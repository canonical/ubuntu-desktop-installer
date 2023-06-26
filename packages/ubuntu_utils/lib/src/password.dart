import 'package:crypt/crypt.dart';

/// Supported hash algorithms.
enum Hash {
  /// SHA-256
  sha256,

  /// SHA-512
  sha512,
}

/// Encrypts a password.
String encryptPassword(
  String password, {
  Hash algorithm = Hash.sha512,
  String? salt,
}) {
  if (password.isEmpty) return '';
  switch (algorithm) {
    case Hash.sha256:
      return Crypt.sha256(password, salt: salt).toString();
    case Hash.sha512:
      return Crypt.sha512(password, salt: salt).toString();
  }
}
