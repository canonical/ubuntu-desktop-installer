import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services.dart';

/// View model for [ChooseSecurityKeyPage].
class SecurityKeyModel extends SafeChangeNotifier {
  /// Creates the model with the given client.
  SecurityKeyModel(this._service) {
    Listenable.merge([
      _securityKey,
      _confirmedSecurityKey,
      _showSecurityKey,
    ]).addListener(notifyListeners);
  }

  final DiskStorageService _service;

  final _securityKey = ValueNotifier('');
  final _confirmedSecurityKey = ValueNotifier('');
  final _showSecurityKey = ValueNotifier(false);

  /// The current security key.
  String get securityKey => _securityKey.value;
  set securityKey(String value) => _securityKey.value = value;

  /// The confirmed security key for validation.
  String get confirmedSecurityKey => _confirmedSecurityKey.value;
  set confirmedSecurityKey(String value) => _confirmedSecurityKey.value = value;

  /// Defines if the security is shown.
  bool get showSecurityKey => _showSecurityKey.value;
  set showSecurityKey(bool value) => _showSecurityKey.value = value;

  /// Whether the current input is valid.
  bool get isValid =>
      securityKey.isNotEmpty && securityKey == confirmedSecurityKey;

  /// Loads the security key from the service.
  Future<void> loadSecurityKey() async {
    _securityKey.value =
        _confirmedSecurityKey.value = _service.securityKey ?? '';
  }

  /// Saves the security key to the service and clears the local values.
  Future<void> saveSecurityKey() async {
    _service.securityKey = securityKey;
    _securityKey.value = '';
    _confirmedSecurityKey.value = '';
  }
}
