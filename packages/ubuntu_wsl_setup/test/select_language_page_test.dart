import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/select_language/select_language_model.dart';
import 'package:ubuntu_wsl_setup/pages/select_language/select_language_page.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';

import 'select_language_page_test.mocks.dart';
import 'test_utils.dart';

// ignore_for_file: type=lint

@GenerateMocks([SelectLanguageModel])
void main() {
  LangTester.type = SelectLanguagePage;

  SelectLanguageModel buildModel() {
    final model = MockSelectLanguageModel();
    when(model.languageCount).thenReturn(3);
    when(model.language(0)).thenReturn('English');
    when(model.locale(0)).thenReturn(Locale('en_US'));
    when(model.uiLocale(0)).thenReturn(Locale('en_US'));
    when(model.language(1)).thenReturn('French');
    when(model.locale(1)).thenReturn(Locale('fr_FR'));
    when(model.uiLocale(1)).thenReturn(Locale('fr_FR'));
    when(model.language(2)).thenReturn('German');
    when(model.locale(2)).thenReturn(Locale('de_DE'));
    when(model.uiLocale(2)).thenReturn(Locale('de_DE'));
    when(model.selectedLanguageIndex).thenReturn(1);
    when(model.getServerLocale()).thenAnswer((_) async => Locale('fr', 'FR'));
    when(model.installLanguagePacks).thenReturn(true);
    return model;
  }

  Widget buildPage(SelectLanguageModel model, [Locale? locale]) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectLanguageModel>.value(value: model),
      ],
      child: InheritedLocale(value: locale, child: SelectLanguagePage()),
    );
  }

  Widget buildApp(WidgetTester tester, SelectLanguageModel model,
      [Locale? locale]) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: (_) => buildPage(model, locale),
            onNext: (settings) => '/',
          ),
        },
      ),
    );
  }

  testWidgets('select and apply locale', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model, Locale('fr_FR')));

    verify(model.loadLanguages()).called(1);
    verify(model.selectLocale(Locale('fr_FR'))).called(1);

    final listTile = find.widgetWithText(ListTile, 'German');
    expect(listTile, findsOneWidget);
    await tester.tap(listTile);
    verify(model.selectedLanguageIndex = 2).called(1);

    final context = tester.element(find.byType(SelectLanguagePage));
    expect(InheritedLocale.of(context), Locale('de_DE'));
  });

  testWidgets('load and apply locale', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model, Locale('fr_FR')));

    verify(model.loadLanguages()).called(1);
    verifyNever(model.getServerLocale());
    verify(model.selectLocale(Locale('fr_FR'))).called(1);

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.applyLocale(Locale('fr_FR'))).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    when(client.wslSetupOptions()).thenAnswer(
      (_) async => WSLSetupOptions(installLanguageSupportPackages: true),
    );
    registerMockService<SubiquityClient>(client);
    registerService(LanguageFallbackService.linux);

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: InheritedLocale(
        child: Wizard(
          routes: {
            '/': WizardRoute(
              builder: SelectLanguagePage.create,
              onNext: (settings) => '/',
            ),
          },
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
