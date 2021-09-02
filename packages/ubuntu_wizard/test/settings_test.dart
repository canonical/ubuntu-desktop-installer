import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/settings.dart';

void main() {
  test('set gtk-theme via gsettings', () {
    final gsettings = MockGSettings();
    when(gsettings.setValue(any, any)).thenAnswer((_) => true);

    final settings = Settings(gsettings);

    settings.applyTheme(Brightness.light);
    verifyInOrder([
      gsettings.setValue('gtk-theme', 'Yaru'),
      gsettings.sync(),
    ]);
    expect(settings.theme, equals(ThemeMode.light));

    var wasNotified = false;
    settings.addListener(() => wasNotified = true);

    settings.applyTheme(Brightness.dark);
    verifyInOrder([
      gsettings.setValue('gtk-theme', 'Yaru-dark'),
      gsettings.sync(),
    ]);
    expect(settings.theme, equals(ThemeMode.dark));
    expect(wasNotified, isTrue);
  });

  testWidgets('init locale', (tester) async {
    tester.binding.window.localeTestValue = const Locale('fr', 'FR');
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
