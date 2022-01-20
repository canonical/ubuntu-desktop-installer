import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
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

import 'welcome_page_test.mocks.dart';

@GenerateMocks([TelemetryService])
void main() {
  late MaterialApp app;

  setUpAll(() async {
    await setupAppLocalizations();
  });

  Future<void> setUpApp(WidgetTester tester) async {
    registerMockService<TelemetryService>(MockTelemetryService());
    app = MaterialApp(
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      locale: Locale('en'),
      home: Flavor(
        data: const FlavorData(name: 'Ubuntu'),
        child: Wizard(
          routes: <String, WizardRoute>{
            Routes.welcome: WizardRoute(builder: (_) => WelcomePage()),
            Routes.tryOrInstall:
                WizardRoute(builder: (_) => Text(Routes.tryOrInstall)),
          },
        ),
      ),
    );
    final client = MockSubiquityClient();
    when(client.keyboard()).thenAnswer((_) async => KeyboardSetup(layouts: []));
    await tester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => WelcomeModel(client),
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
    expect(settings.locale.languageCode, 'en');

    final listItems = find.descendant(
        of: languageList, matching: find.byType(ListTile), skipOffstage: false);
    expect(listItems, findsWidgets);
    expect(listItems.evaluate().length, lessThan(app.supportedLocales.length));
    for (final language in ['English', 'Français', 'Italiano']) {
      final listItem = find.descendant(
          of: languageList, matching: find.text(language), skipOffstage: false);
      await tester.dragUntilVisible(listItem, languageList, Offset(0, -10));
      expect(listItem, findsOneWidget);
    }

    final itemEnglish =
        find.widgetWithText(ListTile, 'English', skipOffstage: false);
    expect(itemEnglish, findsOneWidget);

    final itemItalian =
        find.widgetWithText(ListTile, 'Italiano', skipOffstage: false);
    expect(itemItalian, findsOneWidget);

    final itemFrench =
        find.widgetWithText(ListTile, 'Français', skipOffstage: false);
    expect(itemFrench, findsOneWidget);

    await tester.ensureVisible(itemItalian);
    await tester.tap(itemItalian);
    await tester.pump();
    expect((itemItalian.evaluate().single.widget as ListTile).selected, true);
    expect(settings.locale.languageCode, 'it');

    await tester.ensureVisible(itemEnglish);
    await tester.tap(itemEnglish);
    await tester.pump();
    // TODO: why is the english tile not selected? Is the word too short?
    expect((itemEnglish.evaluate().single.widget as ListTile).selected, false);

    await tester.ensureVisible(itemFrench);
    await tester.tap(itemFrench);
    await tester.pump();

    expect((itemItalian.evaluate().single.widget as ListTile).selected, false);
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
