
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

  /// No description provided for @cancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonText;

  /// No description provided for @changeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changeButtonText;

  /// No description provided for @okButtonText.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButtonText;

  /// No description provided for @noButtonText.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noButtonText;

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

  /// No description provided for @yesButtonText.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesButtonText;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcomeHeader.
  ///
  /// In en, this message translates to:
  /// **'Choose your language:'**
  String get welcomeHeader;

  /// No description provided for @tryOrInstallPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Try or install'**
  String get tryOrInstallPageTitle;

  /// No description provided for @repairInstallation.
  ///
  /// In en, this message translates to:
  /// **'Repair installation'**
  String get repairInstallation;

  /// No description provided for @repairInstallationDescription.
  ///
  /// In en, this message translates to:
  /// **'Repairing will reinstall all installed software without touching documents or settings.'**
  String get repairInstallationDescription;

  /// No description provided for @tryUbuntu.
  ///
  /// In en, this message translates to:
  /// **'Try {RELEASE}'**
  String tryUbuntu(Object RELEASE);

  /// No description provided for @tryUbuntuDescription.
  ///
  /// In en, this message translates to:
  /// **'You can try {RELEASE} without making any changes to your computer.'**
  String tryUbuntuDescription(Object RELEASE);

  /// No description provided for @installUbuntu.
  ///
  /// In en, this message translates to:
  /// **'Install {RELEASE}'**
  String installUbuntu(Object RELEASE);

  /// No description provided for @installUbuntuDescription.
  ///
  /// In en, this message translates to:
  /// **'Install {RELEASE} alongside (or instead of) your current operating system. This shouldn\'t take too long.'**
  String installUbuntuDescription(Object RELEASE);

  /// No description provided for @releaseNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'You may wish to read the <a href=\"{url}\">release notes</a>.'**
  String releaseNotesLabel(Object url);

  /// No description provided for @turnOffRST.
  ///
  /// In en, this message translates to:
  /// **'Turn off RST'**
  String get turnOffRST;

  /// No description provided for @turnOffRSTDescription.
  ///
  /// In en, this message translates to:
  /// **'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.'**
  String get turnOffRSTDescription;

  /// No description provided for @instructionsForRST.
  ///
  /// In en, this message translates to:
  /// **'For instructions, open this page on a phone or other device: <a href=\"https://{url}\">{url}</a>'**
  String instructionsForRST(Object url);

  /// No description provided for @keyboardLayoutPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Keyboard layout'**
  String get keyboardLayoutPageTitle;

  /// No description provided for @chooseYourKeyboardLayout.
  ///
  /// In en, this message translates to:
  /// **'Choose your keyboard layout:'**
  String get chooseYourKeyboardLayout;

  /// No description provided for @typeToTest.
  ///
  /// In en, this message translates to:
  /// **'Type here to test your keyboard'**
  String get typeToTest;

  /// No description provided for @detectLayout.
  ///
  /// In en, this message translates to:
  /// **'Detect Keyboard Layout'**
  String get detectLayout;

  /// No description provided for @pressOneKey.
  ///
  /// In en, this message translates to:
  /// **'Please press one of the following keys:'**
  String get pressOneKey;

  /// No description provided for @isKeyPresent.
  ///
  /// In en, this message translates to:
  /// **'Is the following key present on your keyboard?'**
  String get isKeyPresent;

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

  /// No description provided for @connectToInternetPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect to internet'**
  String get connectToInternetPageTitle;

  /// No description provided for @connectToInternetDescription.
  ///
  /// In en, this message translates to:
  /// **'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by ethernet cable, or choose a Wi-Fi network'**
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
  /// **'To use ethernet on this computer, a wired connection must be enabled'**
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
  /// **'Updates and other software'**
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

  /// No description provided for @onBatteryWarning.
  ///
  /// In en, this message translates to:
  /// **'<font color=\"{color}\">Warning</font>: The computer is not plugged in to a power source.'**
  String onBatteryWarning(Object color);

  /// No description provided for @chooseSecurityKeyTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a security key'**
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
  /// **'<font color=\"{color}\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.'**
  String chooseSecurityKeyWarning(Object color);

  /// No description provided for @installationTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Installation type'**
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
  /// **'Advanced Features...'**
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

  /// No description provided for @installationTypeAlongsideInfo.
  ///
  /// In en, this message translates to:
  /// **'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.'**
  String get installationTypeAlongsideInfo;

  /// No description provided for @installationTypeManual.
  ///
  /// In en, this message translates to:
  /// **'Something else'**
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
  /// **'Install Now'**
  String get selectGuidedStorageInstallNow;

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
  /// **'Allocate disk space'**
  String get allocateDiskSpace;

  /// No description provided for @startInstallingButtonText.
  ///
  /// In en, this message translates to:
  /// **'Start Installing'**
  String get startInstallingButtonText;

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
  /// **'free space'**
  String get freeDiskSpace;

  /// No description provided for @newPartitionTable.
  ///
  /// In en, this message translates to:
  /// **'New partition table'**
  String get newPartitionTable;

  /// No description provided for @newPartitionTableConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new empty partition table on this device?'**
  String get newPartitionTableConfirmationTitle;

  /// No description provided for @newPartitionTableConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.'**
  String get newPartitionTableConfirmationMessage;

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

  /// No description provided for @partitionUnitB.
  ///
  /// In en, this message translates to:
  /// **'B'**
  String get partitionUnitB;

  /// No description provided for @partitionUnitKB.
  ///
  /// In en, this message translates to:
  /// **'KB'**
  String get partitionUnitKB;

  /// No description provided for @partitionUnitMB.
  ///
  /// In en, this message translates to:
  /// **'MB'**
  String get partitionUnitMB;

  /// No description provided for @partitionUnitGB.
  ///
  /// In en, this message translates to:
  /// **'GB'**
  String get partitionUnitGB;

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

  /// No description provided for @partitionFormatExt4.
  ///
  /// In en, this message translates to:
  /// **'Ext4 journaling file system'**
  String get partitionFormatExt4;

  /// No description provided for @partitionFormatExt3.
  ///
  /// In en, this message translates to:
  /// **'Ext3 journaling file system'**
  String get partitionFormatExt3;

  /// No description provided for @partitionFormatExt2.
  ///
  /// In en, this message translates to:
  /// **'Ext2 file system'**
  String get partitionFormatExt2;

  /// No description provided for @partitionFormatBtrfs.
  ///
  /// In en, this message translates to:
  /// **'btrfs journaling file system'**
  String get partitionFormatBtrfs;

  /// No description provided for @partitionFormatJfs.
  ///
  /// In en, this message translates to:
  /// **'JFS journaling file system'**
  String get partitionFormatJfs;

  /// No description provided for @partitionFormatXfs.
  ///
  /// In en, this message translates to:
  /// **'XFS journaling file system'**
  String get partitionFormatXfs;

  /// No description provided for @partitionFormatFat.
  ///
  /// In en, this message translates to:
  /// **'FAT file system'**
  String get partitionFormatFat;

  /// No description provided for @partitionFormatFat12.
  ///
  /// In en, this message translates to:
  /// **'FAT12 file system'**
  String get partitionFormatFat12;

  /// No description provided for @partitionFormatFat16.
  ///
  /// In en, this message translates to:
  /// **'FAT16 file system'**
  String get partitionFormatFat16;

  /// No description provided for @partitionFormatFat32.
  ///
  /// In en, this message translates to:
  /// **'FAT32 file system'**
  String get partitionFormatFat32;

  /// No description provided for @partitionFormatSwap.
  ///
  /// In en, this message translates to:
  /// **'Swap area'**
  String get partitionFormatSwap;

  /// No description provided for @partitionFormatIso9660.
  ///
  /// In en, this message translates to:
  /// **'ISO 9660 file system'**
  String get partitionFormatIso9660;

  /// No description provided for @partitionFormatVfat.
  ///
  /// In en, this message translates to:
  /// **'VFAT file system'**
  String get partitionFormatVfat;

  /// No description provided for @partitionFormatNtfs.
  ///
  /// In en, this message translates to:
  /// **'NTFS file system'**
  String get partitionFormatNtfs;

  /// No description provided for @partitionFormatReiserFS.
  ///
  /// In en, this message translates to:
  /// **'ReiserFS file system'**
  String get partitionFormatReiserFS;

  /// No description provided for @partitionFormatZfsroot.
  ///
  /// In en, this message translates to:
  /// **'ZFS root file system'**
  String get partitionFormatZfsroot;

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

  /// No description provided for @whoAreYouPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Who are you?'**
  String get whoAreYouPageTitle;

  /// No description provided for @whoAreYouPageAutoLogin.
  ///
  /// In en, this message translates to:
  /// **'Log in automatically'**
  String get whoAreYouPageAutoLogin;

  /// No description provided for @whoAreYouPageRequirePassword.
  ///
  /// In en, this message translates to:
  /// **'Require my password to log in'**
  String get whoAreYouPageRequirePassword;

  /// No description provided for @whoAreYouPageRealNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get whoAreYouPageRealNameLabel;

  /// No description provided for @whoAreYouPageRealNameRequired.
  ///
  /// In en, this message translates to:
  /// **'A name is required'**
  String get whoAreYouPageRealNameRequired;

  /// No description provided for @whoAreYouPageComputerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your computer\'s name'**
  String get whoAreYouPageComputerNameLabel;

  /// No description provided for @whoAreYouPageComputerNameInfo.
  ///
  /// In en, this message translates to:
  /// **'The name it uses when it talks to other computers.'**
  String get whoAreYouPageComputerNameInfo;

  /// No description provided for @whoAreYouPageComputerNameRequired.
  ///
  /// In en, this message translates to:
  /// **'A computer name is required'**
  String get whoAreYouPageComputerNameRequired;

  /// No description provided for @whoAreYouPageInvalidComputerName.
  ///
  /// In en, this message translates to:
  /// **'The computer name is invalid'**
  String get whoAreYouPageInvalidComputerName;

  /// No description provided for @whoAreYouPageUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Pick a username'**
  String get whoAreYouPageUsernameLabel;

  /// No description provided for @whoAreYouPageUsernameRequired.
  ///
  /// In en, this message translates to:
  /// **'A username is required'**
  String get whoAreYouPageUsernameRequired;

  /// No description provided for @whoAreYouPageInvalidUsername.
  ///
  /// In en, this message translates to:
  /// **'The username is invalid'**
  String get whoAreYouPageInvalidUsername;

  /// No description provided for @whoAreYouPageUsernameInUse.
  ///
  /// In en, this message translates to:
  /// **'That user name already exists.'**
  String get whoAreYouPageUsernameInUse;

  /// No description provided for @whoAreYouPageUsernameSystemReserved.
  ///
  /// In en, this message translates to:
  /// **'That name is reserved for system usage.'**
  String get whoAreYouPageUsernameSystemReserved;

  /// No description provided for @whoAreYouPageUsernameTooLong.
  ///
  /// In en, this message translates to:
  /// **'That name is too long.'**
  String get whoAreYouPageUsernameTooLong;

  /// No description provided for @whoAreYouPageUsernameInvalidChars.
  ///
  /// In en, this message translates to:
  /// **'That name contains invalid characters.'**
  String get whoAreYouPageUsernameInvalidChars;

  /// No description provided for @whoAreYouPagePasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Choose a password'**
  String get whoAreYouPagePasswordLabel;

  /// No description provided for @whoAreYouPagePasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'A password is required'**
  String get whoAreYouPagePasswordRequired;

  /// No description provided for @whoAreYouPageConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get whoAreYouPageConfirmPasswordLabel;

  /// No description provided for @whoAreYouPagePasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords do not match'**
  String get whoAreYouPagePasswordMismatch;

  /// No description provided for @whoAreYouPageShowPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get whoAreYouPageShowPassword;

  /// No description provided for @writeChangesToDisk.
  ///
  /// In en, this message translates to:
  /// **'Write changes to disk'**
  String get writeChangesToDisk;

  /// Default display name for a disk without a serial (unlikely)
  ///
  /// In en, this message translates to:
  /// **'disk'**
  String get writeChangesFallbackSerial;

  /// No description provided for @writeChangesDescription.
  ///
  /// In en, this message translates to:
  /// **'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.'**
  String get writeChangesDescription;

  /// No description provided for @writeChangesPartitionTablesHeader.
  ///
  /// In en, this message translates to:
  /// **'The partition tables of the following devices are changed:'**
  String get writeChangesPartitionTablesHeader;

  /// An entry for a disk whose partition table is being changed
  ///
  /// In en, this message translates to:
  /// **'{serial} ({path})'**
  String writeChangesPartitionTablesEntry(Object serial, Object path);

  /// No description provided for @writeChangesPartitionsHeader.
  ///
  /// In en, this message translates to:
  /// **'The following partitions are going to be formatted:'**
  String get writeChangesPartitionsHeader;

  /// A mounted partition entry
  ///
  /// In en, this message translates to:
  /// **'partition #{disk}{partition} as {format} used for {mount}'**
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount);

  /// An unmounted partition entry
  ///
  /// In en, this message translates to:
  /// **'partition #{disk}{partition} as {format}'**
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format);

  /// No description provided for @chooseYourLookPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your look'**
  String get chooseYourLookPageTitle;

  /// No description provided for @chooseYourLookPageHeader.
  ///
  /// In en, this message translates to:
  /// **'You can always change this later in the appearance settings.'**
  String get chooseYourLookPageHeader;

  /// No description provided for @chooseYourLookPageDarkSetting.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get chooseYourLookPageDarkSetting;

  /// No description provided for @chooseYourLookPageLightSetting.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get chooseYourLookPageLightSetting;

  /// No description provided for @chooseYourLookPageLightBodyText.
  ///
  /// In en, this message translates to:
  /// **'Everything is light and bright'**
  String get chooseYourLookPageLightBodyText;

  /// No description provided for @chooseYourLookPageDarkBodyText.
  ///
  /// In en, this message translates to:
  /// **'Hello darkness my old friend'**
  String get chooseYourLookPageDarkBodyText;

  /// No description provided for @installationCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Installation complete'**
  String get installationCompleteTitle;

  /// No description provided for @readyToUse.
  ///
  /// In en, this message translates to:
  /// **'**{system}** is installed and ready to use.'**
  String readyToUse(Object system);

  /// No description provided for @restartInto.
  ///
  /// In en, this message translates to:
  /// **'Restart into {system}'**
  String restartInto(Object system);

  /// No description provided for @shutdown.
  ///
  /// In en, this message translates to:
  /// **'Shut Down'**
  String get shutdown;

  /// No description provided for @turnOffBitlockerTitle.
  ///
  /// In en, this message translates to:
  /// **'Turn off BitLocker'**
  String get turnOffBitlockerTitle;

  /// No description provided for @turnOffBitlockerDescription.
  ///
  /// In en, this message translates to:
  /// **'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.'**
  String get turnOffBitlockerDescription;

  /// No description provided for @turnOffBitlockerLinkInstructions.
  ///
  /// In en, this message translates to:
  /// **'For instructions, open this page on a phone or other device: <a href=\"https://{url}\">{url}</a>'**
  String turnOffBitlockerLinkInstructions(Object url);

  /// No description provided for @restartIntoWindows.
  ///
  /// In en, this message translates to:
  /// **'Restart Into Windows'**
  String get restartIntoWindows;

  /// No description provided for @whereAreYouPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Where are you?'**
  String get whereAreYouPageTitle;

  /// No description provided for @whereAreYouLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get whereAreYouLocationLabel;

  /// No description provided for @whereAreYouTimezoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get whereAreYouTimezoneLabel;

  /// No description provided for @welcomeSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {RELEASE}'**
  String welcomeSlideTitle(Object RELEASE);

  /// No description provided for @welcomeSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'Fast and full of new features, the latest version of {RELEASE} makes computing easier than ever. Here are just a few cool new things to look out for...'**
  String welcomeSlideDescription(Object RELEASE);

  /// No description provided for @softwareSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Find even more software'**
  String get softwareSlideTitle;

  /// No description provided for @softwareSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'Say goodbye to searching the web for new software. With access to the Snap Store and the {RELEASE} software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.'**
  String softwareSlideDescription(Object RELEASE);

  /// No description provided for @musicSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Take your music with you'**
  String get musicSlideTitle;

  /// No description provided for @musicSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'{RELEASE} comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.'**
  String musicSlideDescription(Object RELEASE);

  /// No description provided for @musicSlideRhythmbox.
  ///
  /// In en, this message translates to:
  /// **'Rhythmbox Music Player'**
  String get musicSlideRhythmbox;

  /// No description provided for @musicSlideSpotify.
  ///
  /// In en, this message translates to:
  /// **'Spotify'**
  String get musicSlideSpotify;

  /// No description provided for @musicSlideVLC.
  ///
  /// In en, this message translates to:
  /// **'VLC'**
  String get musicSlideVLC;

  /// No description provided for @photoSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Have fun with your photos'**
  String get photoSlideTitle;

  /// No description provided for @photoSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.'**
  String get photoSlideDescription;

  /// No description provided for @photoSlideShotwell.
  ///
  /// In en, this message translates to:
  /// **'Shotwell Photo Manager'**
  String get photoSlideShotwell;

  /// No description provided for @photoSlideGimp.
  ///
  /// In en, this message translates to:
  /// **'GIMP Image Editor'**
  String get photoSlideGimp;

  /// No description provided for @photoSlideShotcut.
  ///
  /// In en, this message translates to:
  /// **'Shotcut Video Editor'**
  String get photoSlideShotcut;

  /// No description provided for @webSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Make the most of the web'**
  String get webSlideTitle;

  /// No description provided for @webSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'{RELEASE} includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.'**
  String webSlideDescription(Object RELEASE);

  /// No description provided for @webSlideFirefox.
  ///
  /// In en, this message translates to:
  /// **'Firefox web browser'**
  String get webSlideFirefox;

  /// No description provided for @webSlideThunderbird.
  ///
  /// In en, this message translates to:
  /// **'Thunderbird'**
  String get webSlideThunderbird;

  /// No description provided for @webSlideChromium.
  ///
  /// In en, this message translates to:
  /// **'Chromium'**
  String get webSlideChromium;

  /// No description provided for @officeSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Everything you need for the office'**
  String get officeSlideTitle;

  /// No description provided for @officeSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.'**
  String get officeSlideDescription;

  /// No description provided for @officeSlideWriter.
  ///
  /// In en, this message translates to:
  /// **'LibreOffice Writer'**
  String get officeSlideWriter;

  /// No description provided for @officeSlideCalc.
  ///
  /// In en, this message translates to:
  /// **'LibreOffice Calc'**
  String get officeSlideCalc;

  /// No description provided for @officeSlideImpress.
  ///
  /// In en, this message translates to:
  /// **'LibreOffice Impress'**
  String get officeSlideImpress;

  /// No description provided for @accessSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Access for everyone'**
  String get accessSlideTitle;

  /// No description provided for @accessSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'At the heart of the {RELEASE} philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, {RELEASE} makes computing easy - whoever and wherever you are.'**
  String accessSlideDescription(Object RELEASE);

  /// No description provided for @accessSlideCustomizationOptions.
  ///
  /// In en, this message translates to:
  /// **'Customization options'**
  String get accessSlideCustomizationOptions;

  /// No description provided for @accessSlideAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get accessSlideAppearance;

  /// No description provided for @accessSlideAssistiveTechnologies.
  ///
  /// In en, this message translates to:
  /// **'Assistive technologies'**
  String get accessSlideAssistiveTechnologies;

  /// No description provided for @accessSlideLanguageSupport.
  ///
  /// In en, this message translates to:
  /// **'Language support'**
  String get accessSlideLanguageSupport;

  /// No description provided for @supportSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Help and support'**
  String get supportSlideTitle;

  /// No description provided for @supportSlideDocumentation.
  ///
  /// In en, this message translates to:
  /// **'The official documentation covers many of the most common areas about {RELEASE}. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.'**
  String supportSlideDocumentation(Object RELEASE);

  /// No description provided for @supportSlideQuestions.
  ///
  /// In en, this message translates to:
  /// **'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.'**
  String get supportSlideQuestions;

  /// No description provided for @supportSlideResources.
  ///
  /// In en, this message translates to:
  /// **'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.'**
  String get supportSlideResources;

  /// No description provided for @includedSoftware.
  ///
  /// In en, this message translates to:
  /// **'Included software'**
  String get includedSoftware;

  /// No description provided for @availableSoftware.
  ///
  /// In en, this message translates to:
  /// **'Available software'**
  String get availableSoftware;

  /// No description provided for @supportedSoftware.
  ///
  /// In en, this message translates to:
  /// **'Supported software'**
  String get supportedSoftware;

  /// No description provided for @copyingFiles.
  ///
  /// In en, this message translates to:
  /// **'Copying files...'**
  String get copyingFiles;

  /// No description provided for @installationFailed.
  ///
  /// In en, this message translates to:
  /// **'Installation failed'**
  String get installationFailed;
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
