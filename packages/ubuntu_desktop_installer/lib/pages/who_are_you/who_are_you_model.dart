import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/utils.dart';

export 'package:ubuntu_wizard/utils.dart' show PasswordStrength;

/// @internal
final log = Logger('who_are_you');

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
      _realName,
      _hostname,
      _username,
      _password,
      _confirmedPassword,
      _loginStrategy,
      _productName,
    ]).addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _realName = ValueNotifier<ValidatedString?>(null);
  final _username = ValueNotifier<ValidatedString?>(null);
  final _hostname = ValueNotifier<ValidatedString?>(null);
  final _password = ValueNotifier<ValidatedString?>(null);
  final _confirmedPassword = ValueNotifier<ValidatedString?>(null);
  final _loginStrategy =
      ValueNotifier<LoginStrategy>(LoginStrategy.requirePassword);
  final _productName = ValueNotifier<String>('');

  /// The current real name.
  String get realName => _realName.value?.value ?? '';
  void setRealName(ValidatedString value) => _realName.value = value;

  /// The current hostname or generates one if not set.
  String get hostname => _hostname.value?.value ?? _generateHostname();
  void setHostname(ValidatedString value) => _hostname.value = value;

  // Generates a hostname `<username>-<system hostname>`.
  String _generateHostname() {
    if (username.isEmpty || _productName.value.isEmpty) return '';
    return '$username-${_productName.value}';
  }

  /// The current username or a sanitized real name if not set.
  String get username =>
      _username.value?.value ?? realName.sanitize().toLowerCase();
  void setUsername(ValidatedString value) => _username.value = value;

  /// The current password.
  String get password => _password.value?.value ?? '';
  void setPassword(ValidatedString value) => _password.value = value;

  /// The confirmed password for validation.
  String get confirmedPassword => _confirmedPassword.value?.value ?? '';
  void setConfirmedPassword(ValidatedString value) =>
      _confirmedPassword.value = value;

  /// Estimates the strength of the password.
  PasswordStrength get passwordStrength => estimatePasswordStrength(password);

  /// The current login strategy.
  LoginStrategy get loginStrategy => _loginStrategy.value;
  set loginStrategy(LoginStrategy value) => _loginStrategy.value = value;

  /// Whether the current input is valid.
  bool get isValid {
    return _realName.value?.isValid == true &&
        _hostname.value?.isValid == true &&
        _username.value?.isValid == true &&
        _password.value?.isValid == true &&
        _confirmedPassword.value?.isValid == true;
  }

  void _initIdentity(ValueNotifier<ValidatedString?> identity, String? value) {
    if (value != null) {
      identity.value = ValidatedString(value);
    }
  }

  /// Loads the identity data from the server, and resolves the system hostname.
  Future<void> loadIdentity() async {
    final identity = await _client.identity();
    _initIdentity(_realName, identity.realname?.orIfEmpty(null));
    _initIdentity(_hostname, identity.hostname?.orIfEmpty(null));
    _initIdentity(_username, identity.username?.orIfEmpty(null));
    log.info('Loaded identity: ${identity.description}');
    _productName.value = await _readProductName();
    log.info('Read product name: ${_productName.value}');
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

/// The DMI product name file. Available for testing.
@visibleForTesting
const kDMIProductNameFile = '/sys/devices/virtual/dmi/id/product_name';

Future<String> _readProductName() {
  return File(kDMIProductNameFile)
      .readAsString()
      .then((value) => value.trim().sanitize())
      .catchError((_) => '');
}

extension _IdentityDescription on IdentityData {
  String get description {
    return 'realname: "$realname", hostname: "$hostname", username: "$username"';
  }
}
