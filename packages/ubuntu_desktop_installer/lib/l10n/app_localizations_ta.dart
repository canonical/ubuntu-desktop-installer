


import 'app_localizations.dart';

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Desktop Installer';

  @override
  String windowTitle(Object RELEASE) {
    return 'நிறுவு$RELEASE';
  }

  @override
  String get cancelButtonText => 'ரத்து செய்';

  @override
  String get changeButtonText => 'மாற்று';

  @override
  String get okButtonText => 'சரி';

  @override
  String get noButtonText => 'இல்லை';

  @override
  String get restartButtonText => 'மீண்டும் இயக்கு';

  @override
  String get revertButtonText => 'மீட்டல்';

  @override
  String get yesButtonText => 'ஆம்';

  @override
  String get welcome => 'நல்வரவு';

  @override
  String get tryOrInstallPageTitle => 'சோதி அல்லது நிறுவு';

  @override
  String get repairInstallation => 'நிறுவலை பழுதுபார்';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'சோதி $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'உங்கள் கணினியில் எந்த மாற்றமும் செய்யாமல் $RELEASEஐ சோதிக்கலாம்.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'நிறுவு$RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Install $RELEASE alongside (or instead of) your current operating system. This shouldn\'t take too long.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'You may wish to read the <a href=\"$url\">release notes</a>.';
  }

  @override
  String get turnOffRST => 'RSTயை முடக்கு';

  @override
  String get turnOffRSTDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'விசைப்பலகை அமைப்பு';

  @override
  String get chooseYourKeyboardLayout => 'உங்களின் விசைப்பலகை அமைப்பைத் தேர்வு செய்யவும்:';

  @override
  String get typeToTest => 'உங்கள் விசைப்பலகையை சோதிக்க இங்கு தட்டச்சு செய்யவும்';

  @override
  String get detectLayout => 'விசைப்பலகையின் அமைப்பைக் கண்டறியவும்';

  @override
  String get pressOneKey => 'பின்வரும் விசைகளில் ஒன்றை அழுத்துங்கள்:';

  @override
  String get isKeyPresent => 'பின்வரும் விசை உங்களுடைய தட்டச்சு பலகையில் இருக்கிறதா?';

  @override
  String get configureSecureBootTitle => 'Configure Secure Boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Configure Secure Boot';

  @override
  String get chooseSecurityKey => 'Choose a security key';

  @override
  String get confirmSecurityKey => 'Confirm the security key';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Security key is required';

  @override
  String get secureBootSecurityKeysDontMatch => 'Security keys do not match';

  @override
  String get connectToInternetPageTitle => 'Connect to internet';

  @override
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'Use wired connection';

  @override
  String get noWiredConnection => 'No wired connection detected';

  @override
  String get wiredDisabled => 'Wired connection is turned off';

  @override
  String get wiredMustBeEnabled => 'To use ethernet on this computer, a wired connection must be enabled';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Connect to a Wi-Fi network';

  @override
  String get noInternet => 'I don\'t want to connect to the internet just now';

  @override
  String get wirelessNetworkingDisabled => 'Wireless networking disabled';

  @override
  String get noWifiDevicesDetected => 'No Wi-Fi devices detected';

  @override
  String get wifiMustBeEnabled => 'To use Wi-Fi on this computer, wireless networking must be enabled';

  @override
  String get enableWifi => 'Enable Wi-Fi';

  @override
  String get connectButtonText => 'Connect';

  @override
  String get updatesOtherSoftwarePageTitle => 'Updates and other software';

  @override
  String get updatesOtherSoftwarePageDescription => 'What apps would you like to install to start with?';

  @override
  String get normalInstallationTitle => 'இயல்பான நிறுவல்';

  @override
  String get normalInstallationSubtitle => 'Web browser, utilities, office software, games and media players.';

  @override
  String get minimalInstallationTitle => 'குறைந்தபட்ச  நிறுவல்';

  @override
  String get minimalInstallationSubtitle => 'Web browser and basic utilities.';

  @override
  String get otherOptions => 'Other options';

  @override
  String get installThirdPartyTitle => 'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Choose a security key';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of $RELEASE will not be encrypted.';
  }

  @override
  String get chooseSecurityKeyHint => 'Choose a security key';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirm the security key';

  @override
  String get chooseSecurityKeyRequired => 'A security key is required';

  @override
  String get chooseSecurityKeyMismatch => 'The security keys do not match';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'நிறுவல் வகை';

  @override
  String installationTypeOSDetected(Object os) {
    return 'This computer currently has $os on it. What would you like to do?';
  }

  @override
  String get installationTypeNoOSDetected => 'இந்த கணினியில் தற்போது எந்த இயங்கு தளங்களும் கண்டறியப்படவில்லை.என்ன செய்ய விரும்புகிறீர்கள்?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'மேம்பட்ட அம்சங்கள்...';

  @override
  String get installationTypeAdvancedTitle => 'மேம்பட்ட அம்சங்கள்';

  @override
  String get installationTypeNone => 'எதுவும் இல்லை';

  @override
  String get installationTypeNoneSelected => 'எதுவும் தேர்வாகவில்லை';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Use LVM with the new $RELEASE installation';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Encrypt the new $RELEASE installation for security';
  }

  @override
  String get installationTypeEncryptInfo => 'You will choose a security key in the next step.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selected';

  @override
  String installationTypeReinstall(Object os) {
    return 'Erase $os and reinstall';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Warning:</font> This will delete all your $os programs, documents, photos, music, and any other files.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Install $product alongside $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Something else';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Select drive:';

  @override
  String get selectGuidedStorageInfoLabel => 'The entire disk will be used:';

  @override
  String get selectGuidedStorageInstallNow => 'இப்போது நிறுவு';

  @override
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'Start Installing';

  @override
  String get diskHeadersDevice => 'Device';

  @override
  String get diskHeadersType => 'வகை';

  @override
  String get diskHeadersMountPoint => 'Mount point';

  @override
  String get diskHeadersSize => 'அளவு';

  @override
  String get diskHeadersUsed => 'பயன்படுத்தப்பட்ட அளவு';

  @override
  String get diskHeadersSystem => 'கணினி';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'காலி இடம்';

  @override
  String get newPartitionTable => 'புதிய பகிர்வு அட்டவணை';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'பகிர்வை உருவாக்கு';

  @override
  String get partitionEditTitle => 'பகிர்வைத் திருத்து';

  @override
  String get partitionSizeLabel => 'அளவு:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'எம்பி';

  @override
  String get partitionUnitGB => 'ஜிபி';

  @override
  String get partitionTypeLabel => 'Type for the new partition:';

  @override
  String get partitionTypePrimary => 'முதன்மை';

  @override
  String get partitionTypeLogical => 'Logical';

  @override
  String get partitionLocationLabel => 'புதிய பகிர்வுக்கான இடம்:';

  @override
  String get partitionLocationBeginning => 'இந்த இடத்தின் தொடக்கத்திலிருந்து';

  @override
  String get partitionLocationEnd => 'இந்த இடத்தின் முடிவில்';

  @override
  String get partitionFormatLabel => 'பயன்படுத்தப்பட்ட அளவு:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Ext2 file system';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT file system';

  @override
  String get partitionFormatFat12 => 'FAT12 file system';

  @override
  String get partitionFormatFat16 => 'FAT16 file system';

  @override
  String get partitionFormatFat32 => 'FAT32 file system';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 file system';

  @override
  String get partitionFormatVfat => 'VFAT file system';

  @override
  String get partitionFormatNtfs => 'NTFS file system';

  @override
  String get partitionFormatReiserFS => 'ReiserFS file system';

  @override
  String get partitionFormatZfsroot => 'ZFS root file system';

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Mount point:';

  @override
  String get whoAreYouPageTitle => 'நீங்கள் யார்?';

  @override
  String get whoAreYouPageAutoLogin => 'தானியங்கியாக உள்நுழையவும்';

  @override
  String get whoAreYouPageRequirePassword => 'உள்நுழைய எனது கடவுச்சொல் தேவை';

  @override
  String get whoAreYouPageRealNameLabel => 'உங்கள் பெயர்';

  @override
  String get whoAreYouPageRealNameRequired => 'ஒரு பெயர் தேவை';

  @override
  String get whoAreYouPageComputerNameLabel => 'உங்கள் கணினியின் பெயர்';

  @override
  String get whoAreYouPageComputerNameInfo => 'மற்ற கணினிகளுடன் பேசும்போது அது பயன்படுத்தும் பெயர்.';

  @override
  String get whoAreYouPageComputerNameRequired => 'கணினி பெயர் தேவை';

  @override
  String get whoAreYouPageInvalidComputerName => 'கணினியின் பெயர் தவறானது';

  @override
  String get whoAreYouPageUsernameLabel => 'பயனர்பெயரை தேர்ந்தெடுங்கள்';

  @override
  String get whoAreYouPageUsernameRequired => 'ஒரு பயனர்பெயர் தேவை';

  @override
  String get whoAreYouPageInvalidUsername => 'பயனர்பெயர் தவறானது';

  @override
  String get whoAreYouPagePasswordLabel => 'கடவுச்சொல்லை தேர்வு செய்யவும்';

  @override
  String get whoAreYouPagePasswordRequired => 'கடவுச்சொல் தேவை';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'உங்கள் கடவுச்சொல்லை உறுதிப்படுத்தவும்';

  @override
  String get whoAreYouPagePasswordMismatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String get writeChangesToDisk => 'Write changes to disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'The following partitions are going to be formatted:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} as $format used for $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} as $format';
  }

  @override
  String get chooseYourLookPageTitle => 'உங்கள் தோற்றத்தை தேர்வு செய்யவும்';

  @override
  String get chooseYourLookPageHeader => 'தோற்ற அமைப்புகளில் இதை எப்போது வேண்டுமானாலும் மாற்றலாம்.';

  @override
  String get chooseYourLookPageDarkSetting => 'கருமை';

  @override
  String get chooseYourLookPageLightSetting => 'Light';

  @override
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

  @override
  String get installationCompleteTitle => 'நிறுவல் முடிவுற்றது';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Shut Down';

  @override
  String get turnOffBitlockerTitle => 'Turn off BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';
}
