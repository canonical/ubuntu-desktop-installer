
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'ubuntu_localizations_am.dart';
import 'ubuntu_localizations_ar.dart';
import 'ubuntu_localizations_be.dart';
import 'ubuntu_localizations_bg.dart';
import 'ubuntu_localizations_bn.dart';
import 'ubuntu_localizations_bo.dart';
import 'ubuntu_localizations_bs.dart';
import 'ubuntu_localizations_ca.dart';
import 'ubuntu_localizations_cs.dart';
import 'ubuntu_localizations_cy.dart';
import 'ubuntu_localizations_da.dart';
import 'ubuntu_localizations_de.dart';
import 'ubuntu_localizations_dz.dart';
import 'ubuntu_localizations_el.dart';
import 'ubuntu_localizations_en.dart';
import 'ubuntu_localizations_eo.dart';
import 'ubuntu_localizations_es.dart';
import 'ubuntu_localizations_et.dart';
import 'ubuntu_localizations_eu.dart';
import 'ubuntu_localizations_fa.dart';
import 'ubuntu_localizations_fi.dart';
import 'ubuntu_localizations_fr.dart';
import 'ubuntu_localizations_ga.dart';
import 'ubuntu_localizations_gl.dart';
import 'ubuntu_localizations_gu.dart';
import 'ubuntu_localizations_he.dart';
import 'ubuntu_localizations_hi.dart';
import 'ubuntu_localizations_hr.dart';
import 'ubuntu_localizations_hu.dart';
import 'ubuntu_localizations_id.dart';
import 'ubuntu_localizations_is.dart';
import 'ubuntu_localizations_it.dart';
import 'ubuntu_localizations_ja.dart';
import 'ubuntu_localizations_ka.dart';
import 'ubuntu_localizations_kk.dart';
import 'ubuntu_localizations_km.dart';
import 'ubuntu_localizations_kn.dart';
import 'ubuntu_localizations_ko.dart';
import 'ubuntu_localizations_ku.dart';
import 'ubuntu_localizations_lo.dart';
import 'ubuntu_localizations_lt.dart';
import 'ubuntu_localizations_lv.dart';
import 'ubuntu_localizations_mk.dart';
import 'ubuntu_localizations_ml.dart';
import 'ubuntu_localizations_mr.dart';
import 'ubuntu_localizations_my.dart';
import 'ubuntu_localizations_nb.dart';
import 'ubuntu_localizations_ne.dart';
import 'ubuntu_localizations_nl.dart';
import 'ubuntu_localizations_nn.dart';
import 'ubuntu_localizations_oc.dart';
import 'ubuntu_localizations_pa.dart';
import 'ubuntu_localizations_pl.dart';
import 'ubuntu_localizations_pt.dart';
import 'ubuntu_localizations_ro.dart';
import 'ubuntu_localizations_ru.dart';
import 'ubuntu_localizations_se.dart';
import 'ubuntu_localizations_si.dart';
import 'ubuntu_localizations_sk.dart';
import 'ubuntu_localizations_sl.dart';
import 'ubuntu_localizations_sq.dart';
import 'ubuntu_localizations_sr.dart';
import 'ubuntu_localizations_sv.dart';
import 'ubuntu_localizations_ta.dart';
import 'ubuntu_localizations_te.dart';
import 'ubuntu_localizations_tg.dart';
import 'ubuntu_localizations_th.dart';
import 'ubuntu_localizations_tl.dart';
import 'ubuntu_localizations_tr.dart';
import 'ubuntu_localizations_ug.dart';
import 'ubuntu_localizations_uk.dart';
import 'ubuntu_localizations_vi.dart';
import 'ubuntu_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of UbuntuLocalizations returned
/// by `UbuntuLocalizations.of(context)`.
///
/// Applications need to include `UbuntuLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/ubuntu_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
///   supportedLocales: UbuntuLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the UbuntuLocalizations.supportedLocales
/// property.
abstract class UbuntuLocalizations {
  UbuntuLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static UbuntuLocalizations of(BuildContext context) {
    return Localizations.of<UbuntuLocalizations>(context, UbuntuLocalizations)!;
  }

  static const LocalizationsDelegate<UbuntuLocalizations> delegate = _UbuntuLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('ar'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('bo'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('dz'),
    Locale('el'),
    Locale('en'),
    Locale('eo'),
    Locale('es'),
    Locale('et'),
    Locale('eu'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('ga'),
    Locale('gl'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('km'),
    Locale('kn'),
    Locale('ko'),
    Locale('ku'),
    Locale('lo'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mr'),
    Locale('my'),
    Locale('nb'),
    Locale('ne'),
    Locale('nl'),
    Locale('nn'),
    Locale('oc'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('se'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('tg'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @countryCode.
  ///
  /// In en, this message translates to:
  /// **'US'**
  String get countryCode;

  /// The display name for the language. Leave empty to exclude the language from the list of languages on the welcome screen.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageName;

  /// No description provided for @backAction.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get backAction;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @strongPassword.
  ///
  /// In en, this message translates to:
  /// **'Strong password'**
  String get strongPassword;

  /// No description provided for @fairPassword.
  ///
  /// In en, this message translates to:
  /// **'Fair password'**
  String get fairPassword;

  /// No description provided for @goodPassword.
  ///
  /// In en, this message translates to:
  /// **'Good password'**
  String get goodPassword;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'Weak password'**
  String get weakPassword;
}

class _UbuntuLocalizationsDelegate extends LocalizationsDelegate<UbuntuLocalizations> {
  const _UbuntuLocalizationsDelegate();

  @override
  Future<UbuntuLocalizations> load(Locale locale) {
    return SynchronousFuture<UbuntuLocalizations>(lookupUbuntuLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['am', 'ar', 'be', 'bg', 'bn', 'bo', 'bs', 'ca', 'cs', 'cy', 'da', 'de', 'dz', 'el', 'en', 'eo', 'es', 'et', 'eu', 'fa', 'fi', 'fr', 'ga', 'gl', 'gu', 'he', 'hi', 'hr', 'hu', 'id', 'is', 'it', 'ja', 'ka', 'kk', 'km', 'kn', 'ko', 'ku', 'lo', 'lt', 'lv', 'mk', 'ml', 'mr', 'my', 'nb', 'ne', 'nl', 'nn', 'oc', 'pa', 'pl', 'pt', 'ro', 'ru', 'se', 'si', 'sk', 'sl', 'sq', 'sr', 'sv', 'ta', 'te', 'tg', 'th', 'tl', 'tr', 'ug', 'uk', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_UbuntuLocalizationsDelegate old) => false;
}

UbuntuLocalizations lookupUbuntuLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return UbuntuLocalizationsPtBr();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am': return UbuntuLocalizationsAm();
    case 'ar': return UbuntuLocalizationsAr();
    case 'be': return UbuntuLocalizationsBe();
    case 'bg': return UbuntuLocalizationsBg();
    case 'bn': return UbuntuLocalizationsBn();
    case 'bo': return UbuntuLocalizationsBo();
    case 'bs': return UbuntuLocalizationsBs();
    case 'ca': return UbuntuLocalizationsCa();
    case 'cs': return UbuntuLocalizationsCs();
    case 'cy': return UbuntuLocalizationsCy();
    case 'da': return UbuntuLocalizationsDa();
    case 'de': return UbuntuLocalizationsDe();
    case 'dz': return UbuntuLocalizationsDz();
    case 'el': return UbuntuLocalizationsEl();
    case 'en': return UbuntuLocalizationsEn();
    case 'eo': return UbuntuLocalizationsEo();
    case 'es': return UbuntuLocalizationsEs();
    case 'et': return UbuntuLocalizationsEt();
    case 'eu': return UbuntuLocalizationsEu();
    case 'fa': return UbuntuLocalizationsFa();
    case 'fi': return UbuntuLocalizationsFi();
    case 'fr': return UbuntuLocalizationsFr();
    case 'ga': return UbuntuLocalizationsGa();
    case 'gl': return UbuntuLocalizationsGl();
    case 'gu': return UbuntuLocalizationsGu();
    case 'he': return UbuntuLocalizationsHe();
    case 'hi': return UbuntuLocalizationsHi();
    case 'hr': return UbuntuLocalizationsHr();
    case 'hu': return UbuntuLocalizationsHu();
    case 'id': return UbuntuLocalizationsId();
    case 'is': return UbuntuLocalizationsIs();
    case 'it': return UbuntuLocalizationsIt();
    case 'ja': return UbuntuLocalizationsJa();
    case 'ka': return UbuntuLocalizationsKa();
    case 'kk': return UbuntuLocalizationsKk();
    case 'km': return UbuntuLocalizationsKm();
    case 'kn': return UbuntuLocalizationsKn();
    case 'ko': return UbuntuLocalizationsKo();
    case 'ku': return UbuntuLocalizationsKu();
    case 'lo': return UbuntuLocalizationsLo();
    case 'lt': return UbuntuLocalizationsLt();
    case 'lv': return UbuntuLocalizationsLv();
    case 'mk': return UbuntuLocalizationsMk();
    case 'ml': return UbuntuLocalizationsMl();
    case 'mr': return UbuntuLocalizationsMr();
    case 'my': return UbuntuLocalizationsMy();
    case 'nb': return UbuntuLocalizationsNb();
    case 'ne': return UbuntuLocalizationsNe();
    case 'nl': return UbuntuLocalizationsNl();
    case 'nn': return UbuntuLocalizationsNn();
    case 'oc': return UbuntuLocalizationsOc();
    case 'pa': return UbuntuLocalizationsPa();
    case 'pl': return UbuntuLocalizationsPl();
    case 'pt': return UbuntuLocalizationsPt();
    case 'ro': return UbuntuLocalizationsRo();
    case 'ru': return UbuntuLocalizationsRu();
    case 'se': return UbuntuLocalizationsSe();
    case 'si': return UbuntuLocalizationsSi();
    case 'sk': return UbuntuLocalizationsSk();
    case 'sl': return UbuntuLocalizationsSl();
    case 'sq': return UbuntuLocalizationsSq();
    case 'sr': return UbuntuLocalizationsSr();
    case 'sv': return UbuntuLocalizationsSv();
    case 'ta': return UbuntuLocalizationsTa();
    case 'te': return UbuntuLocalizationsTe();
    case 'tg': return UbuntuLocalizationsTg();
    case 'th': return UbuntuLocalizationsTh();
    case 'tl': return UbuntuLocalizationsTl();
    case 'tr': return UbuntuLocalizationsTr();
    case 'ug': return UbuntuLocalizationsUg();
    case 'uk': return UbuntuLocalizationsUk();
    case 'vi': return UbuntuLocalizationsVi();
    case 'zh': return UbuntuLocalizationsZh();
  }

  throw FlutterError(
    'UbuntuLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
