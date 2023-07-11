import 'app_localizations.dart';

/// The translations for Welsh (`cy`).
class AppLocalizationsCy extends AppLocalizations {
  AppLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Desktop Installer';

  @override
  String windowTitle(Object RELEASE) {
    return 'Gosod $RELEASE';
  }

  @override
  String get changeButtonText => 'Newid';

  @override
  String get quitButtonText => 'Quit installation';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'Preparing $DISTRO…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Try or install $DISTRO';
  }

  @override
  String get welcomeRepairOption => 'Repair installation';

  @override
  String get welcomeRepairDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'Rhoi cynnig ar $RELEASE';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'You can try $RELEASE without making any changes to your computer.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'Gosod $RELEASE';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Gosod $RELEASE ochr yn ochr â (neu yn lle) eich system weithredu gyfredol. Fydd hyn ddim yn cymryd yn rhy hir.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Efallai hoffech ddarllen <a href=\"$url\">nodiadau\'r fersiwn</a>.';
  }

  @override
  String get rstTitle => 'Diffoddwch RST';

  @override
  String get rstHeader => 'Turn off RST to continue';

  @override
  String get rstDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String rstInstructions(Object url) {
    return 'For instructions, scan the QR code on another device or visit: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get configureSecureBootTitle => 'Configure Secure Boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Configure Secure Boot';

  @override
  String get chooseSecurityKey => 'Dewiswch allwedd diogelwch';

  @override
  String get confirmSecurityKey => 'Cadarnhewch yr allwedd diogelwch';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Security key is required';

  @override
  String get secureBootSecurityKeysDontMatch => 'Security keys do not match';

  @override
  String get showSecurityKey => 'Show security key';

  @override
  String get connectToInternetPageTitle => 'Connect to a network';

  @override
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by Ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'Use wired connection';

  @override
  String get noWiredConnection => 'No wired connection detected';

  @override
  String get wiredDisabled => 'Wired connection is turned off';

  @override
  String get wiredMustBeEnabled => 'To use Ethernet on this computer, a wired connection must be enabled';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Connect to a Wi-Fi network';

  @override
  String get hiddenWifiNetwork => 'Connect to a hidden Wi-Fi network';

  @override
  String get hiddenWifiNetworkNameLabel => 'Network name';

  @override
  String get hiddenWifiNetworkNameRequired => 'A network name is required';

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
  String get updatesOtherSoftwarePageTitle => 'Diweddariadau a meddalwedd eraill';

  @override
  String get updatesOtherSoftwarePageDescription => 'Pa apiau hoffech chi eu gosod yn gyntaf?';

  @override
  String get normalInstallationTitle => 'Gosodiad arferol';

  @override
  String get normalInstallationSubtitle => 'Porwr gwe, gwasanaethau, meddalwedd swyddfa, gemau a chwaraewyr cyfrwng.';

  @override
  String get minimalInstallationTitle => 'Gosodiad lleiaf';

  @override
  String get minimalInstallationSubtitle => 'Porwyr gwe a gwasanaethau sylfaenol.';

  @override
  String get otherOptions => 'Dewisiadau eraill';

  @override
  String get installThirdPartyTitle => 'Gosod meddalwedd trydydd parti ar gyfer caledwedd graffigau a diwifr a fformatau cyfryngau eraill';

  @override
  String get installThirdPartySubtitle => 'Mae\'r feddalwedd hwn yn destun amodau trwyddedu sydd ynghlwm yn y ddogfennaeth. Mae peth yn fasnachol.';

  @override
  String get installDriversTitle => 'Install third-party software for graphics and Wi-Fi hardware';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'Download and install support for additional media formats';

  @override
  String get installCodecsSubtitle => 'Mae\'r feddalwedd hwn yn destun amodau trwyddedu sydd ynghlwm yn y ddogfennaeth. Mae peth yn fasnachol.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> The computer is not plugged in to a power source.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'Security key';

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
    return '<font color=\"$color\">Warning:</font> If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Math o osodiad';

  @override
  String installationTypeOSDetected(Object os) {
    return 'This computer currently has $os on it. What would you like to do?';
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
    return 'Dileu\'r ddisg a gosod $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Rhybudd:</font> Bydd hyn yn dileu eich holl raglenni, dogfennau, lluniau, cerddoriaeth, ac unrhyw ffeiliau eraill ar bob system weithredu.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Nodweddion Uwch...';

  @override
  String get installationTypeAdvancedTitle => 'Nodweddion uwch';

  @override
  String get installationTypeNone => 'Dim';

  @override
  String get installationTypeNoneSelected => 'Dim wedi ei ddewis';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Defnyddio LVM gyda\'r gosodiad $RELEASE newydd';
  }

  @override
  String get installationTypeLVMSelected => 'LVM wedi\'i ddewis';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Amgryptio\'r gosodiad $RELEASE newydd ar gyfer diogelwch';
  }

  @override
  String get installationTypeEncryptInfo => 'Byddwch yn dewis allwedd diogelwch yn y cam nesaf.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS wedi\'i ddewis';

  @override
  String installationTypeReinstall(Object os) {
    return 'Erase $os and reinstall';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Rhybudd:</font> Bydd hyn yn dileu eich holl raglenni $os, dogfennau, lluniau, cerddoriaeth, ac unrhyw ffeiliau eraill.';
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
  String get installationTypeAlongsideInfo => 'Caiff dogfennau, cerddoriaeth, a ffeiliau personol eriall eu cadw. Gallwch ddewis pa system weithredu i\'w defnyddio bob tro mae\'r cyfrifiadur yn cychwyn.';

  @override
  String get installationTypeManual => 'Rhywbeth arall';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Gallwch greu neu newid maint rhaniadau eich hun, neu ddewis nifer o raniadau ar gyfer $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Dileu\'r ddisg a gosod $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Dewis gyriant:';

  @override
  String get selectGuidedStorageInfoLabel => 'Defnyddir yr holl ddisg:';

  @override
  String get selectGuidedStorageInstallNow => 'Gosod Nawr';

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
  String get installAlongsideFiles => 'Ffeiliau';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Maint:';

  @override
  String get installAlongsideAvailable => 'Ar gael:';

  @override
  String get allocateDiskSpace => 'Manual partitioning';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Mount points must start with \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Mount points cannot contain spaces';

  @override
  String get diskHeadersDevice => 'Dyfais';

  @override
  String get diskHeadersType => 'Teip';

  @override
  String get diskHeadersMountPoint => 'Pwynt clymu';

  @override
  String get diskHeadersSize => 'Maint';

  @override
  String get diskHeadersUsed => 'Defnyddir';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Fformat';

  @override
  String get freeDiskSpace => 'Lle rhydd';

  @override
  String get newPartitionTable => 'Tabl rhaniad newydd';

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
  String get partitionCreateTitle => 'Creu ymraniad';

  @override
  String get partitionEditTitle => 'Newid ymraniad';

  @override
  String get partitionSizeLabel => 'Maint:';

  @override
  String get partitionTypeLabel => 'Type for the new partition:';

  @override
  String get partitionTypePrimary => 'Cynradd';

  @override
  String get partitionTypeLogical => 'Rhesymegol';

  @override
  String get partitionLocationLabel => 'Location for the new partition:';

  @override
  String get partitionLocationBeginning => 'Dechrau\'r gwagle hwn';

  @override
  String get partitionLocationEnd => 'Diwedd y gwagle hwn';

  @override
  String get partitionFormatLabel => 'Used as:';

  @override
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Pwynt clymu:';

  @override
  String get confirmPageTitle => 'Ready to install';

  @override
  String get confirmHeader => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get confirmDevicesTitle => 'Devices';

  @override
  String get confirmPartitionsTitle => 'Partitions';

  @override
  String get confirmPartitionTables => 'The partition tables of the following devices are changed:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'The following partition changes are going to be applied:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'partition <b>$sysname</b> resized from <b>$oldsize</b> to <b>$newsize</b>';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'partition <b>$sysname</b> formatted as <b>$format</b> used for <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'partition <b>$sysname</b> formatted as <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'partition <b>$sysname</b> used for <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'partition <b>$sysname</b> created';
  }

  @override
  String get confirmInstallButton => 'Dechrau Gosod';

  @override
  String get installationCompleteTitle => 'Gosodi wedi cwblhau';

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
  String get bitlockerTitle => 'Diffoddwch BitLocker';

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
  String get installationSlidesSupportTitle => 'Help and support';

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
  String get notEnoughDiskSpaceTitle => 'Ymddiheuriad';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';
}
