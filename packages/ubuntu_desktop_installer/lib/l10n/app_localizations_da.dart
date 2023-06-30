import 'app_localizations.dart';

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Skrivebordsinstallatør';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installation $RELEASE';
  }

  @override
  String get changeButtonText => 'Skift';

  @override
  String get restartButtonText => 'Genstart';

  @override
  String get revertButtonText => 'Tilbagefør';

  @override
  String get quitButtonText => 'Forlad installation';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Velkommen til $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Forbereder $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Vælg dit sprog:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Prøv eller installér $DISTRO';
  }

  @override
  String get repairInstallation => 'Reparér installation';

  @override
  String get repairInstallationDescription => 'Reparation vil geninstallere al installeret programvare, uden at røre dokumenter eller indstillinger.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Prøv $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Du kan prøve $RELEASE, uden at foretage nogen ændringer, på din computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installér $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installér $RELEASE, ved siden af (eller i stedet for) dit nuværende operativsystem. Dette burde ikke tage lang tid.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Du kunne nok ønske at læse <a href=\"$url\">udgivelsesnoter</a>.';
  }

  @override
  String get turnOffRST => 'RST er aktiveret';

  @override
  String get turnOffRSTTitle => 'Slå RST fra, for at fortsætte';

  @override
  String get turnOffRSTDescription => 'Denne computer bruger Intel RST (Rapid Storage Technology). Før installation af Ubuntu, skal du slå RST fra i Windows.';

  @override
  String instructionsForRST(Object url) {
    return 'For instruktioner, skan QR-koden på en anden enhed, eller besøg: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Tastaturopsætning';

  @override
  String get chooseYourKeyboardLayout => 'Vælg din tastaturopsætning:';

  @override
  String get typeToTest => 'Tast her, for at afprøve dit tastatur';

  @override
  String get detectLayout => 'Opfang tastaturopsætning';

  @override
  String get detectButtonText => 'Opfang';

  @override
  String get keyboardVariant => 'Tastaturvariant:';

  @override
  String get pressOneKey => 'Tryk venligst på en af følgende taster:';

  @override
  String get isKeyPresent => 'Er følgende tast tilstede på dit tastatur?';

  @override
  String get configureSecureBootTitle => 'Konfigurér Sikret Start';

  @override
  String get configureSecureBootDescription => 'Du har valgt at installere tredjeparts driver-programvare. Dette kræver at man slår Sikret Start fra.\nFor at gøre dette, skal du nu vælge en sikkerhedsnøgle og indtaste den, når systemet genstarter.';

  @override
  String get configureSecureBootOption => 'Konfigurér Sikret Start';

  @override
  String get chooseSecurityKey => 'Vælg sikkerhedsnøgle';

  @override
  String get confirmSecurityKey => 'Bekræft sikkerhedsnøglen';

  @override
  String get dontInstallDriverSoftwareNow => 'Installér ikke driver-programvaren lige nu';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Du kan installere det senere fra Programvare & Opdateringer.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Sikkerhedsnøgle er påkrævet';

  @override
  String get secureBootSecurityKeysDontMatch => 'Sikkerhedsnøgler stemmer ikke overens';

  @override
  String get showSecurityKey => 'Vis sikkerhedsnøgle';

  @override
  String get connectToInternetPageTitle => 'Opret forbindelse til et netværk';

  @override
  String get connectToInternetDescription => 'Tilslutning af denne computer til internettet, vil hjælpe Ubuntu, med at installere enhver ekstra nødvendig programvare og vælge din tidszone.\n\nOpret forbindelse via Ethernet-kabel, eller vælg et WiFi-netværk';

  @override
  String get useWiredConnection => 'Brug kablet forbindelse';

  @override
  String get noWiredConnection => 'Ingen kablet forbindelse opfanget';

  @override
  String get wiredDisabled => 'Kablet forbindelse er slået fra';

  @override
  String get wiredMustBeEnabled => 'En kablet forbindelse skal være aktiveret, for at bruge Ethernet på denne computer';

  @override
  String get enableWired => 'Aktivér kablet';

  @override
  String get selectWifiNetwork => 'Opret forbindelse til et WiFi-netværk';

  @override
  String get hiddenWifiNetwork => 'Opret forbindelse til et skjult WiFi-netværk';

  @override
  String get hiddenWifiNetworkNameLabel => 'Netværksnavn';

  @override
  String get hiddenWifiNetworkNameRequired => 'Et netværksnavn er påkrævet';

  @override
  String get noInternet => 'Jeg vil ikke oprette forbindelse til internettet lige nu';

  @override
  String get wirelessNetworkingDisabled => 'Trådløst netværk deaktiveret';

  @override
  String get noWifiDevicesDetected => 'Ingen WiFi-enheder opfanget';

  @override
  String get wifiMustBeEnabled => 'For at bruge WiFi på denne computer skal trådløst netværk være aktiveret';

  @override
  String get enableWifi => 'Aktivér WiFi';

  @override
  String get connectButtonText => 'Opret forbindelse';

  @override
  String get updatesOtherSoftwarePageTitle => 'Applikationer og opdateringer';

  @override
  String get updatesOtherSoftwarePageDescription => 'Hvilke apps vil du installere, til at starte med?';

  @override
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Netlæsere, værktøjer, kontorpakker, spil og medieafspillere.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

  @override
  String get minimalInstallationSubtitle => 'Netlæsere og basale værktøjer.';

  @override
  String get otherOptions => 'Andre muligheder';

  @override
  String get installThirdPartyTitle => 'Installér tredjeparts programvare til grafik og Wi-Fi maskinel, så vel som yderligere medieformater';

  @override
  String get installThirdPartySubtitle => 'Denne programvare er underlagt de licensvilkår, som er inkluderet i dens dokumentation. Nogle er proprietære.';

  @override
  String get installDriversTitle => 'Installér tredjeparts programvare til grafik og Wi-Fi maskinel';

  @override
  String get installDriversSubtitle => 'Disse chauffører er underlagt de licensvilkår, som er inkluderet i deres dokumentation. De er proprietære.';

  @override
  String get installCodecsTitle => 'Hent og installér understøttelse af yderligere medieformater';

  @override
  String get installCodecsSubtitle => 'Denne programvare er underlagt licensbetingelserne, som er inkluderet i dens dokumentation. Nogle er proprietære.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Advarsel:</font> Computeren er ikke sluttet til en strømkilde.';
  }

  @override
  String get offlineWarning => 'Du er aktuelt offline';

  @override
  String get chooseSecurityKeyTitle => 'Sikkerhedsnøgle';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Diskkryptering beskytter dine filer, i tilfælde af at du mister din computer. Det kræver at du indtaster en sikkerhedsnøgle, hver gang computeren starter op.\n\nEnhver fil uden for $RELEASE vil ikke blive krypteret.';
  }

  @override
  String get chooseSecurityKeyHint => 'Vælg en sikkerhedsnøgle';

  @override
  String get chooseSecurityKeyConfirmHint => 'Bekræft sikkerhedsnøglen';

  @override
  String get chooseSecurityKeyRequired => 'En sikkerhedsnøgle er påkrævet';

  @override
  String get chooseSecurityKeyMismatch => 'Sikkerhedsnøglerne stemmer ikke overens';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Advarsel:</font> Hvis du mister denne sikkerhedsnøgle, vil alle data gå tabt. Hvis du har verug for det, så skriv din nøgle ned og opbevare den et andet sikkert sted.';
  }

  @override
  String get installationTypeTitle => 'installationstype';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Din computer har aktuelt $os installeret. Hvad kunne du tænke dig at gøre?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Denne computer har aktuelt $os1 og $os2 installeret. Hvad kunne du tænke dig at gøre?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Denne computer har aktuelt flere forskellige operativsystemer installeret. Hvad kunne du tænke dig at gøre?';

  @override
  String get installationTypeNoOSDetected => 'Denne computer har aktuelt ingen opfangede operativsystemer. Hvad kunne du tænke dig at gøre?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Udslet disk og installér $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Advarsel:</font> Dette vil slette alle dine programmer, dokumenter, fotografier, musik, og enhver anden fil, i alle operativsystemer.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Avancerede funktioner...';

  @override
  String get installationTypeAdvancedTitle => 'Avancerede funktioner';

  @override
  String get installationTypeNone => 'Ingen';

  @override
  String get installationTypeNoneSelected => 'Ingen valgt';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Benyt LVM med den nye $RELEASE-installation';
  }

  @override
  String get installationTypeLVMSelected => 'LVM opfanget';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM og kryptering valgt';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Kryptér den nye $RELEASE-installation, for en sikkerheds skyld';
  }

  @override
  String get installationTypeEncryptInfo => 'Du vil vælge en sikkerhedsnøgle, i næste trin.';

  @override
  String get installationTypeZFS => 'EKSPERIMENTEL: Udslet disk og benyt ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS valgt';

  @override
  String installationTypeReinstall(Object os) {
    return 'Udslet $os og geninstallér';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Advarsel:</font> Dette vil slette alle dine $os programmer, dokumenter, fotografier, musik, og enhver anden fil.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Installér $product, ved siden af $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Installér $product, ved siden af $os1 og $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Installér $product, ved siden af dem';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Installér $product, ved siden af andre partitioner';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumenter, musik, og andre personlige filer vil blive bevaret. Du kan vælge hvilket operativsystem du vil bruge, hver gang computeren starter op.';

  @override
  String get installationTypeManual => 'Manuel partitionering';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Du kan selv oprette eller ændre størrelse på partitioner, eller vælge flere partitioner til $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Udslet disk og installér $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Vælg drev:';

  @override
  String get selectGuidedStorageInfoLabel => 'Hele disken vil blive brugt:';

  @override
  String get selectGuidedStorageInstallNow => 'Installér nu';

  @override
  String get installAlongsideSpaceDivider => 'Allokér drevplads, ved at trække skellet herunder:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num mindre partitioner er skjulte; brug det <a href=\"$url\">avancerede partitionsværktøj</a> for mere kontrol';
  }

  @override
  String get installAlongsideResizePartition => 'Ændr størrelse på partition';

  @override
  String get installAlongsideAllocateSpace => 'Allokér plads';

  @override
  String get installAlongsideFiles => 'Filer';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Størrelse:';

  @override
  String get installAlongsideAvailable => 'Tilgængelig:';

  @override
  String get allocateDiskSpace => 'Manuel partitionering';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Monteringspunkter skal starte med \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Monteringspunkter må ikke indeholde mellemrum';

  @override
  String get startInstallingButtonText => 'Installér';

  @override
  String get diskHeadersDevice => 'Enhed';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Monteringspunkt';

  @override
  String get diskHeadersSize => 'Størrelse';

  @override
  String get diskHeadersUsed => 'Brugt';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'Fri plads';

  @override
  String get newPartitionTable => 'Ny partitionstabel';

  @override
  String get newPartitionTableConfirmationTitle => 'Ny tom partition';

  @override
  String get newPartitionTableConfirmationMessage => 'Oprettelse af ny partitionstabel, på en hel enhed, vil fjerne alle dens nuværende partitioner. Denne operation kan fortrydes, hvis det er nødvendigt.';

  @override
  String get tooManyPrimaryPartitions => 'For mange primære partitioner';

  @override
  String get partitionLimitReached => 'Grænse nået';

  @override
  String get bootLoaderDevice => 'Enhed til installation af opstartslæser';

  @override
  String get partitionCreateTitle => 'Opret partition';

  @override
  String get partitionEditTitle => 'Redigér partition';

  @override
  String get partitionSizeLabel => 'Størrelse:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Type for ny partition:';

  @override
  String get partitionTypePrimary => 'Primær';

  @override
  String get partitionTypeLogical => 'Logisk';

  @override
  String get partitionLocationLabel => 'Placering for ny partition:';

  @override
  String get partitionLocationBeginning => 'Begyndelse på denne plads';

  @override
  String get partitionLocationEnd => 'Ende på denne plads';

  @override
  String get partitionFormatLabel => 'Brugt som:';

  @override
  String get partitionFormatNone => 'Efterlad uformateret';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'Formatér partition';

  @override
  String get partitionMountPointLabel => 'Monteringspunkt:';

  @override
  String get whoAreYouPageTitle => 'Indstil din konto';

  @override
  String get whoAreYouPageAutoLogin => 'Log ind automatisk';

  @override
  String get whoAreYouPageRequirePassword => 'Kræv min adgangskode, for at logge ind';

  @override
  String get whoAreYouPageRealNameLabel => 'Dit navn';

  @override
  String get whoAreYouPageRealNameRequired => 'Et navn er påkrævet';

  @override
  String get whoAreYouPageRealNameTooLong => 'Navnet er for langt.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Din computers navn';

  @override
  String get whoAreYouPageComputerNameInfo => 'Det navn den bruger, når den snakker med andre computere.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Et computernavn er påkrævet';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Det computernavn er for langt.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Computernavnet er ugyldigt';

  @override
  String get whoAreYouPageUsernameLabel => 'Vælg et brugernavn';

  @override
  String get whoAreYouPageUsernameRequired => 'Et brugernavn er påkrævet';

  @override
  String get whoAreYouPageInvalidUsername => 'Brugernavnet er ugyldigt';

  @override
  String get whoAreYouPageUsernameInUse => 'Det brugernavn findes allerede.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Det navn er reserveret til systembrug.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Det navn er for langt.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Det navn indeholder ugyldige tegn.';

  @override
  String get whoAreYouPagePasswordLabel => 'Vælg en adgangskode';

  @override
  String get whoAreYouPagePasswordRequired => 'En adgangskode er påkrævet';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bekræft din adgangskode';

  @override
  String get whoAreYouPagePasswordMismatch => 'Adgangskoderne stemmer ikke overens';

  @override
  String get whoAreYouPagePasswordShow => 'Vis';

  @override
  String get whoAreYouPagePasswordHide => 'Skjul';

  @override
  String get writeChangesToDisk => 'Klar til at installere';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Hvis du fortsætter, vil ændringerne på listen nedenfor blive skrevet til disken(e). Du vil kunne foretage yderligere ændringer manuelt.';

  @override
  String get writeChangesDevicesTitle => 'Enheder';

  @override
  String get writeChangesPartitionsTitle => 'Partitioner';

  @override
  String get writeChangesPartitionTablesHeader => 'Partitionstabellen på de følgende enheder er ændret:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'De følgende partitionsændringer vil træde i kraft:';

  @override
  String writeChangesPartitionResized(Object sysname, Object oldsize, Object newsize) {
    return 'partition <b>$sysname</b> ændres fra <b>$oldsize</b> til <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object sysname, Object format, Object mount) {
    return 'partition <b>$sysname</b> formateret som <b>$format</b> brugt til <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object sysname, Object format) {
    return 'partition <b>$sysname</b> formateret som <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object sysname, Object mount) {
    return 'partition <b>$sysname</b> brugt til <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object sysname) {
    return 'partition <b>$sysname</b> oprettet';
  }

  @override
  String get chooseYourLookPageTitle => 'Vælg til tema';

  @override
  String get chooseYourLookPageHeader => 'Du kan altid ændre dette senere, i indstillinger for udseende.';

  @override
  String get chooseYourLookPageDarkSetting => 'Mørkt';

  @override
  String get chooseYourLookPageLightSetting => 'Lyst';

  @override
  String get installationCompleteTitle => 'Installation gennemført';

  @override
  String readyToUse(Object system) {
    return '**$system** er installeret og klar til brug';
  }

  @override
  String restartInto(Object system) {
    return 'Genstart i $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Du kan fortsat afprøve $RELEASE nu, men indtil du genstarter computeren, vil ingen ændringer du foretager, eller dokumenter du gemmer, blive bevaret.';
  }

  @override
  String get shutdown => 'Luk Ned';

  @override
  String get restartNow => 'Genstart nu';

  @override
  String get continueTesting => 'Fortsæt afprøvning';

  @override
  String get turnOffBitlockerTitle => 'BitLocker er aktiveret';

  @override
  String get turnOffBitlockerHeadline => 'Slå BitLocker fra, for at fortsætte';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'Denne computer benytter Windows BitLocker kryptering.\nDu bliver nødt til at bruge Windows til, at frigøre plads, eller vælge \'$option\", for at fortsætte.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instruktioner, skan QR-koden, på en anden enhed eller besøg:<a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Genstart i Windows';

  @override
  String get restartIntoWindowsTitle => 'Genstart i Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Er du sikker på, at du vil genstarte din computer? Du vil skulle genstarte $DISTRO-installationen senere, for at færdiggøre installationen af $DISTRO.';
  }

  @override
  String get whereAreYouPageTitle => 'Vælg din tidszone';

  @override
  String get whereAreYouLocationLabel => 'Placering';

  @override
  String get whereAreYouTimezoneLabel => 'Tidszone';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Velkommen til $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Tilgængelig:';

  @override
  String get installationSlidesIncluded => 'Inkluderet:';

  @override
  String get installationSlidesWelcomeTitle => 'Hurtigt, gratis og fyldt med nye funktioner';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'Den seneste udgave af $DISTRO gøre computer-arbejde nemmere end nogensinde.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Om du er udvikler, skaber, gamer, eller administrator, vil du finde nye værktøjer til at forbedre din produktivitet og berige din oplevelse med $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Alle de applikationer du har brug for';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Installér, administrér og opdatér alle dine apps i Ubuntu Varehus, inklusiv tusindvis af applikationer, fra både Snap Butikken og ${DISTRO}s arkiv.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Udvikl det bedste indenfor åben kilde';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO er den idéelle arbejdsstation til app- eller netudvikling, data-videnskab og kunstig intelligens/maskinlærling, så vel som devops og administration. Hver $DISTRO-udgivelse inkluderer de seneste værktøjskæder og understøtter alle større IDEer.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Berig din kreativitet';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Hvis du er animator, designer, videnskaber, eller spiludvikler, så er det nemt at tage dine arbejdsgange med til $DISTRO, med understøttelse af åben kildekode og industriel standard-programvare samt -applikationer.';
  }

  @override
  String get installationSlidesGamingTitle => 'Super til gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO understøtter de seneste NVIDIA- og Mesa-drivere, for at forbedre ydeevne og kompatibilitet. Tusindvis af Windows-titler kører glimrende på $DISTRO, via applikationer som Stram, uden nogen yderligere konfiguration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privat og sikkert';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO tilbyder alle de værktøjer, du har brug for, til at forblive privat og sikker på linjen. Med indbygget firewall og VPN-understøttelse, samt en mængde privatlivsorienterede applikationer, til at sikre at du har fuld kontrol over dine data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Alle $DISTRO LTS-udgivelser kommer med fem års sikkerhedsrettelser inkluderet, som kan udvides helt op til ti år, med et Ubuntu Pro-abonnement.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Send din produktivitet til himmels';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop inkluderer LibreOffice, en pakke Microsoft Office-kompatible applikationer med åben kildekode, til dokumenter, regneark og præsentationer. Populære kollaborationsværktøjer er også tilgængelige.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Adgang for alle';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'I centrum for $DISTRO-filosofien er troen på, at computere er for alle. Med avancerede tilgængelighedsværktøjer og muligheder af, at ændre sprog, farver, og tekst størrelse, gør $DISTRO det nemt at bruge computeren - hvem end og hvor end du er.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Skærmoplæser';

  @override
  String get installationSlidesAccessibilityLanguages => 'Sprogunderstøttelse';

  @override
  String get installationSlidesSupportTitle => 'Hjælp & Støtte';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'Den officielle $DISTRO-dokumentation er både tilgængelig på nettet og via Hjælp-ikonet i dokken.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Spørg Ubuntu dækker en bred vifte af spørgsmål og svar, og Ubuntu Discourse tilbyder vejledninger og diskussioner, for nye og erfarne brugere.';

  @override
  String get installationSlidesSupportEnterprise => 'For entreprise-brugere tilbyder Canonical kommerciel støtte, for at gøre det nemt at onboarde og administrere Ubuntu sikkert på arbejdspladsen.';

  @override
  String get installationSlidesSupportResources => 'Nyttige ressourcer:';

  @override
  String get installationSlidesSupportDocumentation => 'Officiel dokumentation';

  @override
  String get installationSlidesSupportUbuntuPro => '24/7 støtte på entreprise-niveau, med Ubuntu Pro';

  @override
  String get copyingFiles => 'Kopierer filer…';

  @override
  String get installingSystem => 'Installerer systemet…';

  @override
  String get configuringSystem => 'Opsætter systemet…';

  @override
  String get installationFailed => 'Installation slog fejl';

  @override
  String get notEnoughDiskSpaceTitle => 'Ikke nok plads';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Ikke nok diskplads, til at installere $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Tilgængelig:';

  @override
  String get notEnoughDiskSpaceRequired => 'Påkrævet:';

  @override
  String get activeDirectoryOption => 'Brug Aktiv Sti';

  @override
  String get activeDirectoryInfo => 'Du kan indtaste domæne og andre oplysninger i næste trin.';

  @override
  String get activeDirectoryTitle => 'Konfigurér Aktiv Sti';

  @override
  String get activeDirectoryTestConnection => 'Afprøv domæneforbindelse';

  @override
  String get activeDirectoryDomainLabel => 'Domæne';

  @override
  String get activeDirectoryDomainEmpty => 'Påkrævet';

  @override
  String get activeDirectoryDomainTooLong => 'For langt';

  @override
  String get activeDirectoryDomainInvalidChars => 'Ugyldige tegn';

  @override
  String get activeDirectoryDomainStartDot => 'Starter med et punktum (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Slutter med et punktum (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starter med bindestreg (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Slutter med bindestreg (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Indeholder flere punktummer (.) i streg';

  @override
  String get activeDirectoryDomainNotFound => 'Domæne ikke fundet';

  @override
  String get activeDirectoryAdminLabel => 'Domæne tilslut bruger';

  @override
  String get activeDirectoryAdminEmpty => 'Påkrævet';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ugyldige tegn';

  @override
  String get activeDirectoryPasswordLabel => 'Adgangskode';

  @override
  String get activeDirectoryPasswordEmpty => 'Påkrævet';

  @override
  String get activeDirectoryErrorTitle => 'Fejl ved konfiguration af forbindelse til Aktiv Sti';

  @override
  String get activeDirectoryErrorMessage => 'Beklager, Aktiv Sti kan ikke indstilles i øjeblikket. Når først dit system er oppe at køre, så besøg <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for hjælp.';
}
