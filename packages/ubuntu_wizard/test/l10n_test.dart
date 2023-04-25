import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';

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
        const LocalizedLanguage('English', Locale('en', 'US')),
        const LocalizedLanguage('Español', Locale('es', 'ES')),
        const LocalizedLanguage('Français', Locale('fr', 'FR')),
        const LocalizedLanguage('Русский', Locale('ru', 'RU')),
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
        const LocalizedLanguage('', localeFr),
        const LocalizedLanguage('', localeEnUS),
        const LocalizedLanguage('', localeFrFReuro),
        const LocalizedLanguage('', localeFrCA),
        const LocalizedLanguage('', localeFrFR),
      ].findBestMatch(localeFrFReuro),
      equals(2),
    );

    // matching language and country
    expect(
      <LocalizedLanguage>[
        const LocalizedLanguage('', localeFr),
        const LocalizedLanguage('', localeEnUS),
        const LocalizedLanguage('', localeFrCA),
        const LocalizedLanguage('', localeFrFR),
      ].findBestMatch(localeFrFReuro),
      equals(3),
    );

    // matching language
    expect(
      <LocalizedLanguage>[
        const LocalizedLanguage('', localeFr),
        const LocalizedLanguage('', localeEnUS),
        const LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeFrFReuro),
      equals(0),
    );

    // no match -> en
    expect(
      <LocalizedLanguage>[
        const LocalizedLanguage('', localeFr),
        const LocalizedLanguage('', localeEnUS),
        const LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeEs),
      equals(1),
    );

    // country mismatch -> en
    expect(
      <LocalizedLanguage>[
        const LocalizedLanguage('', localeFrFR),
        const LocalizedLanguage('', localeEnUS),
        const LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeFrBE),
      equals(1),
    );
  });
}
