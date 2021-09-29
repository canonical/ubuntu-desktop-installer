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
  InstallationTypeModel(this._client, this._service);

  final SubiquityClient _client;
  final DiskStorageService _service;
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

  Future<void> save() async {
    if (!_service.hasMultipleDisks) {
      await _service.setGuidedStorage();
    }
  }
}
