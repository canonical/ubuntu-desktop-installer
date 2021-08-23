import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_detector.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_widgets.dart';

import 'widget_tester_extensions.dart';

void main() {
  testWidgets('press key', (tester) async {
    final x = 53 - 8;
    final step = PressKeyStep(1, keys: ['x', 'y', 'z'], steps: {x: 123});
    bool? nextStepCalled;

    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: DetectKeyboardLayoutView(
          step: step,
          onNextStep: () => nextStepCalled = true,
        ),
      ),
    );

    expect(find.byType(PressKeyView), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('y'), findsOneWidget);
    expect(find.text('z'), findsOneWidget);
    expect(find.text(tester.lang.pressOneKey), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, tester.lang.yesButtonText),
        findsNothing);
    expect(find.widgetWithText(OutlinedButton, tester.lang.noButtonText),
        findsNothing);

    expect(nextStepCalled, isNull);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyW, platform: 'linux');
    expect(step.next(), isNull);
    expect(nextStepCalled, isTrue);

    nextStepCalled = false;
    await tester.sendKeyEvent(LogicalKeyboardKey.keyX, platform: 'linux');
    expect(step.next(), 123);
    expect(nextStepCalled, isTrue);
  });

  testWidgets('find key', (tester) async {
    bool? nextStepCalled;

    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: DetectKeyboardLayoutView(
          step: FindKeyStep(1, key: 'x', found: 1, notFound: 2),
          onNextStep: () => nextStepCalled = true,
        ),
      ),
    );

    expect(find.byType(FindKeyView), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text(tester.lang.isKeyPresent), findsOneWidget);

    expect(nextStepCalled, isNull);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyX, platform: 'linux');
    expect(nextStepCalled, isNull);
  });
}
