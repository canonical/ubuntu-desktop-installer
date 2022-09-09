


import 'app_localizations.dart';

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Desktop Installer';

  @override
  String windowTitle(Object RELEASE) {
    return 'Įdiegti $RELEASE';
  }

  @override
  String get cancelButtonText => 'Atsisakyti';

  @override
  String get changeButtonText => 'Keisti';

  @override
  String get okButtonText => 'Gerai';

  @override
  String get noButtonText => 'Ne';

  @override
  String get restartButtonText => 'Paleisti iš naujo';

  @override
  String get revertButtonText => 'Sugrąžinti';

  @override
  String get yesButtonText => 'Taip';

  @override
  String get quitButtonText => 'Quit Installation';

  @override
  String get welcome => 'Sveiki,';

  @override
  String get welcomeHeader => 'Pasirinkite kalbą:';

  @override
  String get tryOrInstallPageTitle => 'Išbandykite arba įsidiekite';

  @override
  String get repairInstallation => 'Taisyti diegimą';

  @override
  String get repairInstallationDescription => 'Taisymas iš naujo įdiegs visą įdiegtą programinę įrangą nepaveikdamas dokumentų ar nustatymų.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Išbandyti $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Galite išbandyti $RELEASE neatlikdami kompiuteryje jokių pakeitimų.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Įdiegti $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Įsidiekite $RELEASE šalia savo dabartinės operacinės sistemoje arba vietoje jos. Tai neturėtų ilgai užtrukti.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Galite pageidauti perskaityti <a href=\"$url\">laidos informaciją</a>.';
  }

  @override
  String get turnOffRST => 'Išjunkite RST';

  @override
  String get turnOffRSTDescription => 'Šis kompiuteris naudoja Intel RST (Rapid Storage Technology). Prieš įdiegdami Ubuntu, turite „Windows“ sistemoje išjungti RST.';

  @override
  String instructionsForRST(Object url) {
    return 'Norėdami skaityti instrukcijas, atverkite telefone ar kitame įrenginyje šį puslapį: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Klaviatūros išdėstymas';

  @override
  String get chooseYourKeyboardLayout => 'Pasirinkite klaviatūros išdėstymą:';

  @override
  String get typeToTest => 'Rašykite čia, norėdami išbandyti klaviatūrą';

  @override
  String get detectLayout => 'Aptikti klaviatūros išdėstymą';

  @override
  String get pressOneKey => 'Paspauskite vieną iš šių klavišų:';

  @override
  String get isKeyPresent => 'Ar šis klavišas yra jūsų klaviatūroje?';

  @override
  String get configureSecureBootTitle => 'Konfigūruoti saugųjį paleidimą';

  @override
  String get configureSecureBootDescription => 'Pasirinkote įdiegti trečiųjų šalių tvarkyklės programinę įrangą. Tai reikalauja, kad būtų išjungtas saugusis paleidimashis.\nNorėdami tai atlikti, dabar turite pasirinkti saugumo raktą, o kai sistema bus paleista iš naujo, turėsite jį įvesti.';

  @override
  String get configureSecureBootOption => 'Konfigūruoti saugųjį paleidimą';

  @override
  String get chooseSecurityKey => 'Pasirinkite saugumo raktą';

  @override
  String get confirmSecurityKey => 'Patvirtinkite saugumo raktą';

  @override
  String get dontInstallDriverSoftwareNow => 'Kol kas neįdiegti tvarkyklės programinės įrangos';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Reikia nurodyti saugumo raktą';

  @override
  String get secureBootSecurityKeysDontMatch => 'Saugumo raktai nesutampa';

  @override
  String get showSecurityKey => 'Show security key';

  @override
  String get connectToInternetPageTitle => 'Prisijunkite prie interneto';

  @override
  String get connectToInternetDescription => 'Prijungus šį kompiuterį prie interneto Ubuntu galės įdiegti reikalingą papildomą programinę įrangą ir galės padėti pasirinkti laiko juostą.\n\nPrisijunkite naudodami interneto laidą arba pasirinkite belaidį (Wi-Fi) tinklą';

  @override
  String get useWiredConnection => 'Naudoti laidinį ryšį';

  @override
  String get noWiredConnection => 'Neaptikta jokio laidinio ryšio';

  @override
  String get wiredDisabled => 'Laidinis ryšys yra išjungtas';

  @override
  String get wiredMustBeEnabled => 'Norint šiame kompiuteryje naudoti laidinį tinklą, privalo būti įjungtas laidinis ryšys';

  @override
  String get enableWired => 'Įjungti laidinį ryšį';

  @override
  String get selectWifiNetwork => 'Prisijungti prie belaidžio (Wi-Fi) tinklo';

  @override
  String get hiddenWifiNetwork => 'Prisijungti prie paslėpto belaidžio (Wi-Fi) tinklo';

  @override
  String get hiddenWifiNetworkNameLabel => 'Tinklo pavadinimas';

  @override
  String get hiddenWifiNetworkNameRequired => 'Reikia nurodyti tinklo pavadinimą';

  @override
  String get noInternet => 'Aš kol kas nenoriu jungtis prie interneto';

  @override
  String get wirelessNetworkingDisabled => 'Belaidis darbas tinkle išjungtas';

  @override
  String get noWifiDevicesDetected => 'Neaptikta jokių belaidžių (Wi-Fi) įrenginių';

  @override
  String get wifiMustBeEnabled => 'Norint šiame kompiuteryje naudoti belaidį (Wi-Fi) tinklą, privalo būti įjungtas belaidis darbas tinkle';

  @override
  String get enableWifi => 'Įjungti belaidį (Wi-Fi)';

  @override
  String get connectButtonText => 'Prisijungti';

  @override
  String get updatesOtherSoftwarePageTitle => 'Atnaujinimai ir kita programinė įranga';

  @override
  String get updatesOtherSoftwarePageDescription => 'What apps would you like to install to start with?';

  @override
  String get normalInstallationTitle => 'Įprastas programų paketas';

  @override
  String get normalInstallationSubtitle => 'Saityno naršyklė, paslaugų programos, raštinės programinė įranga, žaidimai ir medijos leistuvės.';

  @override
  String get minimalInstallationTitle => 'Minimalus programų paketas';

  @override
  String get minimalInstallationSubtitle => 'Saityno naršyklė ir pagrindinės paslaugų programos.';

  @override
  String get otherOptions => 'Kitos parinktys';

  @override
  String get installThirdPartyTitle => 'Įdiegti trečiųjų šalių programinę įrangą, skirtą grafikos ir belaidžio (Wi-Fi) ryšio aparatinei įrangai, o taip pat papildomus medijos formatus';

  @override
  String get installThirdPartySubtitle => 'Šiai programinei įrangai taikomos licencijos sąlygos, kurias rasite jos dokumentacijoje. Kai kuri programinė įranga yra nuosavybinė.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Įspėjimas</font>: Šis kompiuteris daugiau nebėra prijungtas prie elektros maitinimo šaltinio.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Pasirinkite saugumo raktą';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Diskų šifravimas apsaugo failus tuo atveju, jei prarasite savo kompiuterį. Tai reikalauja įvesti saugumo raktą kiekvieną kartą paleidus kompiuterį.\n\nVisi failai už $RELEASE ribų nebus šifruoti.';
  }

  @override
  String get chooseSecurityKeyHint => 'Pasirinkite saugumo raktą';

  @override
  String get chooseSecurityKeyConfirmHint => 'Patvirtinkite saugumo raktą';

  @override
  String get chooseSecurityKeyRequired => 'Reikia nurodyti saugumo raktą';

  @override
  String get chooseSecurityKeyMismatch => 'Saugumo raktai nesutampa';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Įspėjimas</font>: Jei prarasite šį saugumo raktą, visi duomenys bus prarasti. Jei reikia, užsirašykite raktą ir laikykite jį atokiai saugioje vietoje.';
  }

  @override
  String get installationTypeTitle => 'Įdiegimo tipas';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Šiuo metu šiame kompiuteryje yra įdiegta $os. Ką norėtumėte daryti?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Šiuo metu šiame kompiuteryje yra įdiegtos $os1 ir $os2. Ką norėtumėte daryti?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Šiuo metu šiame kompiuteryje yra įdiegtos kelios operacinės sistemos. Ką norėtumėte daryti?';

  @override
  String get installationTypeNoOSDetected => 'Šiuo metu šiame kompiuteryje nėra įdiegtų operacinių sistemų. Ką norėtumėte daryti?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Ištrinti duomenis diske ir įdiegti $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Įspėjimas:</font> Tai ištrins visas jūsų programas, dokumentus, nuotraukas, muziką bei visus failus, esančius kitose operacinėse sistemose.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Išplėstinės ypatybės...';

  @override
  String get installationTypeAdvancedTitle => 'Išplėstinės ypatybės';

  @override
  String get installationTypeNone => 'Nėra';

  @override
  String get installationTypeNoneSelected => 'Nieko nepasirinkta';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Naudoti LVM kartu su nauju $RELEASE diegimu';
  }

  @override
  String get installationTypeLVMSelected => 'LVM pasirinkta';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Šifruoti naują $RELEASE diegimą, kad būtų užtikrintas saugumas';
  }

  @override
  String get installationTypeEncryptInfo => 'Kitame žingsnyje pasirinksite saugumo raktą.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS pasirinkta';

  @override
  String installationTypeReinstall(Object os) {
    return 'Ištrinti $os ir įdiegti iš naujo';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Įspėjimas:</font> Tai ištrins visas $os programas, dokumentus, nuotraukas, muziką ir visus kitus failus.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Įdiegti $product šalia $os';
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
  String get whoAreYouPageShowPassword => 'Show password';

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
  String get writeChangesPartitionsHeader => 'The following partition changes are going to be applied:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition #$disk${partition} resized from $oldsize to $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} formatted as $format used for $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} formatted as $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition #$disk${partition} used for $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition #$disk${partition} created';
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

  @override
  String get whereAreYouPageTitle => 'Where are you?';

  @override
  String get whereAreYouLocationLabel => 'Location';

  @override
  String get whereAreYouTimezoneLabel => 'Timezone';

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
  String get officeSlideDescription => 'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.';

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
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, $RELEASE makes computing easy - whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Customization options';

  @override
  String get accessSlideAppearance => 'Appearance';

  @override
  String get accessSlideAssistiveTechnologies => 'Assistive technologies';

  @override
  String get accessSlideLanguageSupport => 'Language support';

  @override
  String get supportSlideTitle => 'Help and support';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
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
  String get copyingFiles => 'Copying files...';

  @override
  String get installingSystem => 'Installing system...';

  @override
  String get configuringSystem => 'Configuring system...';

  @override
  String get installationFailed => 'Installation failed';

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
}
