import 'app_localizations.dart';

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get appTitle => 'Instalilo de Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instali $RELEASE';
  }

  @override
  String get changeButtonText => 'Ŝanĝi';

  @override
  String get quitButtonText => 'Ĉesi instaladon';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Bonvenon al $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'Preparante $DISTRO…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Provi aŭ instali $DISTRO';
  }

  @override
  String get welcomeRepairOption => 'Ripari instalaĵon';

  @override
  String get welcomeRepairDescription => 'Riparado reinstalos ĉiujn instalitajn programojn sen modifi dokumentojn aŭ agordojn.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'Provi $RELEASE';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'Vi povas provi $RELEASE sen iel ajn ŝanĝi vian komputilon.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'Instali $RELEASE';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Instali $RELEASE apud (aŭ anstataŭ) via aktuala mastruma sistemo. Tio ne daŭros tro longe.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Vi eble volas legi la <a href=\"$url\">liverajn notojn</a>.';
  }

  @override
  String get rstTitle => 'Rapid-Konserveja Tekniko (RST) estas ŝaltita';

  @override
  String get rstHeader => 'Malŝaltu RST por daŭrigi';

  @override
  String get rstDescription => 'Ĉi tiu komputilo uzas Intel RST (Rapid-Konservejan Teknikon). Vi devas malŝalti RST en Windows antaŭ ol instali Ubuntu.';

  @override
  String rstInstructions(Object url) {
    return 'Por instrukcioj, skanu la QR-kodon per alia aparato, aŭ vizitu la jenon: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get configureSecureBootTitle => 'Agordi Sekuran Praŝargon';

  @override
  String get configureSecureBootDescription => 'Vi elektis instali triapartiajn zorgilojn. Tio postulas malŝalti Sekuran Praŝargon.\nPor tio, vi devas elekti sekurigan ŝlosilon nun kaj tajpu ĝin, kiam la sistemo restartas.';

  @override
  String get configureSecureBootOption => 'Agordi Sekuran Praŝargon';

  @override
  String get chooseSecurityKey => 'Elektu sekurigan ŝlosilon';

  @override
  String get confirmSecurityKey => 'Konfirmu la sekurigan ŝlosilon';

  @override
  String get dontInstallDriverSoftwareNow => 'Ne instali zorgilojn nun';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Vi povas instali ilin poste per Programaroj kaj Ĝisdatigoj.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Sekuriga ŝlosilo bezoniĝas';

  @override
  String get secureBootSecurityKeysDontMatch => 'La sekurigaj ŝlosiloj ne kongruas';

  @override
  String get showSecurityKey => 'Montri sekurecŝlosilon';

  @override
  String get connectToInternetPageTitle => 'Konekti al reto';

  @override
  String get connectToInternetDescription => 'Konektado de ĉi tiu komputilo al Interreto helpos Ubuntu instali ajnajn kromajn programojn bezonatajn kaj helpos vin elekti vian horzonon.\n\nKonektu per Eterreta kablo, aŭ elektu sendratan reton.';

  @override
  String get useWiredConnection => 'Uzi dratan konekton';

  @override
  String get noWiredConnection => 'Neniu drata konekto troviĝis';

  @override
  String get wiredDisabled => 'Drataj retoj estas malŝaltitaj';

  @override
  String get wiredMustBeEnabled => 'Por uzi Eterreton kun ĉi tiu komputilo, vi devas ebligi dratajn retojn';

  @override
  String get enableWired => 'Ebligi dratajn retojn';

  @override
  String get selectWifiNetwork => 'Konekti al sendrata reto';

  @override
  String get hiddenWifiNetwork => 'Konekti al kaŝita sendrata reto';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nomo de reto';

  @override
  String get hiddenWifiNetworkNameRequired => 'Nomo de reto estas postulata';

  @override
  String get noInternet => 'Mi ne volas konekti al Interreto nun';

  @override
  String get wirelessNetworkingDisabled => 'Sendrataj retoj estas malŝaltitaj';

  @override
  String get noWifiDevicesDetected => 'Neniu sendratreta aparato troviĝis';

  @override
  String get wifiMustBeEnabled => 'Por uzi sendratajn retojn kun ĉi tiu komputilo, vi devas ebligi sendratajn retojn';

  @override
  String get enableWifi => 'Ebligi sendratajn retojn';

  @override
  String get updatesOtherSoftwarePageTitle => 'Programoj kaj ĝisdatigoj';

  @override
  String get updatesOtherSoftwarePageDescription => 'Kiajn programojn vi volas instali por komenci?';

  @override
  String get normalInstallationTitle => 'Ordinara instalado';

  @override
  String get normalInstallationSubtitle => 'TTT-legilo, ilaĵoj, oficejaj programoj, ludoj kaj spektiloj.';

  @override
  String get minimalInstallationTitle => 'Minimuma instalado';

  @override
  String get minimalInstallationSubtitle => 'TTT-legilo kaj bazaj ilaĵoj.';

  @override
  String get otherOptions => 'Aliaj opcioj';

  @override
  String get installThirdPartyTitle => 'Instali triapartiajn programojn por grafiko kaj sendrataj retaj aparatoj, kune kun kromajn videaj dosierformoj';

  @override
  String get installThirdPartySubtitle => 'Tiuj programoj estas disponeblaj laŭ permesiloj inkluzivitaj en siaj dokumentaroj. Kelkaj el ili estas neliberaj.';

  @override
  String get installDriversTitle => 'Instali triapartiajn programojn por grafiko kaj sendrataj retaj aparatoj';

  @override
  String get installDriversSubtitle => 'Tiuj programoj estas disponeblaj laŭ permesiloj inkluzivitaj en siaj dokumentaroj. Ili estas neliberaj.';

  @override
  String get installCodecsTitle => 'Elŝuti kaj instali programojn por kromaj videaj dosierformoj';

  @override
  String get installCodecsSubtitle => 'Tiuj programoj estas disponeblaj laŭ permesiloj inkluzivitaj en siaj dokumentaroj. Kelkaj el ili estas neliberaj.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Averto:</font> La komputilo ne estas konektita al energifonto.';
  }

  @override
  String get offlineWarning => 'Vi estas aktuale ne konektita al Interreto';

  @override
  String get chooseSecurityKeyTitle => 'Sekuriga ŝlosilo';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Ĉifrado de la disko protektos viajn dosierojn, se vi perdos vian komputilon. Ĝi postulas, ke vi ĉiufoje tajpu sekurigan ŝlosilon por startigi vian komputilon.\n\nAjna dosieroj ekster $RELEASE restos neĉifritaj.';
  }

  @override
  String get chooseSecurityKeyHint => 'Elektu sekurigan ŝlosilon';

  @override
  String get chooseSecurityKeyConfirmHint => 'Konfirmu la sekurigan ŝlosilon';

  @override
  String get chooseSecurityKeyRequired => 'Sekuriga ŝlosilo bezoniĝas';

  @override
  String get chooseSecurityKeyMismatch => 'La sekurigaj ŝlosiloj ne kongruas';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Averto:</font> Se vi perdos ĉi tiun sekurigan ŝlosilon, vi perdos ĉiom da datenoj. Skribu vian ŝlosilon kaj konservu ĝin en sekura alia loko, se tio necesas.';
  }

  @override
  String get installationTypeTitle => 'Speco de instalado';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Ĉi tiu komputilo aktuale portas instalaĵon de $os. Kion vi volas?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Ĉi tiu komputilo aktuale portas instalaĵojn de $os1 kaj $os2. Kion vi volas?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Ĉi tiu komputilo aktuale portas instalaĵojn de pluraj mastrumaj sistemoj. Kion vi volas?';

  @override
  String get installationTypeNoOSDetected => 'Ĉi tiu komputilo aktuale portas neniun troveblan instalaĵon de mastruma sistemo. Kion vi volas?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Forviŝi la diskon kaj instali $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Averto:</font> Tio forviŝos ĉiujn viajn programojn, dokumentojn, fotojn, muzikon kaj ĉiajn aliajn dosierojn en ĉiuj mastrumaj sistemoj.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Altnivelaj trajtoj…';

  @override
  String get installationTypeAdvancedTitle => 'Altnivelaj trajtoj';

  @override
  String get installationTypeNone => 'Nenio';

  @override
  String get installationTypeNoneSelected => 'Nenio elektita';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Uzi LVM por la nova instalaĵo de $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM elektita';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM kaj ĉifrado elektitaj';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Ĉifri la novan instalaĵon de $RELEASE por sekurigi ĝin';
  }

  @override
  String get installationTypeEncryptInfo => 'Vi elektos sekurigan ŝlosilon dum la sekva paŝo.';

  @override
  String get installationTypeZFS => 'EKSPERIMENTE: Forviŝi la diskon kaj uzi la dosiersistemon ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS elektita';

  @override
  String installationTypeReinstall(Object os) {
    return 'Forviŝi $os kaj reinstali';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Avertio:</font> Tio forviŝos ĉiujn programojn de $os, dokumentojn, fotojn, muzikon kaj ĉiajn aliajn dosierojn.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Instali $product apud $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Instali $product apud $os1 kaj $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Instali $product apud ili';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Instali $product apud aliaj subdiskoj';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumentoj, muziko kaj aliaj personaj dosieroj estas konservotaj. Vi povos elekti tiun mastruman sistemon, kiun vi volas, kiam la komputilo startas.';

  @override
  String get installationTypeManual => 'Neaŭtomata dispartigo';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Vi povas mem krei subdiskojn aŭ ŝanĝi iliajn grandojn, aŭ elekti plurajn subdiskojn por $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Forviŝi la diskon kaj instali $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Elektu diskon:';

  @override
  String get selectGuidedStorageInfoLabel => 'La tuta disko estas uzota:';

  @override
  String get selectGuidedStorageInstallNow => 'Ekinstali';

  @override
  String get installAlongsideSpaceDivider => 'Asignu diskospacon ŝovante la jenan dividilon:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num etaj subdiskoj estas kaŝitaj; uzu la <a href=\"$url\">altnivelan subdiskilon</a> por agordi tiujn';
  }

  @override
  String get installAlongsideResizePartition => 'Ŝanĝi grandon de subdisko';

  @override
  String get installAlongsideAllocateSpace => 'Asigni spacon';

  @override
  String get installAlongsideFiles => 'Dosieroj';

  @override
  String get installAlongsidePartition => 'Subdisko:';

  @override
  String get installAlongsideSize => 'Grando:';

  @override
  String get installAlongsideAvailable => 'Disponebla:';

  @override
  String get allocateDiskSpace => 'Neaŭtomata dispartigo';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Surmetingo devas komenciĝi per «/»';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Surmetingo devas ne enhavi spaceton';

  @override
  String get diskHeadersDevice => 'Aparato';

  @override
  String get diskHeadersType => 'Speco';

  @override
  String get diskHeadersMountPoint => 'Surmetingo';

  @override
  String get diskHeadersSize => 'Grando';

  @override
  String get diskHeadersUsed => 'Uzata';

  @override
  String get diskHeadersSystem => 'Sistemo';

  @override
  String get diskHeadersFormat => 'Strukturo';

  @override
  String get freeDiskSpace => 'Disponebla spaco';

  @override
  String get newPartitionTable => 'Nova subdiskotabelo';

  @override
  String get newPartitionTableConfirmationTitle => 'Nova malplena subdisko';

  @override
  String get newPartitionTableConfirmationMessage => 'Kreado de nova subdiskotabelo sur la tuta aparato forviŝos ĉiujn ekzistantajn subdiskojn. Vi povos laŭvole malfari ĉi tiun operacion poste.';

  @override
  String get tooManyPrimaryPartitions => 'Tro da unuagradaj subdiskoj';

  @override
  String get partitionLimitReached => 'Limo atingiĝis';

  @override
  String get bootLoaderDevice => 'Aparato, sur kiun instaliĝos la praŝargilo';

  @override
  String get partitionCreateTitle => 'Krei subdiskon';

  @override
  String get partitionEditTitle => 'Modifi subdiskon';

  @override
  String get partitionSizeLabel => 'Grando:';

  @override
  String get partitionTypeLabel => 'Speco de nova subdisko:';

  @override
  String get partitionTypePrimary => 'Unuagrada';

  @override
  String get partitionTypeLogical => 'Logika';

  @override
  String get partitionLocationLabel => 'Loko de nova subdisko:';

  @override
  String get partitionLocationBeginning => 'Komenco de ĉi tiu spaco';

  @override
  String get partitionLocationEnd => 'Fino de ĉi tiu spaco';

  @override
  String get partitionFormatLabel => 'Uzata kiel:';

  @override
  String get partitionFormatNone => 'Lasi nestrukturita';

  @override
  String partitionFormatKeep(Object format) {
    return 'Lasi nestrukturita kiel $format';
  }

  @override
  String get partitionErase => 'Restrukturi la subdiskon';

  @override
  String get partitionMountPointLabel => 'Surmetingo:';

  @override
  String get confirmPageTitle => 'Preta por instalado';

  @override
  String get confirmHeader => 'Se vi daŭrigos, la ĉi-subaj ŝanĝoj estos skribitaj sur la diskojn. Vi povos permane fari pliajn ŝanĝojn.';

  @override
  String get confirmDevicesTitle => 'Aparatoj';

  @override
  String get confirmPartitionsTitle => 'Subdiskoj';

  @override
  String get confirmPartitionTables => 'La subdiskotabeloj de la jenaj aparatoj estas ŝanĝotaj:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'La jenaj ŝanĝoj pri subdiskoj estas efektivigotaj:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'ŝanĝi la grandon de la subdisko <b>$sysname</b> de <b>$oldsize</b> al <b>$newsize</b>';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'la subdisko <b>$sysname</b> strukturota laŭ <b>$format</b> kaj uzota por <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'la subdisko <b>$sysname</b> strukturota laŭ <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'la subdisko <b>$sysname</b> uzota por <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'krei la subdiskon <b>$sysname</b>';
  }

  @override
  String get confirmInstallButton => 'Instali';

  @override
  String get installationCompleteTitle => 'Instalado finiĝis';

  @override
  String readyToUse(Object system) {
    return '**$system** estas instalita kaj preta por uzo';
  }

  @override
  String restartInto(Object system) {
    return 'Restartigi al $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Vi povas daŭre elprovi $RELEASE, sed kiam la komputilo restartos, forĵetiĝos ĉiuj ŝanĝoj farotaj de vi kaj dokumentoj konservotaj de vi.';
  }

  @override
  String get shutdown => 'Malŝalti';

  @override
  String get restartNow => 'Restartigi nun';

  @override
  String get continueTesting => 'Daŭre elprovi';

  @override
  String get bitlockerTitle => 'BitLocker estas ŝaltita';

  @override
  String get bitlockerHeader => 'Malŝaltu BitLocker por daŭrigi';

  @override
  String bitlockerDescription(Object option) {
    return 'Ĉi tiun komputilon ĉifras Windows BitLocker.\nLiberigu diskospacon per Windows, aŭ elektu «$option» por daŭrigi.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Por instrukcioj, skanu la QR-kodon per alia aparato, aŭ vizitu la jenon: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restartigi al Windows';

  @override
  String get restartIntoWindowsTitle => 'Ĉu restartigi al Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Ĉu vi certas, ke vi volas restartigi vian komputilon? Vi devos rekomenci la instaladon de $DISTRO poste por fini instali $DISTRO.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Bonvenon al $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Instaleblaj:';

  @override
  String get installationSlidesIncluded => 'Inkluzivitaj:';

  @override
  String get installationSlidesWelcomeTitle => 'Rapida, senpaga, plena de novaj funkcioj';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'La nova versio de $DISTRO igas komputadon pli facila ol iam ajn.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Ĉu vi programas, kreas, ludas aŭ administras? Vi trovos novajn rimedojn por plibonigi viajn produktivecon kaj sperton en $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Ĉiom da programoj, kiom vi bezonas';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Instalu, administru kaj ĝisdatigu ĉiujn viajn programojn per Ubuntu-Programvendejo, inkluzive de miloj da programoj en la Snap-Vendejo kaj en la arkivoj de $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Programu helpate de malfermitaj kodoj';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO estas la ideala laborstacio por verkado de poŝaparataj kaj Interretaj programoj, datenscienco, artefarita intelekto, maŝina lernado, evoluoperacioj kaj servila administrado. Ĉiu versio de $DISTRO inkluzivas la plej novajn ilĉenojn kaj subtenas ĉiujn precipajn programadmediojn.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Pliigu vian povon krei';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Se vi estas movbildisto, dezajnisto, videoverkisto aŭ ludprogramisto, estas facile alporti viajn laborfluojn al $DISTRO uzante malfermitkodajn kaj industrie normajn programojn.';
  }

  @override
  String get installationSlidesGamingTitle => 'Bonega por videoludoj';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO subtenas la plej novajn zorgilojn de NVIDIA kaj Mesa por plibonigi rendimenton kaj kongruecon. Miloj da videoludoj por Windows ludiĝas bonege sur $DISTRO per Steam kaj aliaj programoj sen kroma agordado.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privata kaj sekura';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provizas ĉiujn ilojn, kiujn vi bezonas por resti privata kaj sekura Interrete. Per subtenataj fajroŝirmilo kaj virtuala privata reto kaj amaso da privatigaj programoj, vi povas certigi, ke vi plene regas viajn datenojn.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Ĉiu Longdaŭre Subtenata (LTS) versio de $DISTRO provizas kvin jarojn da sekurigaj flikoj; abono de Ubuntu Pro plilongigas tion al dek jaroj.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Produktiviĝu';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO inkluzivas LibreOffice, malfermitkodan oficejan programaron kongruan kun Microsoft Office por verki dokumentojn, kalkultabelojn kaj prezentaĵojn. Popularaj kunlaboriloj ankaŭ estas haveblaj.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Uzebla por ĉiuj';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'Ĉe la koro de la filozofio de $DISTRO estas la kredo, ke komputado estu por ĉiuj. Per altnivelaj alirebligiloj kaj la kapablo ŝanĝi lingvon, kolorojn kaj tekstograndon, $DISTRO faciligas komputadon – por ĉiuj ajn, ĉie ajn.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Ekranlegilo Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Lingvosubteno';

  @override
  String get installationSlidesSupportTitle => 'Helpo kaj subteno';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'La oficiala dokumentaro de $DISTRO estas havebla Interrete kaj per la Helpo-piktogramo en la doko.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ĉe Ask Ubuntu troviĝas gamo da demandoj kaj respondoj, kaj ĉe Ubuntu Discourse estas gvidiloj kaj diskutejoj por kaj novaj kaj spertaj uzantoj.';

  @override
  String get installationSlidesSupportEnterprise => 'Al entreprenoj, Canonical ofertas komercan subtenon por facile enkonduki kaj sekure administri Ubuntu.';

  @override
  String get installationSlidesSupportResources => 'Utilaj rimedoj:';

  @override
  String get installationSlidesSupportDocumentation => 'Oficiala dokumentaro';

  @override
  String get installationSlidesSupportUbuntuPro => 'Entreprene taŭga subteno ĉiutage ĉiuhore per Ubuntu Pro';

  @override
  String get copyingFiles => 'Kopiante dosierojn…';

  @override
  String get installingSystem => 'Instalante la sistemon…';

  @override
  String get configuringSystem => 'Agordante la sistemon…';

  @override
  String get installationFailed => 'Instalado fiaskis';

  @override
  String get notEnoughDiskSpaceTitle => 'Ne sufiĉas spaco';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Ne sufiĉas diska spaco por instali $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Disponebla:';

  @override
  String get notEnoughDiskSpaceRequired => 'Bezonata:';
}
