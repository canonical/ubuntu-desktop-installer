import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

void main() {
  group('parseLocale', () {
    test('empty and C locales', () {
      expect(parseLocale(''), const Locale('C'));
      expect(parseLocale('C'), const Locale('C'));
    });

    test('basic locales', () {
      expect(parseLocale('en'), const Locale('en'));
      expect(parseLocale('fr'), const Locale('fr'));
      expect(parseLocale('en_US'), const Locale('en', 'US'));
      expect(parseLocale('en_GB'), const Locale('en', 'GB'));
    });

    test('three letter locales', () {
      expect(parseLocale('agr_PE.UTF-8'), const Locale('agr', 'PE'));
      expect(parseLocale('bhb_IN.UTF-8'), const Locale('bhb', 'IN'));
    });

    test('codeset', () {
      expect(parseLocale('zh_CN.UTF-8'), const Locale('zh', 'CN'));
      expect(parseLocale('zh_SG.GBK'), const Locale('zh', 'SG'));
      expect(parseLocale('zh_HK.BIG5'), const Locale('zh', 'HK'));
      expect(parseLocale('zh_TW.EUC-TW'), const Locale('zh', 'TW'));
      expect(parseLocale('hy_AM.ARMSCII-8'), const Locale('hy', 'AM'));
    });

    test('modifier', () {
      expect(parseLocale('fr@euro'), const Locale('fr'));
      expect(parseLocale('fr_FR@euro'), const Locale('fr', 'FR'));
      expect(parseLocale('fr_BE.UTF-8@euro'), const Locale('fr', 'BE'));
    });

    test('unexpected order', () {
      expect(parseLocale('fr.UTF-8_FR'), const Locale('fr', 'FR'));
      expect(parseLocale('fr.UTF-8_FR@euro'), const Locale('fr', 'FR'));
    });

    test('unexpected format', () {
      expect(parseLocale('fr_UTF-8'), const Locale('fr'));
      expect(parseLocale('fr_UTF-8_FR'), const Locale('fr', 'FR'));
      expect(parseLocale('fr_UTF-8_FR_euro'), const Locale('fr', 'FR'));
    });
  });
}
