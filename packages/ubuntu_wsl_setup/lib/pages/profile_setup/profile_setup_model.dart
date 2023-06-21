import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';

/// The regular expression pattern for valid usernames:
/// - must start with a lowercase letter
/// - may contain lowercase letters, digits, hyphens, and underscores
const kValidUsernamePattern = r'^[a-z][a-z0-9-_]*$';

/// View model for [ProfileSetupPage].
class ProfileSetupModel extends SafeChangeNotifier {
  /// Creates a profile setup model.
  ProfileSetupModel(this._client) {
    Listenable.merge([
      _realname,
      _username,
      _usernameValidation,
      _password,
      _confirmedPassword,
      _showAdvanced,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _realname = ValueNotifier<String?>(null);
  final _username = ValueNotifier<String?>(null);
  final _usernameValidation =
      ValueNotifier<UsernameValidation>(UsernameValidation.OK);
  final _password = ValueNotifier('');
  final _confirmedPassword = ValueNotifier('');

  /// The real name for the profile.
  String get realname => _realname.value ?? '';
  set realname(String realname) => _realname.value = realname;

  /// The current username or a sanitized real name if not set.
  String get username => _username.value ?? realname.sanitize().toLowerCase();
  set username(String username) => _username.value = username;

  /// The password for the profile.
  String get password => _password.value;
  set password(String password) => _password.value = password;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value;
  set confirmedPassword(String password) => _confirmedPassword.value = password;

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
      realname.isNotEmpty &&
      username.isNotEmpty &&
      usernameOk &&
      RegExp(kValidUsernamePattern).hasMatch(username) &&
      password.isNotEmpty &&
      password == confirmedPassword;

  /// The server response on whether the desired username is available.
  UsernameValidation get usernameValidation => _usernameValidation.value;
  bool get usernameOk => _usernameValidation.value == UsernameValidation.OK;

  Future<void> validate() async {
    if (username.isNotEmpty &&
        RegExp(kValidUsernamePattern).hasMatch(username)) {
      _usernameValidation.value = await _client.validateUsername(username);
    }
  }

  /// Loads the profile setup.
  Future<void> loadProfileSetup() async {
    final identity = await _client.getIdentity();
    _realname.value = identity.realname.orIfEmpty(null);
    _username.value = identity.username.orIfEmpty(null);
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
