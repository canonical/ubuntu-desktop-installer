import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_rst.dart';

void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('restart', (tester) async {
    final model = buildRstModel();
    await tester.pumpWidget(tester.buildApp((_) => buildRstPage(model)));

    final restartButton = find.button(tester.lang.restartIntoWindows);
    expect(restartButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    verifyNever(model.reboot());

    final dialogButton = find.descendant(
        of: find.byType(AlertDialog),
        matching: find.text(tester.lang.restartButtonText));

    await tester.tap(dialogButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    verify(model.reboot()).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('tap link', (tester) async {
    final model = buildRstModel();

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl('https://help.ubuntu.com/rst'))
        .thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(tester.buildApp((_) => buildRstPage(model)));

    await tester.tapLink('help.ubuntu.com/rst');

    verify(urlLauncher.launchUrl('https://help.ubuntu.com/rst')).called(1);
  });
}
