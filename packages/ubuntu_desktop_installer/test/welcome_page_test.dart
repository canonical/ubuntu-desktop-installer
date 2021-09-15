import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  late MaterialApp app;

  setUpAll(() async {
    await setupAppLocalizations();
  });

  Future<void> setUpApp(WidgetTester tester) async {
    app = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: localizationsDelegates,
      locale: Locale('en'),
      home: Wizard(
        routes: <String, WidgetBuilder>{
          Routes.welcome: (_) => WelcomePage(),
          Routes.tryOrInstall: (context) => Text(Routes.tryOrInstall),
        },
      ),
    );
    final client = MockSubiquityClient();
    when(client.keyboard()).thenAnswer((_) async => KeyboardSetup(layouts: []));
    await tester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => WelcomeModel(
            client: client,
            keyboardService: KeyboardService(),
          ),
        ),
        ChangeNotifierProvider<Settings>(
          create: (_) => Settings(MockGSettings()),
        ),
      ], child: app),
    );
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  }

  testWidgets('should display a list of languages', (tester) async {
    await setUpApp(tester);

    final languageList = find.byType(ListView);
    expect(languageList, findsOneWidget);

    final settings = Settings.of(tester.element(languageList), listen: false);

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
    expect(settings.locale.languageCode, 'en');

    final itemFrench = find.widgetWithText(ListTile, 'Français');
    expect(itemFrench, findsOneWidget);
    expect((itemFrench.evaluate().single.widget as ListTile).selected, false);

    await tester.tap(itemFrench);
    await tester.pump();
    expect((itemEnglish.evaluate().single.widget as ListTile).selected, false);
    expect((itemFrench.evaluate().single.widget as ListTile).selected, true);
    expect(settings.locale.languageCode, 'fr');
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
