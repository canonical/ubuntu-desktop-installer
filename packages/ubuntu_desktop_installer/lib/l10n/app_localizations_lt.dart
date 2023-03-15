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
  String welcomeSlideTitle(Object RELEASE) {
    return 'Jus sveikina $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Greita ir pilna naujų ypatybių, naujausia $RELEASE versija leidžia naudotis kompiuteriu dar lengviau nei bet kada anksčiau. Štai keli naudingi dalykai, į kuriuos verta atkreipti dėmesį...';
  }

  @override
  String get softwareSlideTitle => 'Atraskite dar daugiau programinės įrangos';

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
  String get accessSlideAppearance => 'Appearance';

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
