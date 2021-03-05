import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbols.dart';
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

const _localeDatePatterns = {
  'd': 'd.',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
  'LLLL': 'LLLL',
  'M': 'L.',
  'Md': 'd.M.',
  'MEd': 'EEE d.M.',
  'MMM': 'LLL',
  'MMMd': 'd. MMM',
  'MMMEd': 'EEE d. MMM',
  'MMMM': 'LLLL',
  'MMMMd': 'd. MMMM',
  'MMMMEEEEd': 'EEEE d. MMMM',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'M.y',
  'yMd': 'd.M.y',
  'yMEd': 'EEE d.MM.y',
  'yMMM': 'MMM y',
  'yMMMd': 'd. MMM y',
  'yMMMEd': 'EEE d. MMM y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd. MMMM y',
  'yMMMMEEEEd': 'EEEE d. MMMM y',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'HH',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'HH',
  'jm': 'HH:mm',
  'jms': 'HH:mm:ss',
  'jmv': 'HH:mm v',
  'jmz': 'HH:mm z',
  'jz': 'HH z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

const _nnDateSymbols = {
  'NAME': 'en',
  'ERAS': <dynamic>[
    'f.Kr.',
    'e.Kr.',
  ],
  'ERANAMES': <dynamic>[
    'før Kristus',
    'etter Kristus',
  ],
  'NARROWMONTHS': <dynamic>[
    'J',
    'F',
    'M',
    'A',
    'M',
    'J',
    'J',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'STANDALONENARROWMONTHS': <dynamic>[
    'J',
    'F',
    'M',
    'A',
    'M',
    'J',
    'J',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'MONTHS': <dynamic>[
    'januar',
    'februar',
    'mars',
    'april',
    'mai',
    'juni',
    'juli',
    'august',
    'september',
    'oktober',
    'november',
    'desember',
  ],
  'STANDALONEMONTHS': <dynamic>[
    'januar',
    'februar',
    'mars',
    'april',
    'mai',
    'juni',
    'juli',
    'august',
    'september',
    'oktober',
    'november',
    'desember',
  ],
  'SHORTMONTHS': <dynamic>[
    'jan.',
    'feb.',
    'mar.',
    'apr.',
    'mai',
    'jun.',
    'jul.',
    'aug.',
    'sep.',
    'okt.',
    'nov.',
    'des.',
  ],
  'STANDALONESHORTMONTHS': <dynamic>[
    'jan',
    'feb',
    'mar',
    'apr',
    'mai',
    'jun',
    'jul',
    'aug',
    'sep',
    'okt',
    'nov',
    'des',
  ],
  'WEEKDAYS': <dynamic>[
    'søndag',
    'mandag',
    'tirsdag',
    'onsdag',
    'torsdag',
    'fredag',
    'lørdag',
  ],
  'STANDALONEWEEKDAYS': <dynamic>[
    'søndag',
    'mandag',
    'tirsdag',
    'onsdag',
    'torsdag',
    'fredag',
    'lørdag',
  ],
  'SHORTWEEKDAYS': <dynamic>[
    'søn.',
    'man.',
    'tir.',
    'ons.',
    'tor.',
    'fre.',
    'lør.',
  ],
  'STANDALONESHORTWEEKDAYS': <dynamic>[
    'søn.',
    'man.',
    'tir.',
    'ons.',
    'tor.',
    'fre.',
    'lør.',
  ],
  'NARROWWEEKDAYS': <dynamic>[
    'S',
    'M',
    'T',
    'O',
    'T',
    'F',
    'L',
  ],
  'STANDALONENARROWWEEKDAYS': <dynamic>[
    'S',
    'M',
    'T',
    'O',
    'T',
    'F',
    'L',
  ],
  'SHORTQUARTERS': <dynamic>[
    'K1',
    'K2',
    'K3',
    'K4',
  ],
  'QUARTERS': <dynamic>[
    '1. kvartal',
    '2. kvartal',
    '3. kvartal',
    '4. kvartal',
  ],
  'AMPMS': <dynamic>[
    'a.m.',
    'p.m.',
  ],
  'DATEFORMATS': <dynamic>[
    'EEEE d. MMMM y',
    'd. MMMM y',
    'd. MMM y',
    'dd.MM.y',
  ],
  'TIMEFORMATS': <dynamic>[
    'HH:mm:ss zzzz',
    'HH:mm:ss z',
    'HH:mm:ss',
    'HH:mm',
  ],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 0,
  'WEEKENDRANGE': <dynamic>[
    5,
    6,
  ],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': <dynamic>[
    '{1} {0}',
    '{1} \'kl\'. {0}',
    '{1}, {0}',
    '{1}, {0}',
  ],
};

class _UbuntuLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _UbuntuLocalizationsDelegate();

  /// Add Additional languages (not supported by [GlobalMaterialLocalizations]) here.
  @override
  bool isSupported(Locale locale) =>
      <String>['oc'].contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    // since date-format for custom locales is not required
    const defaultLocaleName = 'en';
    final localeName = Intl.canonicalizedLocale(locale.toString());

    initializeDateFormattingCustom(
      locale: defaultLocaleName,
      patterns: _localeDatePatterns,
      symbols: DateSymbols.deserializeFromMap(_nnDateSymbols),
    );

    return SynchronousFuture<MaterialLocalizations>(
      GlobalUbuntuLocalizations(
        localeName: localeName,
        decimalFormat: NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: NumberFormat('00', 'en_US'),
        fullYearFormat: DateFormat('y', defaultLocaleName),
        compactDateFormat: DateFormat('yMd', defaultLocaleName),
        shortDateFormat: DateFormat('yMMMd', defaultLocaleName),
        mediumDateFormat: DateFormat('EEE, MMM d', defaultLocaleName),
        longDateFormat: DateFormat('EEEE, MMMM d, y', defaultLocaleName),
        yearMonthFormat: DateFormat('MMMM y', defaultLocaleName),
        shortMonthDayFormat: DateFormat('MMM d'),
      ),
    );
  }

  @override
  bool shouldReload(_UbuntuLocalizationsDelegate old) => false;
}

class GlobalUbuntuLocalizations extends MaterialLocalizationEn {
  const GlobalUbuntuLocalizations({
    String localeName = 'nn',
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

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _UbuntuLocalizationsDelegate();
}
