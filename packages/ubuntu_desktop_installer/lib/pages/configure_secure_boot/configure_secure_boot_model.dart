import 'package:flutter/foundation.dart';
import 'package:ubuntu_wizard/utils.dart';

enum SecureBootMode { turnOff, dontInstall }

class ConfigureSecureBootModel extends ChangeNotifier {
  ConfigureSecureBootModel({
    required SecureBootMode secureBootMode,
  }) : _mode = secureBootMode;

  SecureBootMode _mode;
  SecureBootMode get secureBootMode => _mode;

  ValidatedString? _securityKey;
  String get securityKey => _securityKey?.value ?? '';

  ValidatedString? _confirmKey;
  String get confirmKey => _confirmKey?.value ?? '';

  bool get areTextFieldsEnabled => secureBootMode == SecureBootMode.turnOff;

  void setSecureBootMode(SecureBootMode? mode) {
    if (mode == null || mode == _mode) {
      return;
    }

    _mode = mode;

    notifyListeners();
  }

  void setSecurityKey(ValidatedString? key) {
    if (key == _securityKey) {
      return;
    }

    _securityKey = key;

    notifyListeners();
  }

  void setConfirmKey(ValidatedString key) {
    if (key == _confirmKey) {
      return;
    }

    _confirmKey = key;

    notifyListeners();
  }

  bool get isFormValid =>
      _mode == SecureBootMode.dontInstall ||
      _securityKey?.isValid == true && _confirmKey?.isValid == true;
}
