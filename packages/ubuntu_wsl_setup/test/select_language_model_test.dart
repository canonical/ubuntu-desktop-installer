import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_wsl_setup/pages/select_language/select_language_model.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';

void main() {
  test('load languages', () async {
    final model = SelectLanguageModel(
      MockSubiquityClient(),
      const LanguageFallbackService({}),
    );
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
  });

  test('sort languages', () async {
    final model = SelectLanguageModel(
      MockSubiquityClient(),
      const LanguageFallbackService({}),
    );
    await model.loadLanguages();

    final languages = List.generate(model.languageCount, model.language);
    expect(languages.length, greaterThan(1));

    final sortedLanguages = List.of(languages)
      ..sort((a, b) => removeDiacritics(a).compareTo(removeDiacritics(b)));
    expect(languages, equals(sortedLanguages));
  });

  test('select locale', () async {
    final model = SelectLanguageModel(
      MockSubiquityClient(),
      const LanguageFallbackService({}),
    );
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
    expect(model.selectedLanguageIndex, equals(0));

    // falls back to the base locale (en_US)
    model.selectLocale(const Locale('foo'));
    expect(model.locale(model.selectedLanguageIndex),
        equals(const Locale('en', 'US')));

    final firstLocale = model.locale(0);
    final lastLocale = model.locale(model.languageCount - 1);
    expect(firstLocale, isNot(equals(lastLocale)));

    model.selectLocale(lastLocale);
    expect(model.selectedLanguageIndex, equals(model.languageCount - 1));
  });

  test('load locale', () async {
    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'fr_FR.UTF-8');

    final model =
        SelectLanguageModel(client, const LanguageFallbackService({}));
    final locale = await model.getServerLocale();
    verify(client.getLocale()).called(1);
    expect(locale, equals(const Locale('fr', 'FR')));
  });

  test('set locale', () {
    final client = MockSubiquityClient();
    final model =
        SelectLanguageModel(client, const LanguageFallbackService({}));
    model.applyLocale(const Locale('fr', 'CA'));
    verify(client.setLocale('fr_CA.UTF-8')).called(1);
  });

  test('selected language', () {
    final model = SelectLanguageModel(
      MockSubiquityClient(),
      const LanguageFallbackService({}),
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    expect(model.selectedLanguageIndex, isZero);
    model.selectedLanguageIndex = 0;
    expect(model.selectedLanguageIndex, isZero);
    expect(wasNotified, isFalse);

    model.selectedLanguageIndex = 1;
    expect(model.selectedLanguageIndex, equals(1));
    expect(wasNotified, isTrue);
  });

  test('uiLocale returns default for unsupported langs', () async {
    final model = SelectLanguageModel(
      MockSubiquityClient(),
      LanguageFallbackService.linux(),
    );
    await model.loadLanguages();
    final languages = List.generate(model.languageCount, model.language);
    expect(model.uiLocale(languages.indexOf('Uyghur')), kDefaultLocale);
    expect(model.uiLocale(languages.indexOf('Sinhala')), kDefaultLocale);
  });

  test('language wont return unsupported chars', () async {
    final model = SelectLanguageModel(
      MockSubiquityClient(),
      LanguageFallbackService.linux(),
    );
    await model.loadLanguages();
    final languages = List.generate(model.languageCount, model.language);
    expect(languages.any((e) => e.contains('\u{0626}')), isFalse);
    expect(languages.any((e) => e.contains('\u{0DC3}')), isFalse);
  });

  test('get install lang packs option', () async {
    final client = MockSubiquityClient();
    when(client.wslSetupOptions()).thenAnswer(
      (_) async => const WSLSetupOptions(installLanguageSupportPackages: false),
    );

    final model =
        SelectLanguageModel(client, const LanguageFallbackService({}));
    await model.getInstallLanguagePacks();
    verify(client.wslSetupOptions()).called(1);
    expect(model.installLanguagePacks, isFalse);
  });

  test('set install lang packs option', () {
    final client = MockSubiquityClient();
    final model =
        SelectLanguageModel(client, const LanguageFallbackService({}));
    model.setInstallLanguagePacks(false);
    model.applyInstallLanguagePacks();
    verify(client.setWslSetupOptions(
      const WSLSetupOptions(installLanguageSupportPackages: false),
    )).called(1);
  });
}
