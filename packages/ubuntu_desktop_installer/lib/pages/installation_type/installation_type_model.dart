import 'package:flutter/foundation.dart';
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
class InstallationTypeModel extends ChangeNotifier {
  /// Creates a new model with the given client and service.
  InstallationTypeModel(
      this._client, this._diskService, this._telemetryService);

  // ignore: unused_field, will be used for querying existing OS installations
  final SubiquityClient _client;
  final DiskStorageService _diskService;
  final TelemetryService _telemetryService;
  var _installationType = InstallationType.erase;
  var _advancedFeature = AdvancedFeature.none;
  var _encryption = false;
  String? _existingOS;

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

  /// An existing OS installation or null if not detected.
  String? get existingOS => _existingOS;

  /// Initializes the model and queries the existing OS installation.
  Future<void> init() async {
    // TODO: Get list of existing OS installations.
    // _client.getExistingOS().then((os) {
    //   _existingOS = os;
    //   notifyListeners();
    // });
  }

  /// Saves the installation type selection and applies the guide storage
  /// if appropriate (single guided storage).
  Future<void> save() async {
    _diskService.useLvm = advancedFeature == AdvancedFeature.lvm;
    if (!_diskService.hasMultipleDisks &&
        _installationType == InstallationType.erase) {
      await _diskService.setGuidedStorage();
    }

    // All possible values for the partition method
    // were extracted from Ubiquity's ubi-partman.py
    // (see PageGtk.get_autopartition_choice()).
    if (installationType == InstallationType.erase) {
      _telemetryService.setPartitionMethod('use_device');
    } else if (installationType == InstallationType.reinstall) {
      _telemetryService.setPartitionMethod('reinstall_partition');
    } else if (installationType == InstallationType.alongside) {
      _telemetryService.setPartitionMethod('resize_use_free');
    } else if (installationType == InstallationType.manual) {
      _telemetryService.setPartitionMethod('manual');
    }
    if (advancedFeature == AdvancedFeature.lvm) {
      _telemetryService.setPartitionMethod('use_lvm');
    } else if (advancedFeature == AdvancedFeature.zfs) {
      _telemetryService.setPartitionMethod('use_zfs');
    }
    if (_diskService.hasEncryption && advancedFeature != AdvancedFeature.zfs) {
      _telemetryService.setPartitionMethod('use_crypto');
    }
    // TODO: map upgrading the current Ubuntu installation without
    // wiping the user's home directory (not implemented yet)
    // to the 'reuse_partition' method.
  }
}
