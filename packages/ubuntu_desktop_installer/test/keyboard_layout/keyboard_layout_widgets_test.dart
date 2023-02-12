import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_widgets.dart';

import '../test_utils.dart';

// ignore_for_file: type=lint

void main() {
  setUpAll(() => UbuntuTester.context = DetectKeyboardLayoutView);

  testWidgets('press key', (tester) async {
    int? keyPress;

    await tester.pumpWidget(
      tester.buildApp(
        (_) => DetectKeyboardLayoutView(
          pressKey: const ['x', 'y', 'z'],
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
      tester.buildApp((_) => DetectKeyboardLayoutView(keyPresent: 'x')),
    );

    expect(find.byType(KeyPresentView), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text(tester.lang.isKeyPresent), findsOneWidget);
  });
}
