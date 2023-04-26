import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';

void main() {
  const locale = Locale('ja');
  final l10n = lookupUbuntuLocalizations(locale);
  final lang = LocalizedLanguage(l10n.languageName, locale);

  test('blocked language', () {
    const service = LanguageFallbackService({'ja': 'Japanese'});
    expect(service.isLocaleBlocked(locale), isTrue);
  });

  test('non-blocked language', () {
    const service = LanguageFallbackService({'pt': 'Portuguese'});
    expect(service.isLocaleBlocked(locale), isFalse);
  });
  test('display name of blocked language', () {
    const service = LanguageFallbackService({'ja': 'Japanese'});
    expect(service.displayNameFor(lang), equals('Japanese'));
  });

  test('display name of non-blocked language', () {
    const service = LanguageFallbackService({'pt': 'Portuguese'});
    expect(service.displayNameFor(lang), isNot(equals('Japanese')));
  });

  test('linux', () {
    final service = LanguageFallbackService.linux();
    expect(service.isLocaleBlocked(locale), isTrue);
    expect(service.displayNameFor(lang), equals('Japanese'));
  });

  test('windows', () {
    final service = LanguageFallbackService.win();
    expect(service.isLocaleBlocked(locale), isFalse);
    expect(service.displayNameFor(lang), isNot(equals('Japanese')));
  });
}
