import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';

/// An interface for accessing to desktop settings.
abstract class DesktopService {
  /// Applies a desktop theme matching the given [brightness].
  Future<void> setTheme(Brightness brightness);

  /// Closes the service and releases any resources.
  Future<void> close() async {}
}

/// Provides access to GNOME settings.
class GnomeService implements DesktopService {
  /// Creates a GNOME settings instance using the given GSettings as a backend
  /// for storing the settings.
  GnomeService([@visibleForTesting GSettings? gsettings])
      : _gsettings = gsettings ?? GSettings('org.gnome.desktop.interface');

  final GSettings _gsettings;

  @override
  Future<void> setTheme(Brightness brightness) async {
    final theme = await _gsettings.get('gtk-theme').then((v) => v.asString());
    switch (brightness) {
      case Brightness.dark:
        await _gsettings.set('gtk-theme', DBusString(theme.addSuffix('-dark')));
        await _gsettings.set('color-scheme', const DBusString('prefer-dark'));
        break;
      case Brightness.light:
        await _gsettings.set(
            'gtk-theme', DBusString(theme.removeSuffix('-dark')));
        await _gsettings.set('color-scheme', const DBusString('prefer-light'));
        break;
    }
  }

  @override
  Future<void> close() => _gsettings.close();
}

extension on String {
  String addSuffix(String suffix) {
    if (endsWith(suffix)) return this;
    return '$this$suffix';
  }

  String removeSuffix(String suffix) {
    if (!endsWith(suffix)) return this;
    return substring(0, length - suffix.length);
  }
}
