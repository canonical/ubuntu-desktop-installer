import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart' as yaru;

/// Provides access to application-wide settings.
class AppSettings extends ChangeNotifier {
  /// Creates an app settings instance using the given GSettings as a backend
  /// for storing the settings.
  AppSettings(this._settings);

  final GSettings _settings;

  /// Returns settings for the given [context].
  ///
  /// Note: pass `listen: false` when applying settings without listening for
  /// changes (the entire app will be rebuilt anyway).
  static AppSettings of(BuildContext context, {bool listen = true}) {
    return Provider.of<AppSettings>(context, listen: listen);
  }

  /// The current application theme.
  ThemeMode get theme => _theme;
  ThemeMode _theme = ThemeMode.system;

  /// Applies a theme matching the given [brigtness].
  void applyTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        _theme = ThemeMode.dark;
        _settings.setValue('gtk-theme', 'Yaru-dark');
        break;
      case Brightness.light:
        _theme = ThemeMode.light;
        _settings.setValue('gtk-theme', 'Yaru');
        break;
    }
    notifyListeners();
    _settings.sync();
  }

  /// The current application locale.
  Locale get locale => _locale;
  Locale _locale = Locale(Intl.shortLocale(Intl.systemLocale));

  /// Applies the given [locale].
  void applyLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
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
