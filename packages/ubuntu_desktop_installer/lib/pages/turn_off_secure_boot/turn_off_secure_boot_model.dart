import 'package:flutter/foundation.dart';

enum SecureBootMode { turnoff, dontinstall }

class TurnOffSecureBootModel extends ChangeNotifier {
  TurnOffSecureBootModel({
    required SecureBootMode secureBootMode,
  }) : _mode = secureBootMode;

  SecureBootMode _mode;
  SecureBootMode get secureBootMode => _mode;

  String? _securityKey;
  String get securityKey => _securityKey ?? '';

  String? _confirmKey;
  String get confirmKey => _confirmKey ?? '';

  bool get areTextFieldEnabled => secureBootMode == SecureBootMode.turnoff;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  bool _isConfirmationKeyValid = true;
  bool get isConfrmationKeyValid => _isConfirmationKeyValid;

  void setSecureBootMode(SecureBootMode? mode) {
    if (mode == null || mode == _mode) {
      return;
    }

    _mode = mode;

    _validateForm();

    notifyListeners();
  }

  void setSecurityKey(String key) {
    if (key == _securityKey) {
      return;
    }

    _securityKey = key;

    _validateForm();

    notifyListeners();
  }

  void setConfirmKey(String key) {
    if (key == _confirmKey) {
      return;
    }

    _confirmKey = key;

    _validateForm();

    notifyListeners();
  }

  void _validateForm() {
    if (_mode == SecureBootMode.dontinstall) {
      _isFormValid = true;
      _isConfirmationKeyValid = true;
    } else {
      _validateConfirmKey();
      _isFormValid = _isConfirmationKeyValid;
    }
  }

  void _validateConfirmKey() {
    if (_securityKey != null &&
        _securityKey!.isNotEmpty &&
        _confirmKey == _securityKey) {
      _isConfirmationKeyValid = true;
    } else {
      _isConfirmationKeyValid = false;
    }
  }
}
