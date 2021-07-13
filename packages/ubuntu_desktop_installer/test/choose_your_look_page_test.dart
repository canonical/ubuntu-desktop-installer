import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/app_theme.dart';
import 'package:ubuntu_desktop_installer/pages/choose_your_look_page.dart';
import 'package:ubuntu_desktop_installer/widgets/option_card.dart';

import 'choose_your_look_page_test.mocks.dart';

@GenerateMocks([AppTheme])
void main() {
  AppLocalizations lang(WidgetTester tester) {
    final page = tester.element(find.byType(ChooseYourLookPage));
    return AppLocalizations.of(page)!;
  }

  testWidgets('ChooseYourLookPage applies theme', (tester) async {
    final AppTheme theme = MockAppTheme();
    when(theme.apply(Brightness.light)).thenAnswer((_) {});
    when(theme.apply(Brightness.dark)).thenAnswer((_) {});

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: theme,
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: ChooseYourLookPage(),
        ),
      ),
    );

    final lightOptionCard = find.widgetWithText(
      OptionCard,
      lang(tester).chooseYourLookPageLightSetting,
    );
    expect(lightOptionCard, findsOneWidget);
    await tester.tap(lightOptionCard);
    verify(theme.apply(Brightness.light));

    final darkOptionCard = find.widgetWithText(
      OptionCard,
      lang(tester).chooseYourLookPageDarkSetting,
    );
    expect(darkOptionCard, findsOneWidget);
    await tester.tap(darkOptionCard);
    verify(theme.apply(Brightness.dark));
  });
}
