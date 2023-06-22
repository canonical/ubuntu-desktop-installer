import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_model.dart';

import 'test_locale.dart';

void main() {
  test('load languages', () async {
    final locale = MockLocaleService();
    when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);
    await model.init();
    expect(model.languageCount, greaterThan(1));
    expect(model.selectedIndex, isPositive);

    final selected = model.locale(model.selectedIndex);
    expect(selected.languageCode, 'en');
    expect(selected.countryCode, 'US');
  });

  test('sort languages', () async {
    final locale = MockLocaleService();
    when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);
    await model.init();

    final languages = List.generate(model.languageCount, model.language);
    expect(languages.length, greaterThan(1));

    final sortedLanguages = List.of(languages)
      ..sort((a, b) => removeDiacritics(a).compareTo(removeDiacritics(b)));
    expect(languages, equals(sortedLanguages));
  });

  test('select locale', () async {
    final locale = MockLocaleService();
    when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);
    await model.init();
    expect(model.languageCount, greaterThan(1));
    expect(model.selectedIndex, isPositive);

    // falls back to the base locale (en_US)
    model.selectLocale(const Locale('foo'));
    expect(model.locale(model.selectedIndex), equals(const Locale('en', 'US')));

    final firstLocale = model.locale(0);
    final lastLocale = model.locale(model.languageCount - 1);
    expect(firstLocale, isNot(equals(lastLocale)));

    model.selectLocale(Locale.fromSubtags(
        languageCode: lastLocale.languageCode,
        countryCode: lastLocale.countryCode,
        scriptCode: 'bar'));
    expect(model.selectedIndex, equals(model.languageCount - 1));
  });

  test('set locale', () {
    final locale = MockLocaleService();
    when(locale.setLocale('fr_CA.UTF-8')).thenAnswer((_) async {});
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);
    model.applyLocale(const Locale('fr', 'CA'));
    verify(locale.setLocale('fr_CA.UTF-8')).called(1);
  });

  test('selected language', () async {
    final locale = MockLocaleService();
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    expect(model.selectedIndex, isZero);
    await model.selectLanguage(0);
    expect(model.selectedIndex, isZero);
    expect(wasNotified, isFalse);

    await model.selectLanguage(1);
    expect(model.selectedIndex, equals(1));
    expect(wasNotified, isTrue);
  });

  test('search language', () async {
    final locale = MockLocaleService();
    when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);
    await model.init();

    final english = model.searchLanguage('eng');
    expect(model.language(english), equals('English'));
    await model.selectLanguage(english);
    expect(model.searchLanguage('eng'), english);

    // next language with the same prefix
    final spanish = model.searchLanguage('e');
    expect(model.language(spanish), equals('Español'));

    // case-insensitive
    final french = model.searchLanguage('FRA');
    expect(model.language(french), equals('Français'));
    await model.selectLanguage(french);

    // wrap around
    final danish = model.searchLanguage('d');
    expect(model.language(danish), equals('Dansk'));
    await model.selectLanguage(danish);

    // ignores diacritics
    final icelandic = model.searchLanguage('is');
    expect(model.language(icelandic), equals('Íslenska'));

    // no match
    expect(model.searchLanguage('foo'), isNegative);
    expect(model.searchLanguage('none'), isNegative);
  });

  test('play welcome sound', () async {
    final locale = MockLocaleService();
    final sound = MockSoundService();

    final model = LocaleModel(locale: locale, sound: sound);
    await model.playWelcomeSound();
    verify(sound.play('system-ready')).called(1);
  });
}
