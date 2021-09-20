
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'ubuntu_localizations_en.dart';
import 'ubuntu_localizations_es.dart';
import 'ubuntu_localizations_fi.dart';
import 'ubuntu_localizations_fr.dart';
import 'ubuntu_localizations_it.dart';
import 'ubuntu_localizations_nl.dart';
import 'ubuntu_localizations_oc.dart';
import 'ubuntu_localizations_pt.dart';
import 'ubuntu_localizations_ru.dart';

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
    Locale('en'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('es', 'ES'),
    Locale('fi'),
    Locale('fi', 'FI'),
    Locale('fr'),
    Locale('fr', 'FR'),
    Locale('it'),
    Locale('it', 'IT'),
    Locale('nl'),
    Locale('nl', 'NL'),
    Locale('oc'),
    Locale('oc', 'FR'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('ru', 'RU')
  ];

  /// The display name for the language. Leave empty to exclude the language from the list of languages on the welcome screen.
  ///
  /// In en_US, this message translates to:
  /// **'English'**
  String get languageName;

  /// No description provided for @backAction.
  ///
  /// In en_US, this message translates to:
  /// **'Go Back'**
  String get backAction;

  /// No description provided for @continueAction.
  ///
  /// In en_US, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @strongPassword.
  ///
  /// In en_US, this message translates to:
  /// **'Strong password'**
  String get strongPassword;

  /// No description provided for @moderatePassword.
  ///
  /// In en_US, this message translates to:
  /// **'Moderate password'**
  String get moderatePassword;

  /// No description provided for @weakPassword.
  ///
  /// In en_US, this message translates to:
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
  bool isSupported(Locale locale) => <String>['en', 'es', 'fi', 'fr', 'it', 'nl', 'oc', 'pt', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_UbuntuLocalizationsDelegate old) => false;
}

UbuntuLocalizations lookupUbuntuLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en': {
  switch (locale.countryCode) {
    case 'US': return UbuntuLocalizationsEnUs();
   }
  break;
   }
    case 'es': {
  switch (locale.countryCode) {
    case 'ES': return UbuntuLocalizationsEsEs();
   }
  break;
   }
    case 'fi': {
  switch (locale.countryCode) {
    case 'FI': return UbuntuLocalizationsFiFi();
   }
  break;
   }
    case 'fr': {
  switch (locale.countryCode) {
    case 'FR': return UbuntuLocalizationsFrFr();
   }
  break;
   }
    case 'it': {
  switch (locale.countryCode) {
    case 'IT': return UbuntuLocalizationsItIt();
   }
  break;
   }
    case 'nl': {
  switch (locale.countryCode) {
    case 'NL': return UbuntuLocalizationsNlNl();
   }
  break;
   }
    case 'oc': {
  switch (locale.countryCode) {
    case 'FR': return UbuntuLocalizationsOcFr();
   }
  break;
   }
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return UbuntuLocalizationsPtBr();
   }
  break;
   }
    case 'ru': {
  switch (locale.countryCode) {
    case 'RU': return UbuntuLocalizationsRuRu();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return UbuntuLocalizationsEn();
    case 'es': return UbuntuLocalizationsEs();
    case 'fi': return UbuntuLocalizationsFi();
    case 'fr': return UbuntuLocalizationsFr();
    case 'it': return UbuntuLocalizationsIt();
    case 'nl': return UbuntuLocalizationsNl();
    case 'oc': return UbuntuLocalizationsOc();
    case 'pt': return UbuntuLocalizationsPt();
    case 'ru': return UbuntuLocalizationsRu();
  }

  throw FlutterError(
    'UbuntuLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
