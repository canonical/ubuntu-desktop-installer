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
  String get welcome => 'Velkommen';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

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
  String get partitionFormatExt4 => 'Ext4-journalfilsystem';

  @override
  String get partitionFormatExt3 => 'Ext3-journalfilsystem';

  @override
  String get partitionFormatExt2 => 'Ext2-filsystem';

  @override
  String get partitionFormatBtrfs => 'btrfs-journalfilsystem';

  @override
  String get partitionFormatJfs => 'JFS-journalfilsystem';

  @override
  String get partitionFormatXfs => 'XFS-journalfilsystem';

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
  String get partitionFormatIso9660 => 'ISO 9660-filsystem';

  @override
  String get partitionFormatVfat => 'VFAT-filsystem';

  @override
  String get partitionFormatNtfs => 'NTFS-filsystem';

  @override
  String get partitionFormatReiserFS => 'ReiserFS-filsystem';

  @override
  String get partitionFormatZfsroot => 'ZFS-rotfilsystem';

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
  String get turnOffBitlockerDescription => 'Maskinen bruker Windows BitLocker-kryptering.\nDu må skru dette av før du installerer Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Instruks er tilgjengelig hvis du åpner denne siden på en telefon eller en annen enhet: <a href=\"https://$url\"></a>';
  }

  @override
  String get restartIntoWindows => 'Omstart til Windows';

  @override
  String get whereAreYouPageTitle => 'Hvem er du?';

  @override
  String get whereAreYouLocationLabel => 'Sted';

  @override
  String get whereAreYouTimezoneLabel => 'Tidssone';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Velkommen til $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'For rask og fullstendig oversikt over nye funksjoner, gjør $RELEASE databruk enklere enn noensinne. Her er noen av de kule tingene å sjekke ut …';
  }

  @override
  String get softwareSlideTitle => 'Finn enda mer programvare';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Ta farvel med å søke på nettet etter ny programvare. Med tilgang til Snap-butikken og $RELEASE-pakkebrønnen finner du nye programmer uten. Skriv inn det du leter etter, eller utforsk kategorier som f.eks. grafikk og fotografi, spill og produktivitet, sammen med nyttige vurderinger fra andre brukere.';
  }

  @override
  String get musicSlideTitle => 'Ta musikken din med deg';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE kommer med den fantastiske Rhythmbox-musikkspilleren. Med avanserte avspillingsvalg er det enkelt å lage en spilleliste av de perfekte sporene. Det fungerer flott med CD-er og portable musikkspillere, så du kan ta med deg musikken din uansett hvor du drar.';
  }

  @override
  String get musicSlideRhythmbox => 'Rythmbox-musikkspilleren';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Kos deg med bildene dine';

  @override
  String get photoSlideDescription => 'Shotwell er et hendig verktøy for organisering av bilder som er klar for enheten dine. Koble til et kamera eller en telefon for å overføre bildene dine, deretter er det enkelt å dele dem og holde dem trygge. Hvis du føler deg kreativ kan du finne mange andre bildeprogrammer i utvalget av Ubuntu-programvare.';

  @override
  String get photoSlideShotwell => 'Shotwell-bildeorganisereren';

  @override
  String get photoSlideGimp => 'GIMP-bilderedigerer';

  @override
  String get photoSlideShotcut => 'Shortcut-videoredigerer';

  @override
  String get webSlideTitle => 'Få mer ut av nettet';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE kommer med Firefox, som er en nettleser noen millioner mennesker bruker. Med nett-programmer du ofte bruker (som f.eks. sosiale media eller e-post i nettleseren) kan du ha disse festet på skrivebordet for raskere tilgang, akkurat som programmer på datamaskinen.';
  }

  @override
  String get webSlideFirefox => 'Firefox-nettleseren';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Alt du trenger til kontoret';

  @override
  String get officeSlideDescription => 'LibreOffice er en fri kontorpakke med alt du trenger for å lage dokumenter, regneark, og presentasjoner. Det er kompatibelt med Microsoft Office-filformatene, og gir deg alle funksjonene du trenger.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Tilgang for alle';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'Hjertet i $RELEASE-filosofien er troen på at databruk er for alle. Med avanserte tilgjengelighetsverktøy og alternativer for endring av språk, fargedrakt, og tekststørrelse gjør $RELEASE databruk enkelt for alle — uansett hvor og hvem de er.';
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
    return 'Den offisielle dokumentasjonen dekker mange av de vanligste aspektene ved $RELEASE. Den er tilgjengelig både <a href=\"https://help.ubuntu.com\">på nett</a> og via «Hjelp»-ikonet i dokken.$RELEASE';
  }

  @override
  String get supportSlideQuestions => 'På <a href=\"https://askubuntu.com\">Ask Ubuntu</a> kan du stille spørsmål og søke i en imponerende samling allerede besvarte spørsmål. Støtte på ditt eget språk får du fra <a href=\"https://loco.ubuntu.com/teams\">ditt lokale gemenskapslag</a>.';

  @override
  String get supportSlideResources => 'For veiledning til andre nyttige ressurser kan du besøke <a href=\"https://www.ubuntu.com/support/community-support\">gemenskapsportalen</a> eller nytte <a href=\"https://www.ubuntu.com/support\">kommersiell støtte</a>.';

  @override
  String get includedSoftware => 'Inkludert programvare';

  @override
  String get availableSoftware => 'Tilgjengelig programvare';

  @override
  String get supportedSoftware => 'Støttet programvare';

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
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Du trenger minst $SIZE lagringsplass for å installere $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Denne datamaskinen har kun $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'Den største lagringsenheten på datamaskinen er kun $SIZE.';
  }

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
