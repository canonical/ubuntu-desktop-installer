import 'dart:ui';

import 'package:ubuntu_wsl_setup/l10n.dart';

const kDefaultLocale = Locale('en', 'US');

// Languages we won't invest in shipping fonts in our rootfs for just yet.
// If users select one of those, we will submit it to Subiquity, but won't
// update the UI.
const _languagesLackingFontSupportForWslG = {
  'am': 'Amharic',
  'ar': 'Arabic',
  'bn': 'Bangla',
  'bo': 'Tibetan',
  'dz': 'Dzongkha',
  'fa': 'Persian',
  'gu': 'Gujarati',
  'he': 'Hebrew',
  'hi': 'Hindi',
  'ja': 'Japanese',
  'ka': 'Georgian',
  'km': 'Khmer',
  'kn': 'Kannada',
  'ko': 'Korean',
  'lo': 'Lao',
  'ml': 'Malayalam',
  'mr': 'Marathi',
  'my': 'Burmese',
  'ne': 'Nepali',
  'pa': 'Punjabi',
  'si': 'Sinhala',
  'ta': 'Tamil',
  'te': 'Telugu',
  'th': 'Thai',
  'ug': 'Uyghur',
  'vi': 'Vietnamese',
  'zh': 'Chinese',
};

/// Provide fallback logic for operations sensitive to languages we don't support.
class LanguageFallbackService {
  const LanguageFallbackService(this._langblockList);
  factory LanguageFallbackService.linux() =>
      const LanguageFallbackService(_languagesLackingFontSupportForWslG);
  factory LanguageFallbackService.win() => const LanguageFallbackService({});

  /// Locales and their display names for which we should not translate the UI.
  Map<String, String> get blocklist => _langblockList;
  final Map<String, String> _langblockList;

  String displayNameFor(LocalizedLanguage lang) {
    if (blocklist.isEmpty) {
      return lang.name;
    }

    final altName = blocklist[lang.locale.languageCode];
    if (altName != null) {
      return altName;
    }

    return lang.name;
  }

  bool isLocaleBlocked(Locale locale) =>
      blocklist.isNotEmpty && null != blocklist[locale.languageCode];
}
