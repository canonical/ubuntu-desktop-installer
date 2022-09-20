import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

/// Provides access to application-wide settings.
class Settings extends SafeChangeNotifier {
  /// Creates an app settings instance using the given GSettings as a backend
  /// for storing the settings.
  Settings(this._gsettings);

  final GSettings _gsettings;

  /// Returns settings for the given [context].
  ///
  /// Note: pass `listen: false` when applying settings without listening for
  /// changes (the entire app will be rebuilt anyway).
  static Settings of(BuildContext context, {bool listen = true}) {
    return Provider.of<Settings>(context, listen: listen);
  }

  /// Applies a theme matching the given [brightness].
  void applyTheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        _gsettings.set('gtk-theme', const DBusString('Yaru-dark'));
        _gsettings.set('color-scheme', const DBusString('prefer-dark'));
        break;
      case Brightness.light:
        _gsettings.set('gtk-theme', const DBusString('Yaru'));
        _gsettings.set('color-scheme', const DBusString('prefer-light'));
        break;
    }
  }

  /// The current application locale.
  Locale get locale => _locale;
  Locale _locale = WidgetsBinding.instance.window.locale;

  /// Applies the given [locale].
  void applyLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }
}
