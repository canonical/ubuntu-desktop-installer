import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:gsettings/gsettings.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final logger = Logger('desktop');

/// An interface for accessing to desktop settings.
abstract class DesktopService {
  /// Disables automatic volume mounting to avoid problems during partitioning.
  Future<void> disableAutoMounting();

  /// Disables the screensaver.
  Future<void> disableScreensaver();

  /// Disables screen blanking.
  Future<void> disableScreenBlanking();

  /// Applies a desktop theme matching the given [brightness].
  Future<void> setTheme(Brightness brightness);

  /// Closes the service and releases any resources.
  Future<void> close() async {}
}

/// Provides access to GNOME settings.
class GnomeService implements DesktopService {
  /// Creates a GNOME settings instance using the given GSettings as a backend
  /// for storing the settings.
  GnomeService({
    @visibleForTesting GSettings? dingSettings,
    @visibleForTesting GSettings? interfaceSettings,
    @visibleForTesting GSettings? mediaHandlingSettings,
    @visibleForTesting GSettings? sessionSettings,
    @visibleForTesting GSettings? screensaverSettings,
  })  : _dingSettings =
            dingSettings ?? GSettings('org.gnome.shell.extensions.ding'),
        _interfaceSettings =
            interfaceSettings ?? GSettings('org.gnome.desktop.interface'),
        _mediaHandlingSettings = mediaHandlingSettings ??
            GSettings('org.gnome.desktop.media-handling'),
        _screensaverSettings =
            screensaverSettings ?? GSettings('org.gnome.desktop.screensaver'),
        _sessionSettings =
            sessionSettings ?? GSettings('org.gnome.desktop.session');

  final GSettings _dingSettings;
  final GSettings _interfaceSettings;
  final GSettings _mediaHandlingSettings;
  final GSettings _screensaverSettings;
  final GSettings _sessionSettings;

  final restoreSettings = <Future<void> Function()>[];

  @override
  Future<void> disableAutoMounting() async {
    logger.debug('Disabling automounting');
    final previousAutoMount = await _mediaHandlingSettings.get('automount');
    final previousAutoMountOpen =
        await _mediaHandlingSettings.get('automount-open');
    final previousAutoRunNever =
        await _mediaHandlingSettings.get('autorun-never');
    final previousShowVolumes = await _dingSettings.get('show-volumes');
    final previousShowNetworkVolumes =
        await _dingSettings.get('show-network-volumes');
    await _mediaHandlingSettings.set('automount', const DBusBoolean(false));
    await _mediaHandlingSettings.set(
        'automount-open', const DBusBoolean(false));
    await _mediaHandlingSettings.set('autorun-never', const DBusBoolean(true));
    await _dingSettings.set('show-volumes', const DBusBoolean(false));
    await _dingSettings.set('show-network-volumes', const DBusBoolean(false));
    restoreSettings.add(() async {
      await _mediaHandlingSettings.set('automount', previousAutoMount);
      await _mediaHandlingSettings.set('automount-open', previousAutoMountOpen);
      await _mediaHandlingSettings.set('autorun-never', previousAutoRunNever);
      await _dingSettings.set('show-volumes', previousShowVolumes);
      await _dingSettings.set(
          'show-network-volumes', previousShowNetworkVolumes);
    });
  }

  @override
  Future<void> disableScreenBlanking() async {
    logger.debug('Disabling screen blanking');
    final previousValue = await _sessionSettings.get('idle-delay');
    await _sessionSettings.set('idle-delay', const DBusUint32(0));
    restoreSettings
        .add(() => _sessionSettings.set('idle-delay', previousValue));
  }

  @override
  Future<void> disableScreensaver() async {
    logger.debug('Disabling screensaver');
    final previousValue =
        await _screensaverSettings.get('idle-activation-enabled');
    await _screensaverSettings.set(
        'idle-activation-enabled', const DBusBoolean(false));
    restoreSettings.add(() =>
        _screensaverSettings.set('idle-activation-enabled', previousValue));
  }

  @override
  Future<void> setTheme(Brightness brightness) async {
    final theme =
        await _interfaceSettings.get('gtk-theme').then((v) => v.asString());
    switch (brightness) {
      case Brightness.dark:
        await _interfaceSettings.set(
            'gtk-theme', DBusString(theme.addSuffix('-dark')));
        await _interfaceSettings.set(
            'color-scheme', const DBusString('prefer-dark'));
        break;
      case Brightness.light:
        await _interfaceSettings.set(
            'gtk-theme', DBusString(theme.removeSuffix('-dark')));
        await _interfaceSettings.set(
            'color-scheme', const DBusString('prefer-light'));
        break;
    }
  }

  @override
  Future<void> close() async {
    logger.debug('Restoring desktop settings');
    await Future.wait(restoreSettings.map((r) => r.call()));
    await _interfaceSettings.close();
    await _sessionSettings.close();
    await _screensaverSettings.close();
  }
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
