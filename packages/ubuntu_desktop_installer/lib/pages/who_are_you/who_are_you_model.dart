import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

export 'package:ubuntu_wizard/utils.dart' show PasswordStrength;

/// @internal
final log = Logger('who_are_you');

/// The regular expression pattern for valid usernames:
/// - must start with a lowercase letter
/// - may contain lowercase letters, digits, hyphens, and underscores
const kValidUsernamePattern = r'^[a-z][a-z0-9-_]*$';

/// The regular expression pattern for valid hostnames:
/// - must start and end with a letter or digit
/// - may contain letters, digits, hyphens, and dots
const kValidHostnamePattern = r'^[a-zA-Z0-9]([a-zA-Z0-9.-]*[a-zA-Z0-9])*$';

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
      _realName,
      _hostname,
      _username,
      _password,
      _confirmedPassword,
      _loginStrategy,
      _systemHostname,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final HostnameService _service;
  final _realName = ValueNotifier<String?>(null);
  final _username = ValueNotifier<String?>(null);
  final _hostname = ValueNotifier<String?>(null);
  final _password = ValueNotifier<String?>(null);
  final _confirmedPassword = ValueNotifier<String?>(null);
  final _loginStrategy =
      ValueNotifier<LoginStrategy>(LoginStrategy.requirePassword);
  final _systemHostname = ValueNotifier<String>('');

  /// The current real name.
  String get realName => _realName.value ?? '';
  set realName(String value) => _realName.value = value;

  /// The current hostname or generates one if not set.
  String get hostname => _hostname.value ?? _generateHostname();
  set hostname(String value) => _hostname.value = value;

  // Generates a hostname `<username>-<system hostname>`.
  String _generateHostname() {
    if (username.isEmpty || _systemHostname.value.isEmpty) return '';
    return '$username-${_systemHostname.value}';
  }

  /// The current username or a sanitized real name if not set.
  String get username => _username.value ?? realName.sanitize();
  set username(String value) => _username.value = value;

  /// The current password.
  String get password => _password.value ?? '';
  set password(String value) => _password.value = value;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value ?? '';
  set confirmedPassword(String value) => _confirmedPassword.value = value;

  /// Estimates the strength of the password.
  PasswordStrength get passwordStrength => estimatePasswordStrength(password);

  /// The current login strategy.
  LoginStrategy get loginStrategy => _loginStrategy.value;
  set loginStrategy(LoginStrategy value) => _loginStrategy.value = value;

  /// Whether the current input is valid.
  bool get isValid {
    return realName.isNotEmpty &&
        hostname.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        password == confirmedPassword &&
        RegExp(kValidUsernamePattern).hasMatch(username) &&
        RegExp(kValidHostnamePattern).hasMatch(hostname);
  }

  /// Loads the identity data from the server, and resolves the system hostname.
  Future<void> loadIdentity() async {
    final identity = await _client.identity();
    _realName.value = identity.realname?.orIfEmpty(null);
    _hostname.value = identity.hostname?.orIfEmpty(null);
    _username.value = identity.username?.orIfEmpty(null);
    log.info('Loaded identity: ${identity.description}');
    await _service.init();
    _systemHostname.value = _service.hostname;
    log.info('Resolved hostname: ${_systemHostname.value}');
  }

  /// Saves the identity data to the server.
  Future<void> saveIdentity({@visibleForTesting String? salt}) async {
    final identity = IdentityData(
      realname: realName,
      hostname: hostname,
      username: username,
      cryptedPassword: encryptPassword(password, salt: salt),
    );
    log.info('Saved identity: ${identity.description}');
    return _client.setIdentity(identity);
  }
}

extension _IdentityDescription on IdentityData {
  String get description {
    return 'realname: "$realname", hostname: "$hostname", username: "$username"';
  }
}
