import 'dart:ui';

import 'package:dbus/dbus.dart';
import 'package:gsettings/gsettings.dart';
import 'package:meta/meta.dart';

/// An interface for managing the system theme.
abstract class ThemeService {
  /// Applies a [brightness].
  Future<void> setBrightness(Brightness brightness);

  /// Applies an [accent].
  Future<void> setAccent(String accent);

  /// Closes the service and releases any resources.
  Future<void> close();
}

class GtkThemeService implements ThemeService {
  GtkThemeService([GSettings? settings])
      : settings = settings ?? GSettings('org.gnome.desktop.interface');

  @protected
  final GSettings settings;

  @override
  Future<void> setBrightness(Brightness brightness) async {
    final theme = await settings.get('gtk-theme').then((v) => v.asString());
    switch (brightness) {
      case Brightness.dark:
        await settings.set('gtk-theme', DBusString(theme.addSuffix('dark')));
        await settings.set('color-scheme', const DBusString('prefer-dark'));
        break;
      case Brightness.light:
        await settings.set('gtk-theme', DBusString(theme.removeSuffix('dark')));
        await settings.set('color-scheme', const DBusString('prefer-light'));
        break;
    }
  }

  @override
  Future<void> setAccent(String? accent) async {
    final theme = await settings.get('gtk-theme').then((v) => v.asString());
    final value = [
      theme.getPrefix(),
      if (accent?.isNotEmpty ?? false) accent!.toLowerCase(),
      if (theme.hasSuffix('dark')) 'dark',
    ].join('-');
    return settings.set('gtk-theme', DBusString(value));
  }

  @override
  Future<void> close() => settings.close();
}

extension on String {
  String getPrefix() => split('-').first;

  bool hasSuffix(String suffix) => endsWith('-$suffix');

  String addSuffix(String suffix) {
    if (hasSuffix(suffix)) return this;
    return '$this-$suffix';
  }

  String removeSuffix(String suffix) {
    if (!hasSuffix(suffix)) return this;
    return substring(0, length - suffix.length - 1);
  }
}
