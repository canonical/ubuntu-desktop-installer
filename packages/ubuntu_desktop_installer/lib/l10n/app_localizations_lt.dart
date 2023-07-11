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
  String get changeButtonText => 'Keisti';

  @override
  String get restartButtonText => 'Paleisti iš naujo';

  @override
  String get revertButtonText => 'Sugrąžinti';

  @override
  String get quitButtonText => 'Baigti diegimą';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Jus sveikina $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'Ruošiama $DISTRO…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Išbandykite arba įsidiekite $DISTRO';
  }

  @override
  String get welcomeRepairOption => 'Taisyti diegimą';

  @override
  String get welcomeRepairDescription => 'Taisymas iš naujo įdiegs visą įdiegtą programinę įrangą nepaveikdamas dokumentų ar nustatymų.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'Išbandyti $RELEASE';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'Galite išbandyti $RELEASE neatlikdami kompiuteryje jokių pakeitimų.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'Įdiegti $RELEASE';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Įsidiekite $RELEASE šalia savo dabartinės operacinės sistemoje arba vietoje jos. Tai neturėtų ilgai užtrukti.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Galite pageidauti perskaityti <a href=\"$url\">laidos informaciją</a>.';
  }

  @override
  String get rstTitle => 'RST yra įjungta';

  @override
  String get rstHeader => 'Norėdami tęsti, išjunkite RST';

  @override
  String get rstDescription => 'Šis kompiuteris naudoja Intel RST (Rapid Storage Technology). Prieš įdiegdami Ubuntu, turite „Windows“ sistemoje išjungti RST.';

  @override
  String rstInstructions(Object url) {
    return 'Norėdami skaityti instrukcijas, nuskenuokite kitu įrenginiu QR kodą arba apsilankykite adresu: <a href=\"https://$url\">$url</a>';
  }

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
  String get updatesOtherSoftwarePageTitle => 'Programos ir atnaujinimai';

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
    return '<font color=\"$color\">Įspėjimas:</font> Šis kompiuteris daugiau nebėra prijungtas prie elektros maitinimo šaltinio.';
  }

  @override
  String get offlineWarning => 'Šiuo metu nesate prisijungę prie interneto';

  @override
  String get chooseSecurityKeyTitle => 'Saugumo raktas';

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
    return '<font color=\"$color\">Įspėjimas:</font> Jei prarasite šį saugumo raktą, visi duomenys bus prarasti. Jei reikia, užsirašykite raktą ir laikykite jį atokiai saugioje vietoje.';
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
  String get installationTypeManual => 'Rankinis skaidymas';

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
  String get allocateDiskSpace => 'Rankinis skaidymas';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Mount points must start with \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Mount points cannot contain spaces';

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
  String get newPartitionTableConfirmationTitle => 'Naujas tuščias skaidinys';

  @override
  String get newPartitionTableConfirmationMessage => 'Sukūrus naują skaidinių lentelę visame įrenginyje, bus pašalinti visi jo dabartiniai skaidiniai. Jei reikia, šią operaciją galima atšaukti.';

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
  String get partitionFormatNone => 'Palikti neformatuotą';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'Formatuoti skaidinį';

  @override
  String get partitionMountPointLabel => 'Prijungimo taškas:';

  @override
  String get confirmPageTitle => 'Pasiruošę įdiegti';

  @override
  String get confirmHeader => 'Jei tęsite, žemiau išvardyti pakeitimai bus įrašyti į diskus. Tolimesnius pakeitimus galėsite atlikti rankiniu būdu.';

  @override
  String get confirmDevicesTitle => 'Įrenginiai';

  @override
  String get confirmPartitionsTitle => 'Skaidiniai';

  @override
  String get confirmPartitionTables => 'Šių įrenginių skaidinių lentelėms yra atlikti pakeitimai:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'Bus pritaikyti šie skaidinių pakeitimai:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'skaidinio <b>$sysname</b> dydis pakeistas iš <b>$oldsize</b> į <b>$newsize</b>';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'skaidinys <b>$sysname</b> formatuotas kaip <b>$format</b> ir panaudotas kaip <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'skaidinys <b>$sysname</b> formatuotas kaip <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'skaidinys <b>$sysname</b> panaudotas kaip <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'sukurtas skaidinys <b>$sysname</b>';
  }

  @override
  String get confirmInstallButton => 'Įdiegti';

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
  String get bitlockerTitle => '„BitLocker“ yra įjungta';

  @override
  String get bitlockerHeader => 'Norėdami tęsti, išjunkite „BitLocker“';

  @override
  String bitlockerDescription(Object option) {
    return 'Šis kompiuteris naudoja „Windows BitLocker“ šifravimą.\nNorėdami tęsti, turite pasinaudoti „Windows“ ir sukurti laisvą vietą arba pasirinkti variantą \'$option\'.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Norėdami skaityti instrukcijas, nuskenuokite kitu įrenginiu QR kodą arba apsilankykite adresu: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Paleisti iš naujo į „Windows“';

  @override
  String get restartIntoWindowsTitle => 'Paleisti iš naujo į „Windows“ sistemą?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Ar tikrai norite paleisti kompiuterį iš naujo? Vėliau jums teks pradėti $DISTRO diegimą iš naujo, kad užbaigtumėte diegti $DISTRO.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Jus sveikina $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Prieinama:';

  @override
  String get installationSlidesIncluded => 'Įtraukta:';

  @override
  String get installationSlidesWelcomeTitle => 'Greita, nemokama ir pilna naujų ypatybių';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'Naujausia $DISTRO versija paverčia naudojimąsi kompiuteriu neįtikėtinai lengvu.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Nepaisant to, ar esate plėtotojas, kūrėjas, žaidimų megėjas ar administratorius, atrasite naujus įrankius, kurie pagerins produktyvumą ir jūsų patyrimą su $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Visos reikiamos programos';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Diekite, tvarkykite ir atnaujinkite visas savo programas naudodamiesi „Ubuntu Software“, įskaitant tūkstančius programų iš tiek „Snap Store“, tiek $DISTRO archyvo.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Plėtokite naudodami geriausią, ką siūlo atvirasis kodas';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO yra tobula kompiuterizuota darbo vieta, skirta programų ar saityno plėtojimui, duomenų mokslui bei dirbtinio intelekto/kompiuterio mokymosi vystymui, o taip pat plėtojimo operacijoms ir administravimui. Kiekvienoje $DISTRO laidoje yra naujausios įrankių grandinės ir yra palaikomos visos pagrindinės integruotosios plėtojimo aplinkos.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Vystykite savo kūrybingumą';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Jei esate animatorius, dizaineris, vaizdo įrašų kūrėjas ar žaidimų plėtotojas, be vargo perkelsite savo darbo eigą į $DISTRO, kuri palaiko atvirojo kodo ir pramoninių standartų programinę įrangą bei programas.';
  }

  @override
  String get installationSlidesGamingTitle => 'Puikiai tinka žaidimams';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO palaiko naujausias „NVIDIA“ ir „Mesa“ tvarkykles, kad pagerintų našumą ir suderinamumą. Tūkstančiai „Windows“ žaidimų pavadinimų, tokių programų kaip „Steam“ dėka, be jokios papildomos konfigūracijos gali būti paleisti $DISTRO.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privati ir saugi';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO teikia visus reikiamus įrankius, kad privačiai naudotumėtės internetu ir išliktumėte saugūs. Dėka užkardos ir VPN palaikymo bei daugelio į privatumą orientuotų programų, yra užtikrinama, kad niekas kitas, o tik jūs galėtumėte pilnai valdyti savo duomenis.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Visoms $DISTRO LTS laidoms 5 metų laikotarpyje yra teikiamos saugumo spragų pataisos. Šį laikotarpį „Ubuntu Pro“ prenumeratos dėka galima pratęsti iki 10 metų.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Padidinkite savo produktyvumą';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return 'Į $DISTRO darbalaukį įeina LibreOffice, raštinės programų rinkinys, suderinamas su „Microsoft Office“. Jį sudaro programos, skirtos kurti dokumentus, skaičiuokles bei pateiktis. Taip pat yra prieinami populiarūs bendradarbiavimo įrankiai.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Prieinama visiems';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return '$DISTRO filosofijos gelmėje yra įsitikinimas, jog naudojimasis kompiuteriu yra prieinamas kiekvienam. Dėka išplėstinių prieinamumo įrankių ir parametrų, skirtų keisti kalbą, spalvas bei teksto dydį, $DISTRO paverčia naudojimąsi kompiuteriu lengvu – nepaisant to, kur esate ar kas bebūtumėte.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca ekrano skaityklė';

  @override
  String get installationSlidesAccessibilityLanguages => 'Kalbos palaikymas';

  @override
  String get installationSlidesSupportTitle => 'Pagalba ir palaikymas';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'Oficiali $DISTRO dokumentacija yra prieinama tiek internete, tiek spustelėjus ant žinyno piktogramos doke.';
  }

  @override
  String get installationSlidesSupportCommunity => '„Ask Ubuntu“ apima didelį klausimų ir atsakymų spektrą, o „Ubuntu Discourse“ teikia žinyną bei patarimus tiek naujiems, tiek pažengusiems naudotojams.';

  @override
  String get installationSlidesSupportEnterprise => 'Naudotojams iš įmonių Canonical teikia komercinį palaikymą, padėdama darbo vietoje lengvai pritaikyti ir saugiai valdyti Ubuntu.';

  @override
  String get installationSlidesSupportResources => 'Naudingi ištekliai:';

  @override
  String get installationSlidesSupportDocumentation => 'Oficiali dokumentacija';

  @override
  String get installationSlidesSupportUbuntuPro => 'Naudotojų iš įmonių palaikymas 24/7 naudojant „Ubuntu Pro“';

  @override
  String get copyingFiles => 'Kopijuojami failai…';

  @override
  String get installingSystem => 'Įdiegiama sistema…';

  @override
  String get configuringSystem => 'Nustatoma sistema…';

  @override
  String get installationFailed => 'Nepavyko įdiegti';

  @override
  String get notEnoughDiskSpaceTitle => 'Trūksta vietos';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Nepakanka vietos diske, kad būtų įdiegta $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Prieinama:';

  @override
  String get notEnoughDiskSpaceRequired => 'Reikia:';

  @override
  String get activeDirectoryTitle => 'Konfigūruoti „Active Directory“';

  @override
  String get activeDirectoryTestConnection => 'Išbandyti jungiamumą su domenu';

  @override
  String get activeDirectoryDomainLabel => 'Domenas';

  @override
  String get activeDirectoryDomainEmpty => 'Būtina';

  @override
  String get activeDirectoryDomainTooLong => 'Per ilgas';

  @override
  String get activeDirectoryDomainInvalidChars => 'Netinkami simboliai';

  @override
  String get activeDirectoryDomainStartDot => 'Prasideda tašku (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Pasibaigia tašku (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Prasideda brūkšneliu (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Pasibaigia brūkšneliu (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Turi kelis taškus iš eilės (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domenas nerastas';

  @override
  String get activeDirectoryAdminLabel => 'Prisijungimo prie domeno naudotojas';

  @override
  String get activeDirectoryAdminEmpty => 'Būtina';

  @override
  String get activeDirectoryAdminInvalidChars => 'Netinkami simboliai';

  @override
  String get activeDirectoryPasswordLabel => 'Slaptažodis';

  @override
  String get activeDirectoryPasswordEmpty => 'Būtina';

  @override
  String get activeDirectoryErrorTitle => 'Klaida konfigūruojant ryšį su „Active Directory“';

  @override
  String get activeDirectoryErrorMessage => 'Atleiskite, šiuo metu „Active Directory“ negali būti nustatyta. Kai tik jūsų sistema bus paleista, apsilankykite adresu <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, kad gautumėte išsamesnės informacijos.';
}
