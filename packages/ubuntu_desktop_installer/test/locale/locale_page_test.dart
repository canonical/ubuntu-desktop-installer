import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_model.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'locale_model_test.mocks.dart';
import 'locale_page_test.mocks.dart';

@GenerateMocks([TelemetryService])
void main() {
  LocaleModel buildModel() {
    final locale = MockLocaleService();
    when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');

    return LocaleModel(
      locale: locale,
      sound: MockSoundService(),
    );
  }

  Widget buildPage(LocaleModel model) {
    registerMockService<TelemetryService>(MockTelemetryService());

    return ProviderScope(
      overrides: [
        localeModelProvider.overrideWith((_) => model),
      ],
      child: const LocalePage(),
    );
  }

  testWidgets('should display a list of languages', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    final languageList = find.byType(ListWidget);
    expect(languageList, findsOneWidget);

    expect(InheritedLocale.of(tester.element(languageList)).languageCode, 'en');

    final listItems = find.descendant(
        of: languageList, matching: find.byType(ListTile), skipOffstage: false);
    expect(listItems, findsWidgets);
    for (final language in ['English', 'Français', 'Galego', 'Italiano']) {
      final listItem = find.listTile(language, skipOffstage: false);
      await tester.dragUntilVisible(
          listItem, languageList, const Offset(0, -10));
      await tester.pumpAndSettle();
      expect(listItem, findsOneWidget);
    }

    final itemItalian = find.listTile('Italiano', skipOffstage: false);
    final itemFrench = find.listTile('Français', skipOffstage: false);
    final itemGalego = find.listTile('Galego', skipOffstage: false);

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
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final languageList = find.byType(ListWidget);
    expect(languageList, findsOneWidget);

    expect(find.byType(KeySearch), hasFocus);

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
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tapNext();
    await tester.pumpAndSettle();

    expect(find.byType(LocalePage), findsNothing);
  });
}
