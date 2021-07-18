import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/app_theme.dart';

import 'gsettings.mocks.dart';

void main() {
  test('set gtk-theme via gsettings', () {
    final settings = MockGSettings();
    when(settings.setValue(any, any)).thenAnswer((_) => true);

    final theme = AppTheme(settings);

    theme.apply(Brightness.light);
    verifyInOrder([
      settings.setValue('gtk-theme', 'Yaru'),
      settings.sync(),
    ]);

    theme.apply(Brightness.dark);
    verifyInOrder([
      settings.setValue('gtk-theme', 'Yaru-dark'),
      settings.sync(),
    ]);
  });
}
