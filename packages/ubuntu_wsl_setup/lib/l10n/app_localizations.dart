
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bo.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_dz.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_eo.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_eu.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_km.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ku.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_ne.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_nn.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_se.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_tg.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL'**
  String get appTitle;

  /// No description provided for @windowTitle.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL'**
  String get windowTitle;

  /// No description provided for @exitButton.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitButton;

  /// No description provided for @finishButton.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishButton;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @setupButton.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get setupButton;

  /// No description provided for @selectLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Select your language'**
  String get selectLanguageTitle;

  /// No description provided for @profileSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile setup'**
  String get profileSetupTitle;

  /// No description provided for @profileSetupHeader.
  ///
  /// In en, this message translates to:
  /// **'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>'**
  String get profileSetupHeader;

  /// No description provided for @profileSetupRealnameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get profileSetupRealnameLabel;

  /// No description provided for @profileSetupRealnameRequired.
  ///
  /// In en, this message translates to:
  /// **'A name is required'**
  String get profileSetupRealnameRequired;

  /// No description provided for @profileSetupUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Pick a username'**
  String get profileSetupUsernameHint;

  /// No description provided for @profileSetupUsernameHelper.
  ///
  /// In en, this message translates to:
  /// **'The username does not need to match your windows username.'**
  String get profileSetupUsernameHelper;

  /// No description provided for @profileSetupPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a password'**
  String get profileSetupPasswordHint;

  /// No description provided for @profileSetupConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get profileSetupConfirmPasswordHint;

  /// No description provided for @profileSetupShowAdvancedOptions.
  ///
  /// In en, this message translates to:
  /// **'Show advanced options next page'**
  String get profileSetupShowAdvancedOptions;

  /// No description provided for @profileSetupPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords do not match'**
  String get profileSetupPasswordMismatch;

  /// No description provided for @profileSetupUsernameRequired.
  ///
  /// In en, this message translates to:
  /// **'A username is required'**
  String get profileSetupUsernameRequired;

  /// No description provided for @profileSetupUsernameInvalid.
  ///
  /// In en, this message translates to:
  /// **'The username is invalid'**
  String get profileSetupUsernameInvalid;

  /// No description provided for @profileSetupPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'A password is required'**
  String get profileSetupPasswordRequired;

  /// No description provided for @advancedSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Advanced setup'**
  String get advancedSetupTitle;

  /// No description provided for @advancedSetupHeader.
  ///
  /// In en, this message translates to:
  /// **'In this page, you can tweak Ubuntu WSL to your needs.'**
  String get advancedSetupHeader;

  /// No description provided for @advancedSetupMountLocationHint.
  ///
  /// In en, this message translates to:
  /// **'Mount location'**
  String get advancedSetupMountLocationHint;

  /// No description provided for @advancedSetupMountLocationHelper.
  ///
  /// In en, this message translates to:
  /// **'Location for the automount'**
  String get advancedSetupMountLocationHelper;

  /// No description provided for @advancedSetupMountLocationInvalid.
  ///
  /// In en, this message translates to:
  /// **'The location is invalid'**
  String get advancedSetupMountLocationInvalid;

  /// No description provided for @advancedSetupMountOptionHint.
  ///
  /// In en, this message translates to:
  /// **'Mount option'**
  String get advancedSetupMountOptionHint;

  /// No description provided for @advancedSetupMountOptionHelper.
  ///
  /// In en, this message translates to:
  /// **'Mount option passed for the automount'**
  String get advancedSetupMountOptionHelper;

  /// No description provided for @advancedSetupHostGenerationTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Host Generation'**
  String get advancedSetupHostGenerationTitle;

  /// No description provided for @advancedSetupHostGenerationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Selecting enables /etc/hosts re-generation at every start.'**
  String get advancedSetupHostGenerationSubtitle;

  /// No description provided for @advancedSetupResolvConfGenerationTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable resolv.conf Generation'**
  String get advancedSetupResolvConfGenerationTitle;

  /// No description provided for @advancedSetupResolvConfGenerationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Selecting enables /etc/resolv.conf re-generation at every start.'**
  String get advancedSetupResolvConfGenerationSubtitle;

  /// No description provided for @advancedSetupGUIIntegrationTitle.
  ///
  /// In en, this message translates to:
  /// **'GUI Integration'**
  String get advancedSetupGUIIntegrationTitle;

  /// No description provided for @advancedSetupGUIIntegrationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.'**
  String get advancedSetupGUIIntegrationSubtitle;

  /// No description provided for @configurationUITitle.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu WSL Configuration - Advanced options'**
  String get configurationUITitle;

  /// No description provided for @configurationUIInteroperabilityHeader.
  ///
  /// In en, this message translates to:
  /// **'Interoperability'**
  String get configurationUIInteroperabilityHeader;

  /// No description provided for @configurationUIInteroperabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get configurationUIInteroperabilityTitle;

  /// No description provided for @configurationUIInteroperabilitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Whether the Interoperability is enabled.'**
  String get configurationUIInteroperabilitySubtitle;

  /// No description provided for @configurationUIInteropAppendWindowsPathTitle.
  ///
  /// In en, this message translates to:
  /// **'Append Windows Path'**
  String get configurationUIInteropAppendWindowsPathTitle;

  /// No description provided for @configurationUIInteropAppendWindowsPathSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Whether Windows Path will be append in the PATH environment variable in WSL'**
  String get configurationUIInteropAppendWindowsPathSubtitle;

  /// No description provided for @configurationUIAutoMountHeader.
  ///
  /// In en, this message translates to:
  /// **'Auto-Mount'**
  String get configurationUIAutoMountHeader;

  /// No description provided for @configurationUIAutoMountTitle.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get configurationUIAutoMountTitle;

  /// No description provided for @configurationUIAutoMountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.'**
  String get configurationUIAutoMountSubtitle;

  /// No description provided for @configurationUIMountFstabTitle.
  ///
  /// In en, this message translates to:
  /// **'Mount /etc/fstab'**
  String get configurationUIMountFstabTitle;

  /// No description provided for @configurationUIMountFstabSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the???'**
  String get configurationUIMountFstabSubtitle;

  /// No description provided for @configurationUISystemdHeader.
  ///
  /// In en, this message translates to:
  /// **'EXPERIMENTAL - Systemd'**
  String get configurationUISystemdHeader;

  /// No description provided for @configurationUISystemdTitle.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get configurationUISystemdTitle;

  /// No description provided for @configurationUISystemdSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.'**
  String get configurationUISystemdSubtitle;

  /// No description provided for @applyingChanges.
  ///
  /// In en, this message translates to:
  /// **'Applying changes...'**
  String get applyingChanges;

  /// No description provided for @applyingChangesDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This may take several minutes depending on your Internet connection.'**
  String get applyingChangesDisclaimer;

  /// No description provided for @setupCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Setup complete'**
  String get setupCompleteTitle;

  /// No description provided for @setupCompleteHeader.
  ///
  /// In en, this message translates to:
  /// **'Hi {user},\nYou have successfully completed the setup.'**
  String setupCompleteHeader(Object user);

  /// No description provided for @setupCompleteUpdate.
  ///
  /// In en, this message translates to:
  /// **'It is suggested to run the following command to update Ubuntu to the latest version:'**
  String get setupCompleteUpdate;

  /// No description provided for @setupCompleteRestart.
  ///
  /// In en, this message translates to:
  /// **'* All settings will take effect after restarting Ubuntu.'**
  String get setupCompleteRestart;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['am', 'ar', 'be', 'bg', 'bn', 'bo', 'bs', 'ca', 'cs', 'cy', 'da', 'de', 'dz', 'el', 'en', 'eo', 'es', 'et', 'eu', 'fa', 'fi', 'fr', 'ga', 'gl', 'gu', 'he', 'hi', 'hr', 'hu', 'id', 'is', 'it', 'ja', 'ka', 'kk', 'km', 'kn', 'ko', 'ku', 'lo', 'lt', 'lv', 'mk', 'ml', 'mr', 'my', 'nb', 'ne', 'nl', 'nn', 'pa', 'pl', 'pt', 'ro', 'ru', 'se', 'si', 'sk', 'sl', 'sq', 'sr', 'sv', 'ta', 'te', 'tg', 'th', 'tl', 'tr', 'ug', 'uk', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return AppLocalizationsPtBr();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am': return AppLocalizationsAm();
    case 'ar': return AppLocalizationsAr();
    case 'be': return AppLocalizationsBe();
    case 'bg': return AppLocalizationsBg();
    case 'bn': return AppLocalizationsBn();
    case 'bo': return AppLocalizationsBo();
    case 'bs': return AppLocalizationsBs();
    case 'ca': return AppLocalizationsCa();
    case 'cs': return AppLocalizationsCs();
    case 'cy': return AppLocalizationsCy();
    case 'da': return AppLocalizationsDa();
    case 'de': return AppLocalizationsDe();
    case 'dz': return AppLocalizationsDz();
    case 'el': return AppLocalizationsEl();
    case 'en': return AppLocalizationsEn();
    case 'eo': return AppLocalizationsEo();
    case 'es': return AppLocalizationsEs();
    case 'et': return AppLocalizationsEt();
    case 'eu': return AppLocalizationsEu();
    case 'fa': return AppLocalizationsFa();
    case 'fi': return AppLocalizationsFi();
    case 'fr': return AppLocalizationsFr();
    case 'ga': return AppLocalizationsGa();
    case 'gl': return AppLocalizationsGl();
    case 'gu': return AppLocalizationsGu();
    case 'he': return AppLocalizationsHe();
    case 'hi': return AppLocalizationsHi();
    case 'hr': return AppLocalizationsHr();
    case 'hu': return AppLocalizationsHu();
    case 'id': return AppLocalizationsId();
    case 'is': return AppLocalizationsIs();
    case 'it': return AppLocalizationsIt();
    case 'ja': return AppLocalizationsJa();
    case 'ka': return AppLocalizationsKa();
    case 'kk': return AppLocalizationsKk();
    case 'km': return AppLocalizationsKm();
    case 'kn': return AppLocalizationsKn();
    case 'ko': return AppLocalizationsKo();
    case 'ku': return AppLocalizationsKu();
    case 'lo': return AppLocalizationsLo();
    case 'lt': return AppLocalizationsLt();
    case 'lv': return AppLocalizationsLv();
    case 'mk': return AppLocalizationsMk();
    case 'ml': return AppLocalizationsMl();
    case 'mr': return AppLocalizationsMr();
    case 'my': return AppLocalizationsMy();
    case 'nb': return AppLocalizationsNb();
    case 'ne': return AppLocalizationsNe();
    case 'nl': return AppLocalizationsNl();
    case 'nn': return AppLocalizationsNn();
    case 'pa': return AppLocalizationsPa();
    case 'pl': return AppLocalizationsPl();
    case 'pt': return AppLocalizationsPt();
    case 'ro': return AppLocalizationsRo();
    case 'ru': return AppLocalizationsRu();
    case 'se': return AppLocalizationsSe();
    case 'si': return AppLocalizationsSi();
    case 'sk': return AppLocalizationsSk();
    case 'sl': return AppLocalizationsSl();
    case 'sq': return AppLocalizationsSq();
    case 'sr': return AppLocalizationsSr();
    case 'sv': return AppLocalizationsSv();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
    case 'tg': return AppLocalizationsTg();
    case 'th': return AppLocalizationsTh();
    case 'tl': return AppLocalizationsTl();
    case 'tr': return AppLocalizationsTr();
    case 'ug': return AppLocalizationsUg();
    case 'uk': return AppLocalizationsUk();
    case 'vi': return AppLocalizationsVi();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
