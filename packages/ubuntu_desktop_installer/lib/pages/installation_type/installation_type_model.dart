import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

/// Available installation types.
enum InstallationType {
  /// Erase entire disk and perform guided partitioning.
  erase,

  /// Replace existing OS installation.
  reinstall,

  /// Install alongside existing OS installation.
  alongside,

  /// Manual partitioning.
  manual,
}

/// Available advanced features.
enum AdvancedFeature {
  /// No advanced features.
  none,

  /// Use LVM.
  lvm,

  /// Use ZFS (experimental).
  zfs,
}

/// View model for [InstallationTypePage].
class InstallationTypeModel extends SafeChangeNotifier {
  /// Creates a new model with the given client and service.
  InstallationTypeModel(this._diskService, this._telemetryService);

  final DiskStorageService _diskService;
  final TelemetryService _telemetryService;
  var _installationType = InstallationType.erase;
  var _advancedFeature = AdvancedFeature.none;
  var _encryption = false;
  List<GuidedStorageTarget>? _storages;

  /// The selected installation type.
  InstallationType get installationType => _installationType;
  set installationType(InstallationType type) {
    if (_installationType == type) return;
    _installationType = type;
    notifyListeners();
  }

  /// The selected advanced feature.
  AdvancedFeature get advancedFeature => _advancedFeature;
  set advancedFeature(AdvancedFeature feature) {
    if (_advancedFeature == feature) return;
    _advancedFeature = feature;
    notifyListeners();
  }

  /// Whether to encrypt the disk.
  bool get encryption => _encryption;
  set encryption(bool encryption) {
    if (_encryption == encryption) return;
    _encryption = encryption;
    notifyListeners();
  }

  /// The version of the OS.
  final productInfo = ProductInfoExtractor().getProductInfo();

  /// A list of existing OS installations or null if not detected.
  List<OsProber>? get existingOS => _diskService.existingOS;

  /// Whether storage information has been queried and installation can proceed.
  bool get hasStorage => _storages != null;

  /// Whether installation alongside an existing OS is possible.
  ///
  /// That is, whether a) an existing partition can be safely resized smaller to
  /// make room for the installation, or b) there is a large enough unused gap.
  bool get canInstallAlongside {
    return _storages?.any((target) =>
            target is GuidedStorageTargetResize ||
            target is GuidedStorageTargetUseGap) ??
        false;
  }

  /// Initializes the model.
  Future<void> init() async {
    await _diskService.getGuidedStorage().then((r) => _storages = r.possible);
    _installationType = canInstallAlongside
        ? InstallationType.alongside
        : InstallationType.erase;
    notifyListeners();
  }

  /// Resolves the automatic guided storage target selection for the given
  /// installation type.
  ///
  /// Automatic cases:
  /// - when erasing the disk and there's only one reformat target
  /// - when installing alongside an existing OS and there's a large enough gap
  ///
  /// For all other cases, the user is prompted to select or resize a target.
  GuidedStorageTarget? preselectTarget(InstallationType type) {
    switch (type) {
      case InstallationType.erase:
        return _storages?.whereType<GuidedStorageTargetReformat>().singleOrNull;

      case InstallationType.alongside:
        return _storages
            ?.whereType<GuidedStorageTargetUseGap>()
            .sorted((a, b) => a.gap.size.compareTo(b.gap.size))
            .lastOrNull;

      default:
        return null;
    }
  }

  /// Saves the installation type selection and applies the guide storage
  /// if appropriate (single guided storage).
  Future<void> save() async {
    _diskService.useLvm = advancedFeature == AdvancedFeature.lvm;
    _diskService.useEncryption =
        encryption && advancedFeature == AdvancedFeature.lvm;

    // automatically pre-select a guided storage target if possible
    _diskService.guidedTarget = preselectTarget(installationType);

    final partitionMethod = _resolvePartitionMethod();
    if (partitionMethod != null) {
      await _telemetryService.addMetric('PartitionMethod', partitionMethod);
    }
  }

  String? _resolvePartitionMethod() {
    // All possible values for the partition method
    // were extracted from Ubiquity's ubi-partman.py
    // (see PageGtk.get_autopartition_choice()).
    if (advancedFeature == AdvancedFeature.lvm) {
      return 'use_lvm';
    } else if (advancedFeature == AdvancedFeature.zfs) {
      return 'use_zfs';
    } else if (_diskService.useEncryption &&
        advancedFeature != AdvancedFeature.zfs) {
      return 'use_crypto';
    } else if (installationType == InstallationType.erase) {
      return 'use_device';
    } else if (installationType == InstallationType.reinstall) {
      return 'reinstall_partition';
    } else if (installationType == InstallationType.alongside) {
      return 'resize_use_free';
    } else if (installationType == InstallationType.manual) {
      return 'manual';
    }
    // TODO: map upgrading the current Ubuntu installation without
    // wiping the user's home directory (not implemented yet)
    // to the 'reuse_partition' method.
    return null;
  }

  Future<void> resetStorage() => _diskService.resetStorage();
}
