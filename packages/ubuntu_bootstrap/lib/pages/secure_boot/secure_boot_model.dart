import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_bootstrap/services.dart';

enum SecureBootMode { turnOff, dontInstall }

final secureBootModelProvider = ChangeNotifierProvider(
  (_) => SecureBootModel(storage: getService<StorageService>()),
);

class SecureBootModel extends SafeChangeNotifier {
  SecureBootModel({
    required StorageService storage,
    SecureBootMode secureBootMode = SecureBootMode.turnOff,
  })  : _storage = storage,
        _mode = secureBootMode;

  final StorageService _storage;

  SecureBootMode _mode;
  SecureBootMode get secureBootMode => _mode;

  String? _securityKey;
  String get securityKey => _securityKey ?? '';

  String? _confirmKey;
  String get confirmKey => _confirmKey ?? '';

  bool get areTextFieldsEnabled => secureBootMode == SecureBootMode.turnOff;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  bool _isConfirmationKeyValid = true;
  bool get isConfirmationKeyValid => _isConfirmationKeyValid;

  Future<bool> hasSecureBoot() => _storage.hasSecureBoot();

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
    if (_mode == SecureBootMode.dontInstall) {
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
