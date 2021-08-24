import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_widgets.dart';

import 'widget_tester_extensions.dart';

void main() {
  testWidgets('press key', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    await tester.pumpWidget(
      MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: DetectKeyboardLayoutView(
          step: null,
          onNextStep: () {},
        ),
      ),
    );

    final context = tester.element(find.byType(DetectKeyboardLayoutView));

    final result = showDetectKeyboardLayoutDialog(context);
    await tester.pumpAndSettle();

    expect(find.text('v'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyV, platform: 'linux');
    await tester.pump();

    expect(find.text('w'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyW, platform: 'linux');
    await tester.pump();

    expect(find.text('z'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyZ, platform: 'linux');
    await tester.pump();

    expect(find.text('ö'), findsOneWidget);
    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.yesButtonText));
    await tester.pump();

    expect(find.text('ö'), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.semicolon, platform: 'linux');
    await tester.pump();

    expect(find.text('å'), findsOneWidget);
    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.yesButtonText));
    await tester.pump();

    expect(find.text('ə'), findsOneWidget);
    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.noButtonText));
    await tester.pump();

    expect(await result, 'se');
  });
}
