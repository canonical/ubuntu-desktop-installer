import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

// ignore_for_file: type=lint

void main() {
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
