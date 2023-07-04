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
  String get changeButtonText => 'Canvia';

  @override
  String get restartButtonText => 'Reinicia';

  @override
  String get revertButtonText => 'Reverteix';

  @override
  String get quitButtonText => 'Surt de la instal·lació';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Trieu la vostra llengua:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Prova o instal·la';
  }

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
  String get rstTitle => 'Desactiva la RST.';

  @override
  String get rstHeader => 'Turn off RST to continue';

  @override
  String get rstDescription => 'Aquest ordinador utilitza Intel RST (Tecnologia d\'emmagatzematge ràpid). Heu de desactivar RST a Windows abans d\'instal·lar Ubuntu.';

  @override
  String rstInstructions(Object url) {
    return 'Per a obtenir instruccions, obriu aquesta pàgina en un telèfon o un altre dispositiu: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardTitle => 'Disposició de teclat';

  @override
  String get keyboardHeader => 'Trieu la vostra distribució de teclat:';

  @override
  String get keyboardTestHint => 'Escriviu aquí per provar el vostre teclat';

  @override
  String get keyboardDetectTitle => 'Detecta la disposició del teclat';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Premeu una de les tecles següents:';

  @override
  String get keyboardKeyPresentLabel => 'Teniu la tecla següent al vostre teclat?';

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
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by Ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'Use wired connection';

  @override
  String get noWiredConnection => 'No wired connection detected';

  @override
  String get wiredDisabled => 'Wired connection is turned off';

  @override
  String get wiredMustBeEnabled => 'Per poder fer servir Ethernet a aquest ordinador, la connexió cablejada ha d\'estar habilitada';

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
  String get allocateDiskSpace => 'Manual partitioning';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Mount points must start with \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Mount points cannot contain spaces';

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
  String get newPartitionTableConfirmationTitle => 'New empty partition';

  @override
  String get newPartitionTableConfirmationMessage => 'Creating a new partition table on an entire device will remove all of its current partitions. This operation can be undone if needed.';

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
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'Formata la partició';

  @override
  String get partitionMountPointLabel => 'Punt de muntatge:';

  @override
  String get identityPageTitle => 'Qui sou?';

  @override
  String get identityAutoLogin => 'Entra de manera automàtica';

  @override
  String get identityRequirePassword => 'Fes que calgui una contrasenya per a entrar';

  @override
  String get identityRealNameLabel => 'El vostre nom';

  @override
  String get identityRealNameRequired => 'Cal un nom';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'El nom de l\'ordinador';

  @override
  String get identityHostnameInfo => 'El nom que utilitza quan es comunica amb altres ordinadors.';

  @override
  String get identityHostnameRequired => 'Cal un nom per a l\'ordinador';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'El nom de l\'ordinador no és vàlid';

  @override
  String get identityUsernameLabel => 'Trieu un nom d\'usuari';

  @override
  String get identityUsernameRequired => 'Cal un nom d\'usuari';

  @override
  String get identityInvalidUsername => 'El nom d\'usuari no és vàlid';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'Aquest nom és massa llarg.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'Trieu una contrasenya';

  @override
  String get identityPasswordRequired => 'Cal una contrasenya';

  @override
  String get identityConfirmPasswordLabel => 'Confirmeu la contrasenya';

  @override
  String get identityPasswordMismatch => 'Les contrasenyes no coincideixen';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get writeChangesToDisk => 'Ready to install';

  @override
  String get writeChangesFallbackSerial => 'disc';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'S’aplicaran els canvis següents a les particions:';

  @override
  String writeChangesPartitionResized(Object sysname, Object oldsize, Object newsize) {
    return 'partition <b>$sysname</b> resized from <b>$oldsize</b> to <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object sysname, Object format, Object mount) {
    return 'partition <b>$sysname</b> formatted as <b>$format</b> used for <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object sysname, Object format) {
    return 'partition <b>$sysname</b> formatted as <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object sysname, Object mount) {
    return 'partition <b>$sysname</b> used for <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object sysname) {
    return 'partition <b>$sysname</b> created';
  }

  @override
  String get themePageTitle => 'Trieu l’aspecte';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Fosc';

  @override
  String get themeLight => 'Clar';

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
  String get bitlockerTitle => 'Desactiva el BitLocker';

  @override
  String get bitlockerHeader => 'Turn off BitLocker to continue';

  @override
  String bitlockerDescription(Object option) {
    return 'This computer uses Windows BitLocker encryption.\nYou need to use Windows to create free space or choose \'$option\' to continue.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'For instructions, scan the QR code on another device or visit: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart into Windows';

  @override
  String get restartIntoWindowsTitle => 'Restart into Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Are you sure you want to restart your computer? You will need to restart the $DISTRO installation later to finish installing $DISTRO.';
  }

  @override
  String get timezonePageTitle => 'On sou?';

  @override
  String get timezoneLocationLabel => 'Ubicació';

  @override
  String get timezoneTimezoneLabel => 'Fus horari';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Available:';

  @override
  String get installationSlidesIncluded => 'Included:';

  @override
  String get installationSlidesWelcomeTitle => 'Fast, free and full of new features';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'The latest version of $DISTRO makes computing easier than ever.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'All the applications you need';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and $DISTRO archive.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Develop with the best of open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Enhance your creativity';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'Great for gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Private and secure';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'All $DISTRO LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Power up your productivity';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Access for everyone';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Screen Reader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Language support';

  @override
  String get installationSlidesSupportTitle => 'Help & Support';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'The official $DISTRO documentation is available both online and via the Help icon in the dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'Helpful resources:';

  @override
  String get installationSlidesSupportDocumentation => 'Official documentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Enterprise-grade 24/7 support with Ubuntu Pro';

  @override
  String get copyingFiles => 'S’estan copiant els fitxers…';

  @override
  String get installingSystem => 'S’està instal·lant el sistema…';

  @override
  String get configuringSystem => 'S’està configurant el sistema…';

  @override
  String get installationFailed => 'Ha fallat la instal·lació';

  @override
  String get notEnoughDiskSpaceTitle => 'Not enough space';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';

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
