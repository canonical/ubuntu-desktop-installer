import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';

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

class UpdateOtherSoftwareModel extends ChangeNotifier {
  // ignore: public_member_api_docs
  UpdateOtherSoftwareModel(
      {required SubiquityClient client,
      required InstallationMode installationMode,
      bool installThirdParty = false})
      : _client = client,
        _mode = installationMode,
        _installThirdParty = installThirdParty;

  final SubiquityClient _client;

  InstallationMode _mode;
  InstallationMode get installationMode => _mode;

  bool _installThirdParty;
  bool get installThirdParty => _installThirdParty;

  void setInstallationMode(InstallationMode? mode) {
    if (mode == null || _mode == mode) {
      return;
    }

    _mode = mode;
    log.info('Selected ${describeEnum(mode)} installation mode');
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
}
