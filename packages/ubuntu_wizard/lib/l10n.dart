import 'dart:convert';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
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

/// Parses the given locale string and returns a corresponding [Locale] object.
///
/// The standard format is `language[_territory][.codeset][@modifier]`, but this
/// parser tries to be as relaxed as possible by allowing the parts to be in an
/// arbitrary order.
///
/// Language and country/territory codes are detected by matching against the
/// following rules:
///
/// - language code is 2-3 lowercase letters (ISO 639)
/// - country code is 2-3 uppercase letters (ISO 3166)
///
/// Codeset and modifier are ignored.
Locale parseLocale(String locale) {
  final codes = locale
      .split(RegExp(r'[_\.@]'))
      .where((code) => code.length == 2 || code.length == 3);

  final language = codes.firstWhereOrNull((code) => code == code.toLowerCase());
  final country = codes.firstWhereOrNull((code) => code == code.toUpperCase());

  return Locale(language ?? 'C', country);
}

/// Builds a sorted list of localized languages from subiquity's `languagelist`
/// data.
///
/// The format of the `languagelist` file looks like this:
/// ```
/// console:en_US.UTF-8:English
/// console:en_GB.UTF-8:English (UK)
/// ...
/// ```
List<LocalizedLanguage> loadSubiquityLanguages(String data) {
  final languages = <LocalizedLanguage>[];
  for (final line in LineSplitter.split(data)) {
    final parts = line.split(':');
    languages.add(LocalizedLanguage(parts[2], parseLocale(parts[1])));
  }
  languages.sort(
      (a, b) => removeDiacritics(a.name).compareTo(removeDiacritics(b.name)));
  return languages;
}

/// Builds a sorted list of localized languages.
///
/// [locales] must contain the base locale i.e. the template .arb locale.
Future<List<LocalizedLanguage>> loadLocalizedLanguages(
    List<Locale> locales) async {
  assert(locales.contains(_kBaseLocale));
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

// A fallback locale that must always exist (same as the template .arb).
const _kBaseLocale = Locale('en', 'US');

/// A helper to match locales.
extension LocalizedLanguageMatcher on List<LocalizedLanguage> {
  /// Returns the index of the best match for the given [locale] or falls back
  /// to the base locale if the given locale is not found.
  ///
  /// The best matching locale is determined by the following rules:
  ///
  /// - Full match (language + country + script)
  /// - Matching language and country
  /// - Matching language
  /// - Fall back to the base locale i.e. the template .arb locale.
  int findBestMatch(Locale locale) {
    return _indexOfLocaleOrNull(locale) ??
        _indexOfNeutralLocaleOrNull(locale) ??
        _indexOfParentLocaleOrNull(locale) ??
        _indexOfLocaleOrNull(_kBaseLocale)!;
  }

  // full match (language, country, and script)
  int? _indexOfLocaleOrNull(Locale locale) {
    final index = indexWhere((lang) => lang.locale == locale);
    return index != -1 ? index : null;
  }

  // match language and country
  int? _indexOfNeutralLocaleOrNull(Locale locale) {
    final index = indexWhere((lang) => lang.locale == locale.neutral);
    return index != -1 ? index : null;
  }

  // match language only
  int? _indexOfParentLocaleOrNull(Locale locale) {
    final index = indexWhere((lang) => lang.locale == locale.parent);
    return index != -1 ? index : null;
  }
}

extension _LocaleExtension on Locale {
  // not associated to any specific country
  Locale get parent => Locale(languageCode);

  // not associated to any specific script
  Locale get neutral => Locale(languageCode, countryCode);
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
  Future<MaterialLocalizationOc> load(Locale locale) async {
    assert(isSupported(locale));
    await initializeDateFormatting();
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
