


import 'app_localizations.dart';

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Skrivebord Installering';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installere $RELEASE';
  }

  @override
  String get cancelButtonText => 'Avbryt';

  @override
  String get changeButtonText => 'Endre';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Nei';

  @override
  String get restartButtonText => 'Start på nytt';

  @override
  String get revertButtonText => 'Tilbakefør';

  @override
  String get yesButtonText => 'Ja';

  @override
  String get quitButtonText => 'Quit Installation';

  @override
  String get welcome => 'Velkommen';

  @override
  String get welcomeHeader => 'Velg ditt språk:';

  @override
  String get tryOrInstallPageTitle => 'Prøv eller Installere';

  @override
  String get repairInstallation => 'Reparere installasjonen';

  @override
  String get repairInstallationDescription => 'Reparasjon vil installere all installert programvare på nytt uten å berøre dokumenter eller innstillinger.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Prøv $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Du kan prøve $RELEASE uten å gjøre noen endringer på datamaskinen.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installere $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installer $RELEASE ved siden av (eller i stedet for) ditt nåværende operativsystem. Dette bør ikke ta for lang tid.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Det kan være lurt å lese <a href=\"$url\">versjonsnotatene</a>.';
  }

  @override
  String get turnOffRST => 'Slå av RST';

  @override
  String get turnOffRSTDescription => 'Denne datamaskinen bruker Intel RST (Rapid Storage Technology). Du må slå av RST i Windows før du installerer Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instruksjoner, åpne denne siden på en telefon eller annen enhet: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Tastaturoppsett';

  @override
  String get chooseYourKeyboardLayout => 'Velg tastaturoppsettet ditt:';

  @override
  String get typeToTest => 'Skriv her for å teste tastaturet';

  @override
  String get detectLayout => 'Finn tastaturoppsett';

  @override
  String get pressOneKey => 'Trykk på en av følgende taster:';

  @override
  String get isKeyPresent => 'Finnes følgende tast på tastaturet ditt?';

  @override
  String get configureSecureBootTitle => 'Tilpass Sikkeroppstart';

  @override
  String get configureSecureBootDescription => 'Du har valgt å installere tredjeparts driverprogramvare. Dette krever at du slår av sikker oppstart.\nFor å gjøre dette, må du velge en sikkerhetsnøkkel nå, og angi den når systemet starter på nytt.';

  @override
  String get configureSecureBootOption => 'Tilpass sikkeroppstart';

  @override
  String get chooseSecurityKey => 'Velg en sikkerhetnøkkel';

  @override
  String get confirmSecurityKey => 'Bekreft sikkerhetsnøkkel';

  @override
  String get dontInstallDriverSoftwareNow => 'Ikke installere drivere programvare nå';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Du kan installere det senere fra programvare & oppdateringer.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Sikkerhetsnøkkel er krevet';

  @override
  String get secureBootSecurityKeysDontMatch => 'Sikkerhetsnøkkel stemmer ikke';

  @override
  String get connectToInternetPageTitle => 'Koble til internett';

  @override
  String get connectToInternetDescription => 'Å koble denne datamaskinen til internett vil hjelpe Ubuntu med å installere all ekstra programvare som trengs og hjelpe deg med å velge tidssone.\n\nKoble til med Ethernet-kabel, eller velg et Wi-Fi-nettverk';

  @override
  String get useWiredConnection => 'Bruk kablet nettverktilkobling';

  @override
  String get noWiredConnection => 'Ingen kablet tilkobling er oppdaget';

  @override
  String get wiredDisabled => 'Kablet tilkobling er slått av';

  @override
  String get wiredMustBeEnabled => 'For å bruke nettverkkabel på denne pcen, må kablet tilkobling være aktivert';

  @override
  String get enableWired => 'Aktivere kablet tilkobling';

  @override
  String get selectWifiNetwork => 'Koble til et trådløs nettverk';

  @override
  String get hiddenWifiNetwork => 'Koble til et skjult trådløs nett';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nettverknavn';

  @override
  String get hiddenWifiNetworkNameRequired => 'En nettverksnavn er påkrevd';

  @override
  String get noInternet => 'Jeg ønsker ikke å koble til internett nå';

  @override
  String get wirelessNetworkingDisabled => 'Trådløs nettverk er deaktivert';

  @override
  String get noWifiDevicesDetected => 'Ingen trådløs enheter er oppdaget';

  @override
  String get wifiMustBeEnabled => 'For å bruke Wi-Fi på denne datamaskinen, må trådløst nettverk være aktivert';

  @override
  String get enableWifi => 'Aktivere trådløs';

  @override
  String get connectButtonText => 'Tilkoble';

  @override
  String get updatesOtherSoftwarePageTitle => 'Oppdateringer og annet programvare';

  @override
  String get updatesOtherSoftwarePageDescription => 'Hvilke apper vil du installere til å begynne med?';

  @override
  String get normalInstallationTitle => 'Normal installasjon';

  @override
  String get normalInstallationSubtitle => 'Nettleser, verktøy, kontorprogramvare, spill og mediespillere.';

  @override
  String get minimalInstallationTitle => 'Minimal installasjon';

  @override
  String get minimalInstallationSubtitle => 'Nettleser og grunnleggende verktøy.';

  @override
  String get otherOptions => 'Andre valg';

  @override
  String get installThirdPartyTitle => 'Installer tredjepartsprogramvare for grafikk og trådløs-maskinvare, samt ytterligere medieformater';

  @override
  String get installThirdPartySubtitle => 'Denne programvaren er underlagt lisensvilkårene som følger med dokumentasjonen. Noen er proprietære.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Advarsel</font>: Datamaskinen er ikke koblet til en strømkilde.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Velg en sikkerhetsnøkkel';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Diskkryptering beskytter filene dine i tilfelle du mister datamaskinen. Det krever at du oppgir en sikkerhetsnøkkel hver gang datamaskinen starter opp.\n\nEventuelle filer utenfor $RELEASE blir ikke kryptert.';
  }

  @override
  String get chooseSecurityKeyHint => 'Velg en sikkerhetsnøkkel';

  @override
  String get chooseSecurityKeyConfirmHint => 'Bekreft sikkerhetsnøkkel';

  @override
  String get chooseSecurityKeyRequired => 'En sikkerhetsnøkkel er nødvendig';

  @override
  String get chooseSecurityKeyMismatch => 'Sikkerhetsnøkkelen stemmer ikke';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Advarsel</font>: Hvis du mister denne sikkerhetsnøkkelen, vil alle data gå tapt. Hvis du trenger det, skriv ned nøkkelen og oppbevar den på et trygt sted et annet sted.';
  }

  @override
  String get installationTypeTitle => 'Installasjontype';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Denne datamaskinen har for øyeblikket $os på seg. Hva har du lyst til å gjøre?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Denne datamaskinen har for øyeblikket $os1 og $os2. Hva har du lyst til å gjøre?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Denne datamaskinen har for tiden flere operativsystemer. Hva har du lyst til å gjøre?';

  @override
  String get installationTypeNoOSDetected => 'Denne datamaskinen har for øyeblikket ingen registrerte operativsystemer. Hva har du lyst til å gjøre?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Formatere harddisken og installere $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Advarsel:</font> Dette vil slette alle dine programmer, dokumenter, bilder, musikk og andre filer i alle operativsystemer.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Avansert funksjoner...';

  @override
  String get installationTypeAdvancedTitle => 'Avansert funksjoner';

  @override
  String get installationTypeNone => 'Ingen';

  @override
  String get installationTypeNoneSelected => 'Ingenting valgt';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Bruk LVM med nyeste $RELEASE installasjon';
  }

  @override
  String get installationTypeLVMSelected => 'LVM valg';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Kryptere nye $RELEASE installasjon for sikkerhet';
  }

  @override
  String get installationTypeEncryptInfo => 'Du velger en sikkerhetsnøkkel i neste trinn.';

  @override
  String get installationTypeZFS => 'EKSPERIMENTELL: Slett disk og bruk ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS valgt';

  @override
  String installationTypeReinstall(Object os) {
    return 'Slett og formatere $os og reinstallere';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Advarsel:</font> Dette vil slette alle dine $os-programmer, dokumenter, bilder, musikk og andre filer.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Installer $product ved siden av $os';
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
  String get installationTypeAlongsideInfo => 'Dokumenter, musikk og andre personlige filer vil bli oppbevart. Du kan velge hvilket operativsystem du vil ha hver gang datamaskinen starter opp.';

  @override
  String get installationTypeManual => 'Noe annet';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Du kan opprette eller endre størrelse på partisjoner selv, eller velge flere partisjoner for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Slett disk og installer $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Velg diskstasjon:';

  @override
  String get selectGuidedStorageInfoLabel => 'Hele disken vil bli brukt:';

  @override
  String get selectGuidedStorageInstallNow => 'Installere nå';

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
  String get allocateDiskSpace => 'Tildel diskplass';

  @override
  String get startInstallingButtonText => 'Start Installering';

  @override
  String get diskHeadersDevice => 'Enhet';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Monteringspunkt';

  @override
  String get diskHeadersSize => 'Størrelse';

  @override
  String get diskHeadersUsed => 'Brukt';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Formater';

  @override
  String get freeDiskSpace => 'ledig plass';

  @override
  String get newPartitionTable => 'Ny partisjonstabell';

  @override
  String get newPartitionTableConfirmationTitle => 'Opprett en ny partisjonstabell på enheten?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => 'Rediger partisjon';

  @override
  String get partitionSizeLabel => 'Størrelse:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Type for ny partisjon:';

  @override
  String get partitionTypePrimary => 'Primær';

  @override
  String get partitionTypeLogical => 'Logisk';

  @override
  String get partitionLocationLabel => 'Plassering av ny partisjon:';

  @override
  String get partitionLocationBeginning => 'Begynnelsen av plassen';

  @override
  String get partitionLocationEnd => 'På slutten av plassen';

  @override
  String get partitionFormatLabel => 'Brukt som:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Ext2-filsystem';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT-filsystem';

  @override
  String get partitionFormatFat12 => 'FAT12-filsystem';

  @override
  String get partitionFormatFat16 => 'FAT16-filsystem';

  @override
  String get partitionFormatFat32 => 'FAT32-filsystem';

  @override
  String get partitionFormatSwap => 'Sidevekslingsområde';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 file system';

  @override
  String get partitionFormatVfat => 'VFAT-filsystem';

  @override
  String get partitionFormatNtfs => 'NTFS-filsystem';

  @override
  String get partitionFormatReiserFS => 'ReiserFS-filsystem';

  @override
  String get partitionFormatZfsroot => 'ZFS root file system';

  @override
  String get partitionErase => 'Formater partisjonen';

  @override
  String get partitionMountPointLabel => 'Monteringspunkt:';

  @override
  String get whoAreYouPageTitle => 'Hvem er du?';

  @override
  String get whoAreYouPageAutoLogin => 'Logg inn automatisk';

  @override
  String get whoAreYouPageRequirePassword => 'Krev passord for å logge inn';

  @override
  String get whoAreYouPageRealNameLabel => 'Ditt navn';

  @override
  String get whoAreYouPageRealNameRequired => 'Navn er påkrevd';

  @override
  String get whoAreYouPageComputerNameLabel => 'Datamaskinens navn';

  @override
  String get whoAreYouPageComputerNameInfo => 'Navn brukt ved kommunikasjon med andre datamaskiner.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Et datamaskinsnavn er påkrevd';

  @override
  String get whoAreYouPageInvalidComputerName => 'Datamaskinsnavnet er ugyldig';

  @override
  String get whoAreYouPageUsernameLabel => 'Velg et brukernavn';

  @override
  String get whoAreYouPageUsernameRequired => 'Et brukernavn er påkrevd';

  @override
  String get whoAreYouPageInvalidUsername => 'Brukernavnet er ugyldig';

  @override
  String get whoAreYouPageUsernameInUse => 'That user name already exists.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get whoAreYouPageUsernameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get whoAreYouPagePasswordLabel => 'Velg et passord';

  @override
  String get whoAreYouPagePasswordRequired => 'Et passord er påkrevd';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bekreft passordet ditt';

  @override
  String get whoAreYouPagePasswordMismatch => 'Passordene samsvarer ikke';

  @override
  String get whoAreYouPageShowPassword => 'Vis passord';

  @override
  String get writeChangesToDisk => 'Skriv endringer til disk';

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
  String get chooseYourLookPageDarkSetting => 'Mørk';

  @override
  String get chooseYourLookPageLightSetting => 'Lys';

  @override
  String get chooseYourLookPageLightBodyText => 'Alt er lyst og greit';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hei mørke, min gamle venn';

  @override
  String get installationCompleteTitle => 'Installasjon fullført';

  @override
  String readyToUse(Object system) {
    return '**$system** er installert og klart til bruk.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Slå av';

  @override
  String get turnOffBitlockerTitle => 'Skru av BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';

  @override
  String get whereAreYouPageTitle => 'Hvem er du?';

  @override
  String get whereAreYouLocationLabel => 'Location';

  @override
  String get whereAreYouTimezoneLabel => 'Tidssone';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Velkommen til $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Fast and full of new features, the latest version of $RELEASE makes computing easier than ever. Here are just a few cool new things to look out for...';
  }

  @override
  String get softwareSlideTitle => 'Finn enda mer programvare';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Say goodbye to searching the web for new software. With access to the Snap Store and the $RELEASE software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.';
  }

  @override
  String get musicSlideTitle => 'Ta musikken din med deg';

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
  String get officeSlideTitle => 'Alt du trenger til kontoret';

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
  String get accessSlideCustomizationOptions => 'Tilpasningsinnstillinger';

  @override
  String get accessSlideAppearance => 'Utseende';

  @override
  String get accessSlideAssistiveTechnologies => 'Hjelpeteknologier';

  @override
  String get accessSlideLanguageSupport => 'Språkstøtte';

  @override
  String get supportSlideTitle => 'Hjelp og støtte';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Inkludert programvare';

  @override
  String get availableSoftware => 'Tilgjengelig programvare';

  @override
  String get supportedSoftware => 'Støttet programvare';

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
