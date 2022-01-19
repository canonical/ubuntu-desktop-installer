import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// View model for [ChooseSecurityKeyPage].
class ChooseSecurityKeyModel extends ChangeNotifier {
  /// Creates the model with the given client.
  ChooseSecurityKeyModel(this._client) {
    Listenable.merge([
      _securityKey,
      _confirmedSecurityKey,
    ]).addListener(notifyListeners);
  }

  // ignore: unused_field, will be used for sending the security key to subiquity
  final SubiquityClient _client;
  final _securityKey = ValueNotifier(ValidatedString(''));
  final _confirmedSecurityKey = ValueNotifier(ValidatedString(''));

  /// The current security key.
  String get securityKey => _securityKey.value.value;
  void setSecurityKey(ValidatedString value) => _securityKey.value = value;

  /// The confirmed security key for validation.
  String get confirmedSecurityKey => _confirmedSecurityKey.value.value;
  void setConfirmedSecurityKey(ValidatedString value) =>
      _confirmedSecurityKey.value = value;

  /// Whether the current input is valid.
  bool get isValid =>
      _securityKey.value.isValid == true &&
      _confirmedSecurityKey.value.isValid == true;

  /// Loads the security key.
  Future<void> loadSecurityKey() async {
    // TODO: fetch from subiquity
  }

  /// Saves the security key.
  Future<void> saveSecurityKey() async {
    // TODO: send to subiquity
  }
}
