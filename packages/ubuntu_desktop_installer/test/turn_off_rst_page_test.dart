import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_model.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_rst/turn_off_rst_page.dart';
import 'package:wizard_router/wizard_router.dart';

import 'turn_off_rst_page_test.mocks.dart';

extension LangTester<T> on WidgetTester {
  AppLocalizations get lang {
    final page = element(find.byType(TurnOffRSTPage));
    return AppLocalizations.of(page)!;
  }
}

@GenerateMocks([TurnOffRSTModel])
void main() {
  testWidgets('restart', (tester) async {
    final model = MockTurnOffRSTModel();

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Wizard(
          routes: {
            '/': (_) {
              return Provider<TurnOffRSTModel>.value(
                value: model,
                child: TurnOffRSTPage(),
              );
            },
          },
          onNext: (settings) => '/',
        ),
      ),
    );

    final restartButton = find.widgetWithText(
      ElevatedButton,
      tester.lang.restartButtonText,
    );
    expect(restartButton, findsOneWidget);

    await tester.tap(restartButton);
    verify(model.reboot()).called(1);
  });
}
