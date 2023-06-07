import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/storage/bitlocker/bitlocker_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/bitlocker/bitlocker_page.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_test/yaru_test.dart';

import '../../test_utils.dart';
import 'bitlocker_page_test.mocks.dart';

@GenerateMocks([BitLockerModel])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('restart', (tester) async {
    final model = MockBitLockerModel();
    when(model.reboot()).thenAnswer((_) async {});

    await tester.pumpWidget(
      ProviderScope(
        overrides: [bitLockerModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const BitLockerPage()),
      ),
    );

    final restartButton = find.button(tester.lang.restartIntoWindows);
    expect(restartButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pumpAndSettle();
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
    final model = MockBitLockerModel();

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl('https://help.ubuntu.com/bitlocker'))
        .thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [bitLockerModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const BitLockerPage()),
      ),
    );

    await tester.tapLink('help.ubuntu.com/bitlocker');

    verify(urlLauncher.launchUrl('https://help.ubuntu.com/bitlocker'))
        .called(1);
  });
}
