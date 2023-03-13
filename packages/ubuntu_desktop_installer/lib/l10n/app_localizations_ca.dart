import 'app_localizations.dart';

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Instal·lador de l\'Ubuntu per a l\'escriptori';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instal·lació del sistema $RELEASE';
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
  String get quitButtonText => 'Surt de la instal·lació';

  @override
  String get welcome => 'Us donem la benvinguda';

  @override
  String get welcomeHeader => 'Trieu la vostra llengua:';

  @override
  String get tryOrInstallPageTitle => 'Prova o instal·la';

  @override
  String get repairInstallation => 'Repara la instal·lació';

  @override
  String get repairInstallationDescription => 'La reparació reinstal·larà tot el programari instal·lat sense tocar els documents ni la configuració.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Prova el sistema $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Podeu provar $RELEASE sense fer cap canvi al vostre ordinador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instal·la el sistema $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instal·lar $RELEASE al costat (o en lloc de) del vostre sistema operatiu actual. Això no hauria de trigar massa.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'És possible que vulgueu llegir la <a href=\"$url\"> nota de llançament</a>.';
  }

  @override
  String get turnOffRST => 'Desactiva la RST.';

  @override
  String get turnOffRSTDescription => 'Aquest ordinador utilitza Intel RST (Tecnologia d\'emmagatzematge ràpid). Heu de desactivar RST a Windows abans d\'instal·lar Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Per a obtenir instruccions, obriu aquesta pàgina en un telèfon o un altre dispositiu: <a href=\"https://$url\">$url</a>';
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
  String get configureSecureBootTitle => 'Configura l\'arrencada segura';

  @override
  String get configureSecureBootDescription => 'Has triat per instal·lar programari de control·ladors de tercers. Això requereix desactivar Arrencada Segura,\nPer fer això, has de escogir una clau de seguretat ara i introduir-la després de reiniciar el sistema.';

  @override
  String get configureSecureBootOption => 'Configurar Arrencada Segura';

  @override
  String get chooseSecurityKey => 'Trieu una clau de seguretat';

  @override
  String get confirmSecurityKey => 'Confirmeu la clau de seguretat';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Es requereix la clau de seguretat';

  @override
  String get secureBootSecurityKeysDontMatch => 'Les claus de seguretat no coincideixen';

  @override
  String get showSecurityKey => 'Show security key';

  @override
  String get connectToInternetPageTitle => 'Connecta a internet';

  @override
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'Use wired connection';

  @override
  String get noWiredConnection => 'No wired connection detected';

  @override
  String get wiredDisabled => 'Wired connection is turned off';

  @override
  String get wiredMustBeEnabled => 'Per poder fer servir ethernet a aquest ordinador, la connexió cablejada ha d\'estar habilitada';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Connectar a una xarxa Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Connecta a una xarxa Wi-Fi oculta';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nom a la xarxa';

  @override
  String get hiddenWifiNetworkNameRequired => 'Cal un nom de xarxa';

  @override
  String get noInternet => 'Ara mateix no vull connectar-me a Internet';

  @override
  String get wirelessNetworkingDisabled => 'Xarxa sense fils deshabilitada';

  @override
  String get noWifiDevicesDetected => 'No Wi-Fi devices detected';

  @override
  String get wifiMustBeEnabled => 'To use Wi-Fi on this computer, wireless networking must be enabled';

  @override
  String get enableWifi => 'Enable Wi-Fi';

  @override
  String get connectButtonText => 'Connecta';

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
  String get installDriversTitle => 'Install third-party software for graphics and Wi-Fi hardware';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'Download and install support for additional media formats';

  @override
  String get installCodecsSubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> The computer is not plugged in to a power source.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

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
    return '<font color=\"$color\">Warning:</font> If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Tipus d\'instal·lació';

  @override
  String installationTypeOSDetected(Object os) {
    return 'L’ordinador actualment duu el sistema $os. Què voleu fer?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'L’ordinador actualment duu els sistemes $os1 i $os2. Què voleu fer?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Aquest ordinador duu diversos sistemes operatius. Què voleu fer?';

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
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

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
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Install $product alongside $os1 and $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Install $product alongside them';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Install $product alongside other partitions';
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
  String get installAlongsideSpaceDivider => 'Reserveu espai de disc arrossegant el divisor de més avall:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'Fitxers';

  @override
  String get installAlongsidePartition => 'Partició:';

  @override
  String get installAlongsideSize => 'Mida:';

  @override
  String get installAlongsideAvailable => 'Disponible:';

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
  String get freeDiskSpace => 'Espai lliure';

  @override
  String get newPartitionTable => 'Taula de particions nova';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on it, all its current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'Limit reached';

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
  String get partitionFormatNone => 'Leave unformatted';

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
  String get whoAreYouPageRealNameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'El nom de l\'ordinador';

  @override
  String get whoAreYouPageComputerNameInfo => 'El nom que utilitza quan es comunica amb altres ordinadors.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Cal un nom per a l\'ordinador';

  @override
  String get whoAreYouPageComputerNameTooLong => 'That computer name is too long.';

  @override
  String get whoAreYouPageInvalidComputerName => 'El nom de l\'ordinador no és vàlid';

  @override
  String get whoAreYouPageUsernameLabel => 'Trieu un nom d\'usuari';

  @override
  String get whoAreYouPageUsernameRequired => 'Cal un nom d\'usuari';

  @override
  String get whoAreYouPageInvalidUsername => 'El nom d\'usuari no és vàlid';

  @override
  String get whoAreYouPageUsernameInUse => 'That user name already exists.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Aquest nom és massa llarg.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get whoAreYouPagePasswordLabel => 'Trieu una contrasenya';

  @override
  String get whoAreYouPagePasswordRequired => 'Cal una contrasenya';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirmeu la contrasenya';

  @override
  String get whoAreYouPagePasswordMismatch => 'Les contrasenyes no coincideixen';

  @override
  String get whoAreYouPagePasswordShow => 'Show';

  @override
  String get whoAreYouPagePasswordHide => 'Hide';

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
  String get writeChangesPartitionsHeader => 'S’aplicaran els canvis següents a les particions:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition #$disk$partition resized from $oldsize to $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk$partition formatted as $format used for $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition #$disk$partition formatted as $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition #$disk$partition used for $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition #$disk$partition created';
  }

  @override
  String get chooseYourLookPageTitle => 'Trieu l’aspecte';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Fosc';

  @override
  String get chooseYourLookPageLightSetting => 'Clar';

  @override
  String get installationCompleteTitle => 'S\'ha completat la instal·lació';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'You can continue testing $RELEASE now, but until you restart the computer, any changes you make or documents you save will not be preserved.';
  }

  @override
  String get shutdown => 'Atura';

  @override
  String get restartNow => 'Restart now';

  @override
  String get continueTesting => 'Continue testing';

  @override
  String get turnOffBitlockerTitle => 'Desactiva el BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart into Windows';

  @override
  String get whereAreYouPageTitle => 'On sou?';

  @override
  String get whereAreYouLocationLabel => 'Ubicació';

  @override
  String get whereAreYouTimezoneLabel => 'Fus horari';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Fast and full of new features, the latest version of $RELEASE makes computing easier than ever. Here are just a few cool new things to look out for...';
  }

  @override
  String get softwareSlideTitle => 'Find even more software';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Say goodbye to searching the web for new software. With access to the Snap Store and the $RELEASE software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.';
  }

  @override
  String get musicSlideTitle => 'Take your music with you';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
  }

  @override
  String get musicSlideRhythmbox => 'Reproductor de música Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Have fun with your photos';

  @override
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Gestor de fotos Shotwell';

  @override
  String get photoSlideGimp => 'Editor d’imatges GIMP';

  @override
  String get photoSlideShotcut => 'Editor de vídeos Shotcut';

  @override
  String get webSlideTitle => 'Aprofiteu al màxim la web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'Navegador web Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Everything you need for the office';

  @override
  String get officeSlideDescription => 'LibreOffice is a libre office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Accés per a tothom';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colors and text size, $RELEASE makes computing easy — whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Opcions de personalització';

  @override
  String get accessSlideAppearance => 'Aspecte';

  @override
  String get accessSlideAssistiveTechnologies => 'Tecnologies d’assistència';

  @override
  String get accessSlideLanguageSupport => 'Language support';

  @override
  String get supportSlideTitle => 'Ajuda i assistència';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common aspects of $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Programari inclòs';

  @override
  String get availableSoftware => 'Programari disponible';

  @override
  String get supportedSoftware => 'Programari admès';

  @override
  String get copyingFiles => 'S’estan copiant els fitxers…';

  @override
  String get installingSystem => 'S’està instal·lant el sistema…';

  @override
  String get configuringSystem => 'S’està configurant el sistema…';

  @override
  String get installationFailed => 'Ha fallat la instal·lació';

  @override
  String get notEnoughDiskSpaceTitle => 'Sorry';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'You need at least $SIZE disk space to install $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'This computer has only $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'The biggest disk on this computer is only $SIZE.';
  }

  @override
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test domain connectivity';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domain not found';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';

  @override
  String get activeDirectoryErrorTitle => 'Error configuring connection to Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';
}
