import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

/// Application-specific theming extensions.
extension AppThemeData on ThemeData {
  /// The color to indicate success. For example used for
  /// Widgets that are shown on successful validation.
  /// It can be loaded via
  /// ```dart
  /// Theme.of(context).successColor
  /// ```
  Color get successColor => YaruColors.green;
}
