
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_oc.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';

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
    Locale('es'),
    Locale('es', 'ES'),
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

  /// No description provided for @appTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Ubuntu Desktop Installer'**
  String get appTitle;

  /// No description provided for @windowTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Install Ubuntu'**
  String get windowTitle;

  /// No description provided for @cancelButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'Cancel'**
  String get cancelButtonText;

  /// No description provided for @changeButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'Change'**
  String get changeButtonText;

  /// No description provided for @okButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'OK'**
  String get okButtonText;

  /// No description provided for @noButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'No'**
  String get noButtonText;

  /// No description provided for @restartButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'Restart'**
  String get restartButtonText;

  /// No description provided for @revertButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'Revert'**
  String get revertButtonText;

  /// No description provided for @yesButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'Yes'**
  String get yesButtonText;

  /// No description provided for @welcome.
  ///
  /// In en_US, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @tryOrInstallPageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Try or install'**
  String get tryOrInstallPageTitle;

  /// No description provided for @repairInstallation.
  ///
  /// In en_US, this message translates to:
  /// **'Repair installation'**
  String get repairInstallation;

  /// No description provided for @repairInstallationDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Repairing will reinstall all installed software without touching documents or settings.'**
  String get repairInstallationDescription;

  /// No description provided for @tryUbuntu.
  ///
  /// In en_US, this message translates to:
  /// **'Try Ubuntu'**
  String get tryUbuntu;

  /// No description provided for @tryUbuntuDescription.
  ///
  /// In en_US, this message translates to:
  /// **'You can try Ubuntu without making any changes to your computer.'**
  String get tryUbuntuDescription;

  /// No description provided for @installUbuntu.
  ///
  /// In en_US, this message translates to:
  /// **'Install Ubuntu'**
  String get installUbuntu;

  /// No description provided for @installUbuntuDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.'**
  String get installUbuntuDescription;

  /// No description provided for @releaseNotesLabel.
  ///
  /// In en_US, this message translates to:
  /// **'You may wish to read the <a href=\"{url}\">release notes</a>.'**
  String releaseNotesLabel(Object url);

  /// No description provided for @turnOffRST.
  ///
  /// In en_US, this message translates to:
  /// **'Turn off RST'**
  String get turnOffRST;

  /// No description provided for @turnOffRSTDescription.
  ///
  /// In en_US, this message translates to:
  /// **'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.'**
  String get turnOffRSTDescription;

  /// No description provided for @instructionsForRST.
  ///
  /// In en_US, this message translates to:
  /// **'For instructions, open this page on a phone or other device: <a href=\"https://{url}\">{url}</a>'**
  String instructionsForRST(Object url);

  /// No description provided for @keyboardLayoutPageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Keyboard layout'**
  String get keyboardLayoutPageTitle;

  /// No description provided for @chooseYourKeyboardLayout.
  ///
  /// In en_US, this message translates to:
  /// **'Choose your keyboard layout:'**
  String get chooseYourKeyboardLayout;

  /// No description provided for @typeToTest.
  ///
  /// In en_US, this message translates to:
  /// **'Type here to test your keyboard'**
  String get typeToTest;

  /// No description provided for @detectLayout.
  ///
  /// In en_US, this message translates to:
  /// **'Detect Keyboard Layout'**
  String get detectLayout;

  /// No description provided for @pressOneKey.
  ///
  /// In en_US, this message translates to:
  /// **'Please press one of the following keys:'**
  String get pressOneKey;

  /// No description provided for @isKeyPresent.
  ///
  /// In en_US, this message translates to:
  /// **'Is the following key present on your keyboard?'**
  String get isKeyPresent;

  /// No description provided for @configureSecureBootTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Configure Secure Boot'**
  String get configureSecureBootTitle;

  /// No description provided for @configureSecureBootDescription.
  ///
  /// In en_US, this message translates to:
  /// **'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.'**
  String get configureSecureBootDescription;

  /// No description provided for @configureSecureBootOption.
  ///
  /// In en_US, this message translates to:
  /// **'Configure Secure Boot'**
  String get configureSecureBootOption;

  /// No description provided for @chooseSecurityKey.
  ///
  /// In en_US, this message translates to:
  /// **'Choose a security key'**
  String get chooseSecurityKey;

  /// No description provided for @confirmSecurityKey.
  ///
  /// In en_US, this message translates to:
  /// **'Confirm the security key'**
  String get confirmSecurityKey;

  /// No description provided for @dontInstallDriverSoftwareNow.
  ///
  /// In en_US, this message translates to:
  /// **'Don\'t install the driver software for now'**
  String get dontInstallDriverSoftwareNow;

  /// No description provided for @dontInstallDriverSoftwareNowDescription.
  ///
  /// In en_US, this message translates to:
  /// **'You can install it later from Software & Updates.'**
  String get dontInstallDriverSoftwareNowDescription;

  /// No description provided for @configureSecureBootSecurityKeyRequired.
  ///
  /// In en_US, this message translates to:
  /// **'Security key is required'**
  String get configureSecureBootSecurityKeyRequired;

  /// No description provided for @secureBootSecurityKeysDontMatch.
  ///
  /// In en_US, this message translates to:
  /// **'Security keys do not match'**
  String get secureBootSecurityKeysDontMatch;

  /// No description provided for @updatesOtherSoftwarePageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Updates and other software'**
  String get updatesOtherSoftwarePageTitle;

  /// No description provided for @updatesOtherSoftwarePageDescription.
  ///
  /// In en_US, this message translates to:
  /// **'What apps would you like to install to start with?'**
  String get updatesOtherSoftwarePageDescription;

  /// No description provided for @normalInstallationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Normal installation'**
  String get normalInstallationTitle;

  /// No description provided for @normalInstallationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Web browser, utilities, office software, games and media players.'**
  String get normalInstallationSubtitle;

  /// No description provided for @minimalInstallationTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Minimal installation'**
  String get minimalInstallationTitle;

  /// No description provided for @minimalInstallationSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Web browser and basic utilities.'**
  String get minimalInstallationSubtitle;

  /// No description provided for @otherOptions.
  ///
  /// In en_US, this message translates to:
  /// **'Other options'**
  String get otherOptions;

  /// No description provided for @installThirdPartyTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats'**
  String get installThirdPartyTitle;

  /// No description provided for @installThirdPartySubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'This software is subject to license terms included with its documentation. Some are proprietary.'**
  String get installThirdPartySubtitle;

  /// No description provided for @installationTypeTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Installation type'**
  String get installationTypeTitle;

  /// No description provided for @installationTypeOSDetected.
  ///
  /// In en_US, this message translates to:
  /// **'This computer currently has {os} on it. What would you like to do?'**
  String installationTypeOSDetected(Object os);

  /// No description provided for @installationTypeNoOSDetected.
  ///
  /// In en_US, this message translates to:
  /// **'This computer currently has no detected operating systems. What would you like to do?'**
  String get installationTypeNoOSDetected;

  /// No description provided for @installationTypeErase.
  ///
  /// In en_US, this message translates to:
  /// **'Erase disk and install Ubuntu'**
  String get installationTypeErase;

  /// No description provided for @installationTypeEraseWarning.
  ///
  /// In en_US, this message translates to:
  /// **'<font color=\"{color}\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.'**
  String installationTypeEraseWarning(Object color);

  /// No description provided for @installationTypeAdvancedLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Advanced Features...'**
  String get installationTypeAdvancedLabel;

  /// No description provided for @installationTypeAdvancedTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Advanced features'**
  String get installationTypeAdvancedTitle;

  /// No description provided for @installationTypeNone.
  ///
  /// In en_US, this message translates to:
  /// **'None'**
  String get installationTypeNone;

  /// No description provided for @installationTypeNoneSelected.
  ///
  /// In en_US, this message translates to:
  /// **'None selected'**
  String get installationTypeNoneSelected;

  /// No description provided for @installationTypeLVM.
  ///
  /// In en_US, this message translates to:
  /// **'Use LVM with the new Ubuntu installation'**
  String get installationTypeLVM;

  /// No description provided for @installationTypeLVMSelected.
  ///
  /// In en_US, this message translates to:
  /// **'LVM selected'**
  String get installationTypeLVMSelected;

  /// No description provided for @installationTypeEncrypt.
  ///
  /// In en_US, this message translates to:
  /// **'Encrypt the new Ubuntu installation for security'**
  String get installationTypeEncrypt;

  /// No description provided for @installationTypeEncryptInfo.
  ///
  /// In en_US, this message translates to:
  /// **'You will choose a security key in the next step.'**
  String get installationTypeEncryptInfo;

  /// No description provided for @installationTypeZFS.
  ///
  /// In en_US, this message translates to:
  /// **'EXPERIMENTAL: Erase disk and use ZFS'**
  String get installationTypeZFS;

  /// No description provided for @installationTypeZFSSelected.
  ///
  /// In en_US, this message translates to:
  /// **'ZFS selected'**
  String get installationTypeZFSSelected;

  /// No description provided for @installationTypeReinstall.
  ///
  /// In en_US, this message translates to:
  /// **'Erase {os} and reinstall'**
  String installationTypeReinstall(Object os);

  /// No description provided for @installationTypeReinstallWarning.
  ///
  /// In en_US, this message translates to:
  /// **'<font color=\"{color}\">Warning:</font> This will delete all your {os} programs, documents, photos, music, and any other files.'**
  String installationTypeReinstallWarning(Object color, Object os);

  /// No description provided for @installationTypeAlongside.
  ///
  /// In en_US, this message translates to:
  /// **'Install {product} alongside {os}'**
  String installationTypeAlongside(Object product, Object os);

  /// No description provided for @installationTypeAlongsideInfo.
  ///
  /// In en_US, this message translates to:
  /// **'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.'**
  String get installationTypeAlongsideInfo;

  /// No description provided for @installationTypeManual.
  ///
  /// In en_US, this message translates to:
  /// **'Something else'**
  String get installationTypeManual;

  /// No description provided for @installationTypeManualInfo.
  ///
  /// In en_US, this message translates to:
  /// **'You can create or resize partitions yourself, or choose multiple partitions for Ubuntu'**
  String get installationTypeManualInfo;

  /// No description provided for @selectGuidedStoragePageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Erase disk and install Ubuntu'**
  String get selectGuidedStoragePageTitle;

  /// No description provided for @selectGuidedStorageDropdownLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Select drive:'**
  String get selectGuidedStorageDropdownLabel;

  /// No description provided for @selectGuidedStorageInfoLabel.
  ///
  /// In en_US, this message translates to:
  /// **'The entire disk will be used:'**
  String get selectGuidedStorageInfoLabel;

  /// No description provided for @selectGuidedStorageInstallNow.
  ///
  /// In en_US, this message translates to:
  /// **'Install Now'**
  String get selectGuidedStorageInstallNow;

  /// No description provided for @allocateDiskSpace.
  ///
  /// In en_US, this message translates to:
  /// **'Allocate disk space'**
  String get allocateDiskSpace;

  /// No description provided for @startInstallingButtonText.
  ///
  /// In en_US, this message translates to:
  /// **'Start Installing'**
  String get startInstallingButtonText;

  /// No description provided for @diskHeadersDevice.
  ///
  /// In en_US, this message translates to:
  /// **'Device'**
  String get diskHeadersDevice;

  /// No description provided for @diskHeadersType.
  ///
  /// In en_US, this message translates to:
  /// **'Type'**
  String get diskHeadersType;

  /// No description provided for @diskHeadersMountPoint.
  ///
  /// In en_US, this message translates to:
  /// **'Mount point'**
  String get diskHeadersMountPoint;

  /// No description provided for @diskHeadersSize.
  ///
  /// In en_US, this message translates to:
  /// **'Size'**
  String get diskHeadersSize;

  /// No description provided for @diskHeadersUsed.
  ///
  /// In en_US, this message translates to:
  /// **'Used'**
  String get diskHeadersUsed;

  /// No description provided for @diskHeadersSystem.
  ///
  /// In en_US, this message translates to:
  /// **'System'**
  String get diskHeadersSystem;

  /// No description provided for @diskHeadersFormat.
  ///
  /// In en_US, this message translates to:
  /// **'Format'**
  String get diskHeadersFormat;

  /// No description provided for @freeDiskSpace.
  ///
  /// In en_US, this message translates to:
  /// **'free space'**
  String get freeDiskSpace;

  /// No description provided for @newPartitionTable.
  ///
  /// In en_US, this message translates to:
  /// **'New partition table'**
  String get newPartitionTable;

  /// No description provided for @bootLoaderDevice.
  ///
  /// In en_US, this message translates to:
  /// **'Device for boot loader installation'**
  String get bootLoaderDevice;

  /// No description provided for @partitionCreateTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Create partition'**
  String get partitionCreateTitle;

  /// No description provided for @partitionEditTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Edit partition'**
  String get partitionEditTitle;

  /// No description provided for @partitionSizeLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Size:'**
  String get partitionSizeLabel;

  /// No description provided for @partitionUnitB.
  ///
  /// In en_US, this message translates to:
  /// **'B'**
  String get partitionUnitB;

  /// No description provided for @partitionUnitKB.
  ///
  /// In en_US, this message translates to:
  /// **'KB'**
  String get partitionUnitKB;

  /// No description provided for @partitionUnitMB.
  ///
  /// In en_US, this message translates to:
  /// **'MB'**
  String get partitionUnitMB;

  /// No description provided for @partitionUnitGB.
  ///
  /// In en_US, this message translates to:
  /// **'GB'**
  String get partitionUnitGB;

  /// No description provided for @partitionTypeLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Type for the new partition:'**
  String get partitionTypeLabel;

  /// No description provided for @partitionTypePrimary.
  ///
  /// In en_US, this message translates to:
  /// **'Primary'**
  String get partitionTypePrimary;

  /// No description provided for @partitionTypeLogical.
  ///
  /// In en_US, this message translates to:
  /// **'Logical'**
  String get partitionTypeLogical;

  /// No description provided for @partitionLocationLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Location for the new partition:'**
  String get partitionLocationLabel;

  /// No description provided for @partitionLocationBeginning.
  ///
  /// In en_US, this message translates to:
  /// **'Beginning of this space'**
  String get partitionLocationBeginning;

  /// No description provided for @partitionLocationEnd.
  ///
  /// In en_US, this message translates to:
  /// **'End of this space'**
  String get partitionLocationEnd;

  /// No description provided for @partitionFormatLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Used as:'**
  String get partitionFormatLabel;

  /// No description provided for @partitionFormatExt4.
  ///
  /// In en_US, this message translates to:
  /// **'Ext4 journaling file system'**
  String get partitionFormatExt4;

  /// No description provided for @partitionFormatExt3.
  ///
  /// In en_US, this message translates to:
  /// **'Ext3 journaling file system'**
  String get partitionFormatExt3;

  /// No description provided for @partitionFormatExt2.
  ///
  /// In en_US, this message translates to:
  /// **'Ext2 file system'**
  String get partitionFormatExt2;

  /// No description provided for @partitionFormatBtrfs.
  ///
  /// In en_US, this message translates to:
  /// **'btrfs journaling file system'**
  String get partitionFormatBtrfs;

  /// No description provided for @partitionFormatJfs.
  ///
  /// In en_US, this message translates to:
  /// **'JFS journaling file system'**
  String get partitionFormatJfs;

  /// No description provided for @partitionFormatXfs.
  ///
  /// In en_US, this message translates to:
  /// **'XFS journaling file system'**
  String get partitionFormatXfs;

  /// No description provided for @partitionFormatFat16.
  ///
  /// In en_US, this message translates to:
  /// **'FAT16 file system'**
  String get partitionFormatFat16;

  /// No description provided for @partitionFormatFat32.
  ///
  /// In en_US, this message translates to:
  /// **'FAT32 file system'**
  String get partitionFormatFat32;

  /// No description provided for @partitionFormatSwap.
  ///
  /// In en_US, this message translates to:
  /// **'swap area'**
  String get partitionFormatSwap;

  /// No description provided for @partitionFormatBios.
  ///
  /// In en_US, this message translates to:
  /// **'Reserved BIOS boot area'**
  String get partitionFormatBios;

  /// No description provided for @partitionFormatEfi.
  ///
  /// In en_US, this message translates to:
  /// **'EFI System Partition'**
  String get partitionFormatEfi;

  /// No description provided for @partitionFormatPhysical.
  ///
  /// In en_US, this message translates to:
  /// **'physical volume for encryption'**
  String get partitionFormatPhysical;

  /// No description provided for @partitionFormatNone.
  ///
  /// In en_US, this message translates to:
  /// **'do not use the partition'**
  String get partitionFormatNone;

  /// No description provided for @partitionErase.
  ///
  /// In en_US, this message translates to:
  /// **'Format the partition'**
  String get partitionErase;

  /// No description provided for @partitionMountPointLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Mount point:'**
  String get partitionMountPointLabel;

  /// No description provided for @whoAreYouPageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Who are you?'**
  String get whoAreYouPageTitle;

  /// No description provided for @whoAreYouPageAutoLogin.
  ///
  /// In en_US, this message translates to:
  /// **'Log in automatically'**
  String get whoAreYouPageAutoLogin;

  /// No description provided for @whoAreYouPageRequirePassword.
  ///
  /// In en_US, this message translates to:
  /// **'Require my password to log in'**
  String get whoAreYouPageRequirePassword;

  /// No description provided for @whoAreYouPageRealNameLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Your name'**
  String get whoAreYouPageRealNameLabel;

  /// No description provided for @whoAreYouPageRealNameRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A name is required'**
  String get whoAreYouPageRealNameRequired;

  /// No description provided for @whoAreYouPageComputerNameLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Your computer\'s name'**
  String get whoAreYouPageComputerNameLabel;

  /// No description provided for @whoAreYouPageComputerNameInfo.
  ///
  /// In en_US, this message translates to:
  /// **'The name it uses when it talks to other computers.'**
  String get whoAreYouPageComputerNameInfo;

  /// No description provided for @whoAreYouPageComputerNameRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A computer name is required'**
  String get whoAreYouPageComputerNameRequired;

  /// No description provided for @whoAreYouPageInvalidComputerName.
  ///
  /// In en_US, this message translates to:
  /// **'The computer name is invalid'**
  String get whoAreYouPageInvalidComputerName;

  /// No description provided for @whoAreYouPageUsernameLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Pick a username'**
  String get whoAreYouPageUsernameLabel;

  /// No description provided for @whoAreYouPageUsernameRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A username is required'**
  String get whoAreYouPageUsernameRequired;

  /// No description provided for @whoAreYouPageInvalidUsername.
  ///
  /// In en_US, this message translates to:
  /// **'The username is invalid'**
  String get whoAreYouPageInvalidUsername;

  /// No description provided for @whoAreYouPagePasswordLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Choose a password'**
  String get whoAreYouPagePasswordLabel;

  /// No description provided for @whoAreYouPagePasswordRequired.
  ///
  /// In en_US, this message translates to:
  /// **'A password is required'**
  String get whoAreYouPagePasswordRequired;

  /// No description provided for @whoAreYouPageConfirmPasswordLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Confirm your password'**
  String get whoAreYouPageConfirmPasswordLabel;

  /// No description provided for @whoAreYouPagePasswordMismatch.
  ///
  /// In en_US, this message translates to:
  /// **'The passwords do not match'**
  String get whoAreYouPagePasswordMismatch;

  /// No description provided for @writeChangesToDisk.
  ///
  /// In en_US, this message translates to:
  /// **'Write changes to disk'**
  String get writeChangesToDisk;

  /// Default display name for a disk without a serial (unlikely)
  ///
  /// In en_US, this message translates to:
  /// **'disk'**
  String get writeChangesFallbackSerial;

  /// No description provided for @writeChangesDescription.
  ///
  /// In en_US, this message translates to:
  /// **'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.'**
  String get writeChangesDescription;

  /// No description provided for @writeChangesPartitionTablesHeader.
  ///
  /// In en_US, this message translates to:
  /// **'The partition tables of the following devices are changed:'**
  String get writeChangesPartitionTablesHeader;

  /// An entry for a disk whose partition table is being changed
  ///
  /// In en_US, this message translates to:
  /// **'{serial} ({path})'**
  String writeChangesPartitionTablesEntry(Object serial, Object path);

  /// No description provided for @writeChangesPartitionsHeader.
  ///
  /// In en_US, this message translates to:
  /// **'The following partitions are going to be formatted:'**
  String get writeChangesPartitionsHeader;

  /// An entry for a primary partition without secondary partitions
  ///
  /// In en_US, this message translates to:
  /// **'partition #{partitionNumber} of {diskSerial} ({diskPath}) as {fstype} used for {mountPath}'**
  String writeChangesPartitionEntryPrimaryFull(Object partitionNumber, Object diskSerial, Object diskPath, Object fstype, Object mountPath);

  /// An entry for a primary partition with secondary partitions
  ///
  /// In en_US, this message translates to:
  /// **'partition #{partitionNumber} of {diskSerial} ({diskPath}) as'**
  String writeChangesPartitionEntryPrimary(Object partitionNumber, Object diskSerial, Object diskPath);

  /// An entry for a secondary partition
  ///
  /// In en_US, this message translates to:
  /// **'        partition # as {fstype} used for {mountPath}'**
  String writeChangesPartitionEntrySecondary(Object fstype, Object mountPath);

  /// No description provided for @chooseYourLookPageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Choose your look'**
  String get chooseYourLookPageTitle;

  /// No description provided for @chooseYourLookPageHeader.
  ///
  /// In en_US, this message translates to:
  /// **'You can always change this later in the appearance settings.'**
  String get chooseYourLookPageHeader;

  /// No description provided for @chooseYourLookPageDarkSetting.
  ///
  /// In en_US, this message translates to:
  /// **'Dark'**
  String get chooseYourLookPageDarkSetting;

  /// No description provided for @chooseYourLookPageLightSetting.
  ///
  /// In en_US, this message translates to:
  /// **'Light'**
  String get chooseYourLookPageLightSetting;

  /// No description provided for @chooseYourLookPageLightBodyText.
  ///
  /// In en_US, this message translates to:
  /// **'Everything is light and bright'**
  String get chooseYourLookPageLightBodyText;

  /// No description provided for @chooseYourLookPageDarkBodyText.
  ///
  /// In en_US, this message translates to:
  /// **'Hello darkness my old friend'**
  String get chooseYourLookPageDarkBodyText;

  /// No description provided for @installationCompleteTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Installation complete'**
  String get installationCompleteTitle;

  /// No description provided for @readyToUse.
  ///
  /// In en_US, this message translates to:
  /// **'**{system}** is installed and ready to use.'**
  String readyToUse(Object system);

  /// No description provided for @restartInto.
  ///
  /// In en_US, this message translates to:
  /// **'Restart into {system}'**
  String restartInto(Object system);

  /// No description provided for @shutdown.
  ///
  /// In en_US, this message translates to:
  /// **'Shut Down'**
  String get shutdown;

  /// No description provided for @turnOffBitlockerTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Turn off BitLocker'**
  String get turnOffBitlockerTitle;

  /// No description provided for @turnOffBitlockerDescription.
  ///
  /// In en_US, this message translates to:
  /// **'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.'**
  String get turnOffBitlockerDescription;

  /// No description provided for @turnOffBitlockerLinkInstructions.
  ///
  /// In en_US, this message translates to:
  /// **'For instructions, open this page on a phone or other device: <a href=\"https://{url}\">{url}</a>'**
  String turnOffBitlockerLinkInstructions(Object url);

  /// No description provided for @restartIntoWindows.
  ///
  /// In en_US, this message translates to:
  /// **'Restart Into Windows'**
  String get restartIntoWindows;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'it', 'nl', 'oc', 'pt', 'ru'].contains(locale.languageCode);

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
    case 'es': {
  switch (locale.countryCode) {
    case 'ES': return AppLocalizationsEsEs();
   }
  break;
   }
    case 'fr': {
  switch (locale.countryCode) {
    case 'FR': return AppLocalizationsFrFr();
   }
  break;
   }
    case 'it': {
  switch (locale.countryCode) {
    case 'IT': return AppLocalizationsItIt();
   }
  break;
   }
    case 'nl': {
  switch (locale.countryCode) {
    case 'NL': return AppLocalizationsNlNl();
   }
  break;
   }
    case 'oc': {
  switch (locale.countryCode) {
    case 'FR': return AppLocalizationsOcFr();
   }
  break;
   }
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return AppLocalizationsPtBr();
   }
  break;
   }
    case 'ru': {
  switch (locale.countryCode) {
    case 'RU': return AppLocalizationsRuRu();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
    case 'nl': return AppLocalizationsNl();
    case 'oc': return AppLocalizationsOc();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
