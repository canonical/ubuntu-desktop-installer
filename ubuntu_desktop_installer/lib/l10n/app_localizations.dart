import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl_standalone.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Finds the Locale of Operating System i.e. Platform. and assigns it to
/// [Intl.systemLocale] and [Intl.defaultLocale].
///
/// Must See,
/// * [Intl.defaultLocale]
/// * [Intl.systemLocale]
void setupAppLocalizations() async {
  await findSystemLocale();
  Intl.defaultLocale = Intl.systemLocale;
}

/// The translations for Occitan  (`oc`).
class MaterialLocalizationOc extends MaterialLocalizationCa {
  /// Create an instance of the translation bundle for Occitan.
  const MaterialLocalizationOc({
    String localeName = 'oc',
    @required DateFormat fullYearFormat,
    @required DateFormat compactDateFormat,
    @required DateFormat shortDateFormat,
    @required DateFormat mediumDateFormat,
    @required DateFormat longDateFormat,
    @required DateFormat yearMonthFormat,
    @required DateFormat shortMonthDayFormat,
    @required NumberFormat decimalFormat,
    @required NumberFormat twoDigitZeroPaddedFormat,
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
