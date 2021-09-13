import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_page.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'turn_off_bitlocker_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([TurnOffBitLockerModel])
void main() {
  testWidgets('restart', (tester) async {
    final model = MockTurnOffBitLockerModel();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: Wizard(
          routes: {
            '/': (_) {
              return Provider<TurnOffBitLockerModel>.value(
                value: model,
                child: TurnOffBitLockerPage(),
              );
            },
          },
          onNext: (settings) => '/',
        ),
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
