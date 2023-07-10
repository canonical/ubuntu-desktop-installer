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
import 'app_localizations_oc.dart';
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

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
    Locale('zh'),
    Locale('zh', 'TW')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ubuntu Desktop Installer'**
  String get appTitle;

  /// No description provided for @windowTitle.
  ///
  /// In en, this message translates to:
  /// **'Install {RELEASE}'**
  String windowTitle(Object RELEASE);

  /// No description provided for @changeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeButtonText;

  /// No description provided for @restartButtonText.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restartButtonText;

  /// No description provided for @revertButtonText.
  ///
  /// In en, this message translates to:
  /// **'Revert'**
  String get revertButtonText;

  /// No description provided for @quitButtonText.
  ///
  /// In en, this message translates to:
  /// **'Quit installation'**
  String get quitButtonText;

  /// No description provided for @loadingPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {DISTRO}'**
  String loadingPageTitle(Object DISTRO);

  /// No description provided for @loadingHeader.
  ///
  /// In en, this message translates to:
  /// **'Preparing {DISTRO}…'**
  String loadingHeader(Object DISTRO);

  /// No description provided for @welcomePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Try or install {DISTRO}'**
  String welcomePageTitle(Object DISTRO);

  /// No description provided for @welcomeRepairOption.
  ///
  /// In en, this message translates to:
  /// **'Repair installation'**
  String get welcomeRepairOption;

  /// No description provided for @welcomeRepairDescription.
  ///
  /// In en, this message translates to:
  /// **'Repairing will reinstall all installed software without touching documents or settings.'**
  String get welcomeRepairDescription;

  /// No description provided for @welcomeTryOption.
  ///
  /// In en, this message translates to:
  /// **'Try {RELEASE}'**
  String welcomeTryOption(Object RELEASE);

  /// No description provided for @welcomeTryDescription.
  ///
  /// In en, this message translates to:
  /// **'You can try {RELEASE} without making any changes to your computer.'**
  String welcomeTryDescription(Object RELEASE);

  /// No description provided for @welcomeInstallOption.
  ///
  /// In en, this message translates to:
  /// **'Install {RELEASE}'**
  String welcomeInstallOption(Object RELEASE);

  /// No description provided for @welcomeInstallDescription.
  ///
  /// In en, this message translates to:
  /// **'Install {RELEASE} alongside (or instead of) your current operating system. This shouldn\'t take too long.'**
  String welcomeInstallDescription(Object RELEASE);

  /// No description provided for @welcomeReleaseNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'You may wish to read the <a href=\"{url}\">release notes</a>.'**
  String welcomeReleaseNotesLabel(Object url);

  /// No description provided for @rstTitle.
  ///
  /// In en, this message translates to:
  /// **'RST is enabled'**
  String get rstTitle;

  /// No description provided for @rstHeader.
  ///
  /// In en, this message translates to:
  /// **'Turn off RST to continue'**
  String get rstHeader;

  /// No description provided for @rstDescription.
  ///
  /// In en, this message translates to:
  /// **'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.'**
  String get rstDescription;

  /// No description provided for @rstInstructions.
  ///
  /// In en, this message translates to:
  /// **'For instructions, scan the QR code on another device or visit: <a href=\"https://{url}\">{url}</a>'**
  String rstInstructions(Object url);

  /// No description provided for @configureSecureBootTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Secure Boot'**
  String get configureSecureBootTitle;

  /// No description provided for @configureSecureBootDescription.
  ///
  /// In en, this message translates to:
  /// **'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.'**
  String get configureSecureBootDescription;

  /// No description provided for @configureSecureBootOption.
  ///
  /// In en, this message translates to:
  /// **'Configure Secure Boot'**
  String get configureSecureBootOption;

  /// No description provided for @chooseSecurityKey.
  ///
  /// In en, this message translates to:
  /// **'Choose a security key'**
  String get chooseSecurityKey;

  /// No description provided for @confirmSecurityKey.
  ///
  /// In en, this message translates to:
  /// **'Confirm the security key'**
  String get confirmSecurityKey;

  /// No description provided for @dontInstallDriverSoftwareNow.
  ///
  /// In en, this message translates to:
  /// **'Don\'t install the driver software for now'**
  String get dontInstallDriverSoftwareNow;

  /// No description provided for @dontInstallDriverSoftwareNowDescription.
  ///
  /// In en, this message translates to:
  /// **'You can install it later from Software & Updates.'**
  String get dontInstallDriverSoftwareNowDescription;

  /// No description provided for @configureSecureBootSecurityKeyRequired.
  ///
  /// In en, this message translates to:
  /// **'Security key is required'**
  String get configureSecureBootSecurityKeyRequired;

  /// No description provided for @secureBootSecurityKeysDontMatch.
  ///
  /// In en, this message translates to:
  /// **'Security keys do not match'**
  String get secureBootSecurityKeysDontMatch;

  /// No description provided for @showSecurityKey.
  ///
  /// In en, this message translates to:
  /// **'Show security key'**
  String get showSecurityKey;

  /// No description provided for @connectToInternetPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect to a network'**
  String get connectToInternetPageTitle;

  /// No description provided for @connectToInternetDescription.
  ///
  /// In en, this message translates to:
  /// **'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by Ethernet cable, or choose a Wi-Fi network'**
  String get connectToInternetDescription;

  /// No description provided for @useWiredConnection.
  ///
  /// In en, this message translates to:
  /// **'Use wired connection'**
  String get useWiredConnection;

  /// No description provided for @noWiredConnection.
  ///
  /// In en, this message translates to:
  /// **'No wired connection detected'**
  String get noWiredConnection;

  /// No description provided for @wiredDisabled.
  ///
  /// In en, this message translates to:
  /// **'Wired connection is turned off'**
  String get wiredDisabled;

  /// No description provided for @wiredMustBeEnabled.
  ///
  /// In en, this message translates to:
  /// **'To use Ethernet on this computer, a wired connection must be enabled'**
  String get wiredMustBeEnabled;

  /// No description provided for @enableWired.
  ///
  /// In en, this message translates to:
  /// **'Enable wired'**
  String get enableWired;

  /// No description provided for @selectWifiNetwork.
  ///
  /// In en, this message translates to:
  /// **'Connect to a Wi-Fi network'**
  String get selectWifiNetwork;

  /// No description provided for @hiddenWifiNetwork.
  ///
  /// In en, this message translates to:
  /// **'Connect to a hidden Wi-Fi network'**
  String get hiddenWifiNetwork;

  /// No description provided for @hiddenWifiNetworkNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Network name'**
  String get hiddenWifiNetworkNameLabel;

  /// No description provided for @hiddenWifiNetworkNameRequired.
  ///
  /// In en, this message translates to:
  /// **'A network name is required'**
  String get hiddenWifiNetworkNameRequired;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'I don\'t want to connect to the internet just now'**
  String get noInternet;

  /// No description provided for @wirelessNetworkingDisabled.
  ///
  /// In en, this message translates to:
  /// **'Wireless networking disabled'**
  String get wirelessNetworkingDisabled;

  /// No description provided for @noWifiDevicesDetected.
  ///
  /// In en, this message translates to:
  /// **'No Wi-Fi devices detected'**
  String get noWifiDevicesDetected;

  /// No description provided for @wifiMustBeEnabled.
  ///
  /// In en, this message translates to:
  /// **'To use Wi-Fi on this computer, wireless networking must be enabled'**
  String get wifiMustBeEnabled;

  /// No description provided for @enableWifi.
  ///
  /// In en, this message translates to:
  /// **'Enable Wi-Fi'**
  String get enableWifi;

  /// No description provided for @connectButtonText.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connectButtonText;

  /// No description provided for @updatesOtherSoftwarePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Applications and updates'**
  String get updatesOtherSoftwarePageTitle;

  /// No description provided for @updatesOtherSoftwarePageDescription.
  ///
  /// In en, this message translates to:
  /// **'What apps would you like to install to start with?'**
  String get updatesOtherSoftwarePageDescription;

  /// No description provided for @normalInstallationTitle.
  ///
  /// In en, this message translates to:
  /// **'Normal installation'**
  String get normalInstallationTitle;

  /// No description provided for @normalInstallationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Web browser, utilities, office software, games and media players.'**
  String get normalInstallationSubtitle;

  /// No description provided for @minimalInstallationTitle.
  ///
  /// In en, this message translates to:
  /// **'Minimal installation'**
  String get minimalInstallationTitle;

  /// No description provided for @minimalInstallationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Web browser and basic utilities.'**
  String get minimalInstallationSubtitle;

  /// No description provided for @otherOptions.
  ///
  /// In en, this message translates to:
  /// **'Other options'**
  String get otherOptions;

  /// No description provided for @installThirdPartyTitle.
  ///
  /// In en, this message translates to:
  /// **'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats'**
  String get installThirdPartyTitle;

  /// No description provided for @installThirdPartySubtitle.
  ///
  /// In en, this message translates to:
  /// **'This software is subject to license terms included with its documentation. Some are proprietary.'**
  String get installThirdPartySubtitle;

  /// No description provided for @installDriversTitle.
  ///
  /// In en, this message translates to:
  /// **'Install third-party software for graphics and Wi-Fi hardware'**
  String get installDriversTitle;

  /// No description provided for @installDriversSubtitle.
  ///
  /// In en, this message translates to:
  /// **'These drivers are subject to license terms included with their documentation. They are proprietary.'**
  String get installDriversSubtitle;

  /// No description provided for @installCodecsTitle.
  ///
  /// In en, this message translates to:
  /// **'Download and install support for additional media formats'**
  String get installCodecsTitle;

  /// No description provided for @installCodecsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This software is subject to license terms included with its documentation. Some are proprietary.'**
  String get installCodecsSubtitle;

  /// No description provided for @onBatteryWarning.
  ///
  /// In en, this message translates to:
  /// **'<font color=\"{color}\">Warning:</font> The computer is not plugged in to a power source.'**
  String onBatteryWarning(Object color);

  /// No description provided for @offlineWarning.
  ///
  /// In en, this message translates to:
  /// **'You are currently offline'**
  String get offlineWarning;

  /// No description provided for @chooseSecurityKeyTitle.
  ///
  /// In en, this message translates to:
  /// **'Security key'**
  String get chooseSecurityKeyTitle;

  /// No description provided for @chooseSecurityKeyHeader.
  ///
  /// In en, this message translates to:
  /// **'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of {RELEASE} will not be encrypted.'**
  String chooseSecurityKeyHeader(Object RELEASE);

  /// No description provided for @chooseSecurityKeyHint.
  ///
  /// In en, this message translates to:
  /// **'Choose a security key'**
  String get chooseSecurityKeyHint;

  /// No description provided for @chooseSecurityKeyConfirmHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm the security key'**
  String get chooseSecurityKeyConfirmHint;

  /// No description provided for @chooseSecurityKeyRequired.
  ///
  /// In en, this message translates to:
  /// **'A security key is required'**
  String get chooseSecurityKeyRequired;

  /// No description provided for @chooseSecurityKeyMismatch.
  ///
  /// In en, this message translates to:
  /// **'The security keys do not match'**
  String get chooseSecurityKeyMismatch;

  /// No description provided for @chooseSecurityKeyWarning.
  ///
  /// In en, this message translates to:
  /// **'<font color=\"{color}\">Warning:</font> If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.'**
  String chooseSecurityKeyWarning(Object color);

  /// No description provided for @installationTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Type of installation'**
  String get installationTypeTitle;

  /// No description provided for @installationTypeOSDetected.
  ///
  /// In en, this message translates to:
  /// **'This computer currently has {os} on it. What would you like to do?'**
  String installationTypeOSDetected(Object os);

  /// No description provided for @installationTypeDualOSDetected.
  ///
  /// In en, this message translates to:
  /// **'This computer currently has {os1} and {os2} on it. What would you like to do?'**
  String installationTypeDualOSDetected(Object os1, Object os2);

  /// No description provided for @installationTypeMultiOSDetected.
  ///
  /// In en, this message translates to:
  /// **'This computer currently has multiple operating systems on it. What would you like to do?'**
  String get installationTypeMultiOSDetected;

  /// No description provided for @installationTypeNoOSDetected.
  ///
  /// In en, this message translates to:
  /// **'This computer currently has no detected operating systems. What would you like to do?'**
  String get installationTypeNoOSDetected;

  /// No description provided for @installationTypeErase.
  ///
  /// In en, this message translates to:
  /// **'Erase disk and install {DISTRO}'**
  String installationTypeErase(Object DISTRO);

  /// No description provided for @installationTypeEraseWarning.
  ///
  /// In en, this message translates to:
  /// **'<font color=\"{color}\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.'**
  String installationTypeEraseWarning(Object color);

  /// No description provided for @installationTypeAdvancedLabel.
  ///
  /// In en, this message translates to:
  /// **'Advanced features...'**
  String get installationTypeAdvancedLabel;

  /// No description provided for @installationTypeAdvancedTitle.
  ///
  /// In en, this message translates to:
  /// **'Advanced features'**
  String get installationTypeAdvancedTitle;

  /// No description provided for @installationTypeNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get installationTypeNone;

  /// No description provided for @installationTypeNoneSelected.
  ///
  /// In en, this message translates to:
  /// **'None selected'**
  String get installationTypeNoneSelected;

  /// No description provided for @installationTypeLVM.
  ///
  /// In en, this message translates to:
  /// **'Use LVM with the new {RELEASE} installation'**
  String installationTypeLVM(Object RELEASE);

  /// No description provided for @installationTypeLVMSelected.
  ///
  /// In en, this message translates to:
  /// **'LVM selected'**
  String get installationTypeLVMSelected;

  /// No description provided for @installationTypeLVMEncryptionSelected.
  ///
  /// In en, this message translates to:
  /// **'LVM and encryption selected'**
  String get installationTypeLVMEncryptionSelected;

  /// No description provided for @installationTypeEncrypt.
  ///
  /// In en, this message translates to:
  /// **'Encrypt the new {RELEASE} installation for security'**
  String installationTypeEncrypt(Object RELEASE);

  /// No description provided for @installationTypeEncryptInfo.
  ///
  /// In en, this message translates to:
  /// **'You will choose a security key in the next step.'**
  String get installationTypeEncryptInfo;

  /// No description provided for @installationTypeZFS.
  ///
  /// In en, this message translates to:
  /// **'EXPERIMENTAL: Erase disk and use ZFS'**
  String get installationTypeZFS;

  /// No description provided for @installationTypeZFSSelected.
  ///
  /// In en, this message translates to:
  /// **'ZFS selected'**
  String get installationTypeZFSSelected;

  /// No description provided for @installationTypeReinstall.
  ///
  /// In en, this message translates to:
  /// **'Erase {os} and reinstall'**
  String installationTypeReinstall(Object os);

  /// No description provided for @installationTypeReinstallWarning.
  ///
  /// In en, this message translates to:
  /// **'<font color=\"{color}\">Warning:</font> This will delete all your {os} programs, documents, photos, music, and any other files.'**
  String installationTypeReinstallWarning(Object color, Object os);

  /// No description provided for @installationTypeAlongside.
  ///
  /// In en, this message translates to:
  /// **'Install {product} alongside {os}'**
  String installationTypeAlongside(Object product, Object os);

  /// No description provided for @installationTypeAlongsideDual.
  ///
  /// In en, this message translates to:
  /// **'Install {product} alongside {os1} and {os2}'**
  String installationTypeAlongsideDual(Object product, Object os1, Object os2);

  /// No description provided for @installationTypeAlongsideMulti.
  ///
  /// In en, this message translates to:
  /// **'Install {product} alongside them'**
  String installationTypeAlongsideMulti(Object product);

  /// No description provided for @installationTypeAlongsideUnknown.
  ///
  /// In en, this message translates to:
  /// **'Install {product} alongside other partitions'**
  String installationTypeAlongsideUnknown(Object product);

  /// No description provided for @installationTypeAlongsideInfo.
  ///
  /// In en, this message translates to:
  /// **'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.'**
  String get installationTypeAlongsideInfo;

  /// No description provided for @installationTypeManual.
  ///
  /// In en, this message translates to:
  /// **'Manual partitioning'**
  String get installationTypeManual;

  /// No description provided for @installationTypeManualInfo.
  ///
  /// In en, this message translates to:
  /// **'You can create or resize partitions yourself, or choose multiple partitions for {DISTRO}'**
  String installationTypeManualInfo(Object DISTRO);

  /// No description provided for @selectGuidedStoragePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Erase disk and install {DISTRO}'**
  String selectGuidedStoragePageTitle(Object DISTRO);

  /// No description provided for @selectGuidedStorageDropdownLabel.
  ///
  /// In en, this message translates to:
  /// **'Select drive:'**
  String get selectGuidedStorageDropdownLabel;

  /// No description provided for @selectGuidedStorageInfoLabel.
  ///
  /// In en, this message translates to:
  /// **'The entire disk will be used:'**
  String get selectGuidedStorageInfoLabel;

  /// No description provided for @selectGuidedStorageInstallNow.
  ///
  /// In en, this message translates to:
  /// **'Install now'**
  String get selectGuidedStorageInstallNow;

  /// No description provided for @installAlongsideSpaceDivider.
  ///
  /// In en, this message translates to:
  /// **'Allocate drive space by dragging the divider below:'**
  String get installAlongsideSpaceDivider;

  /// No description provided for @installAlongsideHiddenPartitions.
  ///
  /// In en, this message translates to:
  /// **'{num} smaller partitions are hidden, use the <a href=\"{url}\">advanced partitioning tool</a> for more control'**
  String installAlongsideHiddenPartitions(Object num, Object url);

  /// No description provided for @installAlongsideResizePartition.
  ///
  /// In en, this message translates to:
  /// **'Resize partition'**
  String get installAlongsideResizePartition;

  /// No description provided for @installAlongsideAllocateSpace.
  ///
  /// In en, this message translates to:
  /// **'Allocate space'**
  String get installAlongsideAllocateSpace;

  /// No description provided for @installAlongsideFiles.
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get installAlongsideFiles;

  /// No description provided for @installAlongsidePartition.
  ///
  /// In en, this message translates to:
  /// **'Partition:'**
  String get installAlongsidePartition;

  /// No description provided for @installAlongsideSize.
  ///
  /// In en, this message translates to:
  /// **'Size:'**
  String get installAlongsideSize;

  /// No description provided for @installAlongsideAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available:'**
  String get installAlongsideAvailable;

  /// No description provided for @allocateDiskSpace.
  ///
  /// In en, this message translates to:
  /// **'Manual partitioning'**
  String get allocateDiskSpace;

  /// No description provided for @allocateDiskSpaceInvalidMountPointSlash.
  ///
  /// In en, this message translates to:
  /// **'Mount points must start with \"/\"'**
  String get allocateDiskSpaceInvalidMountPointSlash;

  /// No description provided for @allocateDiskSpaceInvalidMountPointSpace.
  ///
  /// In en, this message translates to:
  /// **'Mount points cannot contain spaces'**
  String get allocateDiskSpaceInvalidMountPointSpace;

  /// No description provided for @diskHeadersDevice.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get diskHeadersDevice;

  /// No description provided for @diskHeadersType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get diskHeadersType;

  /// No description provided for @diskHeadersMountPoint.
  ///
  /// In en, this message translates to:
  /// **'Mount point'**
  String get diskHeadersMountPoint;

  /// No description provided for @diskHeadersSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get diskHeadersSize;

  /// No description provided for @diskHeadersUsed.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get diskHeadersUsed;

  /// No description provided for @diskHeadersSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get diskHeadersSystem;

  /// No description provided for @diskHeadersFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get diskHeadersFormat;

  /// No description provided for @freeDiskSpace.
  ///
  /// In en, this message translates to:
  /// **'Free space'**
  String get freeDiskSpace;

  /// No description provided for @newPartitionTable.
  ///
  /// In en, this message translates to:
  /// **'New partition table'**
  String get newPartitionTable;

  /// No description provided for @newPartitionTableConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'New empty partition'**
  String get newPartitionTableConfirmationTitle;

  /// No description provided for @newPartitionTableConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Creating a new partition table on an entire device will remove all of its current partitions. This operation can be undone if needed.'**
  String get newPartitionTableConfirmationMessage;

  /// No description provided for @tooManyPrimaryPartitions.
  ///
  /// In en, this message translates to:
  /// **'Too many primary partitions'**
  String get tooManyPrimaryPartitions;

  /// No description provided for @partitionLimitReached.
  ///
  /// In en, this message translates to:
  /// **'Limit reached'**
  String get partitionLimitReached;

  /// No description provided for @bootLoaderDevice.
  ///
  /// In en, this message translates to:
  /// **'Device for boot loader installation'**
  String get bootLoaderDevice;

  /// No description provided for @partitionCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create partition'**
  String get partitionCreateTitle;

  /// No description provided for @partitionEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit partition'**
  String get partitionEditTitle;

  /// No description provided for @partitionSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Size:'**
  String get partitionSizeLabel;

  /// No description provided for @partitionTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type for the new partition:'**
  String get partitionTypeLabel;

  /// No description provided for @partitionTypePrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get partitionTypePrimary;

  /// No description provided for @partitionTypeLogical.
  ///
  /// In en, this message translates to:
  /// **'Logical'**
  String get partitionTypeLogical;

  /// No description provided for @partitionLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location for the new partition:'**
  String get partitionLocationLabel;

  /// No description provided for @partitionLocationBeginning.
  ///
  /// In en, this message translates to:
  /// **'Beginning of this space'**
  String get partitionLocationBeginning;

  /// No description provided for @partitionLocationEnd.
  ///
  /// In en, this message translates to:
  /// **'End of this space'**
  String get partitionLocationEnd;

  /// No description provided for @partitionFormatLabel.
  ///
  /// In en, this message translates to:
  /// **'Used as:'**
  String get partitionFormatLabel;

  /// No description provided for @partitionFormatNone.
  ///
  /// In en, this message translates to:
  /// **'Leave unformatted'**
  String get partitionFormatNone;

  /// No description provided for @partitionFormatKeep.
  ///
  /// In en, this message translates to:
  /// **'Leave formatted as {format}'**
  String partitionFormatKeep(Object format);

  /// No description provided for @partitionErase.
  ///
  /// In en, this message translates to:
  /// **'Format the partition'**
  String get partitionErase;

  /// No description provided for @partitionMountPointLabel.
  ///
  /// In en, this message translates to:
  /// **'Mount point:'**
  String get partitionMountPointLabel;

  /// No description provided for @identityPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your account'**
  String get identityPageTitle;

  /// No description provided for @identityAutoLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in automatically'**
  String get identityAutoLogin;

  /// No description provided for @identityRequirePassword.
  ///
  /// In en, this message translates to:
  /// **'Require my password to log in'**
  String get identityRequirePassword;

  /// No description provided for @identityRealNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get identityRealNameLabel;

  /// No description provided for @identityRealNameRequired.
  ///
  /// In en, this message translates to:
  /// **'A name is required'**
  String get identityRealNameRequired;

  /// No description provided for @identityRealNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'That name is too long.'**
  String get identityRealNameTooLong;

  /// No description provided for @identityHostnameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your computer\'s name'**
  String get identityHostnameLabel;

  /// No description provided for @identityHostnameInfo.
  ///
  /// In en, this message translates to:
  /// **'The name it uses when it talks to other computers.'**
  String get identityHostnameInfo;

  /// No description provided for @identityHostnameRequired.
  ///
  /// In en, this message translates to:
  /// **'A computer name is required'**
  String get identityHostnameRequired;

  /// No description provided for @identityHostnameTooLong.
  ///
  /// In en, this message translates to:
  /// **'That computer name is too long.'**
  String get identityHostnameTooLong;

  /// No description provided for @identityInvalidHostname.
  ///
  /// In en, this message translates to:
  /// **'The computer name is invalid'**
  String get identityInvalidHostname;

  /// No description provided for @identityUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Pick a username'**
  String get identityUsernameLabel;

  /// No description provided for @identityUsernameRequired.
  ///
  /// In en, this message translates to:
  /// **'A username is required'**
  String get identityUsernameRequired;

  /// No description provided for @identityInvalidUsername.
  ///
  /// In en, this message translates to:
  /// **'The username is invalid'**
  String get identityInvalidUsername;

  /// No description provided for @identityUsernameInUse.
  ///
  /// In en, this message translates to:
  /// **'That user name already exists.'**
  String get identityUsernameInUse;

  /// No description provided for @identityUsernameSystemReserved.
  ///
  /// In en, this message translates to:
  /// **'That name is reserved for system usage.'**
  String get identityUsernameSystemReserved;

  /// No description provided for @identityUsernameTooLong.
  ///
  /// In en, this message translates to:
  /// **'That name is too long.'**
  String get identityUsernameTooLong;

  /// No description provided for @identityUsernameInvalidChars.
  ///
  /// In en, this message translates to:
  /// **'That name contains invalid characters.'**
  String get identityUsernameInvalidChars;

  /// No description provided for @identityPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Choose a password'**
  String get identityPasswordLabel;

  /// No description provided for @identityPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'A password is required'**
  String get identityPasswordRequired;

  /// No description provided for @identityConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get identityConfirmPasswordLabel;

  /// No description provided for @identityPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords do not match'**
  String get identityPasswordMismatch;

  /// No description provided for @identityPasswordShow.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get identityPasswordShow;

  /// No description provided for @identityPasswordHide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get identityPasswordHide;

  /// No description provided for @confirmPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to install'**
  String get confirmPageTitle;

  /// No description provided for @confirmHeader.
  ///
  /// In en, this message translates to:
  /// **'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.'**
  String get confirmHeader;

  /// No description provided for @confirmDevicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get confirmDevicesTitle;

  /// No description provided for @confirmPartitionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Partitions'**
  String get confirmPartitionsTitle;

  /// No description provided for @confirmPartitionTables.
  ///
  /// In en, this message translates to:
  /// **'The partition tables of the following devices are changed:'**
  String get confirmPartitionTables;

  /// An entry for a disk whose partition table is being changed
  ///
  /// In en, this message translates to:
  /// **'{serial} ({path})'**
  String confirmPartitionTable(Object serial, Object path);

  /// No description provided for @confirmPartitionChanges.
  ///
  /// In en, this message translates to:
  /// **'The following partition changes are going to be applied:'**
  String get confirmPartitionChanges;

  /// A resized partition entry
  ///
  /// In en, this message translates to:
  /// **'partition <b>{sysname}</b> resized from <b>{oldsize}</b> to <b>{newsize}</b>'**
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize);

  /// A formatted and mounted partition entry
  ///
  /// In en, this message translates to:
  /// **'partition <b>{sysname}</b> formatted as <b>{format}</b> used for <b>{mount}</b>'**
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount);

  /// A formatted partition entry
  ///
  /// In en, this message translates to:
  /// **'partition <b>{sysname}</b> formatted as <b>{format}</b>'**
  String confirmPartitionFormat(Object sysname, Object format);

  /// A mounted partition entry
  ///
  /// In en, this message translates to:
  /// **'partition <b>{sysname}</b> used for <b>{mount}</b>'**
  String confirmPartitionMount(Object sysname, Object mount);

  /// A created partition entry
  ///
  /// In en, this message translates to:
  /// **'partition <b>{sysname}</b> created'**
  String confirmPartitionCreate(Object sysname);

  /// No description provided for @confirmInstallButton.
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get confirmInstallButton;

  /// No description provided for @installationCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Installation complete'**
  String get installationCompleteTitle;

  /// No description provided for @readyToUse.
  ///
  /// In en, this message translates to:
  /// **'**{system}** is installed and ready to use'**
  String readyToUse(Object system);

  /// No description provided for @restartInto.
  ///
  /// In en, this message translates to:
  /// **'Restart into {system}'**
  String restartInto(Object system);

  /// No description provided for @restartWarning.
  ///
  /// In en, this message translates to:
  /// **'You can continue testing {RELEASE} now, but until you restart the computer, any changes you make or documents you save will not be preserved.'**
  String restartWarning(Object RELEASE);

  /// No description provided for @shutdown.
  ///
  /// In en, this message translates to:
  /// **'Shut Down'**
  String get shutdown;

  /// No description provided for @restartNow.
  ///
  /// In en, this message translates to:
  /// **'Restart now'**
  String get restartNow;

  /// No description provided for @continueTesting.
  ///
  /// In en, this message translates to:
  /// **'Continue testing'**
  String get continueTesting;

  /// No description provided for @bitlockerTitle.
  ///
  /// In en, this message translates to:
  /// **'BitLocker is enabled'**
  String get bitlockerTitle;

  /// No description provided for @bitlockerHeader.
  ///
  /// In en, this message translates to:
  /// **'Turn off BitLocker to continue'**
  String get bitlockerHeader;

  /// No description provided for @bitlockerDescription.
  ///
  /// In en, this message translates to:
  /// **'This computer uses Windows BitLocker encryption.\nYou need to use Windows to create free space or choose \'{option}\' to continue.'**
  String bitlockerDescription(Object option);

  /// No description provided for @bitlockerInstructions.
  ///
  /// In en, this message translates to:
  /// **'For instructions, scan the QR code on another device or visit: <a href=\"https://{url}\">{url}</a>'**
  String bitlockerInstructions(Object url);

  /// No description provided for @restartIntoWindows.
  ///
  /// In en, this message translates to:
  /// **'Restart into Windows'**
  String get restartIntoWindows;

  /// No description provided for @restartIntoWindowsTitle.
  ///
  /// In en, this message translates to:
  /// **'Restart into Windows?'**
  String get restartIntoWindowsTitle;

  /// No description provided for @restartIntoWindowsDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to restart your computer? You will need to restart the {DISTRO} installation later to finish installing {DISTRO}.'**
  String restartIntoWindowsDescription(Object DISTRO);

  /// No description provided for @installationSlidesTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {RELEASE}'**
  String installationSlidesTitle(Object RELEASE);

  /// No description provided for @installationSlidesAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available:'**
  String get installationSlidesAvailable;

  /// No description provided for @installationSlidesIncluded.
  ///
  /// In en, this message translates to:
  /// **'Included:'**
  String get installationSlidesIncluded;

  /// No description provided for @installationSlidesWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Fast, free and full of new features'**
  String get installationSlidesWelcomeTitle;

  /// No description provided for @installationSlidesWelcomeHeader.
  ///
  /// In en, this message translates to:
  /// **'The latest version of {DISTRO} makes computing easier than ever.'**
  String installationSlidesWelcomeHeader(Object DISTRO);

  /// No description provided for @installationSlidesWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in {RELEASE}.'**
  String installationSlidesWelcomeBody(Object RELEASE);

  /// No description provided for @installationSlidesSoftwareTitle.
  ///
  /// In en, this message translates to:
  /// **'All the applications you need'**
  String get installationSlidesSoftwareTitle;

  /// No description provided for @installationSlidesSoftwareBody.
  ///
  /// In en, this message translates to:
  /// **'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and {DISTRO} archive.'**
  String installationSlidesSoftwareBody(Object DISTRO);

  /// No description provided for @installationSlidesDevelopmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Develop with the best of open source'**
  String get installationSlidesDevelopmentTitle;

  /// No description provided for @installationSlidesDevelopmentBody.
  ///
  /// In en, this message translates to:
  /// **'{DISTRO} is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every {DISTRO} release includes the latest toolchains and supports all major IDEs.'**
  String installationSlidesDevelopmentBody(Object DISTRO);

  /// No description provided for @installationSlidesCreativityTitle.
  ///
  /// In en, this message translates to:
  /// **'Enhance your creativity'**
  String get installationSlidesCreativityTitle;

  /// No description provided for @installationSlidesCreativityBody.
  ///
  /// In en, this message translates to:
  /// **'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to {DISTRO} with support for open source and industry standard software and applications.'**
  String installationSlidesCreativityBody(Object DISTRO);

  /// No description provided for @installationSlidesGamingTitle.
  ///
  /// In en, this message translates to:
  /// **'Great for gaming'**
  String get installationSlidesGamingTitle;

  /// No description provided for @installationSlidesGamingBody.
  ///
  /// In en, this message translates to:
  /// **'{DISTRO} supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on {DISTRO} via applications like Steam with no additional configuration.'**
  String installationSlidesGamingBody(Object DISTRO);

  /// No description provided for @installationSlidesSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Private and secure'**
  String get installationSlidesSecurityTitle;

  /// No description provided for @installationSlidesSecurityBody.
  ///
  /// In en, this message translates to:
  /// **'{DISTRO} provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.'**
  String installationSlidesSecurityBody(Object DISTRO);

  /// No description provided for @installationSlidesSecurityLts.
  ///
  /// In en, this message translates to:
  /// **'All {DISTRO} LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.'**
  String installationSlidesSecurityLts(Object DISTRO);

  /// No description provided for @installationSlidesProductivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Power up your productivity'**
  String get installationSlidesProductivityTitle;

  /// No description provided for @installationSlidesProductivityBody.
  ///
  /// In en, this message translates to:
  /// **'{DISTRO} Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.'**
  String installationSlidesProductivityBody(Object DISTRO);

  /// No description provided for @installationSlidesAccessibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Access for everyone'**
  String get installationSlidesAccessibilityTitle;

  /// No description provided for @installationSlidesAccessibilityBody.
  ///
  /// In en, this message translates to:
  /// **'At the heart of the {DISTRO} philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, {DISTRO} makes computing easy - whoever and wherever you are.'**
  String installationSlidesAccessibilityBody(Object DISTRO);

  /// No description provided for @installationSlidesAccessibilityOrca.
  ///
  /// In en, this message translates to:
  /// **'Orca Screen Reader'**
  String get installationSlidesAccessibilityOrca;

  /// No description provided for @installationSlidesAccessibilityLanguages.
  ///
  /// In en, this message translates to:
  /// **'Language support'**
  String get installationSlidesAccessibilityLanguages;

  /// No description provided for @installationSlidesSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Help and support'**
  String get installationSlidesSupportTitle;

  /// No description provided for @installationSlidesSupportHeader.
  ///
  /// In en, this message translates to:
  /// **'The official {DISTRO} documentation is available both online and via the Help icon in the dock.'**
  String installationSlidesSupportHeader(Object DISTRO);

  /// No description provided for @installationSlidesSupportCommunity.
  ///
  /// In en, this message translates to:
  /// **'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.'**
  String get installationSlidesSupportCommunity;

  /// No description provided for @installationSlidesSupportEnterprise.
  ///
  /// In en, this message translates to:
  /// **'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.'**
  String get installationSlidesSupportEnterprise;

  /// No description provided for @installationSlidesSupportResources.
  ///
  /// In en, this message translates to:
  /// **'Helpful resources:'**
  String get installationSlidesSupportResources;

  /// No description provided for @installationSlidesSupportDocumentation.
  ///
  /// In en, this message translates to:
  /// **'Official documentation'**
  String get installationSlidesSupportDocumentation;

  /// No description provided for @installationSlidesSupportUbuntuPro.
  ///
  /// In en, this message translates to:
  /// **'Enterprise-grade 24/7 support with Ubuntu Pro'**
  String get installationSlidesSupportUbuntuPro;

  /// No description provided for @copyingFiles.
  ///
  /// In en, this message translates to:
  /// **'Copying files…'**
  String get copyingFiles;

  /// No description provided for @installingSystem.
  ///
  /// In en, this message translates to:
  /// **'Installing the system…'**
  String get installingSystem;

  /// No description provided for @configuringSystem.
  ///
  /// In en, this message translates to:
  /// **'Setting up the system…'**
  String get configuringSystem;

  /// No description provided for @installationFailed.
  ///
  /// In en, this message translates to:
  /// **'Installation failed'**
  String get installationFailed;

  /// No description provided for @notEnoughDiskSpaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Not enough space'**
  String get notEnoughDiskSpaceTitle;

  /// No description provided for @notEnoughDiskSpaceUbuntu.
  ///
  /// In en, this message translates to:
  /// **'Not enough disk space to install {DISTRO}'**
  String notEnoughDiskSpaceUbuntu(Object DISTRO);

  /// No description provided for @notEnoughDiskSpaceAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available:'**
  String get notEnoughDiskSpaceAvailable;

  /// No description provided for @notEnoughDiskSpaceRequired.
  ///
  /// In en, this message translates to:
  /// **'Required:'**
  String get notEnoughDiskSpaceRequired;

  /// No description provided for @activeDirectoryOption.
  ///
  /// In en, this message translates to:
  /// **'Use Active Directory'**
  String get activeDirectoryOption;

  /// No description provided for @activeDirectoryInfo.
  ///
  /// In en, this message translates to:
  /// **'You\'ll enter domain and other details in the next step.'**
  String get activeDirectoryInfo;

  /// No description provided for @activeDirectoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Configure Active Directory'**
  String get activeDirectoryTitle;

  /// No description provided for @activeDirectoryTestConnection.
  ///
  /// In en, this message translates to:
  /// **'Test domain connectivity'**
  String get activeDirectoryTestConnection;

  /// No description provided for @activeDirectoryDomainLabel.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get activeDirectoryDomainLabel;

  /// No description provided for @activeDirectoryDomainEmpty.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get activeDirectoryDomainEmpty;

  /// No description provided for @activeDirectoryDomainTooLong.
  ///
  /// In en, this message translates to:
  /// **'Too long'**
  String get activeDirectoryDomainTooLong;

  /// No description provided for @activeDirectoryDomainInvalidChars.
  ///
  /// In en, this message translates to:
  /// **'Invalid characters'**
  String get activeDirectoryDomainInvalidChars;

  /// No description provided for @activeDirectoryDomainStartDot.
  ///
  /// In en, this message translates to:
  /// **'Starts with a dot (.)'**
  String get activeDirectoryDomainStartDot;

  /// No description provided for @activeDirectoryDomainEndDot.
  ///
  /// In en, this message translates to:
  /// **'Ends with a dot (.)'**
  String get activeDirectoryDomainEndDot;

  /// No description provided for @activeDirectoryDomainStartHyphen.
  ///
  /// In en, this message translates to:
  /// **'Starts with a hyphen (-)'**
  String get activeDirectoryDomainStartHyphen;

  /// No description provided for @activeDirectoryDomainEndHyphen.
  ///
  /// In en, this message translates to:
  /// **'Ends with a hyphen (-)'**
  String get activeDirectoryDomainEndHyphen;

  /// No description provided for @activeDirectoryDomainMultipleDots.
  ///
  /// In en, this message translates to:
  /// **'Contains multiple sequenced dots (..)'**
  String get activeDirectoryDomainMultipleDots;

  /// No description provided for @activeDirectoryDomainNotFound.
  ///
  /// In en, this message translates to:
  /// **'Domain not found'**
  String get activeDirectoryDomainNotFound;

  /// No description provided for @activeDirectoryAdminLabel.
  ///
  /// In en, this message translates to:
  /// **'Domain join user'**
  String get activeDirectoryAdminLabel;

  /// No description provided for @activeDirectoryAdminEmpty.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get activeDirectoryAdminEmpty;

  /// No description provided for @activeDirectoryAdminInvalidChars.
  ///
  /// In en, this message translates to:
  /// **'Invalid characters'**
  String get activeDirectoryAdminInvalidChars;

  /// No description provided for @activeDirectoryPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get activeDirectoryPasswordLabel;

  /// No description provided for @activeDirectoryPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get activeDirectoryPasswordEmpty;

  /// No description provided for @activeDirectoryErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error configuring connection to Active Directory'**
  String get activeDirectoryErrorTitle;

  /// No description provided for @activeDirectoryErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.'**
  String get activeDirectoryErrorMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['am', 'ar', 'be', 'bg', 'bn', 'bo', 'bs', 'ca', 'cs', 'cy', 'da', 'de', 'dz', 'el', 'en', 'eo', 'es', 'et', 'eu', 'fa', 'fi', 'fr', 'ga', 'gl', 'gu', 'he', 'hi', 'hr', 'hu', 'id', 'is', 'it', 'ja', 'ka', 'kk', 'km', 'kn', 'ko', 'ku', 'lo', 'lt', 'lv', 'mk', 'ml', 'mr', 'my', 'nb', 'ne', 'nl', 'nn', 'oc', 'pa', 'pl', 'pt', 'ro', 'ru', 'se', 'si', 'sk', 'sl', 'sq', 'sr', 'sv', 'ta', 'te', 'tg', 'th', 'tl', 'tr', 'ug', 'uk', 'vi', 'zh'].contains(locale.languageCode);

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
    case 'zh': {
  switch (locale.countryCode) {
    case 'TW': return AppLocalizationsZhTw();
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
    case 'oc': return AppLocalizationsOc();
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
