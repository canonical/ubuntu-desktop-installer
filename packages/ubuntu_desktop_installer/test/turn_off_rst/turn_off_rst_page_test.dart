import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_page.dart';

import '../widget_tester_extensions.dart';
import 'turn_off_rst_page_test.mocks.dart';

@GenerateMocks([TurnOffRSTModel])
void main() {
  testWidgets('restart', (tester) async {
    final model = MockTurnOffRSTModel();

    await tester.pumpWidget(
      Provider<TurnOffRSTModel>.value(
        value: model,
        child: tester.buildApp((_) => TurnOffRSTPage()),
      ),
    );

    final restartButton = find.widgetWithText(
      ElevatedButton,
      tester.lang.restartButtonText,
    );
    expect(restartButton, findsOneWidget);

    await tester.tap(restartButton);
    verify(model.reboot(immediate: true)).called(1);
  });
}
