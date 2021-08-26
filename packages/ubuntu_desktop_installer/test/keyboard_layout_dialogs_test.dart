import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_widgets.dart';

import 'keyboard_layout_dialogs_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([SubiquityClient])
void main() {
  testWidgets('detect layout', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    final client = MockSubiquityClient();
    when(client.getKeyboardStep(null)).thenAnswer((_) async {
      return KeyboardStep.pressKey(symbols: ['a']);
    });
    when(client.getKeyboardStep('38')).thenAnswer((_) async {
      return KeyboardStep.keyPresent(symbol: 'b', yes: '39');
    });
    when(client.getKeyboardStep('39')).thenAnswer((_) async {
      return KeyboardStep.keyPresent(symbol: 'c', no: '40');
    });
    when(client.getKeyboardStep('40')).thenAnswer((_) async {
      return KeyboardStep.result(layout: 'd', variant: 'e');
    });

    await tester.pumpWidget(
      Provider<SubiquityClient>.value(
        value: client,
        child: MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: DetectKeyboardLayoutView(
            pressKey: null,
            keyPresent: null,
            onKeyPress: (_) {},
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(DetectKeyboardLayoutView));

    // init
    final result = showDetectKeyboardLayoutDialog(context);
    await tester.pumpAndSettle();
    verify(client.getKeyboardStep(null)).called(1);

    // press a
    expect(find.text('a'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyA, platform: 'linux');
    await tester.pump();
    verify(client.getKeyboardStep('38')).called(1);

    await tester.pumpAndSettle();

    // b is present
    expect(find.text('b'), findsOneWidget);
    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.yesButtonText));
    await tester.pump();

    // c is not present
    expect(find.text('c'), findsOneWidget);
    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.noButtonText));
    await tester.pump();

    // result
    expect(await result, equals(StepResult(layout: 'd', variant: 'e')));
  });
}
