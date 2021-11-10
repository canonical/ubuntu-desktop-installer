import 'package:flutter/material.dart';

import '../../l10n.dart';
import '../../utils.dart';
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
    final lang = UbuntuLocalizations.of(context);
    switch (strength) {
      case PasswordStrength.weak:
        return Text(
          lang.weakPassword,
          style: TextStyle(color: Theme.of(context).errorColor),
        );
      case PasswordStrength.fair:
        return Text(lang.fairPassword);
      case PasswordStrength.good:
        return Text(lang.goodPassword);
      case PasswordStrength.strong:
        return Text(
          lang.strongPassword,
          style: TextStyle(color: Theme.of(context).successColor),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
