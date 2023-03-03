import 'app_localizations.dart';

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Instalátor Ubuntu pro osobní počítače';

  @override
  String windowTitle(Object RELEASE) {
    return 'Nainstalovat $RELEASE';
  }

  @override
  String get cancelButtonText => 'Storno';

  @override
  String get changeButtonText => 'Změnit';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Ne';

  @override
  String get restartButtonText => 'Restartovat';

  @override
  String get revertButtonText => 'Vrátit zpět';

  @override
  String get yesButtonText => 'Ano';

  @override
  String get quitButtonText => 'Opustit instalaci';

  @override
  String get welcome => 'Vítejte';

  @override
  String get welcomeHeader => 'Zvolte svůj jazyk:';

  @override
  String get tryOrInstallPageTitle => 'Vyzkoušet nebo nainstalovat';

  @override
  String get repairInstallation => 'Opravit instalaci';

  @override
  String get repairInstallationDescription => 'Oprava přeinstaluje veškerý doposud nainstalovaný software, ale zachová data a nastavení uživatele.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Vyzkoušet $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Můžete si vyzkoušet $RELEASE aniž by se v počítači cokoli měnilo.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Nainstalovat $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Nainstalovat $RELEASE vedle (nebo namísto) stávajícího operačního systému. Mělo by být hned hotové.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Nejspíš si budete chtít přečíst <a href=\"$url\">poznámky k vydání</a>.';
  }

  @override
  String get turnOffRST => 'Vypněte RST';

  @override
  String get turnOffRSTDescription => 'Na tomto počítači je zapnutá technologie Intel RST (Rapit Storage Technology). Aby bylo možné Ubuntu nainstalovat, je třeba ve Windows funkci RST vypnout.';

  @override
  String instructionsForRST(Object url) {
    return 'Návod jak to udělat si otevřete na jiném zařízení (třeba telefonu): <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Rozvržení klávesnice';

  @override
  String get chooseYourKeyboardLayout => 'Zvolte si rozvržení klávesnice:';

  @override
  String get typeToTest => 'Správné fungování rozvržení si můžete vyzkoušet zde';

  @override
  String get detectLayout => 'Zjistit rozvržení klávesnice';

  @override
  String get pressOneKey => 'Stiskněte některou z následujících kláves:';

  @override
  String get isKeyPresent => 'Máte na klávesnici následující klávesu?';

  @override
  String get configureSecureBootTitle => 'Nastavit Secure Boot';

  @override
  String get configureSecureBootDescription => 'Zvolili jste nainstalovat ovladač hardware, pocházející od třetí strany. Aby to bylo možné,\nje zapotřebí vypnout Secure Boot. To uděláte vytvořením klíče zabezpečení a jeho\nnásledným zadáním po restartu systému.';

  @override
  String get configureSecureBootOption => 'Nastavit Secure Boot';

  @override
  String get chooseSecurityKey => 'Zvolte si klíč zabezpečení';

  @override
  String get confirmSecurityKey => 'Zopakujte zadání klíče zabezpečení (prevence překlepu)';

  @override
  String get dontInstallDriverSoftwareNow => 'Nyní ovladač ještě neinstalovat';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Je možné ho nainstalovat kdykoli později pomocí nástroje „Software a aktualizace“.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Je třeba zadat klíč zabezpečení';

  @override
  String get secureBootSecurityKeysDontMatch => 'Do každé z kolonek pro klíč zabezpečení jste napsali něco jiného';

  @override
  String get showSecurityKey => 'Zobrazit klíč zabezpečení';

  @override
  String get connectToInternetPageTitle => 'Připojit k Internetu';

  @override
  String get connectToInternetDescription => 'Připojení tohoto počítač k Internetu pomůže Ubuntu nainstalovat jakýkoli potřebný dodatečný software a pomůže zvolit vaše časové pásmo.\n\nPřipojte se ethernetovým kabelem, nebo zvolte Wi-Fi síť';

  @override
  String get useWiredConnection => 'Použít drátové připojení';

  @override
  String get noWiredConnection => 'Nezjištěno žádné drátové připojení';

  @override
  String get wiredDisabled => 'Drátové připojení je vypnuto';

  @override
  String get wiredMustBeEnabled => 'Aby na tomto počítači bylo možné použít rozhraní ethernet, je třeba zapnout drátové připojení';

  @override
  String get enableWired => 'Zapnout drátové';

  @override
  String get selectWifiNetwork => 'Připojit k Wi-Fi síti';

  @override
  String get hiddenWifiNetwork => 'Připojit ke skryté Wi-Fi síti';

  @override
  String get hiddenWifiNetworkNameLabel => 'Název sítě';

  @override
  String get hiddenWifiNetworkNameRequired => 'Je vyžadován název sítě';

  @override
  String get noInternet => 'V tuto chvíli se nechci připojovat k Internetu';

  @override
  String get wirelessNetworkingDisabled => 'Bezdrátové připojení je vypnuté';

  @override
  String get noWifiDevicesDetected => 'Nevybrána žádná Wi-Fi zařízení';

  @override
  String get wifiMustBeEnabled => 'Aby na tomto počítači bylo možné použít rozhraní Wi-Fi, je třeba zapnout bezdrátové připojení';

  @override
  String get enableWifi => 'Zapnout Wi-Fi';

  @override
  String get connectButtonText => 'Připojit';

  @override
  String get updatesOtherSoftwarePageTitle => 'Aktualizace a ostatní software';

  @override
  String get updatesOtherSoftwarePageDescription => 'Které aplikace chcete mít hned od začátku nainstalované?';

  @override
  String get normalInstallationTitle => 'Normální instalace';

  @override
  String get normalInstallationSubtitle => 'Webový prohlížeč, nástroje, kancelářský software a přehrávače multimédií.';

  @override
  String get minimalInstallationTitle => 'Minimální instalace';

  @override
  String get minimalInstallationSubtitle => 'Webový prohlížeč a základní nástroje.';

  @override
  String get otherOptions => 'Další možnosti';

  @override
  String get installThirdPartyTitle => 'Nainstalovat ovladače třetích stran pro grafické čipy a adaptéry bezdrátových (Wi-Fi) sítí, stejně tak dodatečné kodeky multimédií';

  @override
  String get installThirdPartySubtitle => 'Tento software je předmětem licenčních ujednání, obsažených v dokumentaci k němu. Některý je proprietární.';

  @override
  String get installDriversTitle => 'Nainstalovat ovladače od třetích stran pro grafické čipy a Wi-Fi síťová rozhraní';

  @override
  String get installDriversSubtitle => 'Tyto ovladače jsou předmětem licenčních ujednání obsažených v dokumentaci k nim. Jsou proprietárními.';

  @override
  String get installCodecsTitle => 'Stáhnout a nainstalovat podporu pro další formáty médií';

  @override
  String get installCodecsSubtitle => 'Tento software je předmětem licenčních ujednání obsažených v dokumentaci k němu. Některé jsou proprietární.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Upozornění</font>: Počítač není připojen k napájení ze zásuvky.';
  }

  @override
  String get offlineWarning => 'V tu chvíli nejste připojení k Internetu';

  @override
  String get chooseSecurityKeyTitle => 'Zvolte si šifrovací klíč';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Šifrování disku ochrání vaše soubory v případě, že o počítač přijdete (ztráta, krádež, …). Vyžaduje zadání šifrovacího klíče při každém spuštění počítače z vypnutého stavu (nikoli z uspání).\n\nŠifrovány budou pouze soubory, nacházející se v rámci $RELEASE – ty nacházející se mimo nikoli.';
  }

  @override
  String get chooseSecurityKeyHint => 'Zvolte si šifrovací klíč';

  @override
  String get chooseSecurityKeyConfirmHint => 'Zopakujte zadání šifrovacího klíče (prevence překlepu)';

  @override
  String get chooseSecurityKeyRequired => 'Je třeba zadat šifrovací klíč';

  @override
  String get chooseSecurityKeyMismatch => 'Do každé z kolonek pro šifrovací klíč jste napsali něco jiného';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">VAROVÁNÍ</font>: Pokud tento šifrovací klíč zapomenete, ke svým datům už se nedostanete. Pokud vám to pomůže, šifrovací klíč si zapište na papír a ten si bezpečně uložte někam mimo počítač.';
  }

  @override
  String get installationTypeTitle => 'Typ instalace';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Na tomto počítači se už nachází $os. Co si přejete udělat?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Na tomto počítači se už nacházejí $os1 a $os2. Co si přejete udělat?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Na tomto počítači se v současnosti nachází vícero operačních systémů. Co si přejete udělat?';

  @override
  String get installationTypeNoOSDetected => 'Na tomto počítači nyní nebyl zjištěn žádný operační systém. Co si přejete udělat?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Vymazat disk a nainstalovat $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">VAROVÁNÍ:</font> Toto smaže veškeré případné aplikace, dokumenty, fotky, hudbu (a všechny ostatní soubory) ve všech operačních systémech.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Pokročilé funkce…';

  @override
  String get installationTypeAdvancedTitle => 'Pokročilé funkce';

  @override
  String get installationTypeNone => 'Žádné';

  @override
  String get installationTypeNoneSelected => 'Nic nevybráno';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Použít pro novou instalaci $RELEASE LVM svazky';
  }

  @override
  String get installationTypeLVMSelected => 'Vybráno LVM';

  @override
  String get installationTypeLVMEncryptionSelected => 'Vybráno LVM a šifrování';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Zabezpečit novou instalaci $RELEASE šifrováním';
  }

  @override
  String get installationTypeEncryptInfo => 'V následujícím kroku si zvolíte šifrovací klíč.';

  @override
  String get installationTypeZFS => 'EXPERIMENTÁLNÍ: Vymazat disk a použít souborový systém ZFS';

  @override
  String get installationTypeZFSSelected => 'Vybráno ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Vymazat $os a přeinstalovat';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">VAROVÁNÍ:</font> Toto smaže veškeré aplikace, dokumenty, fotky, hudbu (a všechny ostatní soubory), nacházející se v rámci $os.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Nainstalovat $product vedle $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Nainstalovat $product vedle $os1 a $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Nainstalovat $product vedle nich';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Nainstalovat $product vedle ostatních oddílů';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumenty, hudba a ostatní osobní soubory zůstanou zachovány. Pokaždé, když počítač spustíte z vypnutého stavu (tedy nikoli uspání), budete si moci zvolit který operační systém spustit.';

  @override
  String get installationTypeManual => 'Něco jiného';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Je možné ručně vytvořit nebo změnit velikost oddílů, nebo pro instalaci $DISTRO zvolit vícero oddílů';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Vymazat disk a nainstalovat $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Vyberte jednotku:';

  @override
  String get selectGuidedStorageInfoLabel => 'Bude použit celý disk:';

  @override
  String get selectGuidedStorageInstallNow => 'Nainstalovat nyní';

  @override
  String get installAlongsideSpaceDivider => 'Přidělte prostor na jednotce posunutím dělítka níže:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num menších oddílů skryto. Pokud potřebujete mít nad procesem více kontroly, použijte <a href=\"$url\">nástroj pro pokročilou správu oddílů</a>';
  }

  @override
  String get installAlongsideResizePartition => 'Změnit velikost oddílu';

  @override
  String get installAlongsideAllocateSpace => 'Přidělit prostor';

  @override
  String get installAlongsideFiles => 'Soubory';

  @override
  String get installAlongsidePartition => 'Oddíl:';

  @override
  String get installAlongsideSize => 'Velikost:';

  @override
  String get installAlongsideAvailable => 'K dispozici:';

  @override
  String get allocateDiskSpace => 'Přidělit prostor na disku';

  @override
  String get startInstallingButtonText => 'Zahájit instalaci';

  @override
  String get diskHeadersDevice => 'Zařízení';

  @override
  String get diskHeadersType => 'Typ';

  @override
  String get diskHeadersMountPoint => 'Přípojný bod';

  @override
  String get diskHeadersSize => 'Velikost';

  @override
  String get diskHeadersUsed => 'Využito';

  @override
  String get diskHeadersSystem => 'Systém';

  @override
  String get diskHeadersFormat => 'Formátovat';

  @override
  String get freeDiskSpace => 'Volné místo';

  @override
  String get newPartitionTable => 'Nová tabulka rozdělení na oddíly';

  @override
  String get newPartitionTableConfirmationTitle => 'Vytvořit na tomto zařízení novou prázdnou tabulku oddílů?';

  @override
  String get newPartitionTableConfirmationMessage => 'Vybrali jste celé zařízení, které chcete rozdělit na oddíly. Pokud budete pokračovat ve vytváření nové tabulky oddílů na něm, budou všechny stávající oddíly na něm odstraněny.\n\nUpozorňujeme, že tuto operaci budete moci později (v rámci instalátoru) vrátit, pokud si to budete přát.';

  @override
  String get tooManyPrimaryPartitions => 'Příliš mnoho primárních oddílů';

  @override
  String get partitionLimitReached => 'Dosaženo limitu';

  @override
  String get bootLoaderDevice => 'Zařízení na které nainstalovat zavaděč systému';

  @override
  String get partitionCreateTitle => 'Vytvořit oddíl';

  @override
  String get partitionEditTitle => 'Upravit oddíl';

  @override
  String get partitionSizeLabel => 'Velikost:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Zadejte typ pro nový oddíl:';

  @override
  String get partitionTypePrimary => 'Primární';

  @override
  String get partitionTypeLogical => 'Logický';

  @override
  String get partitionLocationLabel => 'Umístění nového oddílu:';

  @override
  String get partitionLocationBeginning => 'Začátek tohoto prostoru';

  @override
  String get partitionLocationEnd => 'Konec tohoto prostoru';

  @override
  String get partitionFormatLabel => 'Použito jako:';

  @override
  String get partitionFormatExt4 => 'Žurnálovací souborový systém Ext4';

  @override
  String get partitionFormatExt3 => 'Žurnálovací souborový systém Ext3';

  @override
  String get partitionFormatExt2 => 'Souborový systém Ext2';

  @override
  String get partitionFormatBtrfs => 'Žurnálovací souborový systém btrfs';

  @override
  String get partitionFormatJfs => 'Žurnálovací souborový systém JFS';

  @override
  String get partitionFormatXfs => 'Žurnálovací souborový systém XFS';

  @override
  String get partitionFormatFat => 'Souborový systém FAT';

  @override
  String get partitionFormatFat12 => 'Souborový systém FAT12';

  @override
  String get partitionFormatFat16 => 'Souborový systém FAT16';

  @override
  String get partitionFormatFat32 => 'Souborový systém FAT32';

  @override
  String get partitionFormatSwap => 'Odkládací oblast';

  @override
  String get partitionFormatIso9660 => 'Souborový systém ISO 9660';

  @override
  String get partitionFormatVfat => 'Souborový systém VFAT';

  @override
  String get partitionFormatNtfs => 'Souborový systém NTFS';

  @override
  String get partitionFormatReiserFS => 'Souborový systém ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Kořenový souborový systém na ZFS';

  @override
  String get partitionFormatNone => 'Ponechat nenaformátované';

  @override
  String get partitionErase => 'Naformátovat oddíl';

  @override
  String get partitionMountPointLabel => 'Přípojný bod:';

  @override
  String get whoAreYouPageTitle => 'Kdo jste?';

  @override
  String get whoAreYouPageAutoLogin => 'Přihlásit se automaticky';

  @override
  String get whoAreYouPageRequirePassword => 'Při přihlašování se vyžadovat heslo';

  @override
  String get whoAreYouPageRealNameLabel => '(Vaše) jméno';

  @override
  String get whoAreYouPageRealNameRequired => 'Je třeba zadat jméno';

  @override
  String get whoAreYouPageComputerNameLabel => 'Název pro váš počítač';

  @override
  String get whoAreYouPageComputerNameInfo => 'Tento název slouží při komunikaci s ostatními počítači.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Je třeba zadat název pro počítač';

  @override
  String get whoAreYouPageInvalidComputerName => 'Daný název pro počítač nelze použít (neplatný znak)';

  @override
  String get whoAreYouPageUsernameLabel => 'Zvolte si uživatelské jméno';

  @override
  String get whoAreYouPageUsernameRequired => 'Je třeba zadat uživatelské jméno';

  @override
  String get whoAreYouPageInvalidUsername => 'Dané uživatelské jméno nelze použít (neplatný znak)';

  @override
  String get whoAreYouPageUsernameInUse => 'Takové uživatelské jméno už existuje.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Takové jméno je rezervováno pro využití systémem.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Takové jméno je příliš dlouhé.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Takové jméno obsahuje neplatné znaky.';

  @override
  String get whoAreYouPagePasswordLabel => 'Zvolte si heslo';

  @override
  String get whoAreYouPagePasswordRequired => 'Je třeba zadat heslo';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Zopakujte zadání hesla (prevence překlepu)';

  @override
  String get whoAreYouPagePasswordMismatch => 'Do každé z kolonek pro heslo jste napsali něco jiného';

  @override
  String get whoAreYouPagePasswordShow => 'Zobrazit';

  @override
  String get whoAreYouPagePasswordHide => 'Skrýt';

  @override
  String get writeChangesToDisk => 'Zapsat změny na disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Pokud budete pokračovat, níže uvedené změny budou zapsány na disky. Další změny pak můžete udělat ručně.';

  @override
  String get writeChangesPartitionTablesHeader => 'Budou změněny tabulky rozdělení na oddíly následujících zařízení:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Budou provedeny následující změny na oddílech:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'velikost oddílu #$disk$partition změněna z $oldsize na $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'oddíl #$disk$partition naformátován jako $format použit pro $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'oddíl #$disk$partition naformátován jako $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'oddíl #$disk$partition použit pro $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'oddíl #$disk$partition vytvořen';
  }

  @override
  String get chooseYourLookPageTitle => 'Zvolte si vzhled pro své prostředí';

  @override
  String get chooseYourLookPageHeader => 'Toto je možné později kdykoli změnit v nastavení vzhledu.';

  @override
  String get chooseYourLookPageDarkSetting => 'Tmavý';

  @override
  String get chooseYourLookPageLightSetting => 'Světlý';

  @override
  String get installationCompleteTitle => 'Instalace dokončena';

  @override
  String readyToUse(Object system) {
    return '**$system** je nainstalovaný a připravený k použití.';
  }

  @override
  String restartInto(Object system) {
    return 'Restartovat do $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Nyní můžete pokračovat ve zkoušení $RELEASE, ale dokud počítač nerestartujete, veškeré provedené změny nebo vytvořené dokumenty nebudou zachovány.';
  }

  @override
  String get shutdown => 'Vypnout';

  @override
  String get restartNow => 'Restartovat nyní';

  @override
  String get continueTesting => 'Pokračovat ve zkoušení';

  @override
  String get turnOffBitlockerTitle => 'Vypněte BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Na tomto počítači je používáno šifrování nástrojem Windows BitLocker.\nAby bylo možné Ubuntu nainstalovat, je třeba Bitlocker vypnout.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Návod jak to udělat si otevřete na jiném zařízení (třeba telefonu): <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restartovat do Windows';

  @override
  String get whereAreYouPageTitle => 'Kde se nacházíte?';

  @override
  String get whereAreYouLocationLabel => 'Umístění';

  @override
  String get whereAreYouTimezoneLabel => 'Časové pásmo';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Vítejte v $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Rychlá a plná nových funkcí, nejnovější verze $RELEASE usnadňuje používání počítače víc než předtím. Zde je ukázka několika z nových skvělých věcí, na které je možné se těšit…';
  }

  @override
  String get softwareSlideTitle => 'Nalezněte ještě více software';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Dejte sbohem únavnému prohledávání webu při získávání nového software. Díky přístupu do Snap Store a archivu softwaru $RELEASE, je snadné najít a nainstalovat nové aplikace. Stačí jen napsat, co hledáte nebo procházet kategoriemi, jako např. Grafika a fotky, Hry a produktivita – vše doprovázeno užitečnými recenzemi ostatních uživatelů.';
  }

  @override
  String get musicSlideTitle => 'Vezměte si hudbu s sebou';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE přináší skvělý přehrávač hudby Rhythmbox. S pokročilými funkcemi pro přehrávání je snadné si seřadit skladby, které se vám líbí. A funguje skvěle s CD disky a přenosnými přehrávači hudby, takže si veškerou svou hudbu můžete nosit s sebou.';
  }

  @override
  String get musicSlideRhythmbox => 'Přehrávač hudby Rhytmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Bavte se svými fotkami';

  @override
  String get photoSlideDescription => 'Shotwell je šikovný správce fotek, který je připraven na vaše foto zařízení. Připojte fotoaparát nebo telefon a přeneste své fotky a pak je jednoduše nasdílejte a mějte je v bezpečí před ztrátou. A pokud jste tvořiví, v Ubuntu Software je k dispozici mnoho dalších aplikací pro práci s fotkami.';

  @override
  String get photoSlideShotwell => 'Správce fotek Shotwell';

  @override
  String get photoSlideGimp => 'Editor obrázků GIMP';

  @override
  String get photoSlideShotcut => 'Editor videa Shotcut';

  @override
  String get webSlideTitle => 'Získejte z webu maximum';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE obsahuje Firefox – webový prohlížeč, používaný miliony lidí z celého světa. Webové aplikace, které používáte nejčastěji (jako např. Facebook a Gmail), je možné připnout do vašeho desktopového prostředí a mít je tak více po ruce, úplně jako ostatní aplikace v počítači.';
  }

  @override
  String get webSlideFirefox => 'Webový prohlížeč Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Vše co potřebujete pro kancelář';

  @override
  String get officeSlideDescription => 'LibreOffice je svobodná sada kancelářských aplikací, obsahující vše potřebné pro vytváření dokumentů, tabulek a prezentací. Je kompatibilní se souborovými formáty Microsoft Office, nabízí veškeré potřebné funkce.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Přístupnost pro všechny';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'Středobodem filozofie $RELEASE je, že počítače jsou pro všechny. Pomocí pokročilých nástrojů pro zpřístupnění a možnostmi pro změnu jazyka, barev a velikosti textu, $RELEASE usnadňuje používání počítače – ať už jste kdokoli a odkudkoli.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Možnosti přizpůsobení si';

  @override
  String get accessSlideAppearance => 'Vzhled';

  @override
  String get accessSlideAssistiveTechnologies => 'Technologie pro zpřístupnění';

  @override
  String get accessSlideLanguageSupport => 'Podpora jazyků';

  @override
  String get supportSlideTitle => 'Nápověda a podpora';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'Oficiální dokumentace pokrývá mnohé z nejběžnějších aspektů $RELEASE. Je k dispozici jak <a href=\"https://help.ubuntu.com\">online</a>, tak lokálně prostřednictvím ikony Nápověda v doku.';
  }

  @override
  String get supportSlideQuestions => 'Na <a href=\"https://askubuntu.com\">Ask Ubuntu</a> je možné pokládat dotazy a hledat v rozsáhlé sbírce těch už zodpovězených. Podpora ve vašem jazyce může být poskytována vaším <a href=\"https://loco.ubuntu.com/teams\">Místním komunitním týmem</a>.';

  @override
  String get supportSlideResources => 'Ohledně ukazatelů na ostatní užitečné zdroje, navštivte <a href=\"https://www.ubuntu.com/support/community-support\">Komunitní podporu</a> nebo <a href=\"https://www.ubuntu.com/support\">Komerční podporu</a>.';

  @override
  String get includedSoftware => 'Obsažený software';

  @override
  String get availableSoftware => 'Software k dispozici';

  @override
  String get supportedSoftware => 'Podporovaný software';

  @override
  String get copyingFiles => 'Kopírování souborů…';

  @override
  String get installingSystem => 'Instalace systému…';

  @override
  String get configuringSystem => 'Nastavování systému…';

  @override
  String get installationFailed => 'Instalace se nezdařila';

  @override
  String get notEnoughDiskSpaceTitle => 'Omlouváme se';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Aby bylo možné nainstalovat $RELEASE, je zapotřebí alespoň $SIZE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Tento počítač disponuje pouze $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'Největší disk v tomto počítači má velikost pouze $SIZE.';
  }

  @override
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test Connection';

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
  String get activeDirectoryAdminLabel => 'Domain Administrator';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';
}
