
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';

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
    Locale('en'),
    Locale('en', 'US'),
    Locale('fi'),
    Locale('fi', 'FI'),
    Locale('fr'),
    Locale('fr', 'FR')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Ubuntu WSL'**
  String get appTitle;

  /// No description provided for @windowTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Ubuntu WSL'**
  String get windowTitle;

  /// No description provided for @exitButton.
  ///
  /// In en_US, this message translates to:
  /// **'Exit'**
  String get exitButton;

  /// No description provided for @finishButton.
  ///
  /// In en_US, this message translates to:
  /// **'Finish'**
  String get finishButton;

  /// No description provided for @saveButton.
  ///
  /// In en_US, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @setupButton.
  ///
  /// In en_US, this message translates to:
  /// **'Setup'**
  String get setupButton;

  /// No description provided for @selectLanguageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Select your language'**
  String get selectLanguageTitle;

  /// No description provided for @profileSetupTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Profile setup'**
  String get profileSetupTitle;

  /// No description provided for @profileSetupHeader.
  ///
  /// In en_US, this message translates to:
  /// **'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>'**
  String get profileSetupHeader;

  /// No description provided for @profileSetupRealnameLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Your name'**
  String get profileSetupRealnameLabel;

  /// No description provided for @profileSetupRealnameRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A name is required'**
  String get profileSetupRealnameRequired;

  /// No description provided for @profileSetupUsernameHint.
  ///
  /// In en_US, this message translates to:
  /// **'Pick a username'**
  String get profileSetupUsernameHint;

  /// No description provided for @profileSetupUsernameHelper.
  ///
  /// In en_US, this message translates to:
  /// **'The username does not need to match your windows username.'**
  String get profileSetupUsernameHelper;

  /// No description provided for @profileSetupPasswordHint.
  ///
  /// In en_US, this message translates to:
  /// **'Choose a password'**
  String get profileSetupPasswordHint;

  /// No description provided for @profileSetupConfirmPasswordHint.
  ///
  /// In en_US, this message translates to:
  /// **'Confirm your password'**
  String get profileSetupConfirmPasswordHint;

  /// No description provided for @profileSetupShowAdvancedOptions.
  ///
  /// In en_US, this message translates to:
  /// **'Show advanced options next page'**
  String get profileSetupShowAdvancedOptions;

  /// No description provided for @profileSetupPasswordMismatch.
  ///
  /// In en_US, this message translates to:
  /// **'The passwords do not match'**
  String get profileSetupPasswordMismatch;

  /// No description provided for @profileSetupUsernameRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A username is required'**
  String get profileSetupUsernameRequired;

  /// No description provided for @profileSetupUsernameInvalid.
  ///
  /// In en_US, this message translates to:
  /// **'The username is invalid'**
  String get profileSetupUsernameInvalid;

  /// No description provided for @profileSetupPasswordRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A password is required'**
  String get profileSetupPasswordRequired;

  /// No description provided for @advancedSetupTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Advanced setup'**
  String get advancedSetupTitle;

  /// No description provided for @advancedSetupHeader.
  ///
  /// In en_US, this message translates to:
  /// **'In this page, you can tweak Ubuntu WSL to your needs.'**
  String get advancedSetupHeader;

  /// No description provided for @advancedSetupMountLocationHint.
  ///
  /// In en_US, this message translates to:
  /// **'Mount location'**
  String get advancedSetupMountLocationHint;

  /// No description provided for @advancedSetupMountLocationHelper.
  ///
  /// In en_US, this message translates to:
  /// **'Location for the automount'**
  String get advancedSetupMountLocationHelper;

  /// No description provided for @advancedSetupMountLocationInvalid.
  ///
  /// In en_US, this message translates to:
  /// **'The location is invalid'**
  String get advancedSetupMountLocationInvalid;

  /// No description provided for @advancedSetupMountOptionHint.
  ///
  /// In en_US, this message translates to:
  /// **'Mount option'**
  String get advancedSetupMountOptionHint;

  /// No description provided for @advancedSetupMountOptionHelper.
  ///
  /// In en_US, this message translates to:
  /// **'Mount option passed for the automount'**
  String get advancedSetupMountOptionHelper;

  /// No description provided for @advancedSetupHostGenerationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Enable Host Generation'**
  String get advancedSetupHostGenerationTitle;

  /// No description provided for @advancedSetupHostGenerationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Selecting enables /etc/hosts re-generation at every start.'**
  String get advancedSetupHostGenerationSubtitle;

  /// No description provided for @advancedSetupResolvConfGenerationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Enable resolv.conf Generation'**
  String get advancedSetupResolvConfGenerationTitle;

  /// No description provided for @advancedSetupResolvConfGenerationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Selecting enables /etc/resolv.conf re-generation at every start.'**
  String get advancedSetupResolvConfGenerationSubtitle;

  /// No description provided for @advancedSetupGUIIntegrationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'GUI Integration'**
  String get advancedSetupGUIIntegrationTitle;

  /// No description provided for @advancedSetupGUIIntegrationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.'**
  String get advancedSetupGUIIntegrationSubtitle;

  /// No description provided for @configurationUITitle.
  ///
  /// In en_US, this message translates to:
  /// **'Ubuntu WSL configuration UI (experimental)'**
  String get configurationUITitle;

  /// No description provided for @configurationUIInteroperabilityHeader.
  ///
  /// In en_US, this message translates to:
  /// **'Interoperability'**
  String get configurationUIInteroperabilityHeader;

  /// No description provided for @configurationUILegacyGUIIntegrationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Legacy GUI Integration'**
  String get configurationUILegacyGUIIntegrationTitle;

  /// No description provided for @configurationUILegacyGUIIntegrationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'This option enables the Legacy GUI Integration on Windows 10. Requires Third-party X server.'**
  String get configurationUILegacyGUIIntegrationSubtitle;

  /// No description provided for @configurationUILegacyAudioIntegrationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Legacy Audio Integration'**
  String get configurationUILegacyAudioIntegrationTitle;

  /// No description provided for @configurationUILegacyAudioIntegrationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'This option enables the Legacy Audio Integration on Windows 10. Requires PulseAudio for Windows installed.'**
  String get configurationUILegacyAudioIntegrationSubtitle;

  /// No description provided for @configurationUIAdvancedIPDetectionTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Advanced IP Detection'**
  String get configurationUIAdvancedIPDetectionTitle;

  /// No description provided for @configurationUIAdvancedIPDetectionSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'This option enables advanced detection of IP by Windows IPv4 Address which is more reliable to use with WSL2.\nRequires WSL interoperability enabled.'**
  String get configurationUIAdvancedIPDetectionSubtitle;

  /// No description provided for @configurationUIMessageOfTheDayHeader.
  ///
  /// In en_US, this message translates to:
  /// **'Message Of The Day (MOTD)'**
  String get configurationUIMessageOfTheDayHeader;

  /// No description provided for @configurationUIWSLNewsTitle.
  ///
  /// In en_US, this message translates to:
  /// **'WSL News'**
  String get configurationUIWSLNewsTitle;

  /// No description provided for @configurationUIWSLNewsSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'This option allows you to control your MOTD News. Toggling it on allows you to see the MOTD.'**
  String get configurationUIWSLNewsSubtitle;

  /// No description provided for @configurationUIAutoMountHeader.
  ///
  /// In en_US, this message translates to:
  /// **'Auto-Mount'**
  String get configurationUIAutoMountHeader;

  /// No description provided for @configurationUIAutoMountTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Enabled'**
  String get configurationUIAutoMountTitle;

  /// No description provided for @configurationUIAutoMountSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.'**
  String get configurationUIAutoMountSubtitle;

  /// No description provided for @configurationUIMountFstabTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Mount /etc/fstab'**
  String get configurationUIMountFstabTitle;

  /// No description provided for @configurationUIMountFstabSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the???'**
  String get configurationUIMountFstabSubtitle;

  /// No description provided for @setupCompleteTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Setup complete'**
  String get setupCompleteTitle;

  /// No description provided for @setupCompleteHeader.
  ///
  /// In en_US, this message translates to:
  /// **'Hi {user},\nYou have successfully completed the setup.'**
  String setupCompleteHeader(Object user);

  /// No description provided for @setupCompleteUpdate.
  ///
  /// In en_US, this message translates to:
  /// **'It is suggested to run the following command to update Ubuntu to the latest version:'**
  String get setupCompleteUpdate;

  /// No description provided for @setupCompleteManage.
  ///
  /// In en_US, this message translates to:
  /// **'You can use the builtin ubuntuwsl command to manage your WSL settings:'**
  String get setupCompleteManage;

  /// No description provided for @setupCompleteRestart.
  ///
  /// In en_US, this message translates to:
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
  bool isSupported(Locale locale) => <String>['en', 'fi', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en': {
  switch (locale.countryCode) {
    case 'US': return AppLocalizationsEnUs();
   }
  break;
   }
    case 'fi': {
  switch (locale.countryCode) {
    case 'FI': return AppLocalizationsFiFi();
   }
  break;
   }
    case 'fr': {
  switch (locale.countryCode) {
    case 'FR': return AppLocalizationsFrFr();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fi': return AppLocalizationsFi();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
