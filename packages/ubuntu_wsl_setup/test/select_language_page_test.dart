import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/select_language/select_language_model.dart';
import 'package:ubuntu_wsl_setup/pages/select_language/select_language_page.dart';

import 'select_language_page_test.mocks.dart';
import 'test_utils.dart';

@GenerateMocks([SelectLanguageModel, Settings])
void main() {
  LangTester.type = SelectLanguagePage;

  SelectLanguageModel buildModel() {
    final model = MockSelectLanguageModel();
    when(model.languageCount).thenReturn(3);
    when(model.language(0)).thenReturn('English');
    when(model.locale(0)).thenReturn(Locale('en_US'));
    when(model.language(1)).thenReturn('French');
    when(model.locale(1)).thenReturn(Locale('fr_FR'));
    when(model.language(2)).thenReturn('German');
    when(model.locale(2)).thenReturn(Locale('de_DE'));
    when(model.selectedLanguageIndex).thenReturn(1);
    when(model.getServerLocale()).thenAnswer((_) async => Locale('fr', 'FR'));
    return model;
  }

  Widget buildPage(SelectLanguageModel model, Settings settings) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectLanguageModel>.value(value: model),
        ChangeNotifierProvider<Settings>.value(value: settings),
      ],
      child: SelectLanguagePage(),
    );
  }

  Widget buildApp(
      WidgetTester tester, SelectLanguageModel model, Settings settings) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model, settings)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('select and apply locale', (tester) async {
    final model = buildModel();
    final settings = MockSettings();
    when(settings.locale).thenReturn(Locale('fr_FR'));

    await tester.pumpWidget(buildApp(tester, model, settings));

    verify(model.loadLanguages()).called(1);
    verify(model.selectLocale(Locale('fr_FR'))).called(1);

    final listTile = find.widgetWithText(ListTile, 'German');
    expect(listTile, findsOneWidget);
    await tester.tap(listTile);
    verify(model.selectedLanguageIndex = 2).called(1);
    verify(settings.applyLocale(Locale('de_DE'))).called(1);
  });

  testWidgets('load and apply locale', (tester) async {
    final model = buildModel();
    final settings = MockSettings();
    when(settings.locale).thenReturn(Locale('fr_FR'));

    await tester.pumpWidget(buildApp(tester, model, settings));

    verify(model.loadLanguages()).called(1);
    verify(model.getServerLocale()).called(1);
    verify(model.selectLocale(Locale('fr_FR'))).called(1);

    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.applyLocale(Locale('fr_FR'))).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.locale()).thenAnswer((_) async => 'en_US.UTF-8');

    final settings = MockSettings();
    when(settings.locale).thenReturn(Locale('en_US'));

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Settings>.value(value: settings),
          Provider<SubiquityClient>.value(value: client),
        ],
        child: Wizard(
          routes: {'/': SelectLanguagePage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(SelectLanguagePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SelectLanguageModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
