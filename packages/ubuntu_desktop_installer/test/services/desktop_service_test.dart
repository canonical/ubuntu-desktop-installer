import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/desktop_service.dart';
import 'package:ubuntu_test/mocks.dart';

void main() {
  test('set color-scheme via gsettings', () async {
    final gsettings = MockGSettings();
    when(gsettings.set(any, any)).thenAnswer((_) async {});

    final settings = GnomeService(gsettings);

    when(gsettings.get('gtk-theme'))
        .thenAnswer((_) async => const DBusString('Yaru-dark'));

    await settings.setTheme(Brightness.light);
    verifyInOrder([
      gsettings.set('gtk-theme', const DBusString('Yaru')),
      gsettings.set('color-scheme', const DBusString('prefer-light')),
    ]);

    when(gsettings.get('gtk-theme'))
        .thenAnswer((_) async => const DBusString('Yaru'));

    await settings.setTheme(Brightness.dark);
    verifyInOrder([
      gsettings.set('gtk-theme', const DBusString('Yaru-dark')),
      gsettings.set('color-scheme', const DBusString('prefer-dark')),
    ]);
  });
}
