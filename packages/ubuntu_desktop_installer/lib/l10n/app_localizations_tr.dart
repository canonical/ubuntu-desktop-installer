


import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Masaüstü Yükleyicisi';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE Kur';
  }

  @override
  String get cancelButtonText => 'İptal Et';

  @override
  String get changeButtonText => 'Değiştir';

  @override
  String get okButtonText => 'Tamam';

  @override
  String get noButtonText => 'Hayır';

  @override
  String get restartButtonText => 'Yeniden Başlat';

  @override
  String get revertButtonText => 'Geri Al';

  @override
  String get yesButtonText => 'Evet';

  @override
  String get welcome => 'Hoş Geldiniz';

  @override
  String get tryOrInstallPageTitle => 'Dene veya kur';

  @override
  String get repairInstallation => 'Kurulumu Tamir Et';

  @override
  String get repairInstallationDescription => 'Tamir etme seçeneği, tüm yazılımlarınızı tekrardan yükleyecek ve belgeleriniz ile ayarlarınıza dokunmayacaktır.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE Dene';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Bilgisayarınızda hiç bir değişiklik yapmadan $RELEASE\'ü/u deneyebilirsiniz.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE\'ü/u Kur';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '$RELEASE\'ü/u halihazırda kullandığınız işletim sisteminizin yanına (ya da yerine) kur. Çok uzun sürmeyecektir.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '<a href=\"$url\">Sürüm notlarını</a> okumak isteyebilirsiniz.';
  }

  @override
  String get turnOffRST => 'RST\'yi kapat';

  @override
  String get turnOffRSTDescription => 'Bu bilgisayar Intel RST (Rapid Storage Technology) kullanmaktadır. Ubuntu\'yu yüklemeden önce Windows\'tan RST\'yi kapatmalısınız.';

  @override
  String instructionsForRST(Object url) {
    return 'Talimatlar için şu adresi bir telefondan veya başka bir cihazdan açın: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Klavye düzeni';

  @override
  String get chooseYourKeyboardLayout => 'Klavye düzeninizi seçin:';

  @override
  String get typeToTest => 'Klavyenizi test etmek için buraya yazın';

  @override
  String get detectLayout => 'Klavye Düzenini Tespit Et';

  @override
  String get pressOneKey => 'Lütfen aşağıdaki tuşlardan birine basın:';

  @override
  String get isKeyPresent => 'Aşağıdaki tuş klavyenizde bulunuyor mu?';

  @override
  String get configureSecureBootTitle => 'Güvenli Önyüklemeyi Ayarlayın';

  @override
  String get configureSecureBootDescription => 'Üçüncü parti sürücüleri yüklemeyi seçtiniz. Bu, Güvenli Önyüklemeyi kapatmanızı gerektirir. \nBunu yapabilmek için, şimdi bir güvenlik anahtarı seçmeli ve sistem yeniden başlatıldığında bu anahtarı girmelisiniz.';

  @override
  String get configureSecureBootOption => 'Güvenli Önyüklemeyi Ayarla';

  @override
  String get chooseSecurityKey => 'Güvenlik anahtarı seçin';

  @override
  String get confirmSecurityKey => 'Güvenlik anahtarını onaylayın';

  @override
  String get dontInstallDriverSoftwareNow => 'Şimdilik sürücü yazılımını yükleme';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Daha sonra Yazılımlar & Güncellemeler uygulamasından yükleyebilirsiniz.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Güvenlik anahtarı gereklidir';

  @override
  String get secureBootSecurityKeysDontMatch => 'Güvenlik anahtarları uyuşmamaktadır';

  @override
  String get connectToInternetPageTitle => 'İnternete bağlan';

  @override
  String get connectToInternetDescription => 'Bu bilgisayarı internete bağlamak, Ubuntu\'nun ihtiyacı olan ek yazılımları yüklemesine ve zaman diliminizi seçmenize yardımcı olur.\n\nEthernet kablosuyla bağlan veya bir Wi-Fi ağı seç';

  @override
  String get useWiredConnection => 'Kablolu bağlantı kullan';

  @override
  String get noWiredConnection => 'Kablolu bağlantı saptanamadı';

  @override
  String get wiredDisabled => 'Kablolu bağlantı kapalı';

  @override
  String get wiredMustBeEnabled => 'Bilgisayarda etherneti kullanabilrmek için kablolu bağlantı aktif hale getirilmelidir';

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
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Web browser, utilities, office software, games and media players.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

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
  String get installationTypeTitle => 'Installation type';

  @override
  String installationTypeOSDetected(Object os) {
    return 'This computer currently has $os on it. What would you like to do?';
  }

  @override
  String get installationTypeNoOSDetected => 'This computer currently has no detected operating systems. What would you like to do?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Advanced Features...';

  @override
  String get installationTypeAdvancedTitle => 'Advanced features';

  @override
  String get installationTypeNone => 'None';

  @override
  String get installationTypeNoneSelected => 'None selected';

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
  String get selectGuidedStorageInstallNow => 'Install Now';

  @override
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'Start Installing';

  @override
  String get diskHeadersDevice => 'Device';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Mount point';

  @override
  String get diskHeadersSize => 'Size';

  @override
  String get diskHeadersUsed => 'Used';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'free space';

  @override
  String get newPartitionTable => 'New partition table';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => 'Edit partition';

  @override
  String get partitionSizeLabel => 'Size:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Type for the new partition:';

  @override
  String get partitionTypePrimary => 'Primary';

  @override
  String get partitionTypeLogical => 'Logical';

  @override
  String get partitionLocationLabel => 'Location for the new partition:';

  @override
  String get partitionLocationBeginning => 'Beginning of this space';

  @override
  String get partitionLocationEnd => 'End of this space';

  @override
  String get partitionFormatLabel => 'Used as:';

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
  String get whoAreYouPageTitle => 'Who are you?';

  @override
  String get whoAreYouPageAutoLogin => 'Log in automatically';

  @override
  String get whoAreYouPageRequirePassword => 'Require my password to log in';

  @override
  String get whoAreYouPageRealNameLabel => 'Your name';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageComputerNameLabel => 'Your computer\'s name';

  @override
  String get whoAreYouPageComputerNameInfo => 'The name it uses when it talks to other computers.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A computer name is required';

  @override
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Pick a username';

  @override
  String get whoAreYouPageUsernameRequired => 'A username is required';

  @override
  String get whoAreYouPageInvalidUsername => 'The username is invalid';

  @override
  String get whoAreYouPagePasswordLabel => 'Choose a password';

  @override
  String get whoAreYouPagePasswordRequired => 'A password is required';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirm your password';

  @override
  String get whoAreYouPagePasswordMismatch => 'The passwords do not match';

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
  String get chooseYourLookPageTitle => 'Choose your look';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Dark';

  @override
  String get chooseYourLookPageLightSetting => 'Light';

  @override
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

  @override
  String get installationCompleteTitle => 'Installation complete';

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
