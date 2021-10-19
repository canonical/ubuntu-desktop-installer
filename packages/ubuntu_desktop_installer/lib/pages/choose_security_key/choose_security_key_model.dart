import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

/// View model for [ChooseSecurityKeyPage].
class ChooseSecurityKeyModel extends ChangeNotifier {
  /// Creates the model with the given client.
  ChooseSecurityKeyModel(this._client) {
    Listenable.merge([
      _securityKey,
      _confirmedSecurityKey,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _securityKey = ValueNotifier('');
  final _confirmedSecurityKey = ValueNotifier('');

  /// The current security key.
  String get securityKey => _securityKey.value;
  set securityKey(String value) => _securityKey.value = value;

  /// The confirmed security key for validation.
  String get confirmedSecurityKey => _confirmedSecurityKey.value;
  set confirmedSecurityKey(String value) => _confirmedSecurityKey.value = value;

  /// Whether the current input is valid.
  bool get isValid => securityKey == confirmedSecurityKey;

  /// Loads the security key.
  Future<void> loadSecurityKey() async {}

  /// Saves the security key.
  Future<void> saveSecurityKey() async {}
}
