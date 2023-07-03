import 'app_localizations.dart';

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Inštalátor Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Nainštalovať $RELEASE';
  }

  @override
  String get changeButtonText => 'Zmeniť';

  @override
  String get restartButtonText => 'Reštartovať';

  @override
  String get revertButtonText => 'Vrátiť späť';

  @override
  String get quitButtonText => 'Opustiť inštaláciu';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Vitajte v $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Pripravuje sa $DISTRO…';
  }

  @override
  String get welcomeHeader => 'Vyberte si svoj jazyk:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Vyskúšať alebo nainštalovať $DISTRO';
  }

  @override
  String get repairInstallation => 'Opraviť inštaláciu';

  @override
  String get repairInstallationDescription => 'Opravou preinštalujete všetok nainštalovaný softvér bez toho, aby sa to dotklo dokumentov alebo nastavení.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Vyskúšať $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Môžete vyskúšať $RELEASE bez vykonania zmien vo vašom počítači.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Nainštalovať $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Nainštalujte $RELEASE spoločne z (alebo namiesto) vášho operačného systému. Nemalo by to trvať dlho.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Mohli by ste mať záujem o prečítanie si <a href=\"$url\">poznámok k vydaniu</a>.';
  }

  @override
  String get turnOffRST => 'RST je zapnuté';

  @override
  String get turnOffRSTTitle => 'Aby bolo možné pokračovať, vypnite RST';

  @override
  String get turnOffRSTDescription => 'Na tomto počítači je zapnutá technológia Intel RST (Rapid Storage Technology). Aby bolo možné Ubuntu nainštalovať, je potrebné vo Windows funkciu RST vypnúť.';

  @override
  String instructionsForRST(Object url) {
    return 'Ohľadne pokynov naskenujte QR kód na inom zariadení alebo choďte na: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Rozloženie klávesnice';

  @override
  String get chooseYourKeyboardLayout => 'Vyberte si rozloženie klávesnice:';

  @override
  String get typeToTest => 'Správne fungovanie rozloženia si môžete vyskúšať tu';

  @override
  String get detectLayout => 'Zistiť rozloženie klávesnice';

  @override
  String get detectButtonText => 'Zistiť';

  @override
  String get keyboardVariant => 'Variant klávesnice:';

  @override
  String get pressOneKey => 'Stlačte niektorú z nasledujúcich kláves:';

  @override
  String get isKeyPresent => 'Máte na klávesnici nasledujúci kláves?';

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
  String get connectToInternetPageTitle => 'Pripojiť sa k sieti';

  @override
  String get connectToInternetDescription => 'Pripojenie počítača na Internet pomôže Ubuntu nainštalovať akýkoľvek potrebný dodatočný softvér a pomôže vybrať vaše časové pásmo.\n\nPripojte sa Ethernetovým káblom, alebo si vyberte Wi-Fi sieť';

  @override
  String get useWiredConnection => 'Použiť káblové pripojenie';

  @override
  String get noWiredConnection => 'Nezistilo sa žiadne káblové pripojenie';

  @override
  String get wiredDisabled => 'Káblové pripojenie je vypnuté';

  @override
  String get wiredMustBeEnabled => 'Aby na tomto počítači bolo možné použiť rozhranie Ethernet, je potrebné zapnúť káblové pripojenie';

  @override
  String get enableWired => 'Zapnúť káblové';

  @override
  String get selectWifiNetwork => 'Pripojiť sa k Wi-Fi sieti';

  @override
  String get hiddenWifiNetwork => 'Pripojiť sa k skrytej Wi-Fi sieti';

  @override
  String get hiddenWifiNetworkNameLabel => 'Názov siete';

  @override
  String get hiddenWifiNetworkNameRequired => 'Vyžaduje sa názov siete';

  @override
  String get noInternet => 'V tejto chvíli sa nechcem pripájať na Internet';

  @override
  String get wirelessNetworkingDisabled => 'Bezdrôtové pripojenie je vypnuté';

  @override
  String get noWifiDevicesDetected => 'Nezistili sa žiadne zariadenia Wi-Fi';

  @override
  String get wifiMustBeEnabled => 'Aby na tomto počítači bolo možné použiť rozhranie Wi-Fi, je potrebné zapnúť bezdrôtové pripojenie';

  @override
  String get enableWifi => 'Zapnúť Wi-Fi';

  @override
  String get connectButtonText => 'Pripojiť';

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
  String get startInstallingButtonText => 'Inštalácia';

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
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

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
  String get identityPageTitle => 'Nastavenie vášho účtu';

  @override
  String get identityAutoLogin => 'Prihlásiť sa automaticky';

  @override
  String get identityRequirePassword => 'Pri prihlasovaní sa vyžadovať heslo';

  @override
  String get identityRealNameLabel => 'Vaše meno';

  @override
  String get identityRealNameRequired => 'Je potrebné zadať meno';

  @override
  String get identityRealNameTooLong => 'Meno je príliš dlhé.';

  @override
  String get identityHostnameLabel => 'Názov pre váš počítač';

  @override
  String get identityHostnameInfo => 'Tento názov slúži pri komunikácii s ostatnými počítačmi.';

  @override
  String get identityHostnameRequired => 'Je potrebné zadať názov pre počítač';

  @override
  String get identityHostnameTooLong => 'Takýto názov počítača je príliš dlhý.';

  @override
  String get identityInvalidHostname => 'Zadaný názov pre počítač nie je možné použiť';

  @override
  String get identityUsernameLabel => 'Vyberte si používateľské meno';

  @override
  String get identityUsernameRequired => 'Je potrebné zadať používateľské meno';

  @override
  String get identityInvalidUsername => 'Zadané používateľské meno nie je možné použiť';

  @override
  String get identityUsernameInUse => 'Také používateľské meno už existuje.';

  @override
  String get identityUsernameSystemReserved => 'Také meno je rezervované pre využitie systémom.';

  @override
  String get identityUsernameTooLong => 'Také meno je príliš dlhé.';

  @override
  String get identityUsernameInvalidChars => 'Také meno obsahuje neplatné znaky.';

  @override
  String get identityPasswordLabel => 'Vyberte si heslo';

  @override
  String get identityPasswordRequired => 'Je potrebné zadať heslo';

  @override
  String get identityConfirmPasswordLabel => 'Zopakujte zadanie hesla';

  @override
  String get identityPasswordMismatch => 'Do každej z kolónok pre heslo ste napísali niečo iné';

  @override
  String get identityPasswordShow => 'Zobraziť';

  @override
  String get identityPasswordHide => 'Skryť';

  @override
  String get writeChangesToDisk => 'Pripravené na inštaláciu';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Ak budete pokračovať, nižšie uvedené zmeny budú zapísané na disky. Ďalšie zmeny potom môžete urobiť ručne.';

  @override
  String get writeChangesDevicesTitle => 'Zariadenia';

  @override
  String get writeChangesPartitionsTitle => 'Oddiely';

  @override
  String get writeChangesPartitionTablesHeader => 'Budú zmenené tabuľky rozdelenia na oddiely nasledujúcich zariadení:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Budú vykonané nasledujúce zmeny na oddieloch:';

  @override
  String writeChangesPartitionResized(Object sysname, Object oldsize, Object newsize) {
    return 'veľkosť oddielu <b>$sysname</b> zmenené z <b>$oldsize</b> na <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object sysname, Object format, Object mount) {
    return 'oddiel <b>$sysname</b> naformátovaný ako <b>$format</b> použitý pre <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object sysname, Object format) {
    return 'oddiel <b>$sysname</b> naformátovaný ako <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object sysname, Object mount) {
    return 'oddiel <b>$sysname</b> použitý pre <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object sysname) {
    return 'oddiel <b>$sysname</b> vytvorený';
  }

  @override
  String get themePageTitle => 'Vyberte si motív vzhľadu';

  @override
  String get themePageHeader => 'Môžete ho neskôr kedykoľvek zmeniť v nastaveniach vzhľadu.';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get themeLight => 'Svetlý';

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
  String get turnOffBitlockerTitle => 'BitLocker je zapnutý';

  @override
  String get turnOffBitlockerHeadline => 'Aby bolo možné pokračovať, vypnite BitLocker';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'Na tomto počítači je používané šifrovanie nástrojom Windows BitLocker.\nAby bolo možné pokračovať, je potrebné pomocou Windows urobiť voľné miesto alebo zvoliť \'$option\'.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
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
  String get timezonePageTitle => 'Vyberte si svoje časové pásmo';

  @override
  String get timezoneLocationLabel => 'Umiestnenie';

  @override
  String get timezoneTimezoneLabel => 'Časové pásmo';

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

  @override
  String get activeDirectoryOption => 'Použiť Active Directory';

  @override
  String get activeDirectoryInfo => 'V ďalšom kroku zadáte doménu a ďalšie podrobnosti.';

  @override
  String get activeDirectoryTitle => 'Konfigurácia služby Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Vyskúšať spojenie s doménou';

  @override
  String get activeDirectoryDomainLabel => 'Doména';

  @override
  String get activeDirectoryDomainEmpty => 'Vyžadované';

  @override
  String get activeDirectoryDomainTooLong => 'Príliš dlhé';

  @override
  String get activeDirectoryDomainInvalidChars => 'Neplatné znaky';

  @override
  String get activeDirectoryDomainStartDot => 'Začína na bodku (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Končí na bodku (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Začína na spojovník/pomlčku (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Končí na spojovník/pomlčku (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Obsahuje niekoľko bodiek za sebou (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Doména nenájdená';

  @override
  String get activeDirectoryAdminLabel => 'Používateľ s oprávnením pre pridanie do domény';

  @override
  String get activeDirectoryAdminEmpty => 'Vyžadované';

  @override
  String get activeDirectoryAdminInvalidChars => 'Neplatné znaky';

  @override
  String get activeDirectoryPasswordLabel => 'Heslo';

  @override
  String get activeDirectoryPasswordEmpty => 'Vyžadované';

  @override
  String get activeDirectoryErrorTitle => 'Chyba pri konfigurácii pripojenia k Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Je nám ľúto, v tejto chvíli sa nedarí nastaviť službu Active Directory. Po spustení systému navštívte stránku <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, kde získate ďalšie informácie.';
}
