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
  String get quitButtonText => 'Avslutt installasjon';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Velg ditt språk:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Prøv eller Installere';
  }

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
  String get turnOffRSTTitle => 'Turn off RST to continue';

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
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

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
  String get showSecurityKey => 'Vis sikkerhetsnøkkel';

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
  String get installDriversTitle => 'Installer tredjepartsprogramvare for grafikk- og Wi-Fi-maskinvare';

  @override
  String get installDriversSubtitle => 'Disse driverrutinene har lisensvilkår som er å finne i dokumentasjonen av dem. De er ufrie.';

  @override
  String get installCodecsTitle => 'Last ned og installer støtte for ytterligere mediaformater';

  @override
  String get installCodecsSubtitle => 'Denne programvaren har lisensvilkår som er å finnen i dokumentasjonen av den. Noen av dem er ufrie.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Advarsel</font>: Datamaskinen er ikke koblet til en strømkilde.';
  }

  @override
  String get offlineWarning => 'Du er frakoblet';

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
  String get installationTypeLVMEncryptionSelected => 'LVM og kryptering valgt';

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
    return 'Installer $product ved siden av $os1 og $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Installer $product ved siden av dem';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Installer $product ved siden av andre partisjoner';
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
  String get installAlongsideSpaceDivider => 'Tildel lagringsplass ved å dra inndeleren nedenfor:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num mindre partisjoner er skjult, bruk <a href=\"$url\">avansert partisjoneringsverktøy</a> for mer kontroll';
  }

  @override
  String get installAlongsideResizePartition => 'Endre størrelse på partisjon';

  @override
  String get installAlongsideAllocateSpace => 'Tildel plass';

  @override
  String get installAlongsideFiles => 'Filer';

  @override
  String get installAlongsidePartition => 'Partisjon:';

  @override
  String get installAlongsideSize => 'Størrelse:';

  @override
  String get installAlongsideAvailable => 'Tilgjengelig:';

  @override
  String get allocateDiskSpace => 'Tildel diskplass';

  @override
  String get startInstallingButtonText => 'Installer';

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
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'Ledig plass';

  @override
  String get newPartitionTable => 'Ny partisjonstabell';

  @override
  String get newPartitionTableConfirmationTitle => 'Opprett en ny partisjonstabell på enheten?';

  @override
  String get newPartitionTableConfirmationMessage => 'Du har valgt en hel enhet å partisjonere. Hvis du fortsetter med opprettelse av en ny partisjonstabell på enheten vil alle nåværende partisjoner på den fjernes.\n\nMerk at du også vil kunne angre operasjonen senere hvis du ønsker det.';

  @override
  String get tooManyPrimaryPartitions => 'For mange primære partisjoner';

  @override
  String get partitionLimitReached => 'Grense nådd';

  @override
  String get bootLoaderDevice => 'Enhet å installere oppstartslaster på';

  @override
  String get partitionCreateTitle => 'Opprett partisjon';

  @override
  String get partitionEditTitle => 'Rediger partisjon';

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
  String get partitionFormatNone => 'Levn uformatert';

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
  String get whoAreYouPageRealNameTooLong => 'Navnet er for langt.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Datamaskinens navn';

  @override
  String get whoAreYouPageComputerNameInfo => 'Navn brukt ved kommunikasjon med andre datamaskiner.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Et datamaskinsnavn er påkrevd';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Datamaskinsnavnet er for langt.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Datamaskinsnavnet er ugyldig';

  @override
  String get whoAreYouPageUsernameLabel => 'Velg et brukernavn';

  @override
  String get whoAreYouPageUsernameRequired => 'Et brukernavn er påkrevd';

  @override
  String get whoAreYouPageInvalidUsername => 'Brukernavnet er ugyldig';

  @override
  String get whoAreYouPageUsernameInUse => 'Brukernavnet finnes allerede.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Navnet er reservert for systembruk.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Navnet er for langt.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Navnet inneholder ugyldige tegn.';

  @override
  String get whoAreYouPagePasswordLabel => 'Velg et passord';

  @override
  String get whoAreYouPagePasswordRequired => 'Et passord er påkrevd';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bekreft passordet ditt';

  @override
  String get whoAreYouPagePasswordMismatch => 'Passordene samsvarer ikke';

  @override
  String get whoAreYouPagePasswordShow => 'Vis';

  @override
  String get whoAreYouPagePasswordHide => 'Skjul';

  @override
  String get writeChangesToDisk => 'Skriv endringer til disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Hvis du fortsetter vil endringene nedenfor bli skrevet til diskene. Du vil kunne gjøre videre endringer manuelt.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Partisjonstabellen for følgende enheter har blitt endret:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Følgende partisjonsendringer vil bli utført:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'endret størrelse fra $oldsize til $newsize for #$disk$partition';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partisjon #$disk$partition formatert som $format og brukt til $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partisjon #$disk$partition formatert som $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partisjon #$disk$partition brukt til $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partisjon #$disk$partition opprettet';
  }

  @override
  String get chooseYourLookPageTitle => 'Velg utseende';

  @override
  String get chooseYourLookPageHeader => 'Du kan alltid endre dette senere i utseende-innstillingene.';

  @override
  String get chooseYourLookPageDarkSetting => 'Mørk';

  @override
  String get chooseYourLookPageLightSetting => 'Lys';

  @override
  String get installationCompleteTitle => 'Installasjon fullført';

  @override
  String readyToUse(Object system) {
    return '**$system** er installert og klart til bruk.';
  }

  @override
  String restartInto(Object system) {
    return 'Start om igjen til $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Du kan fortsette å teste $RELEASE, men før du starter datamaskinen på ny vil ingen endringer du gjør eller dokumenter du lagrer bevares.';
  }

  @override
  String get shutdown => 'Slå av';

  @override
  String get restartNow => 'Utfør omstart nå';

  @override
  String get continueTesting => 'Fortsett testingen';

  @override
  String get turnOffBitlockerTitle => 'Skru av BitLocker';

  @override
  String get turnOffBitlockerHeadline => 'Turn off BitLocker to continue';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'Maskinen bruker Windows BitLocker-kryptering.\nDu må skru dette av før du installerer Ubuntu.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Instruks er tilgjengelig hvis du åpner denne siden på en telefon eller en annen enhet: <a href=\"https://$url\"></a>';
  }

  @override
  String get restartIntoWindows => 'Omstart til Windows';

  @override
  String get restartIntoWindowsTitle => 'Restart into Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Are you sure you want to restart your computer? You will need to restart the $DISTRO installation later to finish installing $DISTRO.';
  }

  @override
  String get whereAreYouPageTitle => 'Hvem er du?';

  @override
  String get whereAreYouLocationLabel => 'Sted';

  @override
  String get whereAreYouTimezoneLabel => 'Tidssone';

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
  String get copyingFiles => 'Kopierer filer …';

  @override
  String get installingSystem => 'Installerer systemet …';

  @override
  String get configuringSystem => 'Setter opp systemet …';

  @override
  String get installationFailed => 'Installasjonen mislyktes';

  @override
  String get notEnoughDiskSpaceTitle => 'Beklager';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';

  @override
  String get activeDirectoryOption => 'Bruk Active Directory';

  @override
  String get activeDirectoryInfo => 'Du skriver inn domene og andre detaljer i neste steg.';

  @override
  String get activeDirectoryTitle => 'Sett opp Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test tilknytning';

  @override
  String get activeDirectoryDomainLabel => 'Domene';

  @override
  String get activeDirectoryDomainEmpty => 'Påkrevd';

  @override
  String get activeDirectoryDomainTooLong => 'For langt';

  @override
  String get activeDirectoryDomainInvalidChars => 'Ugyldige tegn';

  @override
  String get activeDirectoryDomainStartDot => 'Starter med punktum (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Slutter med punktum (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starter med bindestrek (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Slutter med bindestrek (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Inneholder flere gjentagende punktum (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Fant ikke domenet';

  @override
  String get activeDirectoryAdminLabel => 'Domeneadministrator';

  @override
  String get activeDirectoryAdminEmpty => 'Påkrevd';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ugyldige tegn';

  @override
  String get activeDirectoryPasswordLabel => 'Passord';

  @override
  String get activeDirectoryPasswordEmpty => 'Påkrevd';

  @override
  String get activeDirectoryErrorTitle => 'Kunne ikke sette opp tilkobling til Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Active Directory kan ikke settes opp for øyeblikket. Når systemet er oppe og går kan du besøke <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for hjelp.';
}
