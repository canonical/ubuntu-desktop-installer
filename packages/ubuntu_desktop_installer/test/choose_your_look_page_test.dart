import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/choose_your_look_page.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'choose_your_look_page_test.mocks.dart';

@GenerateMocks([Settings])
void main() {
  AppLocalizations lang(WidgetTester tester) {
    final page = tester.element(find.byType(ChooseYourLookPage));
    return AppLocalizations.of(page);
  }

  testWidgets('ChooseYourLookPage applies theme', (tester) async {
    final Settings settings = MockSettings();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: settings,
        child: MaterialApp(
          localizationsDelegates: localizationsDelegates,
          home: Wizard(
            routes: {
              '/': ChooseYourLookPage.create,
            },
          ),
        ),
      ),
    );

    final lightOptionCard = find.widgetWithText(
      OptionCard,
      lang(tester).chooseYourLookPageLightSetting,
    );
    expect(lightOptionCard, findsOneWidget);
    await tester.tap(lightOptionCard);
    verify(settings.applyTheme(Brightness.light));

    final darkOptionCard = find.widgetWithText(
      OptionCard,
      lang(tester).chooseYourLookPageDarkSetting,
    );
    expect(darkOptionCard, findsOneWidget);
    await tester.tap(darkOptionCard);
    verify(settings.applyTheme(Brightness.dark));
  });
}
