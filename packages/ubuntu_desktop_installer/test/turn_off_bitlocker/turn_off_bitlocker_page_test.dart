import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_page.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test_utils.dart';
import 'turn_off_bitlocker_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([TurnOffBitLockerModel, UrlLauncher])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('restart', (tester) async {
    final model = MockTurnOffBitLockerModel();
    when(model.reboot()).thenAnswer((_) async {});

    await tester.pumpWidget(
      Provider<TurnOffBitLockerModel>.value(
        value: model,
        child: tester.buildApp((_) => TurnOffBitLockerPage()),
      ),
    );

    final restartButton = find.widgetWithText(
      FilledButton,
      tester.lang.restartIntoWindows,
    );
    expect(restartButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pump();
    verify(model.reboot()).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('tap link', (tester) async {
    final model = MockTurnOffBitLockerModel();

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl('https://help.ubuntu.com/bitlocker'))
        .thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(
      Provider<TurnOffBitLockerModel>.value(
        value: model,
        child: tester.buildApp((_) => TurnOffBitLockerPage()),
      ),
    );

    await tester.tapLink('help.ubuntu.com/bitlocker');

    verify(urlLauncher.launchUrl('https://help.ubuntu.com/bitlocker'))
        .called(1);
  });
}
