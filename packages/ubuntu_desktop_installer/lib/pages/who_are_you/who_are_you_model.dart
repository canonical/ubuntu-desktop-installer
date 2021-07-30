import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../utils.dart';
export '../../utils.dart' show PasswordStrength;

/// The regular expression pattern for valid usernames:
/// - must start with a lowercase letter
/// - may contain lowercase letters, digits, hyphens, and underscores
const kValidUsernamePattern = r'^[a-z][a-z0-9-_]*$';

/// The regular expression pattern for valid hostnames:
/// - must start and end with a letter or digit
/// - may contain letters, digits, hyphens, and dots
const kValidHostNamePattern = r'^[a-zA-Z0-9]([a-zA-Z0-9.-]*[a-zA-Z0-9])*$';

/// An enum for storing the login strategy.
enum LoginStrategy {
  /// If selected can be used for the representation
  /// of the user preference to always entering the password
  /// at login.
  requirePassword,

  /// If selected can be used for the representation
  /// of the user preference to log in without a password.
  autoLogin
}

/// [WhoAreYouPage]'s view model.
class WhoAreYouModel extends ChangeNotifier {
  /// Creates the model with the given client.
  WhoAreYouModel(this._client) {
    Listenable.merge([
      _identity,
      _password,
      _confirmedPassword,
      _loginStrategy,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _identity = ValueNotifier<IdentityData>(IdentityData());
  final _password = ValueNotifier<String>('');
  final _confirmedPassword = ValueNotifier<String>('');
  final _loginStrategy =
      ValueNotifier<LoginStrategy>(LoginStrategy.requirePassword);

  /// The current real name.
  String get realName => _identity.value.realname ?? '';
  set realName(String value) {
    _identity.value = _identity.value.copyWith(realname: value);
  }

  /// The current hostname.
  String get hostName => _identity.value.hostname ?? '';
  set hostName(String value) {
    _identity.value = _identity.value.copyWith(hostname: value);
  }

  /// The the current username.
  String get username => _identity.value.username ?? '';
  set username(String value) {
    _identity.value = _identity.value.copyWith(username: value);
  }

  /// The current password.
  String get password => _password.value;
  set password(String value) => _password.value = value;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value;
  set confirmedPassword(String value) => _confirmedPassword.value = value;

  /// Estimates the strength of the password.
  PasswordStrength get passwordStrength => estimatePasswordStrength(password);

  /// The current login strategy.
  LoginStrategy get loginStrategy => _loginStrategy.value;
  set loginStrategy(LoginStrategy value) => _loginStrategy.value = value;

  /// Whether the current input is valid.
  bool get isValid {
    return realName.isNotEmpty &&
        password.isNotEmpty &&
        password == confirmedPassword &&
        RegExp(kValidUsernamePattern).hasMatch(username) &&
        RegExp(kValidHostNamePattern).hasMatch(hostName);
  }

  /// Loads the identity data from the server.
  Future<void> loadIdentity() {
    return _client.identity().then((identity) => _identity.value = identity);
  }

  /// Saves the identity data to the server.
  Future<void> saveIdentity({@visibleForTesting String? salt}) async {
    final cryptedPassword = encryptPassword(password, salt: salt);
    return _client.setIdentity(
      _identity.value.copyWith(cryptedPassword: cryptedPassword),
    );
  }
}
