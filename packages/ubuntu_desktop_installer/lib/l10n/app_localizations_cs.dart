


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
  String get welcome => 'Vítejte';

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
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Upozornění</font>: Počítač není připojen k napájení ze zásuvky.';
  }

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
  String get freeDiskSpace => 'volné místo';

  @override
  String get newPartitionTable => 'Nová tabulka rozdělení na oddíly';

  @override
  String get newPartitionTableConfirmationTitle => 'Vytvořit na tomto zařízení novou prázdnou tabulku oddílů?';

  @override
  String get newPartitionTableConfirmationMessage => 'Vybrali jste celé zařízení, které chcete rozdělit na oddíly. Pokud budete pokračovat ve vytváření nové tabulky oddílů na zařízení, budou všechny stávající oddíly odstraněny.\n\nUpozorňujeme, že tuto operaci budete moci později (v rámci instalátoru) vrátit, pokud si to budete přát.';

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
  String get partitionUnitKB => 'KB';

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
  String get whoAreYouPagePasswordLabel => 'Zvolte si heslo';

  @override
  String get whoAreYouPagePasswordRequired => 'Je třeba zadat heslo';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Zopakujte zadání hesla (prevence překlepu)';

  @override
  String get whoAreYouPagePasswordMismatch => 'Do každé z kolonek pro heslo jste napsali něco jiného';

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
  String get writeChangesPartitionsHeader => 'Následující oddíly budou zformátovány:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'oddíl č. $disk${partition} jako $format, použitý pro $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'oddíl č. $disk${partition} jako $format';
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
  String get chooseYourLookPageLightBodyText => 'Vše je světlé a svítivé';

  @override
  String get chooseYourLookPageDarkBodyText => 'Ahoj temnoto, můj starý příteli';

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
  String get shutdown => 'Vypnout';

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
}
