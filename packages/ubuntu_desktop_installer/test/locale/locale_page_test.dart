import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_model.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_page.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../test_utils.dart';
import 'locale_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([SoundService, TelemetryService])
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
            Routes.locale: WizardRoute(builder: (_) => LocalePage()),
            Routes.welcome: WizardRoute(builder: (_) => Text(Routes.welcome)),
          },
        ),
      ),
    );
    final client = MockSubiquityClient();
    when(client.getKeyboard()).thenAnswer((_) async =>
        KeyboardSetup(layouts: [], setting: KeyboardSetting(layout: '')));
    await tester.pumpWidget(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => LocaleModel(client: client, sound: MockSoundService()),
        ),
      ], child: InheritedLocale(child: app)),
    );
    await tester.pumpAndSettle();
    expect(find.byType(LocalePage), findsOneWidget);
  }

  testWidgets('should display a list of languages', (tester) async {
    await setUpApp(tester);

    final languageList = find.byType(ListWidget);
    expect(languageList, findsOneWidget);

    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'en');

    final listItems = find.descendant(
        of: languageList, matching: find.byType(ListTile), skipOffstage: false);
    expect(listItems, findsWidgets);
    expect(listItems.evaluate().length, lessThan(app.supportedLocales.length));
    for (final language in ['English', 'Français', 'Galego', 'Italiano']) {
      final listItem =
          find.widgetWithText(ListTile, language, skipOffstage: false);
      await tester.dragUntilVisible(listItem, languageList, Offset(0, -10));
      await tester.pumpAndSettle();
      expect(listItem, findsOneWidget);
    }

    final itemItalian =
        find.widgetWithText(ListTile, 'Italiano', skipOffstage: false);

    final itemFrench =
        find.widgetWithText(ListTile, 'Français', skipOffstage: false);

    final itemGalego =
        find.widgetWithText(ListTile, 'Galego', skipOffstage: false);

    // scroll forward to Italian
    await tester.scrollUntilVisible(itemItalian, -kMinInteractiveDimension / 2);
    await tester.pump();
    await tester.tap(itemItalian);
    await tester.pump();
    expect((itemItalian.evaluate().single.widget as ListTile).selected, true);
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'it');

    // scroll backward to French
    await tester.scrollUntilVisible(itemFrench, kMinInteractiveDimension / 2);
    await tester.pump();
    await tester.tap(itemFrench);
    await tester.pump();
    expect((itemFrench.evaluate().single.widget as ListTile).selected, true);
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'fr');

    // scroll forward to Galego
    await tester.scrollUntilVisible(itemGalego, -kMinInteractiveDimension / 2);
    await tester.pump();
    await tester.tap(itemGalego);
    await tester.pump();

    expect((itemItalian.evaluate().single.widget as ListTile).selected, false);
    expect((itemFrench.evaluate().single.widget as ListTile).selected, false);
    expect((itemGalego.evaluate().single.widget as ListTile).selected, true);
    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'gl');
  });

  testWidgets('key search', (tester) async {
    await setUpApp(tester);

    final languageList = find.byType(ListWidget);
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

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    expect(find.byType(LocalePage), findsNothing);
    expect(find.text(Routes.welcome), findsOneWidget);
  });
}
