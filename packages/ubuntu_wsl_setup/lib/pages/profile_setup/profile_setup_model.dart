import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// View model for [ProfileSetupPage].
class ProfileSetupModel extends ChangeNotifier {
  /// Creates a profile setup model.
  ProfileSetupModel(this._client) {
    Listenable.merge([
      _realname,
      _username,
      _password,
      _confirmedPassword,
      _showAdvanced,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _realname = ValueNotifier<ValidatedString?>(null);
  final _username = ValueNotifier<ValidatedString?>(null);
  final _password = ValueNotifier(ValidatedString(''));
  final _confirmedPassword = ValueNotifier(ValidatedString(''));

  /// The real name for the profile.
  String get realname => _realname.value?.value ?? '';
  void setRealname(ValidatedString realname) => _realname.value = realname;

  /// The current username or a sanitized real name if not set.
  String get username =>
      _username.value?.value ?? realname.sanitize().toLowerCase();
  void setUsername(ValidatedString username) => _username.value = username;

  /// The password for the profile.
  String get password => _password.value.value;
  void setPassword(ValidatedString password) => _password.value = password;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value.value;
  void setConfirmedPassword(ValidatedString password) =>
      _confirmedPassword.value = password;

  /// Estimates the strength of the password.
  PasswordStrength get passwordStrength => estimatePasswordStrength(password);

  /// Whether to show the advanced options.
  ///
  /// NOTE: The advanced options cannot be skipped for now. This ensures that
  /// the UI posts a `/wslconfbase` request. That way, the respective controller
  /// in Subiquity is always marked as configured and the `wsl.conf` file is
  /// forced to be written.
  ///
  /// More details:
  /// https://github.com/canonical/ubuntu-desktop-installer/issues/431
  ///
  bool get showAdvancedOptions => true; // _showAdvanced.value;
  final _showAdvanced = ValueNotifier<bool>(false);
  set showAdvancedOptions(bool value) => _showAdvanced.value = value;

  /// Whether the current input is valid.
  bool get isValid =>
      _realname.value?.isValid == true &&
      _username.value?.isValid == true &&
      _password.value.isValid == true &&
      _confirmedPassword.value.isValid == true;

  void _initProfile(ValueNotifier<ValidatedString?> identity, String? value) {
    if (value != null && value.isNotEmpty) {
      identity.value = ValidatedString(value);
    }
  }

  /// Loads the profile setup.
  Future<void> loadProfileSetup() async {
    final identity = await _client.identity();
    _initProfile(_realname, identity.realname);
    _initProfile(_username, identity.username);
  }

  /// Saves the profile setup.
  Future<void> saveProfileSetup({@visibleForTesting String? salt}) async {
    final identity = IdentityData(
      realname: realname,
      username: username,
      cryptedPassword: encryptPassword(password, salt: salt),
    );
    return _client.setIdentity(identity);
  }
}
