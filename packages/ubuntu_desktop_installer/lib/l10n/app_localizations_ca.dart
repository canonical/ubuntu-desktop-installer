


import 'app_localizations.dart';

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Instal·lador de l\'Ubuntu per a l\'escriptori';

  @override
  String windowTitle(Object RELEASE) {
    return 'Install $RELEASE';
  }

  @override
  String get cancelButtonText => 'Cancel·la';

  @override
  String get changeButtonText => 'Canvia';

  @override
  String get okButtonText => 'D\'acord';

  @override
  String get noButtonText => 'No';

  @override
  String get restartButtonText => 'Reinicia';

  @override
  String get revertButtonText => 'Reverteix';

  @override
  String get yesButtonText => 'Sí';

  @override
  String get welcome => 'Us donem la benvinguda';

  @override
  String get tryOrInstallPageTitle => 'Prova o instal·la';

  @override
  String get repairInstallation => 'Repair installation';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Try $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'You can try $RELEASE without making any changes to your computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Install $RELEASE';
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
  String get turnOffRST => 'Desactiva la RST.';

  @override
  String get turnOffRSTDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Disposició de teclat';

  @override
  String get chooseYourKeyboardLayout => 'Trieu la vostra distribució de teclat:';

  @override
  String get typeToTest => 'Escriviu aquí per provar el vostre teclat';

  @override
  String get detectLayout => 'Detecta la disposició del teclat';

  @override
  String get pressOneKey => 'Premeu una de les tecles següents:';

  @override
  String get isKeyPresent => 'Teniu la tecla següent al vostre teclat?';

  @override
  String get configureSecureBootTitle => 'Configure Secure Boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Configure Secure Boot';

  @override
  String get chooseSecurityKey => 'Trieu una clau de seguretat';

  @override
  String get confirmSecurityKey => 'Confirmeu la clau de seguretat';

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
  String get updatesOtherSoftwarePageTitle => 'Actualitzacions i altre programari';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quines aplicacions us agradaria instal·lar per començar?';

  @override
  String get normalInstallationTitle => 'Instal·lació normal';

  @override
  String get normalInstallationSubtitle => 'Web browser, utilities, office software, games and media players.';

  @override
  String get minimalInstallationTitle => 'Instal·lació mínima';

  @override
  String get minimalInstallationSubtitle => 'Navegador web i utilitats bàsiques.';

  @override
  String get otherOptions => 'Altres opcions';

  @override
  String get installThirdPartyTitle => 'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Trieu una clau de seguretat';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'El xifratge de discs protegeix els fitxers en cas que perdeu l\'ordinador. Us caldrà escriure una clau de seguretat cada cop que s\'iniciï l\'ordinador.\n\nQualssevol fitxers que no siguin dins el sistema $RELEASE no es xifraran.';
  }

  @override
  String get chooseSecurityKeyHint => 'Trieu una clau de seguretat';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirmeu la clau de seguretat';

  @override
  String get chooseSecurityKeyRequired => 'Cal una clau de seguretat';

  @override
  String get chooseSecurityKeyMismatch => 'Les claus de seguretat no coincideixen';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Tipus d\'instal·lació';

  @override
  String installationTypeOSDetected(Object os) {
    return 'L\'ordinador actualment duu el sistema $os. Què voleu fer?';
  }

  @override
  String get installationTypeNoOSDetected => 'Aquest ordinador no duu cap sistema operatiu que s\'hagi detectat. Què voleu fer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Característiques avançades…';

  @override
  String get installationTypeAdvancedTitle => 'Característiques avançades';

  @override
  String get installationTypeNone => 'Cap';

  @override
  String get installationTypeNoneSelected => 'Cap seleccionat';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Use LVM with the new $RELEASE installation';
  }

  @override
  String get installationTypeLVMSelected => 'Seleccionat LVM';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Encrypt the new $RELEASE installation for security';
  }

  @override
  String get installationTypeEncryptInfo => 'En el pas següent triareu la clau de seguretat.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'Seleccionat ZFS';

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
  String get installationTypeAlongsideInfo => 'Els documents, la música i la resta de fitxers personals es conservaran. Podreu triar quin sistema operatiu voleu utilitzar cada cop que engegueu l\'ordinador.';

  @override
  String get installationTypeManual => 'Alguna altra cosa';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Seleccioneu la unitat:';

  @override
  String get selectGuidedStorageInfoLabel => 'S\'utilitzarà el disc sencer:';

  @override
  String get selectGuidedStorageInstallNow => 'Instal·la ara';

  @override
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'Comença a instal·lar';

  @override
  String get diskHeadersDevice => 'Dispositiu';

  @override
  String get diskHeadersType => 'Tipus';

  @override
  String get diskHeadersMountPoint => 'Punt de muntatge';

  @override
  String get diskHeadersSize => 'Mida';

  @override
  String get diskHeadersUsed => 'En ús';

  @override
  String get diskHeadersSystem => 'Sistema';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'espai lliure';

  @override
  String get newPartitionTable => 'Taula de particions nova';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Crea una partició';

  @override
  String get partitionEditTitle => 'Edita la partició';

  @override
  String get partitionSizeLabel => 'Mida:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Tipus de partició nova:';

  @override
  String get partitionTypePrimary => 'Primària';

  @override
  String get partitionTypeLogical => 'Lògica';

  @override
  String get partitionLocationLabel => 'Ubicació de la partició nova:';

  @override
  String get partitionLocationBeginning => 'Començament d\'aquest espai';

  @override
  String get partitionLocationEnd => 'Final d\'aquest espai';

  @override
  String get partitionFormatLabel => 'Used as:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Sistema de fitxers Ext2';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'Sistema de fitxers FAT';

  @override
  String get partitionFormatFat12 => 'Sistema de fitxers FAT12';

  @override
  String get partitionFormatFat16 => 'Sistema de fitxers FAT16';

  @override
  String get partitionFormatFat32 => 'Sistema de fitxers FAT32';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'Sistema de fitxers ISO 9660';

  @override
  String get partitionFormatVfat => 'Sistema de fitxers VFAT';

  @override
  String get partitionFormatNtfs => 'Sistema de fitxers NTFS';

  @override
  String get partitionFormatReiserFS => 'Sistema de fitxers ReiserFS';

  @override
  String get partitionFormatZfsroot => 'ZFS root file system';

  @override
  String get partitionErase => 'Formata la partició';

  @override
  String get partitionMountPointLabel => 'Punt de muntatge:';

  @override
  String get whoAreYouPageTitle => 'Qui sou?';

  @override
  String get whoAreYouPageAutoLogin => 'Entra de manera automàtica';

  @override
  String get whoAreYouPageRequirePassword => 'Fes que calgui una contrasenya per a entrar';

  @override
  String get whoAreYouPageRealNameLabel => 'El vostre nom';

  @override
  String get whoAreYouPageRealNameRequired => 'Cal un nom';

  @override
  String get whoAreYouPageComputerNameLabel => 'El nom de l\'ordinador';

  @override
  String get whoAreYouPageComputerNameInfo => 'El nom que utilitza quan es comunica amb altres ordinadors.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Cal un nom per a l\'ordinador';

  @override
  String get whoAreYouPageInvalidComputerName => 'El nom de l\'ordinador no és vàlid';

  @override
  String get whoAreYouPageUsernameLabel => 'Trieu un nom d\'usuari';

  @override
  String get whoAreYouPageUsernameRequired => 'Cal un nom d\'usuari';

  @override
  String get whoAreYouPageInvalidUsername => 'El nom d\'usuari no és vàlid';

  @override
  String get whoAreYouPagePasswordLabel => 'Trieu una contrasenya';

  @override
  String get whoAreYouPagePasswordRequired => 'Cal una contrasenya';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirmeu la contrasenya';

  @override
  String get whoAreYouPagePasswordMismatch => 'Les contrasenyes no coincideixen';

  @override
  String get writeChangesToDisk => 'Write changes to disk';

  @override
  String get writeChangesFallbackSerial => 'disc';

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
  String get installationCompleteTitle => 'S\'ha completat la instal·lació';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Atura';

  @override
  String get turnOffBitlockerTitle => 'Desactiva el BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';
}
