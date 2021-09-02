import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'src/l10n/ubuntu_localizations.dart';
export 'src/l10n/ubuntu_localizations.dart';

/// Finds the Locale of Operating System i.e. Platform. and assigns it to
/// [Intl.systemLocale] and [Intl.defaultLocale].
///
/// Must See,
/// * [Intl.defaultLocale]
/// * [Intl.systemLocale]
Future<void> setupAppLocalizations() async {
  await findSystemLocale();
  Intl.defaultLocale = Intl.systemLocale;
}

/// A localized language and its locale.
@immutable
class LocalizedLanguage {
  /// Creates a localized language with the given [name] and [locale].
  const LocalizedLanguage(this.name, this.locale);

  /// A localized name of the language.
  final String name;

  /// The locale of the language.
  final Locale locale;

  @override
  String toString() => 'Language($name, $locale)';

  @override
  int get hashCode => hashValues(name, locale);

  @override
  bool operator ==(dynamic other) =>
      other is LocalizedLanguage &&
      other.name == name &&
      other.locale == locale;
}

/// Builds a sorted list of localized languages.
Future<List<LocalizedLanguage>> loadLocalizedLanguages(
    List<Locale> locales) async {
  final languages = <LocalizedLanguage>[];
  for (final locale in locales) {
    final localization = await UbuntuLocalizations.delegate.load(locale);
    if (localization.languageName.isNotEmpty) {
      languages.add(LocalizedLanguage(localization.languageName, locale));
    }
  }
  languages.sort(
      (a, b) => removeDiacritics(a.name).compareTo(removeDiacritics(b.name)));
  return languages;
}

/// A helper to match locales.
extension LocalizedLanguageMatcher on List<LocalizedLanguage> {
  /// Returns the index of the best match for the given [locale] or -1 if not
  /// found.
  ///
  /// The best matching locale is determined by the following rules:
  ///
  /// - Full match (language + country + script)
  /// - Matching language and country
  /// - Matching language
  int findBestMatch(Locale locale) {
    return _indexOfLocaleOrNull(locale) ??
        _indexOfLanguageAndCountryOrNull(locale) ??
        _indexOfLanguageOrNull(locale) ??
        -1;
  }

  // full match (language, country, and script)
  int? _indexOfLocaleOrNull(Locale locale) {
    final index = indexWhere((lang) => lang.locale == locale);
    return index != -1 ? index : null;
  }

  // match language and country
  int? _indexOfLanguageAndCountryOrNull(Locale locale) {
    final index = indexWhere((lang) =>
        lang.locale.languageCode == locale.languageCode &&
        lang.locale.countryCode == locale.countryCode);
    return index != -1 ? index : null;
  }

  // match language only
  int? _indexOfLanguageOrNull(Locale locale) {
    final index =
        indexWhere((lang) => lang.locale.languageCode == locale.languageCode);
    return index != -1 ? index : null;
  }
}

/// The translations for Occitan  (`oc`).
class MaterialLocalizationOc extends MaterialLocalizationCa {
  /// Create an instance of the translation bundle for Occitan.
  const MaterialLocalizationOc({
    String localeName = 'oc',
    required DateFormat fullYearFormat,
    required DateFormat compactDateFormat,
    required DateFormat shortDateFormat,
    required DateFormat mediumDateFormat,
    required DateFormat longDateFormat,
    required DateFormat yearMonthFormat,
    required DateFormat shortMonthDayFormat,
    required NumberFormat decimalFormat,
    required NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          compactDateFormat: compactDateFormat,
          shortDateFormat: shortDateFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          shortMonthDayFormat: shortMonthDayFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );
}

class LocalizationsDelegateOc
    extends LocalizationsDelegate<MaterialLocalizations> {
  const LocalizationsDelegateOc();

  @override
  bool isSupported(Locale locale) =>
      <String>['oc'].contains(locale.languageCode);

  @override
  Future<MaterialLocalizationOc> load(Locale locale) {
    assert(isSupported(locale));
    final extendsLocaleName = 'ca';
    return SynchronousFuture<MaterialLocalizationOc>(MaterialLocalizationOc(
      fullYearFormat: DateFormat.y(extendsLocaleName),
      compactDateFormat: DateFormat.yMd(extendsLocaleName),
      shortDateFormat: DateFormat.yMMMd(extendsLocaleName),
      mediumDateFormat: DateFormat.MMMEd(extendsLocaleName),
      longDateFormat: DateFormat.yMMMMEEEEd(extendsLocaleName),
      yearMonthFormat: DateFormat.yMMMM(extendsLocaleName),
      shortMonthDayFormat: DateFormat.MMMd(extendsLocaleName),
      decimalFormat: NumberFormat.decimalPattern(extendsLocaleName),
      twoDigitZeroPaddedFormat: NumberFormat('00', extendsLocaleName),
    ));
  }

  @override
  bool shouldReload(LocalizationsDelegateOc old) => false;
}
