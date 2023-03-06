import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:ubuntu_desktop_installer/settings.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'welcome_page_test.mocks.dart';

// ignore_for_file: type=lint

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
    when(client.keyboard()).thenAnswer((_) async =>
        KeyboardSetup(layouts: [], setting: KeyboardSetting(layout: '')));
    await tester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => WelcomeModel(client),
        ),
        ChangeNotifierProvider<Settings>(
          create: (_) => Settings(MockGSettings()),
        ),
      ], child: InheritedLocale(child: app)),
    );
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  }

  testWidgets('should display a list of languages', (tester) async {
    await setUpApp(tester);

    final languageList = find.byType(ListView);
    expect(languageList, findsOneWidget);

    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'en');

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

    // scroll forward to Italian
    await tester.scrollUntilVisible(itemItalian, -kMinInteractiveDimension / 2);
    await tester.pump();
    await tester.tap(itemItalian);
    await tester.pump();
    expect((itemItalian.evaluate().single.widget as ListTile).selected, true);
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'it');

    // scroll backward to English
    await tester.scrollUntilVisible(itemEnglish, kMinInteractiveDimension / 2);
    await tester.pump();
    await tester.tap(itemEnglish);
    await tester.pump();
    expect((itemEnglish.evaluate().single.widget as ListTile).selected, true);
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'en');

    // scroll forward to French
    await tester.scrollUntilVisible(itemFrench, -kMinInteractiveDimension / 2);
    await tester.pump();
    await tester.tap(itemFrench);
    await tester.pump();

    expect((itemItalian.evaluate().single.widget as ListTile).selected, false);
    expect((itemEnglish.evaluate().single.widget as ListTile).selected, false);
    expect((itemFrench.evaluate().single.widget as ListTile).selected, true);
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'fr');
  });

  testWidgets('key search', (tester) async {
    await setUpApp(tester);

    final languageList = find.byType(ListView);
    expect(languageList, findsOneWidget);

    final keySearch = find.byType(KeySearch);
    expect(keySearch, findsOneWidget);

    final focusNode = tester.widget<KeySearch>(keySearch).focusNode;
    expect(focusNode, isNotNull);
    expect(focusNode!.hasFocus, isTrue);

    // french
    await tester.sendKeyEvent(LogicalKeyboardKey.keyF);
    await tester.pumpAndSettle(kKeySearchInterval);
    await tester.pumpAndSettle();
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'fr');

    // danish
    await tester.sendKeyEvent(LogicalKeyboardKey.keyD);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyA);
    await tester.pumpAndSettle(kKeySearchInterval);
    await tester.pumpAndSettle();
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'da');

    // swedish
    await tester.sendKeyEvent(LogicalKeyboardKey.keyS);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyV);
    await tester.pumpAndSettle(kKeySearchInterval);
    await tester.pumpAndSettle();
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'sv');
  });

  testWidgets('should continue to next page', (tester) async {
    await setUpApp(tester);

    final continueButton = find.widgetWithText(FilledButton, 'Continue');
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsNothing);
    expect(find.text(Routes.tryOrInstall), findsOneWidget);
  });
}
