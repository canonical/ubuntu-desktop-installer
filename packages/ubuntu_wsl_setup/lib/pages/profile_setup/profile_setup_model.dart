import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// The regular expression pattern for valid usernames:
/// - must start with a lowercase letter
/// - may contain lowercase letters, digits, hyphens, and underscores
const kValidUsernamePattern = r'^[a-z][a-z0-9-_]*$';

/// View model for [ProfileSetupPage].
class ProfileSetupModel extends ChangeNotifier {
  /// Creates a profile setup model.
  ProfileSetupModel(this._client) {
    Listenable.merge([
      _identity,
      _password,
      _confirmedPassword,
      _showAdvanced,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _identity = ValueNotifier(IdentityData());
  final _password = ValueNotifier('');
  final _confirmedPassword = ValueNotifier('');

  /// The real name for the profile.
  String get realname => _identity.value.realname ?? '';
  set realname(String realname) {
    _identity.value = _identity.value.copyWith(realname: realname);
  }

  /// The username for the profile.
  String get username => _getUserName();
  set username(String username) {
    _identity.value = _identity.value.copyWith(username: username);
  }

  // Returns the current username or a sanitized real name if not set.
  String _getUserName() {
    final username = _identity.value.username ?? '';
    return username.orIfEmpty(realname.sanitize());
  }

  /// The password for the profile.
  String get password => _password.value;
  set password(String password) => _password.value = password;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value;
  set confirmedPassword(String password) => _confirmedPassword.value = password;

  /// Estimates the strength of the password.
  PasswordStrength get passwordStrength => estimatePasswordStrength(password);

  /// Whether to show the advanced options.
  bool get showAdvancedOptions => _showAdvanced.value;
  final _showAdvanced = ValueNotifier<bool>(false);
  set showAdvancedOptions(bool value) => _showAdvanced.value = value;

  /// Whether the current input is valid.
  bool get isValid =>
      realname.isNotEmpty &&
      RegExp(kValidUsernamePattern).hasMatch(username) &&
      password.isNotEmpty &&
      password == confirmedPassword;

  /// Loads the profile setup.
  Future<void> loadProfileSetup() async {
    return _client.identity().then((identity) => _identity.value = identity);
  }

  /// Saves the profile setup.
  Future<void> saveProfileSetup({@visibleForTesting String? salt}) async {
    final cryptedPassword = encryptPassword(password, salt: salt);
    return _client.setIdentity(
      _identity.value.copyWith(cryptedPassword: cryptedPassword),
    );
  }
}
