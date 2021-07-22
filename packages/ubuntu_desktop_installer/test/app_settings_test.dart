import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/app_settings.dart';

import 'gsettings.mocks.dart';

void main() {
  test('set gtk-theme via gsettings', () {
    final gsettings = MockGSettings();
    when(gsettings.setValue(any, any)).thenAnswer((_) => true);

    final appSettings = AppSettings(gsettings);

    appSettings.applyTheme(Brightness.light);
    verifyInOrder([
      gsettings.setValue('gtk-theme', 'Yaru'),
      gsettings.sync(),
    ]);
    expect(appSettings.theme, equals(ThemeMode.light));

    var wasNotified = false;
    appSettings.addListener(() => wasNotified = true);

    appSettings.applyTheme(Brightness.dark);
    verifyInOrder([
      gsettings.setValue('gtk-theme', 'Yaru-dark'),
      gsettings.sync(),
    ]);
    expect(appSettings.theme, equals(ThemeMode.dark));
    expect(wasNotified, isTrue);
  });

  test('set locale', () {
    final appSettings = AppSettings(MockGSettings());
    appSettings.applyLocale(Locale('en', 'US'));
    expect(appSettings.locale, equals(Locale('en', 'US')));

    var wasNotified = false;
    appSettings.addListener(() => wasNotified = true);
    appSettings.applyLocale(Locale('en', 'UK'));
    expect(appSettings.locale, equals(Locale('en', 'UK')));
    expect(wasNotified, isTrue);
  });
}
