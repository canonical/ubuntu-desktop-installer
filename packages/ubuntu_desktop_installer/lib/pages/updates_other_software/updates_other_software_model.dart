import 'package:flutter/foundation.dart';

enum InstallationMode { normal, minimal }

class UpdateOtherSoftwareModel extends ChangeNotifier {
  // ignore: public_member_api_docs
  UpdateOtherSoftwareModel(
      {required InstallationMode installationMode,
      bool installThirdParty = false})
      : _mode = installationMode,
        _installThirdParty = installThirdParty;

  InstallationMode _mode;
  InstallationMode get installationMode => _mode;

  bool _installThirdParty;
  bool get installThirdParty => _installThirdParty;

  void setInstallationMode(InstallationMode? mode) {
    if (mode == null || _mode == mode) {
      return;
    }

    _mode = mode;
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  void setInstallThirdParty(bool? installThirdParty) {
    if (installThirdParty == null || _installThirdParty == installThirdParty) {
      return;
    }

    _installThirdParty = installThirdParty;

    notifyListeners();
  }
}
