import 'app_localizations.dart';

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Ubuntu darbalaukio diegimo programa';

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
  String get quitButtonText => 'Quit installation';

  @override
  String get welcome => 'Sveiki,';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

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
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

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
  String get dontInstallDriverSoftwareNowDescription => 'Vėliau galėsite ją įdiegti, atvėrę Programinę įrangą ir atnaujinimus.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Reikia nurodyti saugumo raktą';

  @override
  String get secureBootSecurityKeysDontMatch => 'Saugumo raktai nesutampa';

  @override
  String get showSecurityKey => 'Rodyti saugumo raktą';

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
  String get updatesOtherSoftwarePageDescription => 'Kokias programas pradžiai norėtumėte įdiegti?';

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
  String get installDriversTitle => 'Įdiegti trečiųjų šalių programinę įrangą, skirtą grafikos ir belaidžio ryšio (Wi-Fi) aparatinei įrangai';

  @override
  String get installDriversSubtitle => 'Šios tvarkyklės yra platinamos pagal licencijas, nurodytas jų dokumentacijoje. Tvarkyklės yra nuosavybinės.';

  @override
  String get installCodecsTitle => 'Atsisiųsti ir įdiegti papildomų medijos formatų palaikymą';

  @override
  String get installCodecsSubtitle => 'Ši programinė įranga yra platinama pagal licencijas, nurodytas jos dokumentacijoje. Kai kuri programinė įranga yra nuosavybinė.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Įspėjimas</font>: Šis kompiuteris daugiau nebėra prijungtas prie elektros maitinimo šaltinio.';
  }

  @override
  String get offlineWarning => 'Šiuo metu nesate prisijungę prie interneto';

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
  String get installationTypeLVMEncryptionSelected => 'Pasirinkta LVM ir šifravimas';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Šifruoti naują $RELEASE diegimą, kad būtų užtikrintas saugumas';
  }

  @override
  String get installationTypeEncryptInfo => 'Kitame žingsnyje pasirinksite saugumo raktą.';

  @override
  String get installationTypeZFS => 'EKSPERIMENTINIS: Ištrinti diską ir naudoti ZFS';

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
    return 'Įdiegti $product šalia $os1 ir $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Įdiegti $product šalia jų';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Įdiegti $product šalia kitų skaidinių';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumentai, muzika ir kiti asmeniniai failai bus išsaugoti. Kas kartą įjungę kompiuterį, galėsite pasirinkti, kurią operacinę sistemą paleisti.';

  @override
  String get installationTypeManual => 'Kažkas kito';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Jūs galite kurti skaidinius, keisti jų dydį arba pasirinkti kelis skaidinius, skirtus $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Ištrinti diską ir įdiegti $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Pasirinkite diską:';

  @override
  String get selectGuidedStorageInfoLabel => 'Bus naudojamas visas diskas:';

  @override
  String get selectGuidedStorageInstallNow => 'Įdiegti dabar';

  @override
  String get installAlongsideSpaceDivider => 'Paskirstykite vietą diske, tempdami žemiau esantį dalytuvą:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num mažesni skaidiniai yra paslėpti. Norėdami didesnių valdymo galimybių, naudokite <a href=\"$url\">išplėstinį skaidymo įrankį</a>';
  }

  @override
  String get installAlongsideResizePartition => 'Keisti skaidinio dydį';

  @override
  String get installAlongsideAllocateSpace => 'Paskirstyti vietą';

  @override
  String get installAlongsideFiles => 'Failai';

  @override
  String get installAlongsidePartition => 'Skaidinys:';

  @override
  String get installAlongsideSize => 'Dydis:';

  @override
  String get installAlongsideAvailable => 'Prieinama:';

  @override
  String get allocateDiskSpace => 'Paskirstyti vietą diske';

  @override
  String get startInstallingButtonText => 'Įdiegti';

  @override
  String get diskHeadersDevice => 'Įrenginys';

  @override
  String get diskHeadersType => 'Tipas';

  @override
  String get diskHeadersMountPoint => 'Prijungimo taškas';

  @override
  String get diskHeadersSize => 'Dydis';

  @override
  String get diskHeadersUsed => 'Panaudotas';

  @override
  String get diskHeadersSystem => 'Sistema';

  @override
  String get diskHeadersFormat => 'Formatuoti';

  @override
  String get freeDiskSpace => 'Laisva vieta';

  @override
  String get newPartitionTable => 'Nauja skaidinių lentelė';

  @override
  String get newPartitionTableConfirmationTitle => 'Sukurti šiame įrenginyje naują tuščią skaidinių lentelę?';

  @override
  String get newPartitionTableConfirmationMessage => 'Jūs pasirinkote skaidyti visą įrenginį. Jeigu jame pratęsite naujos skaidinių lentelės kūrimą, visi esami jo skaidiniai bus pašalinti.\n\nTurėkite omenyje, kad vėliau, jei norėsite, galėsite šią operaciją atšaukti.';

  @override
  String get tooManyPrimaryPartitions => 'Per daug pirminių skaidinių';

  @override
  String get partitionLimitReached => 'Pasiekta riba';

  @override
  String get bootLoaderDevice => 'Įrenginys, skirtas pradinio įkėliklio diegimui';

  @override
  String get partitionCreateTitle => 'Kurti skaidinį';

  @override
  String get partitionEditTitle => 'Taisyti skaidinį';

  @override
  String get partitionSizeLabel => 'Dydis:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Naujo skaidinio tipas:';

  @override
  String get partitionTypePrimary => 'Pirminis';

  @override
  String get partitionTypeLogical => 'Loginis';

  @override
  String get partitionLocationLabel => 'Naujo skaidinio vieta:';

  @override
  String get partitionLocationBeginning => 'Šios vietos pradžia';

  @override
  String get partitionLocationEnd => 'Šios vietos pabaiga';

  @override
  String get partitionFormatLabel => 'Naudojamas kaip:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Ext2 failų sistema';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT failų sistema';

  @override
  String get partitionFormatFat12 => 'FAT12 failų sistema';

  @override
  String get partitionFormatFat16 => 'FAT16 failų sistema';

  @override
  String get partitionFormatFat32 => 'FAT32 failų sistema';

  @override
  String get partitionFormatSwap => 'Mainų sritis';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 failų sistema';

  @override
  String get partitionFormatVfat => 'VFAT failų sistema';

  @override
  String get partitionFormatNtfs => 'NTFS failų sistema';

  @override
  String get partitionFormatReiserFS => 'ReiserFS failų sistema';

  @override
  String get partitionFormatZfsroot => 'ZFS šakninė failų sistema';

  @override
  String get partitionFormatNone => 'Palikti neformatuotą';

  @override
  String get partitionErase => 'Formatuoti skaidinį';

  @override
  String get partitionMountPointLabel => 'Prijungimo taškas:';

  @override
  String get whoAreYouPageTitle => 'Kas jūs esate?';

  @override
  String get whoAreYouPageAutoLogin => 'Automatiškai prisijungti prie paskyros';

  @override
  String get whoAreYouPageRequirePassword => 'Prisijungiant prie paskyros reikalauti slaptažodžio';

  @override
  String get whoAreYouPageRealNameLabel => 'Jūsų vardas';

  @override
  String get whoAreYouPageRealNameRequired => 'Reikia nurodyti vardą';

  @override
  String get whoAreYouPageRealNameTooLong => 'Šis vardas per ilgas.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Jūsų kompiuterio pavadinimas';

  @override
  String get whoAreYouPageComputerNameInfo => 'Pavadinimas yra naudojamas bendraujant su kitais kompiuteriais.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Reikia nurodyti kompiuterio pavadinimą';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Šis kompiuterio pavadinimas per ilgas.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Kompiuterio pavadinimas yra netinkamas';

  @override
  String get whoAreYouPageUsernameLabel => 'Pasirinkite naudotojo vardą';

  @override
  String get whoAreYouPageUsernameRequired => 'Reikia nurodyti naudotojo vardą';

  @override
  String get whoAreYouPageInvalidUsername => 'Netinkamas naudotojo vardas';

  @override
  String get whoAreYouPageUsernameInUse => 'Šis naudotojo vardas jau yra.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Šis vardas yra rezervuotas sisteminiam naudojimui.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Šis vardas per ilgas.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Šiame varde yra netinkamų simbolių.';

  @override
  String get whoAreYouPagePasswordLabel => 'Pasirinkite slaptažodį';

  @override
  String get whoAreYouPagePasswordRequired => 'Reikia nurodyti slaptažodį';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Pakartokite slaptažodį';

  @override
  String get whoAreYouPagePasswordMismatch => 'Slaptažodžiai nesutampa';

  @override
  String get whoAreYouPagePasswordShow => 'Rodyti';

  @override
  String get whoAreYouPagePasswordHide => 'Slėpti';

  @override
  String get writeChangesToDisk => 'Rašyti pakeitimus į diską';

  @override
  String get writeChangesFallbackSerial => 'diskas';

  @override
  String get writeChangesDescription => 'Jei tęsite, žemiau išvardyti pakeitimai bus įrašyti į diskus. Tolimesnius pakeitimus galėsite atlikti rankiniu būdu.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Šių įrenginių skaidinių lentelėms yra atlikti pakeitimai:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Bus pritaikyti šie skaidinių pakeitimai:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'skaidinio #$disk$partition dydis pakeistas iš $oldsize į $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'skaidinys #$disk$partition formatuotas kaip $format ir panaudotas $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'skaidinys #$disk$partition formatuotas kaip $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'skaidinys #$disk$partition panaudotas $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'skaidinys #$disk$partition sukurtas';
  }

  @override
  String get chooseYourLookPageTitle => 'Pasirinkite išvaizdą';

  @override
  String get chooseYourLookPageHeader => 'Vėliau bet kada galėsite tai pakeisti išvaizdos nustatymuose.';

  @override
  String get chooseYourLookPageDarkSetting => 'Tamsi';

  @override
  String get chooseYourLookPageLightSetting => 'Šviesi';

  @override
  String get installationCompleteTitle => 'Įdiegimas baigtas';

  @override
  String readyToUse(Object system) {
    return '**$system** įdiegta ir paruošta naudoti';
  }

  @override
  String restartInto(Object system) {
    return 'Paleisti iš naujo į $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Galite toliau bandyti $RELEASE, tačiau, kol nepaleisite kompiuterio iš naujo, tol jokie atlikti pakeitimai bei sukurti ar atsiųsti dokumentai (failai) nebus išsaugoti.';
  }

  @override
  String get shutdown => 'Išjungti';

  @override
  String get restartNow => 'Paleisti iš naujo dabar';

  @override
  String get continueTesting => 'Tęsti sistemos bandymą';

  @override
  String get turnOffBitlockerTitle => 'Išjungti „BitLocker“';

  @override
  String get turnOffBitlockerDescription => 'Šis kompiuteris naudoja „Windows BitLocker“ šifravimą.\nPrieš įdiegdami Ubuntu, turite „Windows“ sistemoje išjungti „BitLocker“.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Norėdami gauti instrukcijas, atverkite savo telefone ar kitame įrenginyje šią internetinę svetainę: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Paleisti iš naujo į „Windows“';

  @override
  String get whereAreYouPageTitle => 'Kur esate?';

  @override
  String get whereAreYouLocationLabel => 'Vieta';

  @override
  String get whereAreYouTimezoneLabel => 'Laiko juosta';

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
