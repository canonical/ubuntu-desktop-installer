import 'app_localizations.dart';

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Installer di Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installa $RELEASE';
  }

  @override
  String get cancelButtonText => 'Annulla';

  @override
  String get changeButtonText => 'Modifica';

  @override
  String get okButtonText => 'Ok';

  @override
  String get noButtonText => 'No';

  @override
  String get restartButtonText => 'Riavvia';

  @override
  String get revertButtonText => 'Ripristina';

  @override
  String get yesButtonText => 'Sì';

  @override
  String get quitButtonText => 'Quit installation';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Scegli la tua lingua:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Prova o installa';
  }

  @override
  String get repairInstallation => 'Ripara installazione';

  @override
  String get repairInstallationDescription => 'La riparazione reinstallerá tutti i programmi senza toccare alcun documento o impostazione.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Prova $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Puoi provare $RELEASE senza apportare alcuna modifica al tuo computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installa $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installa $RELEASE accanto (o al posto di) al tuo sistema operativo attuale. Questo non dovrebbe durare molto.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Forse vorresti leggere le <a href=\"$url\">informazioni di rilascio</a>.';
  }

  @override
  String get turnOffRST => 'Disattiva RST';

  @override
  String get turnOffRSTTitle => 'Turn off RST to continue';

  @override
  String get turnOffRSTDescription => 'Questo computer usa Intel RST (Rapid Storage Technology). Devi disattivare RST da Windows prima di poter installare Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Per istruzioni, apri questa pagina da un telefono o un altro dispositivo: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Disposizione della tastiera';

  @override
  String get chooseYourKeyboardLayout => 'Scegliere la disposizione della tastiera:';

  @override
  String get typeToTest => 'Digitare qui per provare la tastiera';

  @override
  String get detectLayout => 'Rileva disposizione tastiera';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Prego premere uno dei seguenti tasti:';

  @override
  String get isKeyPresent => 'Il seguente tasto è presente sulla propria tastiera?';

  @override
  String get configureSecureBootTitle => 'Configura Avvio Sicuro';

  @override
  String get configureSecureBootDescription => 'Hai scelto di installare driver software di terze parti. Questo richiede lo spegnimento dell\'Avvio Sicuro.\nPer farlo, devi scegliere una chiave di sicurezza, e digitarla al riavvio del sistema.';

  @override
  String get configureSecureBootOption => 'Configura Avvio Sicuro';

  @override
  String get chooseSecurityKey => 'Scegli una chiave di sicurezza';

  @override
  String get confirmSecurityKey => 'Conferma la chiave di sicurezza';

  @override
  String get dontInstallDriverSoftwareNow => 'Non installare il software dei driver per il momento';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'È richiesta la chiave di sicurezza';

  @override
  String get secureBootSecurityKeysDontMatch => 'Le chiavi di sicurezza non corrispondono';

  @override
  String get showSecurityKey => 'Mostra chiave di sicurezza';

  @override
  String get connectToInternetPageTitle => 'Connetti alla rete';

  @override
  String get connectToInternetDescription => 'Connettere questo computer alla rete permetterà a Ubuntu l\'installazione di software aggiuntivo necessario e a scegliere il tuo fuso orario.\n\nConnetti il computer via cavo Ethernet, o scegli una Rete Wi-Fi';

  @override
  String get useWiredConnection => 'Usa connessione cablata';

  @override
  String get noWiredConnection => 'Nessuna connessione cablata rilevata';

  @override
  String get wiredDisabled => 'La connessione cablata è disattivata';

  @override
  String get wiredMustBeEnabled => 'Per usufruire della connessione Ethernet in questo computer, una connessione cablata deve essere attiva';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Connetti a una rete Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Connetti a una rete Wi-Fi nascosta';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nome della Rete';

  @override
  String get hiddenWifiNetworkNameRequired => 'È richiesto il nome della rete';

  @override
  String get noInternet => 'Non voglio connettermi alla rete in questo momento';

  @override
  String get wirelessNetworkingDisabled => 'Connessione senza fili disattivata';

  @override
  String get noWifiDevicesDetected => 'Nessun dispositivo Wi-Fi rilevato';

  @override
  String get wifiMustBeEnabled => 'Per usufruire della Wi-Fi in questo computer, la rete wireless deve essere abilitata';

  @override
  String get enableWifi => 'Abilita Wi-Fi';

  @override
  String get connectButtonText => 'Connetti';

  @override
  String get updatesOtherSoftwarePageTitle => 'Aggiornamenti e altro software';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quali applicazioni installare?';

  @override
  String get normalInstallationTitle => 'Installazione normale';

  @override
  String get normalInstallationSubtitle => 'Browser web, utilità, programmi di ufficio, giochi e lettori multimediali.';

  @override
  String get minimalInstallationTitle => 'Installazione minima';

  @override
  String get minimalInstallationSubtitle => 'Browser web e strumenti di base.';

  @override
  String get otherOptions => 'Altre opzioni';

  @override
  String get installThirdPartyTitle => 'Installa software di terze parti per hardware grafico e Wi-Fi, e altri formati multimediali';

  @override
  String get installThirdPartySubtitle => 'Questo software è soggetto ai termini di licenza inclusi nella documentazione. Alcuni sono proprietari.';

  @override
  String get installDriversTitle => 'Install third-party software for graphics and Wi-Fi hardware';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'Download and install support for additional media formats';

  @override
  String get installCodecsSubtitle => 'Questo software è soggetto ai termini di licenza inclusi nella documentazione. Alcuni sono proprietari.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Attenzione</font>: Il computer non è connesso a una fonte di alimentazione.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'Scegli una chiave di sicurezza';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'La crittografia del disco protegge i tuoi file in caso di perdita del computer. Ad ogni avvio del computer sarà necessario inserire la chiave di sicurezza.\n\nQualsiasi file esterno a $RELEASE non verrà criptato.';
  }

  @override
  String get chooseSecurityKeyHint => 'Scegli una chiave di sicurezza';

  @override
  String get chooseSecurityKeyConfirmHint => 'Conferma la chiave di sicurezza';

  @override
  String get chooseSecurityKeyRequired => 'A security key is required';

  @override
  String get chooseSecurityKeyMismatch => 'The security keys do not match';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Tipo d\'installazione';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Questo computer ha installato $os. Come procedere?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Questo computer ha installato $os1 e $os2. Come procedere?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Questo computer ha installato più di un sistema operativo. Come procedere?';

  @override
  String get installationTypeNoOSDetected => 'Non è stato trovato alcun sistema operativo installato su questo computer. Come procedere?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Cancella il disco e installa $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Caratteristiche avanzate…';

  @override
  String get installationTypeAdvancedTitle => 'Caratteristiche avanzate';

  @override
  String get installationTypeNone => 'Nessuno';

  @override
  String get installationTypeNoneSelected => 'Nessuna selezione';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Use LVM with the new $RELEASE installation';
  }

  @override
  String get installationTypeLVMSelected => 'Selezionato LVM';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Encrypt the new $RELEASE installation for security';
  }

  @override
  String get installationTypeEncryptInfo => 'You will choose a security key in the next step.';

  @override
  String get installationTypeZFS => 'SPERIMENTALE: Cancella il disco e usa ZFS';

  @override
  String get installationTypeZFSSelected => 'Selezionato ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Cancella $os e reinstalla';
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
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Altro';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Seleziona il disco:';

  @override
  String get selectGuidedStorageInfoLabel => 'Verrà utilizzato l\'intero disco:';

  @override
  String get selectGuidedStorageInstallNow => 'Installa ora';

  @override
  String get installAlongsideSpaceDivider => 'Suddividere lo spazio sul disco trascinando la barra verticale sottostante:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'File';

  @override
  String get installAlongsidePartition => 'Partizione:';

  @override
  String get installAlongsideSize => 'Dimensione:';

  @override
  String get installAlongsideAvailable => 'Available:';

  @override
  String get allocateDiskSpace => 'Manual partitioning';

  @override
  String get allocateDiskSpaceInvalidMountPoint => 'Invalid mount point';

  @override
  String get startInstallingButtonText => 'Installa';

  @override
  String get diskHeadersDevice => 'Device';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Punto di mount';

  @override
  String get diskHeadersSize => 'Size';

  @override
  String get diskHeadersUsed => 'Used';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'Free space';

  @override
  String get newPartitionTable => 'New partition table';

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
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => 'Edit partition';

  @override
  String get partitionSizeLabel => 'Size:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

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
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Mount point:';

  @override
  String get whoAreYouPageTitle => 'Informazioni personali';

  @override
  String get whoAreYouPageAutoLogin => 'Accedere automaticamente';

  @override
  String get whoAreYouPageRequirePassword => 'Require my password to log in';

  @override
  String get whoAreYouPageRealNameLabel => 'Your name';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageRealNameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Il nome del computer';

  @override
  String get whoAreYouPageComputerNameInfo => 'The name it uses when it talks to other computers.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A computer name is required';

  @override
  String get whoAreYouPageComputerNameTooLong => 'That computer name is too long.';

  @override
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Scegli uno username';

  @override
  String get whoAreYouPageUsernameRequired => 'A username is required';

  @override
  String get whoAreYouPageInvalidUsername => 'The username is invalid';

  @override
  String get whoAreYouPageUsernameInUse => 'That user name already exists.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get whoAreYouPageUsernameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get whoAreYouPagePasswordLabel => 'Scegli una password';

  @override
  String get whoAreYouPagePasswordRequired => 'A password is required';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Conferma la password';

  @override
  String get whoAreYouPagePasswordMismatch => 'The passwords do not match';

  @override
  String get whoAreYouPagePasswordShow => 'Mostra';

  @override
  String get whoAreYouPagePasswordHide => 'Nascondi';

  @override
  String get writeChangesToDisk => 'Ready to install';

  @override
  String get writeChangesFallbackSerial => 'disk';

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
  String get writeChangesPartitionsHeader => 'The following partition changes are going to be applied:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition <b>$disk$partition</b> resized from <b>$oldsize</b> to <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition <b>$disk$partition</b> formatted as <b>$format</b> used for <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition <b>$disk$partition</b> formatted as <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition <b>$disk$partition</b> used for <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition <b>$disk$partition</b> created';
  }

  @override
  String get chooseYourLookPageTitle => 'Scegli il aspetto';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Dark';

  @override
  String get chooseYourLookPageLightSetting => 'Light';

  @override
  String get installationCompleteTitle => 'Installation complete';

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
  String get shutdown => 'Shut Down';

  @override
  String get restartNow => 'Restart now';

  @override
  String get continueTesting => 'Continue testing';

  @override
  String get turnOffBitlockerTitle => 'BitLocker is enabled';

  @override
  String get turnOffBitlockerHeadline => 'Turn off BitLocker to continue';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'This computer uses Windows BitLocker encryption.\nYou need to use Windows to create free space or choose \'$option\' to continue.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
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
  String get whereAreYouPageTitle => 'Select your timezone';

  @override
  String get whereAreYouLocationLabel => 'Location';

  @override
  String get whereAreYouTimezoneLabel => 'Fuso orario';

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
  String get copyingFiles => 'Copia dei file…';

  @override
  String get installingSystem => 'Installazione del sistema…';

  @override
  String get configuringSystem => 'Configurazione del sistema…';

  @override
  String get installationFailed => 'Installazione non riuscita';

  @override
  String get notEnoughDiskSpaceTitle => 'Spiacenti';

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
