import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/desktop_service.dart';
import 'package:ubuntu_session/ubuntu_session.dart';

import 'desktop_service_test.mocks.dart';

@GenerateMocks([GnomeSessionManager, GSettings])
void main() {
  late MockGSettings dingSettings;
  late MockGSettings interfaceSettings;
  late MockGSettings mediaHandlingSettings;
  late MockGSettings sessionSettings;
  late MockGSettings screensaverSettings;
  late MockGnomeSessionManager gnomeSessionManager;
  late DesktopService service;
  setUp(() {
    dingSettings = MockGSettings();
    interfaceSettings = MockGSettings();
    mediaHandlingSettings = MockGSettings();
    sessionSettings = MockGSettings();
    screensaverSettings = MockGSettings();
    when(dingSettings.set(any, any)).thenAnswer((_) async {});
    when(interfaceSettings.set(any, any)).thenAnswer((_) async {});
    when(mediaHandlingSettings.set(any, any)).thenAnswer((_) async {});
    when(sessionSettings.set(any, any)).thenAnswer((_) async {});
    when(screensaverSettings.set(any, any)).thenAnswer((_) async {});

    gnomeSessionManager = MockGnomeSessionManager();
    when(gnomeSessionManager.inhibit(
      appId: anyNamed('appId'),
      topLevelXId: anyNamed('topLevelXId'),
      reason: anyNamed('reason'),
      flags: anyNamed('flags'),
    )).thenAnswer((_) async => 42);

    service = GnomeService(
      dingSettings: dingSettings,
      interfaceSettings: interfaceSettings,
      mediaHandlingSettings: mediaHandlingSettings,
      sessionSettings: sessionSettings,
      screensaverSettings: screensaverSettings,
      gnomeSessionManager: gnomeSessionManager,
    );
  });

  test('set color-scheme via gsettings', () async {
    when(interfaceSettings.get('gtk-theme'))
        .thenAnswer((_) async => const DBusString('Yaru-dark'));

    await service.setTheme(Brightness.light);
    verifyInOrder([
      interfaceSettings.set('gtk-theme', const DBusString('Yaru')),
      interfaceSettings.set('color-scheme', const DBusString('prefer-light')),
    ]);

    when(interfaceSettings.get('gtk-theme'))
        .thenAnswer((_) async => const DBusString('Yaru'));

    await service.setTheme(Brightness.dark);
    verifyInOrder([
      interfaceSettings.set('gtk-theme', const DBusString('Yaru-dark')),
      interfaceSettings.set('color-scheme', const DBusString('prefer-dark')),
    ]);
  });

  test('inhibit', () async {
    when(mediaHandlingSettings.get('automount'))
        .thenAnswer((_) async => const DBusBoolean(true));
    when(mediaHandlingSettings.get('automount-open'))
        .thenAnswer((_) async => const DBusBoolean(true));
    when(mediaHandlingSettings.get('autorun-never'))
        .thenAnswer((_) async => const DBusBoolean(false));
    when(dingSettings.get('show-volumes'))
        .thenAnswer((_) async => const DBusBoolean(true));
    when(dingSettings.get('show-network-volumes'))
        .thenAnswer((_) async => const DBusBoolean(true));
    when(sessionSettings.get('idle-delay'))
        .thenAnswer((_) async => const DBusUint32(600));
    when(screensaverSettings.get('idle-activation-enabled'))
        .thenAnswer((_) async => const DBusBoolean(true));
    await service.inhibit();
    verifyInOrder([
      mediaHandlingSettings.set('automount', const DBusBoolean(false)),
      mediaHandlingSettings.set('automount-open', const DBusBoolean(false)),
      mediaHandlingSettings.set('autorun-never', const DBusBoolean(true)),
      dingSettings.set('show-volumes', const DBusBoolean(false)),
      dingSettings.set('show-network-volumes', const DBusBoolean(false)),
      gnomeSessionManager.inhibit(
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
      )
    ]);
    await service.close();
    verifyInOrder([
      mediaHandlingSettings.set('automount', const DBusBoolean(true)),
      mediaHandlingSettings.set('automount-open', const DBusBoolean(true)),
      mediaHandlingSettings.set('autorun-never', const DBusBoolean(false)),
      dingSettings.set('show-volumes', const DBusBoolean(true)),
      dingSettings.set('show-network-volumes', const DBusBoolean(true)),
    ]);
    verify(sessionSettings.set('idle-delay', const DBusUint32(600))).called(1);
    verify(screensaverSettings.set(
            'idle-activation-enabled', const DBusBoolean(true)))
        .called(1);
    verify(gnomeSessionManager.uninhibit(42)).called(1);
  });
}
