import 'package:password_strength/password_strength.dart' as pws;

/// The strength of a password.
enum PasswordStrength {
  /// A weak password.
  weak,

  /// A moderate strength password.
  moderate,

  /// A strong password.
  strong,
}

/// Estimates the strength of the given [password].
PasswordStrength estimatePasswordStrength(String password) {
  final strength = pws.estimatePasswordStrength(password);
  if (strength < 0.3) {
    return PasswordStrength.weak;
  } else if (strength < 0.7) {
    return PasswordStrength.moderate;
  } else {
    return PasswordStrength.strong;
  }
}
