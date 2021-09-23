import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

export 'package:ubuntu_wizard/utils.dart' show PasswordStrength;

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
  WhoAreYouModel({
    required SubiquityClient client,
    required HostnameService service,
  })  : _client = client,
        _service = service {
    Listenable.merge([
      _identity,
      _password,
      _confirmedPassword,
      _loginStrategy,
      _systemHostname,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final HostnameService _service;
  final _identity = ValueNotifier<IdentityData>(IdentityData());
  final _password = ValueNotifier<String>('');
  final _confirmedPassword = ValueNotifier<String>('');
  final _loginStrategy =
      ValueNotifier<LoginStrategy>(LoginStrategy.requirePassword);
  final _systemHostname = ValueNotifier<String>('');

  /// The current real name.
  String get realName => _identity.value.realname ?? '';
  set realName(String value) {
    _identity.value = _identity.value.copyWith(realname: value);
  }

  /// The current hostname.
  String get hostName => _getHostname();
  set hostName(String value) {
    _identity.value = _identity.value.copyWith(hostname: value);
  }

  // Returns the current hostname or generates one if not set.
  String _getHostname() {
    final hostname = _identity.value.hostname ?? '';
    return hostname.orIfEmpty(_generateHostname());
  }

  // Generates a hostname `<username>-<system hostname>`.
  String _generateHostname() {
    if (username.isEmpty || _systemHostname.value.isEmpty) return '';
    return '$username-${_systemHostname.value}';
  }

  /// The the current username.
  String get username => _getUserName();
  set username(String value) {
    _identity.value = _identity.value.copyWith(username: value);
  }

  // Returns the current username or a sanitized real name if not set.
  String _getUserName() {
    final username = _identity.value.username ?? '';
    return username.orIfEmpty(realName.sanitize());
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
    final id = _client.identity().then((value) => _identity.value = value);
    final hn =
        _service.init().then((_) => _systemHostname.value = _service.hostname);
    return Future.wait<void>([id, hn]);
  }

  /// Saves the identity data to the server.
  Future<void> saveIdentity({@visibleForTesting String? salt}) async {
    final cryptedPassword = encryptPassword(password, salt: salt);
    return _client.setIdentity(
      _identity.value.copyWith(cryptedPassword: cryptedPassword),
    );
  }
}
