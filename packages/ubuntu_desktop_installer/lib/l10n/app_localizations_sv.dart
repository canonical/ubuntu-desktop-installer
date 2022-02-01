


import 'app_localizations.dart';

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Skrivbordsinstallerare';

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
  String get welcome => 'Välkommen';

  @override
  String get tryOrInstallPageTitle => 'Prova eller installera';

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
    return 'You may wish to read the <a href=\"$url\">release notes</a>.';
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
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Varning</font>: Datorn är inte ansluten till en strömkälla.';
  }

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
    return '<font color=\"$color\">Varning</font>: Om du tappar den här säkerhetsnyckeln kommer all data att gå förlorad. Om du behöver, skriv ner din nyckel och förvara den på ett säkert ställe någon annanstans.';
  }

  @override
  String get installationTypeTitle => 'Installationstyp';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Den här datorn har för närvarande $os på sig. Vad skulle du vilja göra?';
  }

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
  String get allocateDiskSpace => 'Tilldela diskutrymme';

  @override
  String get startInstallingButtonText => 'Börja installera';

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
  String get freeDiskSpace => 'ledigt utrymme';

  @override
  String get newPartitionTable => 'Ny partitionstabell';

  @override
  String get newPartitionTableConfirmationTitle => 'Skapa en ny tom partitionstabell på den här enheten?';

  @override
  String get newPartitionTableConfirmationMessage => 'Du har valt en hel enhet att partitionera. Om du fortsätter med att skapa en ny partitionstabell på enheten kommer alla nuvarande partitioner att tas bort.\n\nObservera att du kommer att kunna ångra denna operation senare om du vill.';

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
  String get partitionUnitKB => 'KB';

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
  String get whoAreYouPageComputerNameLabel => 'Din dators namn';

  @override
  String get whoAreYouPageComputerNameInfo => 'Namnet den använder när den pratar med andra datorer.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Ett datornamn krävs';

  @override
  String get whoAreYouPageInvalidComputerName => 'Datornamnet är ogiltigt';

  @override
  String get whoAreYouPageUsernameLabel => 'Välj ett användarnamn';

  @override
  String get whoAreYouPageUsernameRequired => 'Ett användarnamn krävs';

  @override
  String get whoAreYouPageInvalidUsername => 'Användarnamnet är ogiltigt';

  @override
  String get whoAreYouPagePasswordLabel => 'Välj ett lösenord';

  @override
  String get whoAreYouPagePasswordRequired => 'Ett lösenord krävs';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bekräfta ditt lösenord';

  @override
  String get whoAreYouPagePasswordMismatch => 'Lösenorden stämmer inte överens';

  @override
  String get writeChangesToDisk => 'Skriv ändringar till disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Om du fortsätter kommer ändringarna nedan att skrivas till diskarna. Du kommer att kunna göra ytterligare ändringar manuellt.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Följande partitioner kommer att formateras:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} som $format används för $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} som $format';
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
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

  @override
  String get installationCompleteTitle => 'Installationen är klar';

  @override
  String readyToUse(Object system) {
    return '**$system** är installerat och redo att användas.';
  }

  @override
  String restartInto(Object system) {
    return 'Starta om till $system';
  }

  @override
  String get shutdown => 'Stäng av';

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
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <strong>online</strong> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <strong>Ask Ubuntu</strong> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <strong>Local Community Team</strong>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <strong>Community support</strong> or <strong>Commercial support</strong>.';

  @override
  String get includedSoftware => 'Included software';

  @override
  String get availableSoftware => 'Available software';

  @override
  String get supportedSoftware => 'Supported software';
}
