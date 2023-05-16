import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/rst/rst_model.dart';
import 'package:ubuntu_desktop_installer/pages/rst/rst_page.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'rst_page_test.mocks.dart';

@GenerateMocks([RstModel, UrlLauncher])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('restart', (tester) async {
    final model = MockRstModel();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          rstModelProvider.overrideWith((_) => model),
        ],
        child: tester.buildApp((_) => const RstPage()),
      ),
    );

    final restartButton =
        find.button(find.al10n((l10n) => l10n.restartIntoWindows));
    expect(restartButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    verifyNever(model.reboot());

    final dialogButton = find.descendant(
        of: find.byType(AlertDialog),
        matching: find.al10n((l10n) => l10n.restartButtonText));

    await tester.tap(dialogButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    verify(model.reboot()).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('tap link', (tester) async {
    final model = MockRstModel();

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl('https://help.ubuntu.com/rst'))
        .thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          rstModelProvider.overrideWith((_) => model),
        ],
        child: tester.buildApp((_) => const RstPage()),
      ),
    );

    await tester.tapLink('help.ubuntu.com/rst');

    verify(urlLauncher.launchUrl('https://help.ubuntu.com/rst')).called(1);
  });
}
