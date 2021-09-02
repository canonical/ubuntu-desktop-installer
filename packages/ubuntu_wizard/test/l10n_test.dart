import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/l10n.dart';

void main() {
  test('load localized languages', () async {
    const testLocales = [
      Locale('fr', 'FR'),
      Locale('es', 'ES'),
      Locale('en', 'US'),
      Locale('ru'),
    ];

    expect(
      await loadLocalizedLanguages(testLocales),
      equals([
        LocalizedLanguage('English', Locale('en', 'US')),
        LocalizedLanguage('Español', Locale('es', 'ES')),
        LocalizedLanguage('Français', Locale('fr', 'FR')),
      ]),
    );
  });

  test('find best matching locale', () {
    const localeFr = Locale('fr');
    const localeFrCA = Locale('fr', 'CA');
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
        LocalizedLanguage('', localeFrFReuro),
        LocalizedLanguage('', localeFrCA),
        LocalizedLanguage('', localeFrFR),
      ].findBestMatch(localeFrFReuro),
      equals(1),
    );

    // matching language and country
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeFrCA),
        LocalizedLanguage('', localeFrFR),
      ].findBestMatch(localeFrFReuro),
      equals(2),
    );

    // matching language
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeFrCA),
      ].findBestMatch(localeFrFReuro),
      equals(0),
    );

    // no match
    expect(
      <LocalizedLanguage>[
        LocalizedLanguage('', localeFr),
        LocalizedLanguage('', localeFrCA),
      ].findBestMatch(Locale('en')),
      equals(isNull),
    );
  });
}
