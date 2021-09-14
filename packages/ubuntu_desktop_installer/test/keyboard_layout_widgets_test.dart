import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_widgets.dart';

import 'widget_tester_extensions.dart';

void main() {
  setUpAll(() => LangTester.context = DetectKeyboardLayoutView);

  testWidgets('press key', (tester) async {
    int? keyPress;

    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: localizationsDelegates,
        home: DetectKeyboardLayoutView(
          pressKey: ['x', 'y', 'z'],
          onKeyPress: (code) => keyPress = code,
        ),
      ),
    );

    expect(find.byType(PressKeyView), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('y'), findsOneWidget);
    expect(find.text('z'), findsOneWidget);
    expect(find.text(tester.lang.pressOneKey), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.keyW, platform: 'linux');
    expect(keyPress, equals(25 - 8));

    await tester.sendKeyEvent(LogicalKeyboardKey.keyX, platform: 'linux');
    expect(keyPress, equals(53 - 8));
  });

  testWidgets('find key', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: localizationsDelegates,
        home: DetectKeyboardLayoutView(
          keyPresent: 'x',
        ),
      ),
    );

    expect(find.byType(KeyPresentView), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text(tester.lang.isKeyPresent), findsOneWidget);
  });
}
