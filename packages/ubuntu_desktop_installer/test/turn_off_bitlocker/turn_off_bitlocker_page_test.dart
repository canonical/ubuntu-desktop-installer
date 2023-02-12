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

import '../test_utils.dart';
import 'turn_off_bitlocker_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([TurnOffBitLockerModel, UrlLauncher])
void main() {
  testWidgets('restart', (tester) async {
    final model = MockTurnOffBitLockerModel();

    await tester.pumpWidget(
      Provider<TurnOffBitLockerModel>.value(
        value: model,
        child: tester.buildApp((_) => TurnOffBitLockerPage()),
      ),
    );

    final restartButton = find.widgetWithText(
      ElevatedButton,
      tester.lang.restartIntoWindows,
    );
    expect(restartButton, findsOneWidget);

    await tester.tap(restartButton);
    verify(model.reboot(immediate: true)).called(1);
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
