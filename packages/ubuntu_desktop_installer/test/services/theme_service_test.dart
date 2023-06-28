import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/theme_service.dart';

import 'theme_service_test.mocks.dart';

@GenerateMocks([GSettings])
void main() {
  test('set color-scheme via gsettings', () async {
    final settings = MockGSettings();
    when(settings.set(any, any)).thenAnswer((_) async {});

    final service = GtkThemeService(settings);

    when(settings.get('gtk-theme'))
        .thenAnswer((_) async => const DBusString('Yaru-dark'));

    await service.setBrightness(Brightness.light);
    verifyInOrder([
      settings.set('gtk-theme', const DBusString('Yaru')),
      settings.set('color-scheme', const DBusString('prefer-light')),
    ]);

    when(settings.get('gtk-theme'))
        .thenAnswer((_) async => const DBusString('Yaru'));

    await service.setBrightness(Brightness.dark);
    verifyInOrder([
      settings.set('gtk-theme', const DBusString('Yaru-dark')),
      settings.set('color-scheme', const DBusString('prefer-dark')),
    ]);
  });
}
