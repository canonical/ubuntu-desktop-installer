import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/desktop_service.dart';
import 'package:ubuntu_test/mocks.dart';

void main() {
  late MockGSettings interfaceSettings;
  late MockGSettings mediaHandlingSettings;
  late MockGSettings sessionSettings;
  late MockGSettings screensaverSettings;
  late DesktopService service;
  setUp(() {
    interfaceSettings = MockGSettings();
    mediaHandlingSettings = MockGSettings();
    sessionSettings = MockGSettings();
    screensaverSettings = MockGSettings();
    when(interfaceSettings.set(any, any)).thenAnswer((_) async {});
    when(mediaHandlingSettings.set(any, any)).thenAnswer((_) async {});
    when(sessionSettings.set(any, any)).thenAnswer((_) async {});
    when(screensaverSettings.set(any, any)).thenAnswer((_) async {});

    service = GnomeService(
        interfaceSettings: interfaceSettings,
        mediaHandlingSettings: mediaHandlingSettings,
        sessionSettings: sessionSettings,
        screensaverSettings: screensaverSettings);
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

  test('disable automounting', () async {
    when(mediaHandlingSettings.get('automount'))
        .thenAnswer((_) async => const DBusBoolean(true));
    when(mediaHandlingSettings.get('automount-open'))
        .thenAnswer((_) async => const DBusBoolean(true));
    when(mediaHandlingSettings.get('autorun-never'))
        .thenAnswer((_) async => const DBusBoolean(false));
    await service.disableAutoMounting();
    verifyInOrder([
      mediaHandlingSettings.set('automount', const DBusBoolean(false)),
      mediaHandlingSettings.set('automount-open', const DBusBoolean(false)),
      mediaHandlingSettings.set('autorun-never', const DBusBoolean(true)),
    ]);
    await service.close();
    verifyInOrder([
      mediaHandlingSettings.set('automount', const DBusBoolean(true)),
      mediaHandlingSettings.set('automount-open', const DBusBoolean(true)),
      mediaHandlingSettings.set('autorun-never', const DBusBoolean(false)),
    ]);
  });

  test('disable screen blanking', () async {
    when(sessionSettings.get('idle-delay'))
        .thenAnswer((_) async => const DBusUint32(600));
    await service.disableScreenBlanking();
    verify(sessionSettings.set('idle-delay', const DBusUint32(0))).called(1);
    await service.close();
    verify(sessionSettings.set('idle-delay', const DBusUint32(600))).called(1);
  });

  test('disable screensaver', () async {
    when(screensaverSettings.get('idle-activation-enabled'))
        .thenAnswer((_) async => const DBusBoolean(true));
    await service.disableScreensaver();
    verify(screensaverSettings.set(
            'idle-activation-enabled', const DBusBoolean(false)))
        .called(1);
    await service.close();
    verify(screensaverSettings.set(
            'idle-activation-enabled', const DBusBoolean(true)))
        .called(1);
  });
}
