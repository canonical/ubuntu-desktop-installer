import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';

/// [WhoAreYouPage]'s view model.
class WhoAreYouModel extends ChangeNotifier {
  /// Creates the model with the given client.
  WhoAreYouModel(this._client) {
    Listenable.merge([_loginStrategy, _identity, _password])
        .addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _identity = ValueNotifier<IdentityData>(IdentityData());
  final _loginStrategy =
      ValueNotifier<LoginStrategy>(LoginStrategy.requirePassword);
  final _password = ValueNotifier<String>('');

  /// The current login strategy.
  LoginStrategy get loginStrategy => _loginStrategy.value;
  set loginStrategy(LoginStrategy value) => _loginStrategy.value = value;

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
  set password(String value) {
    _password.value = value;
  }

  /// Find the strength of the password depending on regexps
  PasswordStrength? get passwordStrength {
    final strongPassword = RegExp(r'(?=.*?[#?!@$%^&*-])');
    final averagePassword = RegExp(r'(^.*(?=.{6,})(?=.*\d).*$)');

    if (strongPassword.hasMatch(password) && password.length > 8) {
      return PasswordStrength.strongPassword;
    }
    if (averagePassword.hasMatch(password)) {
      return PasswordStrength.averagePassword;
    }
    if (password.isNotEmpty && password.length > 1) {
      return PasswordStrength.weakPassword;
    }
    return null;
  }

  /// Loads the identity data from the server.
  Future<void> loadIdentity() {
    return _client.identity().then((identity) => _identity.value = identity);
  }

  /// Saves the identity data to the server.
  Future<void> saveIdentity() {
    return _client.setIdentity(
      _identity.value.copyWith(cryptedPassword: encryptPassword(password)),
    );
  }

  static final _encryptionIV = encrypt.IV.fromLength(16);
  static encrypt.Encrypter get _encrypter =>
      encrypt.Encrypter(encrypt.AES(encrypt.Key.fromLength(32)));

  /// Encrypts a password.
  @visibleForTesting
  static String encryptPassword(String password) {
    assert(password.isNotEmpty);
    return _encrypter.encrypt(password, iv: _encryptionIV).base64;
  }

  /// Decrypts a password.
  @visibleForTesting
  static String decryptPassword(String encryptedPassword) {
    assert(encryptedPassword.isNotEmpty);
    return _encrypter.decrypt64(encryptedPassword, iv: _encryptionIV);
  }
}

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

/// The strength of the password
enum PasswordStrength {
  /// Representing weak password
  weakPassword,

  /// Representing an average password
  averagePassword,

  /// Representing a strong password
  strongPassword
}
