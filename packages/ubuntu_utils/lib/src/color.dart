import 'package:flutter/material.dart';
import 'package:yaru_colors/yaru_colors.dart';

/// Adds utility extensions to [Color].
extension HexColor on Color {
  /// Returns the hex string representation of the color.
  String toHex() =>
      _formatHex(alpha.toHex(), red.toHex(), green.toHex(), blue.toHex());

  static String _formatHex(String a, String r, String g, String b) =>
      '#$a$r$g$b';
}

extension _HexInt on int {
  String toHex() => toRadixString(16).padLeft(2, '0');
}

extension LinkColor on BuildContext {
  Color get linkColor => Theme.of(this).brightness == Brightness.light
      ? YaruColors.blue[700]!
      : YaruColors.blue[500]!;
}
