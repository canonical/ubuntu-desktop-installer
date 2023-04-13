import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_test/mocks.dart';

import 'welcome_page_test.mocks.dart';

// ignore_for_file: type=lint

void main() {
  test('load languages', () async {
    final client = MockSubiquityClient();
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
  });

  test('sort languages', () async {
    final client = MockSubiquityClient();
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);
    await model.loadLanguages();

    final languages = List.generate(model.languageCount, model.language);
    expect(languages.length, greaterThan(1));

    final sortedLanguages = List.of(languages)
      ..sort((a, b) => removeDiacritics(a).compareTo(removeDiacritics(b)));
    expect(languages, equals(sortedLanguages));
  });

  test('select locale', () async {
    final client = MockSubiquityClient();
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);
    await model.loadLanguages();
    expect(model.languageCount, greaterThan(1));
    expect(model.selectedLanguageIndex, equals(0));

    // falls back to the base locale (en_US)
    model.selectLocale(Locale('foo'));
    expect(
        model.locale(model.selectedLanguageIndex), equals(Locale('en', 'US')));

    final firstLocale = model.locale(0);
    final lastLocale = model.locale(model.languageCount - 1);
    expect(firstLocale, isNot(equals(lastLocale)));

    model.selectLocale(Locale.fromSubtags(
        languageCode: lastLocale.languageCode,
        countryCode: lastLocale.countryCode,
        scriptCode: 'bar'));
    expect(model.selectedLanguageIndex, equals(model.languageCount - 1));
  });

  test('set locale', () {
    final client = MockSubiquityClient();
    when(client.setLocale('fr_CA.UTF-8')).thenAnswer((_) async {});
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);
    model.applyLocale(Locale('fr', 'CA'));
    verify(client.setLocale('fr_CA.UTF-8')).called(1);
  });

  test('selected language', () {
    final client = MockSubiquityClient();
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);

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

  test('search language', () async {
    final client = MockSubiquityClient();
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);
    await model.loadLanguages();

    final english = model.searchLanguage('eng');
    expect(model.language(english), equals('English'));
    model.selectedLanguageIndex = english;
    expect(model.searchLanguage('eng'), english);

    // next language with the same prefix
    final spanish = model.searchLanguage('e');
    expect(model.language(spanish), equals('Español'));

    // case-insensitive
    final french = model.searchLanguage('FRA');
    expect(model.language(french), equals('Français'));
    model.selectedLanguageIndex = french;

    // wrap around
    final danish = model.searchLanguage('d');
    expect(model.language(danish), equals('Dansk'));
    model.selectedLanguageIndex = danish;

    // ignores diacritics
    final icelandic = model.searchLanguage('is');
    expect(model.language(icelandic), equals('Íslenska'));

    // no match
    expect(model.searchLanguage('foo'), isNegative);
    expect(model.searchLanguage('none'), isNegative);
  });

  test('play welcome sound', () async {
    final client = MockSubiquityClient();
    final canberra = MockCanberraService();

    final model = WelcomeModel(client: client, canberra: canberra);
    await model.playWelcomeSound();
    verify(canberra.play('system-ready')).called(1);
  });
}
