import 'app_localizations.dart';

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Skrivbordsinstallatören för Ubuntu';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installera $RELEASE';
  }

  @override
  String get cancelButtonText => 'Avbryt';

  @override
  String get changeButtonText => 'Ändra';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Nej';

  @override
  String get restartButtonText => 'Starta om';

  @override
  String get revertButtonText => 'Återställ';

  @override
  String get yesButtonText => 'Ja';

  @override
  String get quitButtonText => 'Avbryt installation';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Välj ditt språk:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Prova eller installera';
  }

  @override
  String get repairInstallation => 'Reparera installation';

  @override
  String get repairInstallationDescription => 'Reparation kommer att installera om all installerad programvara utan att röra dokument eller inställningar.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Prova $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Du kan prova $RELEASE utan att göra några ändringar till din dator.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installera $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installera $RELEASE bredvid (eller istället för) ditt nuvarande operativsystem. Det här ska inte ta för lång tid.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Du kanske vill läsa <a href=\"$url\">kommentarer till utgåvan</a>.';
  }

  @override
  String get turnOffRST => 'Stäng av RST';

  @override
  String get turnOffRSTDescription => 'Den här datorn använder Intel RST (Rapid Storage Technology). Du måste stänga av RST i Windows innan du installerar Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'För instruktioner, öppna den här sidan på en telefon eller annan enhet: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Tangentbordslayout';

  @override
  String get chooseYourKeyboardLayout => 'Välj din tangentbordslayout:';

  @override
  String get typeToTest => 'Skriv här för att testa ditt tangentbord';

  @override
  String get detectLayout => 'Upptäck tangentbordslayout';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Vänligen tryck på en av följande tangenter:';

  @override
  String get isKeyPresent => 'Finns följande tangent på ditt tangentbord?';

  @override
  String get configureSecureBootTitle => 'Konfigurera Säker start';

  @override
  String get configureSecureBootDescription => 'Du har valt att installera drivrutinsprogram från tredje part. Detta kräver att du stänger av Säker Start.\nFör att göra detta måste du välja en säkerhetsnyckel nu och ange den när systemet startar om.';

  @override
  String get configureSecureBootOption => 'Konfigurera Säker start';

  @override
  String get chooseSecurityKey => 'Välj en säkerhetsnyckel';

  @override
  String get confirmSecurityKey => 'Bekräfta säkerhetsnyckeln';

  @override
  String get dontInstallDriverSoftwareNow => 'Installera inte drivrutinsprogramvara för tillfället';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Du kan installera det senare från Programvara och uppdateringar.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Säkerhetsnyckel krävs';

  @override
  String get secureBootSecurityKeysDontMatch => 'Säkerhetsnycklarna matchar inte';

  @override
  String get showSecurityKey => 'Visa säkerhetsnyckel';

  @override
  String get connectToInternetPageTitle => 'Anslut till internet';

  @override
  String get connectToInternetDescription => 'Att ansluta den här datorn till internet hjälper Ubuntu att installera all extra programvara som behövs och hjälpa dig att välja din tidszon.\n\nAnslut med Ethernet-kabel eller välj ett Wi-Fi-nätverk';

  @override
  String get useWiredConnection => 'Använd trådbunden anslutning';

  @override
  String get noWiredConnection => 'Ingen trådbunden anslutning upptäcktes';

  @override
  String get wiredDisabled => 'Den trådbundna anslutningen är avstängd';

  @override
  String get wiredMustBeEnabled => 'För att använda Ethernet på den här datorn måste en trådbunden anslutning vara aktiverad';

  @override
  String get enableWired => 'Aktivera trådbunden';

  @override
  String get selectWifiNetwork => 'Anslut till ett Wi-Fi nätverk';

  @override
  String get hiddenWifiNetwork => 'Anslut till ett dolt Wi-Fi-nätverk';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nätverksnamn';

  @override
  String get hiddenWifiNetworkNameRequired => 'Ett nätverksnamn krävs';

  @override
  String get noInternet => 'Jag vill inte ansluta till internet just nu';

  @override
  String get wirelessNetworkingDisabled => 'Trådlöst nätverk inaktiverat';

  @override
  String get noWifiDevicesDetected => 'Inga Wi-Fi-enheter upptäcktes';

  @override
  String get wifiMustBeEnabled => 'För att kunna använda Wi-Fi på den här datorn måste trådlöst nätverk vara aktiverat';

  @override
  String get enableWifi => 'Aktivera Wi-Fi';

  @override
  String get connectButtonText => 'Anslut';

  @override
  String get updatesOtherSoftwarePageTitle => 'Uppdateringar och annan programvara';

  @override
  String get updatesOtherSoftwarePageDescription => 'Vilka program skulle du vilja installera till att börja med?';

  @override
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Webbläsare, verktyg, office programvara, spel och mediaspelare.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

  @override
  String get minimalInstallationSubtitle => 'Webbläsare och grundläggande verktyg.';

  @override
  String get otherOptions => 'Andra alternativ';

  @override
  String get installThirdPartyTitle => 'Installera programvara från tredje part för grafik och Wi-Fi-hårdvara, samt ytterligare mediaformat';

  @override
  String get installThirdPartySubtitle => 'Denna programvara är föremål för licensvillkor som ingår i dess dokumentation. Vissa är proprietära.';

  @override
  String get installDriversTitle => 'Installera programvara från tredje part för grafik och Wi-Fi-hårdvara';

  @override
  String get installDriversSubtitle => 'Dessa drivrutiner är föremål för licensvillkor som ingår i deras dokumentation. De är proprietära.';

  @override
  String get installCodecsTitle => 'Ladda ner och installera stöd för ytterligare medieformat';

  @override
  String get installCodecsSubtitle => 'Denna programvara är föremål för licensvillkor som ingår i dess dokumentation. Vissa är proprietära.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Varning:</font> Denna dator är inte ansluten till en strömkälla.';
  }

  @override
  String get offlineWarning => 'Du är för närvarande offline';

  @override
  String get chooseSecurityKeyTitle => 'Välj en säkerhetsnyckel';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Diskkryptering skyddar dina filer om du tappar bort din dator. Det kräver att du anger en säkerhetsnyckel varje gång datorn startar.\n\nAlla filer utanför $RELEASE kommer inte att krypteras.';
  }

  @override
  String get chooseSecurityKeyHint => 'Välj en säkerhetsnyckel';

  @override
  String get chooseSecurityKeyConfirmHint => 'Bekräfta säkerhetsnyckeln';

  @override
  String get chooseSecurityKeyRequired => 'En säkerhetsnyckel krävs';

  @override
  String get chooseSecurityKeyMismatch => 'Säkerhetsnycklarna stämmer inte överens';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Varning:</font> Om du tappar den här säkerhetsnyckeln kommer all data att gå förlorad. Om du behöver, skriv ner din nyckel och förvara den på ett säkert ställe någon annanstans.';
  }

  @override
  String get installationTypeTitle => 'Installationstyp';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Den här datorn har för närvarande $os på sig. Vad skulle du vilja göra?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Den här datorn har för närvarande $os1 och $os2 på sig. Vad skulle du vilja göra?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Den här datorn har för närvarande flera operativsystem på sig. Vad skulle du vilja göra?';

  @override
  String get installationTypeNoOSDetected => 'Den här datorn har för närvarande inga upptäckta operativsystem. Vad skulle du vilja göra?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Radera disk och installera $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Varning:</font> Detta kommer att radera alla dina program, dokument, foton, musik och alla andra filer i alla operativsystem.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Avancerade funktioner...';

  @override
  String get installationTypeAdvancedTitle => 'Avancerade funktioner';

  @override
  String get installationTypeNone => 'Inga';

  @override
  String get installationTypeNoneSelected => 'Inga valda';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Använd LVM med den nya $RELEASE-installationen';
  }

  @override
  String get installationTypeLVMSelected => 'LVM valt';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM och kryptering vald';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Kryptera den nya $RELEASE-installationen för säkerhet';
  }

  @override
  String get installationTypeEncryptInfo => 'Du väljer en säkerhetsnyckel i nästa steg.';

  @override
  String get installationTypeZFS => 'EXPERIMENTELLT: Radera disk och använd ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS valt';

  @override
  String installationTypeReinstall(Object os) {
    return 'Radera $os och installera om';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Varning:</font> Detta tar bort alla dina $os-program, dokument, foton, musik och alla andra filer.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Installera $product bredvid $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Installera $product bredvid $os1 och $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Installera $product bredvid dem';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Installera $product bredvid andra partitioner';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokument, musik och andra personliga filer kommer att sparas. Du kan välja vilket operativsystem du vill ha varje gång datorn startar.';

  @override
  String get installationTypeManual => 'Något annat';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Du kan skapa eller ändra storlek på partitioner själv, eller välja flera partitioner för $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Radera disk och installera $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Välj disk:';

  @override
  String get selectGuidedStorageInfoLabel => 'Hela disken kommer att användas:';

  @override
  String get selectGuidedStorageInstallNow => 'Installera nu';

  @override
  String get installAlongsideSpaceDivider => 'Tilldela enhetsutrymme genom att dra i spaken nedan:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num mindre partitioner är dolda, använd det <a href=\"$url\">avancerade partitionsverktyget</a> för mer kontroll';
  }

  @override
  String get installAlongsideResizePartition => 'Ändra storlek på partition';

  @override
  String get installAlongsideAllocateSpace => 'Tilldela utrymme';

  @override
  String get installAlongsideFiles => 'Filer';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Storlek:';

  @override
  String get installAlongsideAvailable => 'Tillgängligt:';

  @override
  String get allocateDiskSpace => 'Tilldela diskutrymme';

  @override
  String get startInstallingButtonText => 'Installera';

  @override
  String get diskHeadersDevice => 'Enhet';

  @override
  String get diskHeadersType => 'Typ';

  @override
  String get diskHeadersMountPoint => 'Monteringspunkt';

  @override
  String get diskHeadersSize => 'Storlek';

  @override
  String get diskHeadersUsed => 'Använt';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Formatera';

  @override
  String get freeDiskSpace => 'Ledigt utrymme';

  @override
  String get newPartitionTable => 'Ny partitionstabell';

  @override
  String get newPartitionTableConfirmationTitle => 'Skapa en ny tom partitionstabell på den här enheten?';

  @override
  String get newPartitionTableConfirmationMessage => 'Du har valt en hel enhet att partitionera. Om du fortsätter med att skapa en ny partitionstabell så kommer alla nuvarande partitioner att tas bort.\n\nObservera att du kommer att kunna ångra denna operation senare om du vill.';

  @override
  String get tooManyPrimaryPartitions => 'För många primära partitioner';

  @override
  String get partitionLimitReached => 'Gränsen nådd';

  @override
  String get bootLoaderDevice => 'Enhet för installation av starthanteraren';

  @override
  String get partitionCreateTitle => 'Skapa partition';

  @override
  String get partitionEditTitle => 'Redigera partition';

  @override
  String get partitionSizeLabel => 'Storlek:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Typ för den nya partitionen:';

  @override
  String get partitionTypePrimary => 'Primär';

  @override
  String get partitionTypeLogical => 'Logisk';

  @override
  String get partitionLocationLabel => 'Plats för den nya partitionen:';

  @override
  String get partitionLocationBeginning => 'Början av detta utrymme';

  @override
  String get partitionLocationEnd => 'Slutet på detta utrymme';

  @override
  String get partitionFormatLabel => 'Används som:';

  @override
  String get partitionFormatExt4 => 'Ext4 journalfilsystem';

  @override
  String get partitionFormatExt3 => 'Ext3 journalfilsystem';

  @override
  String get partitionFormatExt2 => 'Ext2 filsystem';

  @override
  String get partitionFormatBtrfs => 'btrfs journalfilsystem';

  @override
  String get partitionFormatJfs => 'JFS journalfilsystem';

  @override
  String get partitionFormatXfs => 'XFS journalfilsystem';

  @override
  String get partitionFormatFat => 'FAT filsystem';

  @override
  String get partitionFormatFat12 => 'FAT12 filsystem';

  @override
  String get partitionFormatFat16 => 'FAT16 filsystem';

  @override
  String get partitionFormatFat32 => 'FAT32 filsystem';

  @override
  String get partitionFormatSwap => 'Swap område';

  @override
  String get partitionFormatIso9660 => 'ISO 9960 filsystem';

  @override
  String get partitionFormatVfat => 'VFAT filsystem';

  @override
  String get partitionFormatNtfs => 'NTFS filsystem';

  @override
  String get partitionFormatReiserFS => 'ReiserFS filsystem';

  @override
  String get partitionFormatZfsroot => 'ZFS rotfilsystem';

  @override
  String get partitionFormatNone => 'Lämna oformaterad';

  @override
  String get partitionErase => 'Formatera partitionen';

  @override
  String get partitionMountPointLabel => 'Monteringspunkt:';

  @override
  String get whoAreYouPageTitle => 'Vem är du?';

  @override
  String get whoAreYouPageAutoLogin => 'Logga in automatiskt';

  @override
  String get whoAreYouPageRequirePassword => 'Kräv mitt lösenord för att logga in';

  @override
  String get whoAreYouPageRealNameLabel => 'Ditt namn';

  @override
  String get whoAreYouPageRealNameRequired => 'Ett namn krävs';

  @override
  String get whoAreYouPageRealNameTooLong => 'Det namnet är för långt.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Din dators namn';

  @override
  String get whoAreYouPageComputerNameInfo => 'Namnet den använder när den pratar med andra datorer.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Ett datornamn krävs';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Det datornamnet är för långt.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Datornamnet är ogiltigt';

  @override
  String get whoAreYouPageUsernameLabel => 'Välj ett användarnamn';

  @override
  String get whoAreYouPageUsernameRequired => 'Ett användarnamn krävs';

  @override
  String get whoAreYouPageInvalidUsername => 'Användarnamnet är ogiltigt';

  @override
  String get whoAreYouPageUsernameInUse => 'Det användarnamnet existerar redan.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Det namnet är reserverat för systemanvändning.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Det namnet är för långt.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Det namnet innehåller ogiltiga tecken.';

  @override
  String get whoAreYouPagePasswordLabel => 'Välj ett lösenord';

  @override
  String get whoAreYouPagePasswordRequired => 'Ett lösenord krävs';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bekräfta ditt lösenord';

  @override
  String get whoAreYouPagePasswordMismatch => 'Lösenorden stämmer inte överens';

  @override
  String get whoAreYouPagePasswordShow => 'Visa';

  @override
  String get whoAreYouPagePasswordHide => 'Dölj';

  @override
  String get writeChangesToDisk => 'Skriv ändringar till disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Om du fortsätter kommer ändringarna nedan att skrivas till diskarna. Du kommer att kunna göra ytterligare ändringar manuellt.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Följande enheters partitionstabeller är ändrade:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Följande partitionsändringar kommer att tillämpas:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition #$disk$partition storleksändrad från $oldsize till $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk$partition formaterad som $format används för $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition #$disk$partition formaterad som $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition #$disk$partition används för $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition #$disk$partition skapad';
  }

  @override
  String get chooseYourLookPageTitle => 'Välj ditt utseende';

  @override
  String get chooseYourLookPageHeader => 'Du kan alltid ändra detta senare i utseendeinställningarna.';

  @override
  String get chooseYourLookPageDarkSetting => 'Mörk';

  @override
  String get chooseYourLookPageLightSetting => 'Ljus';

  @override
  String get installationCompleteTitle => 'Installationen är klar';

  @override
  String readyToUse(Object system) {
    return '**$system** är installerat och redo att användas';
  }

  @override
  String restartInto(Object system) {
    return 'Starta om till $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Du kan fortsätta att testa $RELEASE nu, men tills du startar om datorn kommer alla ändringar du gör eller dokument du sparar inte att bevaras.';
  }

  @override
  String get shutdown => 'Stäng av';

  @override
  String get restartNow => 'Starta om nu';

  @override
  String get continueTesting => 'Fortsätt att testa';

  @override
  String get turnOffBitlockerTitle => 'Slå av BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Den här datorn använder Windows BitLocker-kryptering.\nDu måste stänga av BitLocker i Windows innan du installerar Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'För instruktioner, öppna den här sidan på en telefon eller annan enhet: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Starta om till Windows';

  @override
  String get whereAreYouPageTitle => 'Var är du?';

  @override
  String get whereAreYouLocationLabel => 'Plats';

  @override
  String get whereAreYouTimezoneLabel => 'Tidszon';

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
  String get copyingFiles => 'Kopierar filer…';

  @override
  String get installingSystem => 'Installerar ditt system…';

  @override
  String get configuringSystem => 'Ställer in ditt system…';

  @override
  String get installationFailed => 'Installationen misslyckades';

  @override
  String get notEnoughDiskSpaceTitle => 'Förlåt';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';

  @override
  String get activeDirectoryOption => 'Använd Active Directory';

  @override
  String get activeDirectoryInfo => 'Du anger domän och andra detaljer i nästa steg.';

  @override
  String get activeDirectoryTitle => 'Konfigurera Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Testa domänanslutning';

  @override
  String get activeDirectoryDomainLabel => 'Domän';

  @override
  String get activeDirectoryDomainEmpty => 'Krävs';

  @override
  String get activeDirectoryDomainTooLong => 'För lång';

  @override
  String get activeDirectoryDomainInvalidChars => 'Ogiltiga tecken';

  @override
  String get activeDirectoryDomainStartDot => 'Börjar med en punkt (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Slutar med en punkt (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Börjar med ett bindestreck (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Slutar med ett bindestreck (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Innehåller flera sekvenserade punkter (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domän hittades inte';

  @override
  String get activeDirectoryAdminLabel => 'Domän gå med användare';

  @override
  String get activeDirectoryAdminEmpty => 'Krävs';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ogiltiga tecken';

  @override
  String get activeDirectoryPasswordLabel => 'Lösenord';

  @override
  String get activeDirectoryPasswordEmpty => 'Krävs';

  @override
  String get activeDirectoryErrorTitle => 'Fel vid konfiguration av anslutning till Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Tyvärr, Active Directory kan inte ställas in just nu. när ditt system är igång, besök <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> för hjälp.';
}
