import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';

// ignore_for_file: type=lint

void main() {
  test('load localized languages', () async {
    const testLocales = [
      Locale('fr', 'FR'),
      Locale('es', 'ES'),
      Locale('en', 'US'),
      Locale('ru', 'RU'),
    ];

    expect(
      await loadLocalizedLanguages(testLocales),
      equals([
        LocalizedLanguage('English', Locale('en', 'US')),
        LocalizedLanguage('Español', Locale('es', 'ES')),
        LocalizedLanguage('Français', Locale('fr', 'FR')),
        LocalizedLanguage('Русский', Locale('ru', 'RU')),
      ]),
    );
  });

  test('find best matching locale', () {
    const localeEnUS = Locale('en', 'US');
    const localeEs = Locale('es');
    const localeFr = Locale('fr');
    const localeFrCA = Locale('fr', 'CA');
    const localeFrBE = Locale('fr', 'BE');
    const localeFrFR = Locale('fr', 'FR');
    const localeFrFReuro = Locale.fromSubtags(
      languageCode: 'fr',
      countryCode: 'FR',
      scriptCode: 'euro',
    );

    // full match
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeEnUS),
        LocalizedLanguage('', localeFrFReuro),
        LocalizedLanguage('', localeFrCA),
        LocalizedLanguage('', localeFrFR),
      ].findBestMatch(localeFrFReuro),
      equals(2),
    );

    // matching language and country
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeEnUS),
        LocalizedLanguage('', localeFrCA),
        LocalizedLanguage('', localeFrFR),
      ].findBestMatch(localeFrFReuro),
      equals(3),
    );

    // matching language
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeEnUS),
        LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeFrFReuro),
      equals(0),
    );

    // no match -> en
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeEnUS),
        LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeEs),
      equals(1),
    );

    // country mismatch -> en
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFrFR),
        LocalizedLanguage('', localeEnUS),
        LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeFrBE),
      equals(1),
    );
  });
}
