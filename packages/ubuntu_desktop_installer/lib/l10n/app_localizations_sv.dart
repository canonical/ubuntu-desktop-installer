


import 'app_localizations.dart';

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Desktop Installer';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installera $RELEASE';
  }

  @override
  String get cancelButtonText => 'Avbryt';

  @override
  String get changeButtonText => 'Ändra';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Nej';

  @override
  String get restartButtonText => 'Starta om';

  @override
  String get revertButtonText => 'Revert';

  @override
  String get yesButtonText => 'Ja';

  @override
  String get welcome => 'Välkommen';

  @override
  String get tryOrInstallPageTitle => 'Try or install';

  @override
  String get repairInstallation => 'Repair installation';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Try $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'You can try $RELEASE without making any changes to your computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installera $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Install $RELEASE alongside (or instead of) your current operating system. This shouldn\'t take too long.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'You may wish to read the <a href=\"$url\">release notes</a>.';
  }

  @override
  String get turnOffRST => 'Stäng av RST';

  @override
  String get turnOffRSTDescription => 'Den här datorn använder Intel RST (Rapid Storage Technology). Du måste stänga av RST i Windows innan du installerar Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'För instruktioner, öppna den här sidan på en telefon eller annan enhet: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Tangentbordslayout';

  @override
  String get chooseYourKeyboardLayout => 'Välj din tangentbordslayout:';

  @override
  String get typeToTest => 'Skriv här för att testa ditt tangentbord';

  @override
  String get detectLayout => 'Upptäck tangentbordslayout';

  @override
  String get pressOneKey => 'Vänligen tryck på en av följande tangenter:';

  @override
  String get isKeyPresent => 'Finns följande tangent på ditt tangentbord?';

  @override
  String get configureSecureBootTitle => 'Configure Secure Boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Configure Secure Boot';

  @override
  String get chooseSecurityKey => 'Välj en säkerhetsnyckel';

  @override
  String get confirmSecurityKey => 'Bekräfta säkerhetsnyckeln';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Du kan installera det senare från Programvara och uppdateringar.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Säkerhetsnyckel krävs';

  @override
  String get secureBootSecurityKeysDontMatch => 'Säkerhetsnycklarna matchar inte';

  @override
  String get connectToInternetPageTitle => 'Anslut till internet';

  @override
  String get connectToInternetDescription => 'Att ansluta den här datorn till internet hjälper Ubuntu att installera all extra programvara som behövs och hjälpa dig att välja din tidszon.\n\nAnslut med Ethernet-kabel eller välj ett Wi-Fi-nätverk';

  @override
  String get useWiredConnection => 'Använd trådbunden anslutning';

  @override
  String get noWiredConnection => 'Ingen trådbunden anslutning upptäcktes';

  @override
  String get wiredDisabled => 'Den trådbundna anslutningen är avstängd';

  @override
  String get wiredMustBeEnabled => 'För att använda Ethernet på den här datorn måste en trådbunden anslutning vara aktiverad';

  @override
  String get enableWired => 'Aktivera trådbunden';

  @override
  String get selectWifiNetwork => 'Anslut till ett Wi-Fi nätverk';

  @override
  String get noInternet => 'Jag vill inte ansluta till internet just nu';

  @override
  String get wirelessNetworkingDisabled => 'Trådlöst nätverk inaktiverat';

  @override
  String get noWifiDevicesDetected => 'Inga Wi-Fi-enheter upptäcktes';

  @override
  String get wifiMustBeEnabled => 'För att kunna använda Wi-Fi på den här datorn måste trådlöst nätverk vara aktiverat';

  @override
  String get enableWifi => 'Aktivera Wi-Fi';

  @override
  String get connectButtonText => 'Anslut';

  @override
  String get updatesOtherSoftwarePageTitle => 'Uppdateringar och annan programvara';

  @override
  String get updatesOtherSoftwarePageDescription => 'Vilka program skulle du vilja installera till att börja med?';

  @override
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Webbläsare, verktyg, office programvara, spel och mediaspelare.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

  @override
  String get minimalInstallationSubtitle => 'Webbläsare och grundläggande verktyg.';

  @override
  String get otherOptions => 'Andra alternativ';

  @override
  String get installThirdPartyTitle => 'Installera programvara från tredje part för grafik och Wi-Fi-hårdvara, samt ytterligare mediaformat';

  @override
  String get installThirdPartySubtitle => 'Denna programvara är föremål för licensvillkor som ingår i dess dokumentation. Vissa är proprietära.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Välj en säkerhetsnyckel';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of $RELEASE will not be encrypted.';
  }

  @override
  String get chooseSecurityKeyHint => 'Välj en säkerhetsnyckel';

  @override
  String get chooseSecurityKeyConfirmHint => 'Bekräfta säkerhetsnyckeln';

  @override
  String get chooseSecurityKeyRequired => 'En säkerhetsnyckel krävs';

  @override
  String get chooseSecurityKeyMismatch => 'Säkerhetsnycklarna stämmer inte överens';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Varning</font>: Om du tappar den här säkerhetsnyckeln kommer all data att gå förlorad. Om du behöver, skriv ner din nyckel och förvara den på ett säkert ställe någon annanstans.';
  }

  @override
  String get installationTypeTitle => 'Installationstyp';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Den här datorn har för närvarande $os på sig. Vad skulle du vilja göra?';
  }

  @override
  String get installationTypeNoOSDetected => 'Den här datorn har för närvarande inga upptäckta operativsystem. Vad skulle du vilja göra?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Radera disk och installera $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Varning:</font> Detta kommer att radera alla dina program, dokument, foton, musik och alla andra filer i alla operativsystem.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Avancerade funktioner...';

  @override
  String get installationTypeAdvancedTitle => 'Avancerade funktioner';

  @override
  String get installationTypeNone => 'Inga';

  @override
  String get installationTypeNoneSelected => 'Inga valda';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Use LVM with the new $RELEASE installation';
  }

  @override
  String get installationTypeLVMSelected => 'LVM valt';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Encrypt the new $RELEASE installation for security';
  }

  @override
  String get installationTypeEncryptInfo => 'Du väljer en säkerhetsnyckel i nästa steg.';

  @override
  String get installationTypeZFS => 'EXPERIMENTELLT: Radera disk och använd ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS valt';

  @override
  String installationTypeReinstall(Object os) {
    return 'Radera $os och installera om';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Varning:</font> Detta tar bort alla dina $os-program, dokument, foton, musik och alla andra filer.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Installera $product bredvid $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokument, musik och andra personliga filer kommer att sparas. Du kan välja vilket operativsystem du vill ha varje gång datorn startar.';

  @override
  String get installationTypeManual => 'Något annat';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Du kan skapa eller ändra storlek på partitioner själv, eller välja flera partitioner för $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Radera disk och installera $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Välj disk:';

  @override
  String get selectGuidedStorageInfoLabel => 'Hela disken kommer att användas:';

  @override
  String get selectGuidedStorageInstallNow => 'Installera nu';

  @override
  String get allocateDiskSpace => 'Tilldela diskutrymme';

  @override
  String get startInstallingButtonText => 'Börja installera';

  @override
  String get diskHeadersDevice => 'Enhet';

  @override
  String get diskHeadersType => 'Typ';

  @override
  String get diskHeadersMountPoint => 'Monteringspunkt';

  @override
  String get diskHeadersSize => 'Storlek';

  @override
  String get diskHeadersUsed => 'Used';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Formatera';

  @override
  String get freeDiskSpace => 'ledigt utrymme';

  @override
  String get newPartitionTable => 'Ny partitionstabell';

  @override
  String get newPartitionTableConfirmationTitle => 'Skapa en ny tom partitionstabell på den här enheten?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Enhet för installation av starthanteraren';

  @override
  String get partitionCreateTitle => 'Skapa partition';

  @override
  String get partitionEditTitle => 'Redigera partition';

  @override
  String get partitionSizeLabel => 'Storlek:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Typ för den nya partitionen:';

  @override
  String get partitionTypePrimary => 'Primär';

  @override
  String get partitionTypeLogical => 'Logisk';

  @override
  String get partitionLocationLabel => 'Plats för den nya partitionen:';

  @override
  String get partitionLocationBeginning => 'Början av detta utrymme';

  @override
  String get partitionLocationEnd => 'Slutet på detta utrymme';

  @override
  String get partitionFormatLabel => 'Används som:';

  @override
  String get partitionFormatExt4 => 'Ext4 journalfilsystem';

  @override
  String get partitionFormatExt3 => 'Ext3 journalfilsystem';

  @override
  String get partitionFormatExt2 => 'Ext2 filsystem';

  @override
  String get partitionFormatBtrfs => 'btrfs journalfilsystem';

  @override
  String get partitionFormatJfs => 'JFS journalfilsystem';

  @override
  String get partitionFormatXfs => 'XFS journalfilsystem';

  @override
  String get partitionFormatFat => 'FAT filsystem';

  @override
  String get partitionFormatFat12 => 'FAT12 filsystem';

  @override
  String get partitionFormatFat16 => 'FAT16 filsystem';

  @override
  String get partitionFormatFat32 => 'FAT32 filsystem';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'ISO 9960 filsystem';

  @override
  String get partitionFormatVfat => 'VFAT filsystem';

  @override
  String get partitionFormatNtfs => 'NTFS filsystem';

  @override
  String get partitionFormatReiserFS => 'ReiserFS filsystem';

  @override
  String get partitionFormatZfsroot => 'ZFS rotfilsystem';

  @override
  String get partitionErase => 'Formatera partitionen';

  @override
  String get partitionMountPointLabel => 'Monteringspunkt:';

  @override
  String get whoAreYouPageTitle => 'Vem är du?';

  @override
  String get whoAreYouPageAutoLogin => 'Logga in automatiskt';

  @override
  String get whoAreYouPageRequirePassword => 'Kräv mitt lösenord för att logga in';

  @override
  String get whoAreYouPageRealNameLabel => 'Ditt namn';

  @override
  String get whoAreYouPageRealNameRequired => 'Ett namn krävs';

  @override
  String get whoAreYouPageComputerNameLabel => 'Din dators namn';

  @override
  String get whoAreYouPageComputerNameInfo => 'Namnet den använder när den pratar med andra datorer.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Ett datornamn krävs';

  @override
  String get whoAreYouPageInvalidComputerName => 'Datornamnet är ogiltigt';

  @override
  String get whoAreYouPageUsernameLabel => 'Välj ett användarnamn';

  @override
  String get whoAreYouPageUsernameRequired => 'Ett användarnamn krävs';

  @override
  String get whoAreYouPageInvalidUsername => 'Användarnamnet är ogiltigt';

  @override
  String get whoAreYouPagePasswordLabel => 'Välj ett lösenord';

  @override
  String get whoAreYouPagePasswordRequired => 'Ett lösenord krävs';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bekräfta ditt lösenord';

  @override
  String get whoAreYouPagePasswordMismatch => 'Lösenorden stämmer inte överens';

  @override
  String get writeChangesToDisk => 'Skriv ändringar till disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Om du fortsätter kommer ändringarna nedan att skrivas till diskarna. Du kommer att kunna göra ytterligare ändringar manuellt.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Följande partitioner kommer att formateras:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} som $format används för $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} som $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Välj ditt utseende';

  @override
  String get chooseYourLookPageHeader => 'Du kan alltid ändra detta senare i utseendeinställningarna.';

  @override
  String get chooseYourLookPageDarkSetting => 'Mörk';

  @override
  String get chooseYourLookPageLightSetting => 'Ljus';

  @override
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

  @override
  String get installationCompleteTitle => 'Installationen är klar';

  @override
  String readyToUse(Object system) {
    return '**$system** är installerat och redo att användas.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Stäng av';

  @override
  String get turnOffBitlockerTitle => 'Slå av BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Den här datorn använder Windows BitLocker-kryptering.\nDu måste stänga av BitLocker i Windows innan du installerar Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'För instruktioner, öppna den här sidan på en telefon eller annan enhet: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';
}
