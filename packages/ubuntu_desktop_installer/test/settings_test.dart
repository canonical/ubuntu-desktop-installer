import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/settings.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() {
  test('set color-scheme via gsettings', () {
    final gsettings = MockGSettings();
    when(gsettings.set(any, any)).thenAnswer((_) async {});

    final settings = Settings(gsettings);

    settings.applyTheme(Brightness.light);
    verifyInOrder([
      gsettings.set('color-scheme', DBusString('prefer-light')),
    ]);

    settings.applyTheme(Brightness.dark);
    verifyInOrder([
      gsettings.set('color-scheme', DBusString('prefer-dark')),
    ]);
  });

  testWidgets('init locale', (tester) async {
    tester.binding.platformDispatcher.localeTestValue =
        const Locale('fr', 'FR');
    final settings = Settings(MockGSettings());
    expect(settings.locale, equals(Locale('fr', 'FR')));
  });

  test('set locale', () {
    final settings = Settings(MockGSettings());
    settings.applyLocale(Locale('en', 'US'));
    expect(settings.locale, equals(Locale('en', 'US')));

    var wasNotified = false;
    settings.addListener(() => wasNotified = true);
    settings.applyLocale(Locale('en', 'UK'));
    expect(settings.locale, equals(Locale('en', 'UK')));
    expect(wasNotified, isTrue);
  });
}
