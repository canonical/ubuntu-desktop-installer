import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

/// Available storage types.
enum StorageType {
  /// Erase entire disk and perform guided partitioning.
  erase,

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

/// Provider for [StorageModel].
final storageModelProvider = ChangeNotifierProvider((_) => StorageModel(
      getService<StorageService>(),
      tryGetService<TelemetryService>(),
      getService<ProductService>(),
    ));

/// View model for [StoragePage].
class StorageModel extends SafeChangeNotifier {
  /// Creates a new model with the given client and service.
  StorageModel(
    this._diskService,
    this._telemetryService,
    this._productService,
  );

  final StorageService _diskService;
  final TelemetryService? _telemetryService;
  final ProductService _productService;

  StorageType? _type;
  var _advancedFeature = AdvancedFeature.none;
  var _encryption = false;
  var _hasBitLocker = false;
  List<GuidedStorageTarget>? _targets;

  Iterable<T> _getTargets<T extends GuidedStorageTarget>() =>
      _targets?.whereType<T>().where((t) => t.allowed.isNotEmpty) ?? [];

  /// The selected storage type.
  StorageType? get type => _type;
  set type(StorageType? type) {
    if (_type == type) return;
    _type = type;
    notifyListeners();
  }

  /// The selected advanced feature.
  AdvancedFeature get advancedFeature => _advancedFeature;
  set advancedFeature(AdvancedFeature feature) {
    if (_advancedFeature == feature) return;
    _advancedFeature = feature;
    _syncService();
    notifyListeners();
  }

  /// Whether to encrypt the disk.
  bool get encryption => _encryption;
  set encryption(bool encryption) {
    if (_encryption == encryption) return;
    _encryption = encryption;
    _syncService();
    notifyListeners();
  }

  void _syncService() {
    _diskService.useLvm = advancedFeature == AdvancedFeature.lvm;
    _diskService.useEncryption =
        encryption && advancedFeature == AdvancedFeature.lvm;
  }

  /// The version of the OS.
  ProductInfo get productInfo => _productService.getProductInfo();

  /// A list of existing OS installations or null if not detected.
  List<OsProber>? get existingOS => _diskService.existingOS;

  /// Whether storage information has been queried and installation can proceed.
  bool get hasStorage => _targets != null;

  /// Whether BitLocker is detected.
  bool get hasBitLocker => _hasBitLocker;

  /// Whether installation alongside an existing OS is possible.
  ///
  /// That is, whether a) an existing partition can be safely resized smaller to
  /// make room for the installation, or b) there is a large enough unused gap.
  bool get canInstallAlongside {
    return _getTargets<GuidedStorageTargetResize>().isNotEmpty ||
        _getTargets<GuidedStorageTargetUseGap>().isNotEmpty;
  }

  /// Initializes the model.
  Future<void> init() async {
    await _diskService.init();
    await _diskService.getGuidedStorage().then((r) => _targets = r.targets);
    _type ??= canInstallAlongside ? StorageType.alongside : StorageType.erase;
    _advancedFeature =
        _diskService.useLvm ? AdvancedFeature.lvm : AdvancedFeature.none;
    _encryption = _diskService.useEncryption;
    _hasBitLocker = await _diskService.hasBitLocker();
    notifyListeners();
  }

  /// Saves the storage type selection.
  Future<void> save() async {
    final partitionMethod = _resolvePartitionMethod();
    if (partitionMethod != null) {
      await _telemetryService?.addMetric('PartitionMethod', partitionMethod);
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
    } else if (type == StorageType.erase) {
      return 'use_device';
    } else if (type == StorageType.alongside) {
      return 'resize_use_free';
    } else if (type == StorageType.manual) {
      return 'manual';
    }
    // TODO: map upgrading the current Ubuntu installation without
    // wiping the user's home directory (not implemented yet)
    // to the 'reuse_partition' method.
    return null;
  }

  Future<void> resetStorage() => _diskService.resetStorage();
}
