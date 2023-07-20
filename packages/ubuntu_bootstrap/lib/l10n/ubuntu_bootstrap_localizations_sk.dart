import 'ubuntu_bootstrap_localizations.dart';

/// The translations for Slovak (`sk`).
class UbuntuBootstrapLocalizationsSk extends UbuntuBootstrapLocalizations {
  UbuntuBootstrapLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Inštalátor Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Nainštalovať $RELEASE';
  }

  @override
  String get changeButtonText => 'Zmeniť';

  @override
  String get quitButtonText => 'Opustiť inštaláciu';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Vitajte v $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'Pripravuje sa $DISTRO…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Vyskúšať alebo nainštalovať $DISTRO';
  }

  @override
  String get welcomeRepairOption => 'Opraviť inštaláciu';

  @override
  String get welcomeRepairDescription => 'Opravou preinštalujete všetok nainštalovaný softvér bez toho, aby sa to dotklo dokumentov alebo nastavení.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'Vyskúšať $RELEASE';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'Môžete vyskúšať $RELEASE bez vykonania zmien vo vašom počítači.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'Nainštalovať $RELEASE';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Nainštalujte $RELEASE spoločne z (alebo namiesto) vášho operačného systému. Nemalo by to trvať dlho.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Mohli by ste mať záujem o prečítanie si <a href=\"$url\">poznámok k vydaniu</a>.';
  }

  @override
  String get rstTitle => 'RST je zapnuté';

  @override
  String get rstHeader => 'Aby bolo možné pokračovať, vypnite RST';

  @override
  String get rstDescription => 'Na tomto počítači je zapnutá technológia Intel RST (Rapid Storage Technology). Aby bolo možné Ubuntu nainštalovať, je potrebné vo Windows funkciu RST vypnúť.';

  @override
  String rstInstructions(Object url) {
    return 'Ohľadne pokynov naskenujte QR kód na inom zariadení alebo choďte na: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get configureSecureBootTitle => 'Nastaviť Secure Boot';

  @override
  String get configureSecureBootDescription => 'Vybrali ste nainštalovať ovládač hardvéru, pochádzajúci od tretej strany. Aby to bolo možné, je potrebné vypnúť Secure Boot.\nTo urobíte vytvorením kľúča zabezpečenia a jeho následným zadaním po reštarte systému.';

  @override
  String get configureSecureBootOption => 'Nastaviť Secure Boot';

  @override
  String get chooseSecurityKey => 'Vyberte si bezpečnostný kľúč';

  @override
  String get confirmSecurityKey => 'Zopakujte zadanie bezpečnostného kľúča';

  @override
  String get dontInstallDriverSoftwareNow => 'Zatiaľ neinštalujte softvér ovládača';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Je ho možné nainštalovať kedykoľvek neskôr pomocou nástroja „Softvér a aktualizácie“.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Je potrebné zadať kľúč zabezpečenia';

  @override
  String get secureBootSecurityKeysDontMatch => 'Do každej z kolónok pre kľúč zabezpečenia ste napísali niečo iné';

  @override
  String get showSecurityKey => 'Zobraziť kľúč zabezpečenia';

  @override
  String get updatesOtherSoftwarePageTitle => 'Aplikácie a aktualizácie';

  @override
  String get updatesOtherSoftwarePageDescription => 'Ktoré aplikácie chcete mať ihneď od začiatku nainštalované?';

  @override
  String get normalInstallationTitle => 'Normálna inštalácia';

  @override
  String get normalInstallationSubtitle => 'Webový prehliadač, nástroje, kancelársky softvér, hry a prehrávače multimédií.';

  @override
  String get minimalInstallationTitle => 'Minimálna inštalácia';

  @override
  String get minimalInstallationSubtitle => 'Webový prehliadač a základné nástroje.';

  @override
  String get otherOptions => 'Ďalšie možnosti';

  @override
  String get installThirdPartyTitle => 'Nainštalovať ovládače tretích strán pre grafické čipy a adaptéry bezdrôtových Wi-Fi sietí, ako aj dodatočné kodeky multimédií';

  @override
  String get installThirdPartySubtitle => 'Tento softvér je predmetom licenčných dojednaní, obsiahnutých v dokumentácii k nemu. Niektorý je proprietárny.';

  @override
  String get installDriversTitle => 'Nainštalovať ovládače od tretích strán pre grafické čipy a Wi-Fi sieťové rozhrania';

  @override
  String get installDriversSubtitle => 'Tieto ovládače sú predmetom licenčných dojednaní obsiahnutých v dokumentácii k nim. Sú proprietárne.';

  @override
  String get installCodecsTitle => 'Stiahnuť a nainštalovať podporu pre ďalšie formáty médií';

  @override
  String get installCodecsSubtitle => 'Tento softvér je predmetom licenčných dojednaní obsiahnutých v dokumentácii k nemu. Niektoré sú proprietárne.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Upozornenie:</font> Počítač nie je pripojený k napájaniu zo zásuvky.';
  }

  @override
  String get offlineWarning => 'V tejto chvíli nie ste pripojení na Internet';

  @override
  String get chooseSecurityKeyTitle => 'Kľúč zabezpečenia';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Šifrovanie disku chráni vaše súbory v prípade straty počítača. Vyžaduje, aby ste pri každom spustení počítača zadali bezpečnostný kľúč.\n\nŽiadne súbory mimo $RELEASE nebudú zašifrované.';
  }

  @override
  String get chooseSecurityKeyHint => 'Vyberte si bezpečnostný kľúč';

  @override
  String get chooseSecurityKeyConfirmHint => 'Zopakujte zadanie bezpečnostného kľúča';

  @override
  String get chooseSecurityKeyRequired => 'Je potrebné zadať bezpečnostný kľúč';

  @override
  String get chooseSecurityKeyMismatch => 'Do každej z kolónok pre bezpečnostný kľúč ste napísali niečo iné';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">UPOZORNENIE:</font> Pokiaľ tento bezpečnostný kľúč zabudnete, k svojim dátam sa už nedostanete. Ak vám to pomôže, bezpečnostný kľúč si zapíšte na papier a ten si bezpečne uložte niekam mimo počítača.';
  }

  @override
  String get installationTypeTitle => 'Typ inštalácie';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Na tomto počítači sa už nachádza $os. Čo si prajete urobiť?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Na tomto počítači sa už nachádzajú $os1 a $os2. Čo si prajete urobiť?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Na tomto počítači sa v súčasnosti nachádza viacero operačných systémov. Čo si prajete urobiť?';

  @override
  String get installationTypeNoOSDetected => 'Na tomto počítači sa teraz nezistil žiadny operačný systém. Čo si prajete urobiť?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Vymazať disk a nainštalovať $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">UPOZORNENIE:</font> Týmto zmažete všetky prípadné aplikácie, dokumenty, fotky, hudbu a všetky ostatné súbory vo všetkých operačných systémoch.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Pokročilé funkcie…';

  @override
  String get installationTypeAdvancedTitle => 'Pokročilé funkcie';

  @override
  String get installationTypeNone => 'Žiadne';

  @override
  String get installationTypeNoneSelected => 'Nič nevybrané';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Použiť pre novú inštaláciu $RELEASE LVM zväzky';
  }

  @override
  String get installationTypeLVMSelected => 'Vybrané LVM';

  @override
  String get installationTypeLVMEncryptionSelected => 'Vybrané LVM a šifrovanie';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Zabezpečiť novú inštaláciu $RELEASE šifrovaním';
  }

  @override
  String get installationTypeEncryptInfo => 'V nasledujúcom kroku si zvolíte bezpečnostný kľúč.';

  @override
  String get installationTypeZFS => 'EXPERIMENTÁLNE: Vymazať disk a použiť súborový systém ZFS';

  @override
  String get installationTypeZFSSelected => 'Vybrané ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Vymazať $os a preinštalovať';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">UPOZORNENIE:</font> Týmto zmažete všetky aplikácie, dokumenty, fotky, hudbu a všetky ostatné súbory, nachádzajúce sa v rámci $os.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Nainštalovať $product vedľa $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Nainštalovať $product vedľa $os1 a $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Nainštalovať $product vedľa nich';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Nainštalovať $product vedľa ostatných oddielov';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumenty, hudba a ostatné osobné súbory zostanú zachované. Zakaždým, keď počítač spustíte z vypnutého stavu, budete si môcť zvoliť ktorý operačný systém spustiť.';

  @override
  String get installationTypeManual => 'Ručné rozdelenie na oddiely';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Je možné ručne vytvoriť alebo zmeniť veľkosť oddielov, alebo pre inštaláciu $DISTRO zvoliť viacero oddielov';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Vymazať disk a nainštalovať $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Vyberte jednotku:';

  @override
  String get selectGuidedStorageInfoLabel => 'Bude použitý celý disk:';

  @override
  String get selectGuidedStorageInstallNow => 'Nainštalovať teraz';

  @override
  String get installAlongsideSpaceDivider => 'Prideľte priestor na jednotke posunutím delítka nižšie:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num menších oddielov je skrytých. Pokiaľ potrebujete mať nad procesom viac kontroly, použite <a href=\"$url\">nástroj pre pokročilú správu oddielov</a>';
  }

  @override
  String get installAlongsideResizePartition => 'Zmeniť veľkosť oddielu';

  @override
  String get installAlongsideAllocateSpace => 'Prideliť priestor';

  @override
  String get installAlongsideFiles => 'Súbory';

  @override
  String get installAlongsidePartition => 'Oddiel:';

  @override
  String get installAlongsideSize => 'Veľkosť:';

  @override
  String get installAlongsideAvailable => 'K dispozícii:';

  @override
  String get allocateDiskSpace => 'Ručné rozdelenie';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Prípojné body musia začínať znakom „/“';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Prípojné body nemôžu obsahovať medzery';

  @override
  String get diskHeadersDevice => 'Zariadenie';

  @override
  String get diskHeadersType => 'Typ';

  @override
  String get diskHeadersMountPoint => 'Prípojný bod';

  @override
  String get diskHeadersSize => 'Veľkosť';

  @override
  String get diskHeadersUsed => 'Využité';

  @override
  String get diskHeadersSystem => 'Systém';

  @override
  String get diskHeadersFormat => 'Formátovať';

  @override
  String get freeDiskSpace => 'Voľné miesto';

  @override
  String get newPartitionTable => 'Nová tabuľka rozdelenia na oddiely';

  @override
  String get newPartitionTableConfirmationTitle => 'Nový prázdny oddiel';

  @override
  String get newPartitionTableConfirmationMessage => 'Vytvorenie novej tabuľky oddielov na celom zariadení z neho odoberie všetky existujúce oddiely. V prípade potreby je možné v tomto kroku ešte túto operáciu vziať späť.';

  @override
  String get tooManyPrimaryPartitions => 'Príliš veľa primárnych oddielov';

  @override
  String get partitionLimitReached => 'Dosiahnutý limit';

  @override
  String get bootLoaderDevice => 'Zariadenie na ktoré nainštalovať zavádzač systému';

  @override
  String get partitionCreateTitle => 'Vytvoriť oddiel';

  @override
  String get partitionEditTitle => 'Upraviť oddiel';

  @override
  String get partitionSizeLabel => 'Veľkosť:';

  @override
  String get partitionTypeLabel => 'Zadajte typ pre nový oddiel:';

  @override
  String get partitionTypePrimary => 'Primárny';

  @override
  String get partitionTypeLogical => 'Logický';

  @override
  String get partitionLocationLabel => 'Umiestnenie nového oddielu:';

  @override
  String get partitionLocationBeginning => 'Začiatok tohto priestoru';

  @override
  String get partitionLocationEnd => 'Koniec tohto priestoru';

  @override
  String get partitionFormatLabel => 'Použité ako:';

  @override
  String get partitionFormatNone => 'Ponechať nenaformátované';

  @override
  String partitionFormatKeep(Object format) {
    return 'Nechať naformátované ako $format';
  }

  @override
  String get partitionErase => 'Naformátovať oddiel';

  @override
  String get partitionMountPointLabel => 'Prípojný bod:';

  @override
  String get confirmPageTitle => 'Pripravené na inštaláciu';

  @override
  String get confirmHeader => 'Ak budete pokračovať, nižšie uvedené zmeny budú zapísané na disky. Ďalšie zmeny potom môžete urobiť ručne.';

  @override
  String get confirmDevicesTitle => 'Zariadenia';

  @override
  String get confirmPartitionsTitle => 'Oddiely';

  @override
  String get confirmPartitionTables => 'Budú zmenené tabuľky rozdelenia na oddiely nasledujúcich zariadení:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'Budú vykonané nasledujúce zmeny na oddieloch:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'veľkosť oddielu <b>$sysname</b> zmenené z <b>$oldsize</b> na <b>$newsize</b>';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'oddiel <b>$sysname</b> naformátovaný ako <b>$format</b> použitý pre <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'oddiel <b>$sysname</b> naformátovaný ako <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'oddiel <b>$sysname</b> použitý pre <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'oddiel <b>$sysname</b> vytvorený';
  }

  @override
  String get confirmInstallButton => 'Inštalácia';

  @override
  String get installationCompleteTitle => 'Inštalácia dokončená';

  @override
  String readyToUse(Object system) {
    return '**$system** je nainštalované a pripravené na použitie';
  }

  @override
  String restartInto(Object system) {
    return 'Reštartovať do $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Teraz môžete pokračovať v skúšaní $RELEASE, ale pokiaľ počítač nereštartujete, všetky vykonané zmeny alebo vytvorené dokumenty nebudú zachované.';
  }

  @override
  String get shutdown => 'Vypnúť';

  @override
  String get restartNow => 'Reštartovať teraz';

  @override
  String get continueTesting => 'Pokračovať v skúšaní';

  @override
  String get bitlockerTitle => 'BitLocker je zapnutý';

  @override
  String get bitlockerHeader => 'Aby bolo možné pokračovať, vypnite BitLocker';

  @override
  String bitlockerDescription(Object option) {
    return 'Na tomto počítači je používané šifrovanie nástrojom Windows BitLocker.\nAby bolo možné pokračovať, je potrebné pomocou Windows urobiť voľné miesto alebo zvoliť \'$option\'.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Ohľadne pokynov naskenujte QR kód na inom zariadení alebo choďte na: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reštartovať do Windows';

  @override
  String get restartIntoWindowsTitle => 'Reštartovať do Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Naozaj chcete váš počítač reštartovať? Ak potom budete chcieť dokončiť inštaláciu $DISTRO, bude potrebné znova spustiť inštaláciu $DISTRO.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Vitajte v $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'K dispozícii:';

  @override
  String get installationSlidesIncluded => 'Obsiahnuté:';

  @override
  String get installationSlidesWelcomeTitle => 'Rýchle, slobodné a plné nových funkcií';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'Najnovšia verzia $DISTRO uľahčuje používanie počítača viac ako kedykoľvek predtým.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Či už ste vývojári, tvorcovia, hráči alebo správcovia, nájdete tu nové nástroje zvyšujúce vašu produktivitu a vylepšujúce váš dojem z používania $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Všetky aplikácie ktoré potrebujete';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Inštalujte, spravujte a aktualizujte vami používané aplikácie v Ubuntu Software, obsahujúceho tisíce aplikácií ako zo Snap Store, tak z archívu balíčkov $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Vyvíjajte s najlepším open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO je ideálne prostredie pre vývoj aplikácií či webov, dátovú vedu a umelú inteligenciu / strojové učenie, rovnako tak pre devops a správu systémov. Každé vydanie $DISTRO obsahuje najnovšie sady potrebných nástrojov a podporuje všetky hlavné integrované vývojárske prostredia.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Buďte tvorivejší';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Ak ste animátormi, dizajnérmi, tvorcami videí či vývojármi hier, je ľahké preniesť svoje pracovné postupy na $DISTRO vďaka podpore softvéru a aplikácií, ktoré patria k open source a priemyselným štandardom.';
  }

  @override
  String get installationSlidesGamingTitle => 'Skvelé na hranie hier';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO podporuje najnovšie ovládače od NVIDIA a Mesa, čo zlepšuje výkon a kompatibilitu. Tisíce hier pre Windows skvele fungujú na $DISTRO prostredníctvom aplikácií ako je Steam, bez potreby niečo ďalej nastavovať.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Súkromné a bezpečné';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO poskytuje všetky nástroje, ktoré sú potrebné na ochranu súkromia a bezpečné používanie Internetu. Vďaka vstavanej bráne firewall, podpore VPN a radu aplikácií zameraných na ochranu súkromia máte svoje dáta plne pod kontrolou.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Všetky $DISTRO LTS vydania dostávajú po dobu piatich rokov opravy zabezpečenia s tým, že ich je možné predĺžiť na desať rokov s predplatným Ubuntu Pro.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Zvýšte svoju produktivitu';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop obsahuje LibreOffice, balík open source aplikácií kompatibilných s Microsoft Office pre dokumenty, tabuľky a prezentácie. K dispozícii sú aj obľúbené nástroje na spoluprácu.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Prístupnosť pre každého';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'V srdci filozofie $DISTRO je myšlienka, že počítače sú pre všetkých. Vďaka pokročilým nástrojom na sprístupnenie hendikepovaným a možnosti zmeniť jazyk, farby a veľkosť textu rozhrania, $DISTRO robí používanie počítača jednoduché – nech už ste ktokoľvek a žijete kdekoľvek.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Čítačka obrazovky Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Podpora jazykov';

  @override
  String get installationSlidesSupportTitle => 'Pomoc a podpora';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'Oficiálna dokumentácia k $DISTRO je k dispozícii online aj cez ikonu Pomocník na paneli.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Web Ask Ubuntu pokrýva celú škálu otázok a odpovedí, ďalej na fóre Ubuntu Discourse sú k dispozícii návody a diskusie pre nových aj pokročilých používateľov.';

  @override
  String get installationSlidesSupportEnterprise => 'Pre firemných používateľov Canonical poskytuje komerčnú podporu, vďaka ktorej je ľahké zaviesť a spravovať Ubuntu na pracovisku.';

  @override
  String get installationSlidesSupportResources => 'Užitočné zdroje:';

  @override
  String get installationSlidesSupportDocumentation => 'Oficiálna dokumentácia';

  @override
  String get installationSlidesSupportUbuntuPro => 'Podpora 24/7 na podnikovej úrovni s Ubuntu Pro';

  @override
  String get copyingFiles => 'Kopírovanie súborov…';

  @override
  String get installingSystem => 'Inštalácia systému…';

  @override
  String get configuringSystem => 'Nastavovanie systému…';

  @override
  String get installationFailed => 'Inštalácia sa nepodarila';

  @override
  String get notEnoughDiskSpaceTitle => 'Nedostatok miesta';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Nedostatok miesta na disku pre inštaláciu $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'K dispozícii:';

  @override
  String get notEnoughDiskSpaceRequired => 'Vyžadované:';
}
