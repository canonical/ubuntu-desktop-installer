import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/app.dart';

import 'app_test.mocks.dart';

@GenerateMocks([Settings])
void main() {
  testWidgets('create an app instance', (tester) async {
    final settings = MockSettings();
    when(settings.locale).thenReturn(Locale('en'));
    when(settings.theme).thenReturn(ThemeMode.light);

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<Settings>.value(value: settings),
      ],
      child: const UbuntuWslSetupApp(),
    ));

    expect(find.byType(Wizard), findsOneWidget);
  });
}
