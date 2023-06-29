import 'package:flutter/material.dart';

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
