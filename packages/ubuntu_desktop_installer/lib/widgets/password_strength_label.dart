import 'package:flutter/material.dart';

import '../utils.dart';
import 'localized_view.dart';
import 'theme.dart';

/// A widget that visualizes the strength of a password.
class PasswordStrengthLabel extends StatelessWidget {
  /// Creates a new label with the given [strength].
  const PasswordStrengthLabel({
    Key? key,
    required this.strength,
  }) : super(key: key);

  /// The strength of the password.
  final PasswordStrength strength;

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) {
        switch (strength) {
          case PasswordStrength.weak:
            return Text(
              lang.weakPassword,
              style: TextStyle(color: Theme.of(context).errorColor),
            );
          case PasswordStrength.moderate:
            return Text(lang.moderatePassword);
          case PasswordStrength.strong:
            return Text(
              lang.strongPassword,
              style: TextStyle(color: Theme.of(context).successColor),
            );
          default:
            return SizedBox.shrink();
        }
      },
    );
  }
}
