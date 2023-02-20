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
  String get cancelButtonText => 'Diddymu';

  @override
  String get changeButtonText => 'Newid';

  @override
  String get okButtonText => 'Iawn';

  @override
  String get noButtonText => 'Na';

  @override
  String get restartButtonText => 'Ailgychwyn';

  @override
  String get revertButtonText => 'Dychwelyd';

  @override
  String get yesButtonText => 'Ie';

  @override
  String get quitButtonText => 'Quit Installation';

  @override
  String get welcome => 'Croeso';

  @override
  String get welcomeHeader => 'Dewiswch eich iaith:';

  @override
  String get tryOrInstallPageTitle => 'Try or install';

  @override
  String get repairInstallation => 'Repair installation';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Rhoi cynnig ar $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'You can try $RELEASE without making any changes to your computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Gosod $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Gosod $RELEASE ochr yn ochr â (neu yn lle) eich system weithredu gyfredol. Fydd hyn ddim yn cymryd yn rhy hir.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Efallai hoffech ddarllen <a href=\"$url\">nodiadau\'r fersiwn</a>.';
  }

  @override
  String get turnOffRST => 'Diffoddwch RST';

  @override
  String get turnOffRSTDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Cynllun bysellfwrdd';

  @override
  String get chooseYourKeyboardLayout => 'Dewiswch gynllun eich bysellfwrdd:';

  @override
  String get typeToTest => 'Teipiwch yma i brofi\'ch bysellfwrdd';

  @override
  String get detectLayout => 'Canfod Cynllun Bysellfwrdd';

  @override
  String get pressOneKey => 'Pwyswch un o\'r bysellau canlynol:';

  @override
  String get isKeyPresent => 'Ydy\'r fysell ganlynol yn bresennol ar eich bysellfwrdd?';

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
  String get connectButtonText => 'Cysylltu';

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
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

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
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'Dechrau Gosod';

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
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on it, all its current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'limit reached';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Creu ymraniad';

  @override
  String get partitionEditTitle => 'Newid ymraniad';

  @override
  String get partitionSizeLabel => 'Maint:';

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
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'System ffeiliau Ext2';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'System ffeiliau FAT';

  @override
  String get partitionFormatFat12 => 'System ffeiliau FAT12';

  @override
  String get partitionFormatFat16 => 'System ffeiliau FAT16';

  @override
  String get partitionFormatFat32 => 'System ffeiliau FAT32';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'System ffeiliau ISO 9660';

  @override
  String get partitionFormatVfat => 'System ffeiliau VFAT';

  @override
  String get partitionFormatNtfs => 'System ffeiliau NTFS';

  @override
  String get partitionFormatReiserFS => 'System ffeiliau ReiserFS';

  @override
  String get partitionFormatZfsroot => 'ZFS root file system';

  @override
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Pwynt clymu:';

  @override
  String get whoAreYouPageTitle => 'Pwy ydych chi?';

  @override
  String get whoAreYouPageAutoLogin => 'Mewngofnodi\'n awtomatig';

  @override
  String get whoAreYouPageRequirePassword => 'Gofyn am fy nghyfrinair i fewngofnodi';

  @override
  String get whoAreYouPageRealNameLabel => 'Eich enw';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageComputerNameLabel => 'Enw eich cyfrifiadur';

  @override
  String get whoAreYouPageComputerNameInfo => 'Yr enw a ddefnydir pan yn cyfathrebu a chyfrifiaduron eraill.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A computer name is required';

  @override
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Dewiswch enw defnyddiwr';

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
  String get whoAreYouPagePasswordLabel => 'Dewiswch gyfrinair';

  @override
  String get whoAreYouPagePasswordRequired => 'A password is required';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Cadarnhewch eich cyfrinair';

  @override
  String get whoAreYouPagePasswordMismatch => 'Nid yw\'r cyfrineiriau yn cyd-fynd';

  @override
  String get whoAreYouPageShowPassword => 'Show password';

  @override
  String get writeChangesToDisk => 'Write changes to disk';

  @override
  String get writeChangesFallbackSerial => 'disg';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

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
  String get chooseYourLookPageTitle => 'Choose your look';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Tywyll';

  @override
  String get chooseYourLookPageLightSetting => 'Golau';

  @override
  String get installationCompleteTitle => 'Gosodi wedi cwblhau';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use.';
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
  String get restartNow => 'Restart Now';

  @override
  String get continueTesting => 'Continue Testing';

  @override
  String get turnOffBitlockerTitle => 'Diffoddwch BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';

  @override
  String get whereAreYouPageTitle => 'Where are you?';

  @override
  String get whereAreYouLocationLabel => 'Lleoliad';

  @override
  String get whereAreYouTimezoneLabel => 'Cylchfa amser';

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
  String get musicSlideRhythmbox => 'Rhythmbox Music Player';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Have fun with your photos';

  @override
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Shotwell Photo Manager';

  @override
  String get photoSlideGimp => 'GIMP Image Editor';

  @override
  String get photoSlideShotcut => 'Shotcut Video Editor';

  @override
  String get webSlideTitle => 'Make the most of the web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'Firefox web browser';

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
  String get accessSlideTitle => 'Access for everyone';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colors and text size, $RELEASE makes computing easy — whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Customization options';

  @override
  String get accessSlideAppearance => 'Ymddangosiad';

  @override
  String get accessSlideAssistiveTechnologies => 'Assistive technologies';

  @override
  String get accessSlideLanguageSupport => 'Language support';

  @override
  String get supportSlideTitle => 'Help and support';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common aspects of $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Included software';

  @override
  String get availableSoftware => 'Available software';

  @override
  String get supportedSoftware => 'Supported software';

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
}
