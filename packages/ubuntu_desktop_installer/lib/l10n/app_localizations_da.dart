import 'app_localizations.dart';

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Ubuntu-Desktop-Installationsprogram';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE installer';
  }

  @override
  String get cancelButtonText => 'Afbryde';

  @override
  String get changeButtonText => 'Ændre';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Nej';

  @override
  String get restartButtonText => 'Genstart';

  @override
  String get revertButtonText => 'Nulstil til standard';

  @override
  String get yesButtonText => 'Ja';

  @override
  String get quitButtonText => 'Afslut installationen';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Vælg dit sprog:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Prøv eller installer';
  }

  @override
  String get repairInstallation => 'reparer installation';

  @override
  String get repairInstallationDescription => 'Reparation geninstallerer al installeret software uden at røre ved dokumenter eller indstillinger.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE prøv';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Du kan prøve $RELEASE uden at foretage ændringer på din computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE installerer';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installer $RELEASE ved siden af (eller i stedet for) dit nuværende operativsystem. Dette bør ikke tage for lang tid.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Du vil måske læse <a href=\"$url\">udgivelsesbemærkningerne</a>.';
  }

  @override
  String get turnOffRST => 'Sluk for RST';

  @override
  String get turnOffRSTTitle => 'Turn off RST to continue';

  @override
  String get turnOffRSTDescription => 'Denne lommeregner bruger Intel RST (Rapid Storage Technology). Før du installerer Ubuntu, skal RST være slået fra i Windows.';

  @override
  String instructionsForRST(Object url) {
    return 'For instruktioner skal du åbne denne side på en smartphone eller anden enhed: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'tastatur layout';

  @override
  String get chooseYourKeyboardLayout => 'Vælg dit tastatur layout:';

  @override
  String get typeToTest => 'Skriv noget her for at teste dit tastatur layout';

  @override
  String get detectLayout => 'Genkend tastaturlayout';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Tryk venligst på en af følgende taster:';

  @override
  String get isKeyPresent => 'Findes følgende tast på dit tastatur?';

  @override
  String get configureSecureBootTitle => 'Konfigurer sikker opstart';

  @override
  String get configureSecureBootDescription => 'Du har valgt at installere tredjeparts driversoftware. For at gøre dette skal Secure Boot være slået fra.\nFor at gøre dette skal du nu vælge en sikkerhedsnøgle og indtaste den, når du genstarter systemet.';

  @override
  String get configureSecureBootOption => 'Konfigurer sikker opstart';

  @override
  String get chooseSecurityKey => 'Vælg sikkerhedsnøgle';

  @override
  String get confirmSecurityKey => 'Bekræft sikkerhedsnøgle';

  @override
  String get dontInstallDriverSoftwareNow => 'Installer ikke driversoftwaren lige nu';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Du kan installere dem senere fra Software og opdateringer.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Der kræves en sikkerhedsnøgle';

  @override
  String get secureBootSecurityKeysDontMatch => 'Sikkerhedsnøglerne stemmer ikke overens';

  @override
  String get showSecurityKey => 'Vis sikkerhedsnøgle';

  @override
  String get connectToInternetPageTitle => 'Forbind til internettet';

  @override
  String get connectToInternetDescription => 'Tilslutning af computeren til internettet hjælper Ubuntu med at installere yderligere software og vælge tidszonen.\n\nTilslut via Ethernet-kabel eller vælg et WiFi-netværk';

  @override
  String get useWiredConnection => 'Brug kablet forbindelse';

  @override
  String get noWiredConnection => 'Ingen kablet forbindelse fundet';

  @override
  String get wiredDisabled => 'Kablet forbindelse er slået fra';

  @override
  String get wiredMustBeEnabled => 'En kablet forbindelse skal være aktiveret for at bruge Ethernet på denne computer';

  @override
  String get enableWired => 'Aktiver kablet Ethernet';

  @override
  String get selectWifiNetwork => 'Opret forbindelse til et WiFi-netværk';

  @override
  String get hiddenWifiNetwork => 'Opret forbindelse til et skjult WiFi-netværk';

  @override
  String get hiddenWifiNetworkNameLabel => 'Netværksnavn';

  @override
  String get hiddenWifiNetworkNameRequired => 'Netværksnavnet er påkrævet';

  @override
  String get noInternet => 'Jeg vil ikke oprette forbindelse til internettet lige nu';

  @override
  String get wirelessNetworkingDisabled => 'Trådløst netværk deaktiveret';

  @override
  String get noWifiDevicesDetected => 'Ingen WiFi-enheder fundet';

  @override
  String get wifiMustBeEnabled => 'For at bruge WiFi på denne computer skal det trådløse netværk være aktiveret';

  @override
  String get enableWifi => 'Skriver WiFi';

  @override
  String get connectButtonText => 'Forbinde';

  @override
  String get updatesOtherSoftwarePageTitle => 'Opdateringer og anden software';

  @override
  String get updatesOtherSoftwarePageDescription => 'Hvilke applikationer vil du først installere?';

  @override
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Webbrowsere, hjælpeprogrammer, kontorapplikationer, spil og medieafspillere.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

  @override
  String get minimalInstallationSubtitle => 'Webbrowser og grundlæggende hjælpeprogrammer.';

  @override
  String get otherOptions => 'Flere muligheder';

  @override
  String get installThirdPartyTitle => 'Installer tredjepartssoftware til grafik og trådløs hardware og yderligere medieformater';

  @override
  String get installThirdPartySubtitle => 'Denne software er underlagt de licensvilkår, der er inkluderet i dokumentationen. Noget af det er proprietært.';

  @override
  String get installDriversTitle => 'Installer tredjepartssoftware til grafik og trådløs hardware';

  @override
  String get installDriversSubtitle => 'Disse chauffører er underlagt de licensvilkår, der er inkluderet i deres dokumentation. De er proprietære.';

  @override
  String get installCodecsTitle => 'Download og installer understøttelse af yderligere medieformater';

  @override
  String get installCodecsSubtitle => 'Denne software er underlagt licensbetingelserne i dens dokumentation. Nogle er proprietære.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Advarsel:</font> Computeren er ikke tilsluttet en strømkilde.';
  }

  @override
  String get offlineWarning => 'Du er i øjeblikket offline';

  @override
  String get chooseSecurityKeyTitle => 'Vælg sikkerhedsnøgle';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Fuld diskkryptering beskytter dine filer, hvis du mister din computer. Hver gang du starter computeren, skal du indtaste en sikkerhedsnøgle.\n\nAlle filer uden for $RELEASE bliver ikke krypteret.';
  }

  @override
  String get chooseSecurityKeyHint => 'Vælg en sikkerhedsnøgle';

  @override
  String get chooseSecurityKeyConfirmHint => 'Bekræft sikkerhedsnøglen';

  @override
  String get chooseSecurityKeyRequired => 'Der kræves en sikkerhedsnøgle';

  @override
  String get chooseSecurityKeyMismatch => 'Sikkerhedsnøglerne stemmer ikke overens';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Advarsel:</font> Hvis du mister denne sikkerhedsnøgle, vil alle data gå tabt. Hvis det er nødvendigt, kan du skrive nøglen ned og opbevare den et sikkert sted.';
  }

  @override
  String get installationTypeTitle => 'installationstype';

  @override
  String installationTypeOSDetected(Object os) {
    return '$os er i øjeblikket på denne maskine. Hvordan vil du gerne komme videre?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

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
  String get installationTypeAdvancedLabel => 'Advanced features...';

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
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

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
  String get installationTypeManual => 'Manual partitioning';

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
  String get selectGuidedStorageInstallNow => 'Install now';

  @override
  String get installAlongsideSpaceDivider => 'Allocate drive space by dragging the divider below:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'Files';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Size:';

  @override
  String get installAlongsideAvailable => 'Available:';

  @override
  String get allocateDiskSpace => 'Manual partitioning';

  @override
  String get allocateDiskSpaceInvalidMountPoint => 'Invalid mount point';

  @override
  String get startInstallingButtonText => 'Install';

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
  String get whoAreYouPageTitle => 'Set up your account';

  @override
  String get whoAreYouPageAutoLogin => 'Log in automatically';

  @override
  String get whoAreYouPageRequirePassword => 'Require my password to log in';

  @override
  String get whoAreYouPageRealNameLabel => 'Your name';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageRealNameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Your computer\'s name';

  @override
  String get whoAreYouPageComputerNameInfo => 'The name it uses when it talks to other computers.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A computer name is required';

  @override
  String get whoAreYouPageComputerNameTooLong => 'That computer name is too long.';

  @override
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Pick a username';

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
  String get whoAreYouPagePasswordLabel => 'Choose a password';

  @override
  String get whoAreYouPagePasswordRequired => 'A password is required';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirm your password';

  @override
  String get whoAreYouPagePasswordMismatch => 'The passwords do not match';

  @override
  String get whoAreYouPagePasswordShow => 'Show';

  @override
  String get whoAreYouPagePasswordHide => 'Hide';

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
  String get chooseYourLookPageTitle => 'Choose your theme';

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
  String get whereAreYouTimezoneLabel => 'Timezone';

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
  String get copyingFiles => 'Copying files…';

  @override
  String get installingSystem => 'Installing the system…';

  @override
  String get configuringSystem => 'Setting up the system…';

  @override
  String get installationFailed => 'Installation failed';

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
