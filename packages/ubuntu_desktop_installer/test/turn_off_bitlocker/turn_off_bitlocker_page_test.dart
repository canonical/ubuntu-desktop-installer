import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_page.dart';

import '../widget_tester_extensions.dart';
import 'turn_off_bitlocker_page_test.mocks.dart';

@GenerateMocks([TurnOffBitLockerModel])
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
}
