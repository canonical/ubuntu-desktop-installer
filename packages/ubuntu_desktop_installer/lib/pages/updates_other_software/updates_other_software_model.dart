import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

/// @internal
final log = Logger('updates_other_software');

enum InstallationMode { normal, minimal }

extension _InstallationSource on InstallationMode {
  String get source {
    switch (this) {
      case InstallationMode.normal:
        return 'ubuntu-desktop';
      case InstallationMode.minimal:
        return 'ubuntu-desktop-minimal';
    }
  }
}

class UpdateOtherSoftwareModel extends PropertyStreamNotifier {
  // ignore: public_member_api_docs
  UpdateOtherSoftwareModel(
      {required SubiquityClient client,
      required PowerService power,
      required InstallationMode installationMode,
      bool installThirdParty = false})
      : _client = client,
        _power = power,
        _mode = installationMode,
        _installThirdParty = installThirdParty {
    addPropertyListener('OnBattery', notifyListeners);
  }

  final SubiquityClient _client;
  final PowerService _power;

  InstallationMode _mode;
  InstallationMode get installationMode => _mode;

  bool _installThirdParty;
  bool get installThirdParty => _installThirdParty;

  void setInstallationMode(InstallationMode? mode) {
    if (mode == null || _mode == mode) {
      return;
    }

    _mode = mode;
    log.info('Selected ${mode.name} installation mode');
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setInstallThirdParty(bool? installThirdParty) {
    if (installThirdParty == null || _installThirdParty == installThirdParty) {
      return;
    }

    _installThirdParty = installThirdParty;
    log.info('Install 3rd-party software: $installThirdParty');
    notifyListeners();
  }

  /// Select the source corresponding to the selected installation mode.
  Future<void> selectInstallationSource() {
    log.info('Selected ${installationMode.source} installation source');
    return _client.setSource(installationMode.source);
  }

  /// Returns true if currently powered by battery.
  bool get onBattery => _power.onBattery;

  /// Initializes the model and connects to the power service.
  Future<void> init() async {
    return _power.connect().then((_) {
      setProperties(_power.propertiesChanged);
      notifyListeners();
    });
  }
}
