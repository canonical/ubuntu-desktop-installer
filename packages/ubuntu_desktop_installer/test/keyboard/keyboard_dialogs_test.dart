import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_widgets.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';

import '../test_utils.dart';

void main() {
  setUpAll(() => UbuntuTester.context = DetectKeyboardView);

  testWidgets('detect layout', (tester) async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('0')).thenAnswer((_) async {
      return const AnyStep.stepPressKey(symbols: ['a'], keycodes: {30: '40'});
    });
    when(client.getKeyboardStep('40')).thenAnswer((_) async {
      return const AnyStep.stepKeyPresent(symbol: 'b', yes: '50', no: '');
    });
    when(client.getKeyboardStep('50')).thenAnswer((_) async {
      return const AnyStep.stepKeyPresent(symbol: 'c', yes: '', no: '60');
    });
    when(client.getKeyboardStep('60')).thenAnswer((_) async {
      return const AnyStep.stepResult(layout: 'd', variant: 'e');
    });
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(
      tester.buildApp(
        (_) => DetectKeyboardView(
          pressKey: null,
          keyPresent: null,
          onKeyPress: (_) {},
        ),
      ),
    );

    final context = tester.element(find.byType(DetectKeyboardView));

    // init
    final result = showDetectKeyboardDialog(context);
    await tester.pumpAndSettle();
    verify(client.getKeyboardStep('0')).called(1);

    // press a
    expect(find.text('a'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyA, platform: 'linux');
    await tester.pump();
    verify(client.getKeyboardStep('40')).called(1);

    await tester.pumpAndSettle();

    // b is present
    expect(find.text('b'), findsOneWidget);
    await tester.tap(find.button(tester.lang.yesButtonText));
    await tester.pump();
    verify(client.getKeyboardStep('50')).called(1);

    // c is not present
    expect(find.text('c'), findsOneWidget);
    await tester.tap(find.button(tester.lang.noButtonText));
    await tester.pump();
    verify(client.getKeyboardStep('60')).called(1);

    // result
    expect(await result, equals(const StepResult(layout: 'd', variant: 'e')));
  });
}
