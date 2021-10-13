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

  group('parseLocale', () {
    test('empty and C locales', () {
      expect(parseLocale(''), Locale('C'));
      expect(parseLocale('C'), Locale('C'));
    });

    test('basic locales', () {
      expect(parseLocale('en'), Locale('en'));
      expect(parseLocale('fr'), Locale('fr'));
      expect(parseLocale('en_US'), Locale('en', 'US'));
      expect(parseLocale('en_GB'), Locale('en', 'GB'));
    });

    test('three letter locales', () {
      expect(parseLocale('agr_PE.UTF-8'), Locale('agr', 'PE'));
      expect(parseLocale('bhb_IN.UTF-8'), Locale('bhb', 'IN'));
    });

    test('codeset', () {
      expect(parseLocale('zh_CN.UTF-8'), Locale('zh', 'CN'));
      expect(parseLocale('zh_SG.GBK'), Locale('zh', 'SG'));
      expect(parseLocale('zh_HK.BIG5'), Locale('zh', 'HK'));
      expect(parseLocale('zh_TW.EUC-TW'), Locale('zh', 'TW'));
      expect(parseLocale('hy_AM.ARMSCII-8'), Locale('hy', 'AM'));
    });

    test('modifier', () {
      expect(parseLocale('fr@euro'), Locale('fr'));
      expect(parseLocale('fr_FR@euro'), Locale('fr', 'FR'));
      expect(parseLocale('fr_BE.UTF-8@euro'), Locale('fr', 'BE'));
    });

    test('unexpected order', () {
      expect(parseLocale('fr.UTF-8_FR'), Locale('fr', 'FR'));
      expect(parseLocale('fr.UTF-8_FR@euro'), Locale('fr', 'FR'));
    });

    test('unexpected format', () {
      expect(parseLocale('fr_UTF-8'), Locale('fr'));
      expect(parseLocale('fr_UTF-8_FR'), Locale('fr', 'FR'));
      expect(parseLocale('fr_UTF-8_FR_euro'), Locale('fr', 'FR'));
    });
  });
}
