import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/app.dart';
import 'package:ubuntu_desktop_installer/keyboard_service.dart';
import 'package:ubuntu_desktop_installer/l10n/app_localizations.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';
import 'package:ubuntu_desktop_installer/routes.dart';

class SubiquityClientMock extends SubiquityClient {
  @override
  Future<String> setLocale(String code) async {
    return '';
  }

  @override
  Future<KeyboardSetup> keyboard() async {
    return KeyboardSetup(layouts: []);
  }
}

void main() {
  late MaterialApp app;

  setUpAll(() async {
    await setupAppLocalizations();
  });

  Future<void> setUpApp(WidgetTester tester) async {
    app = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale('en'),
      initialRoute: Routes.welcome,
      routes: <String, WidgetBuilder>{
        Routes.welcome: WelcomePage.create,
        Routes.tryOrInstall: (context) => Text(Routes.tryOrInstall),
      },
    );
    await tester.pumpWidget(
      MultiProvider(providers: [
        Provider(
          // ignore: unnecessary_cast
          create: (_) => SubiquityClientMock() as SubiquityClient,
        ),
        Provider(create: (context) => KeyboardService()),
      ], child: app),
    );
    expect(find.byType(WelcomePage), findsOneWidget);
  }

  testWidgets('should display a list of languages', (tester) async {
    await setUpApp(tester);

    final languageList = find.byType(ListView);
    expect(languageList, findsOneWidget);

    final listItems =
        find.descendant(of: languageList, matching: find.byType(ListTile));
    expect(listItems, findsWidgets);
    expect(listItems.evaluate().length, lessThan(app.supportedLocales.length));
    for (final language in ['English', 'Français', 'Italiano']) {
      expect(find.descendant(of: languageList, matching: find.text(language)),
          findsOneWidget);
    }

    final itemEnglish = find.widgetWithText(ListTile, 'English');
    expect(itemEnglish, findsOneWidget);
    expect((itemEnglish.evaluate().single.widget as ListTile).selected, true);
    expect(UbuntuDesktopInstallerApp.locale.languageCode, 'en');

    final itemFrench = find.widgetWithText(ListTile, 'Français');
    expect(itemFrench, findsOneWidget);
    expect((itemFrench.evaluate().single.widget as ListTile).selected, false);

    await tester.tap(itemFrench);
    await tester.pump();
    expect((itemEnglish.evaluate().single.widget as ListTile).selected, false);
    expect((itemFrench.evaluate().single.widget as ListTile).selected, true);
    expect(UbuntuDesktopInstallerApp.locale.languageCode, 'fr');
  });

  testWidgets('should continue to next page', (tester) async {
    await setUpApp(tester);

    final continueButton = find.widgetWithText(OutlinedButton, 'Continue');
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsNothing);
    expect(find.text(Routes.tryOrInstall), findsOneWidget);
  });
}
