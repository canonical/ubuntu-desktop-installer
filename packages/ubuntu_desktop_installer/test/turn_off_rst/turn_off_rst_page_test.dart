import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_page.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test_utils.dart';
import 'turn_off_rst_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([TurnOffRSTModel, UrlLauncher])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('restart', (tester) async {
    final model = MockTurnOffRSTModel();

    await tester.pumpWidget(
      Provider<TurnOffRSTModel>.value(
        value: model,
        child: tester.buildApp((_) => TurnOffRSTPage()),
      ),
    );

    final restartButton = find.widgetWithText(
      FilledButton,
      tester.lang.restartIntoWindows,
    );
    expect(restartButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    verifyNever(model.reboot());

    final continueButton = find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text(tester.lang.restartButtonText));

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    verify(model.reboot()).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('tap link', (tester) async {
    final model = MockTurnOffRSTModel();

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl('https://help.ubuntu.com/rst'))
        .thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(
      Provider<TurnOffRSTModel>.value(
        value: model,
        child: tester.buildApp((_) => TurnOffRSTPage()),
      ),
    );

    await tester.tapLink('help.ubuntu.com/rst');

    verify(urlLauncher.launchUrl('https://help.ubuntu.com/rst')).called(1);
  });
}
