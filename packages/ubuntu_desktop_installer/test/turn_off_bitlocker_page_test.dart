import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_bitlocker/turn_off_bitlocker_page.dart';
import 'package:wizard_router/wizard_router.dart';

import 'turn_off_bitlocker_page_test.mocks.dart';

extension LangTester<T> on WidgetTester {
  AppLocalizations get lang {
    final page = element(find.byType(TurnOffBitLockerPage));
    return AppLocalizations.of(page)!;
  }
}

@GenerateMocks([TurnOffBitLockerModel])
void main() {
  testWidgets('restart', (tester) async {
    final model = MockTurnOffBitLockerModel();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
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
    verify(model.reboot()).called(1);
  });
}
