import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:yaru/yaru.dart' as yaru;

class AppTheme extends ValueNotifier<ThemeMode> {
  AppTheme(this._settings) : super(ThemeMode.system);
  final GSettings _settings;

  void apply(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        value = ThemeMode.dark;
        _settings.setValue('gtk-theme', 'Yaru-dark');
        break;
      case Brightness.light:
        value = ThemeMode.light;
        _settings.setValue('gtk-theme', 'Yaru');
        break;
    }
    _settings.sync();
  }

  @override
  void dispose() {
    super.dispose();
    _settings.dispose();
  }
}

/// Application-specific theming extensions.
extension AppThemeData on ThemeData {
  /// The color to indicate success. For example used for
  /// Widgets that are shown on successful validation.
  /// It can be loaded via
  /// ```dart
  /// Theme.of(context).successColor
  /// ```
  Color get successColor => yaru.Colors.green;
}
