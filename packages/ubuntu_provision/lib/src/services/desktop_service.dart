import 'package:dbus/dbus.dart';
import 'package:gsettings/gsettings.dart';
import 'package:meta/meta.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_session/ubuntu_session.dart';

/// @internal
final log = Logger('desktop');

/// An interface for accessing to desktop settings.
abstract class DesktopService {
  /// Inhibits potentially disruptive events, such as automatic volume mounting,
  /// screen blanking, suspending, logging out, etc.
  Future<void> inhibit() async {}

  /// Closes the service and releases any resources.
  Future<void> close() async {}
}

/// Provides access to GNOME settings.
class GnomeService implements DesktopService {
  /// Creates a GNOME settings instance using the given GSettings as a backend
  /// for storing the settings.
  GnomeService({
    @visibleForTesting GSettings? dingSettings,
    @visibleForTesting GSettings? mediaHandlingSettings,
    @visibleForTesting GSettings? sessionSettings,
    @visibleForTesting GSettings? screensaverSettings,
    @visibleForTesting GnomeSessionManager? gnomeSessionManager,
  })  : _dingSettings =
            dingSettings ?? GSettings('org.gnome.shell.extensions.ding'),
        _mediaHandlingSettings = mediaHandlingSettings ??
            GSettings('org.gnome.desktop.media-handling'),
        _screensaverSettings =
            screensaverSettings ?? GSettings('org.gnome.desktop.screensaver'),
        _sessionSettings =
            sessionSettings ?? GSettings('org.gnome.desktop.session'),
        _gnomeSessionManager = gnomeSessionManager ?? GnomeSessionManager();

  final GSettings _dingSettings;
  final GSettings _mediaHandlingSettings;
  final GSettings _screensaverSettings;
  final GSettings _sessionSettings;
  final GnomeSessionManager _gnomeSessionManager;

  final restoreSettings = <Future<void> Function()>[];

  Future<void> _disableAutoMounting() async {
    log.debug('Disabling automounting');
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

  Future<void> _disableScreenBlanking() async {
    log.debug('Disabling screen blanking');
    final previousValue = await _sessionSettings.get('idle-delay');
    await _sessionSettings.set('idle-delay', const DBusUint32(0));
    restoreSettings
        .add(() => _sessionSettings.set('idle-delay', previousValue));
  }

  Future<void> _disableScreensaver() async {
    log.debug('Disabling screensaver');
    final previousValue =
        await _screensaverSettings.get('idle-activation-enabled');
    await _screensaverSettings.set(
        'idle-activation-enabled', const DBusBoolean(false));
    restoreSettings.add(() =>
        _screensaverSettings.set('idle-activation-enabled', previousValue));
  }

  @override
  Future<void> inhibit() async {
    await _disableAutoMounting();
    await _disableScreenBlanking();
    await _disableScreensaver();

    await _gnomeSessionManager.connect();
    final cookie = await _gnomeSessionManager.inhibit(
      appId: 'com.canonical.ubuntu_desktop_installer',
      topLevelXId: 0,
      reason: 'Installing Ubuntu',
      flags: {
        GnomeInhibitionFlag.autoMount,
        GnomeInhibitionFlag.idle,
        GnomeInhibitionFlag.logout,
        GnomeInhibitionFlag.suspend,
        GnomeInhibitionFlag.switchUser,
      },
    );
    restoreSettings.add(() => _gnomeSessionManager.uninhibit(cookie));
  }

  @override
  Future<void> close() async {
    log.debug('Restoring desktop settings');
    await Future.wait(restoreSettings.map((r) => r.call()));
    await _sessionSettings.close();
    await _screensaverSettings.close();
    await _gnomeSessionManager.close();
  }
}
