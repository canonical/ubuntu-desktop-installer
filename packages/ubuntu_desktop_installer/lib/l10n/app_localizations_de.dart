import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Ubuntu-Desktop-Installationsprogramm';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE installieren';
  }

  @override
  String get cancelButtonText => 'Abbrechen';

  @override
  String get changeButtonText => 'Ändern';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Nein';

  @override
  String get restartButtonText => 'Neustart';

  @override
  String get revertButtonText => 'Zurücksetzen';

  @override
  String get yesButtonText => 'Ja';

  @override
  String get quitButtonText => 'Installation beenden';

  @override
  String get welcome => 'Willkommen';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Wählen Sie Ihre Sprache aus:';

  @override
  String get tryOrInstallPageTitle => 'Ausprobieren oder installieren';

  @override
  String get repairInstallation => 'Installation reparieren';

  @override
  String get repairInstallationDescription => 'Beim Reparieren wird die gesamte installierte Software neu installiert, ohne dass Dokumente oder Einstellungen angerührt werden.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE ausprobieren';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Sie können $RELEASE ausprobieren, ohne irgendwelche Änderungen an Ihrem Computer vorzunehmen.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE installieren';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installieren Sie $RELEASE neben (oder anstelle) Ihres aktuellen Betriebssystems. Dies sollte nicht allzu lange dauern.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Vielleicht möchten Sie die <a href=\"$url\">Veröffentlichungshinweise</a> lesen.';
  }

  @override
  String get turnOffRST => 'RST ausschalten';

  @override
  String get turnOffRSTDescription => 'Dieser Rechner verwendet Intel RST (Rapid Storage Technology). Vor der Installation von Ubuntu muss RST in Windows ausgeschaltet werden.';

  @override
  String instructionsForRST(Object url) {
    return 'Um Anweisungen zu erhalten, öffnen Sie diese Seite auf einem Smartphone oder einem anderen Gerät: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Tastaturbelegung';

  @override
  String get chooseYourKeyboardLayout => 'Wählen Sie Ihre Tastaturbelegung aus:';

  @override
  String get typeToTest => 'Geben Sie hier etwas ein, um Ihre Tastaturbelegung zu überprüfen';

  @override
  String get detectLayout => 'Tastaturbelegung erkennen';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Bitte drücken Sie eine der folgenden Tasten:';

  @override
  String get isKeyPresent => 'Ist die folgende Taste auf Ihrer Tastatur vorhanden?';

  @override
  String get configureSecureBootTitle => 'Secure Boot konfigurieren';

  @override
  String get configureSecureBootDescription => 'Sie haben sich für die Installation von Treibersoftware von Drittanbietern entschieden. Dazu muss Secure Boot ausgeschaltet werden.\nDazu müssen Sie jetzt einen Sicherheitsschlüssel auswählen und ihn beim Neustart des Systems eingeben.';

  @override
  String get configureSecureBootOption => 'Secure Boot konfigurieren';

  @override
  String get chooseSecurityKey => 'Sicherheitsschlüssel auswählen';

  @override
  String get confirmSecurityKey => 'Sicherheitsschlüssel bestätigen';

  @override
  String get dontInstallDriverSoftwareNow => 'Installieren Sie die Treibersoftware vorerst nicht';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Sie können sie später über Software & Aktualisierungen installieren.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Ein Sicherheitsschlüssel ist erforderlich';

  @override
  String get secureBootSecurityKeysDontMatch => 'Die Sicherheitsschlüssel stimmen nicht überein';

  @override
  String get showSecurityKey => 'Sicherheitsschlüssel anzeigen';

  @override
  String get connectToInternetPageTitle => 'Mit dem Internet verbinden';

  @override
  String get connectToInternetDescription => 'Die Verbindung des Computers mit dem Internet hilft Ubuntu bei der Installation zusätzlicher Software und bei der Auswahl der Zeitzone.\n\nPer Ethernet-Kabel verbinden oder ein WLAN-Netzwerk auswählen';

  @override
  String get useWiredConnection => 'Kabelgebundene Verbindung verwenden';

  @override
  String get noWiredConnection => 'Keine kabelgebundene Verbindung erkannt';

  @override
  String get wiredDisabled => 'Kabelgebundene Verbindung ist ausgeschaltet';

  @override
  String get wiredMustBeEnabled => 'Für die Verwendung von Ethernet auf diesem Computer muss eine kabelgebundene Verbindung aktiviert sein';

  @override
  String get enableWired => 'Kabelgebundenes Ethernet aktivieren';

  @override
  String get selectWifiNetwork => 'Mit einem WLAN-Netzwerk verbinden';

  @override
  String get hiddenWifiNetwork => 'Mit einem versteckten WLAN-Netzwerk verbinden';

  @override
  String get hiddenWifiNetworkNameLabel => 'Netzwerkname';

  @override
  String get hiddenWifiNetworkNameRequired => 'Der Netzwerkname wird benötigt';

  @override
  String get noInternet => 'Ich will gerade keine Verbindung zum Internet herstellen';

  @override
  String get wirelessNetworkingDisabled => 'Drahtloses Netzwerk deaktiviert';

  @override
  String get noWifiDevicesDetected => 'Keine WLAN-Geräte erkannt';

  @override
  String get wifiMustBeEnabled => 'Für die Verwendung von WLAN auf diesem Computer muss das drahtlose Netzwerk aktiviert sein';

  @override
  String get enableWifi => 'WLAN aktivieren';

  @override
  String get connectButtonText => 'Verbinden';

  @override
  String get updatesOtherSoftwarePageTitle => 'Aktualisierungen und andere Software';

  @override
  String get updatesOtherSoftwarePageDescription => 'Welche Anwendungen möchten Sie am Anfang installieren?';

  @override
  String get normalInstallationTitle => 'Normale Installation';

  @override
  String get normalInstallationSubtitle => 'Webbrowser, Dienstprogramme, Büroanwendungen, Spiele und Medienspieler.';

  @override
  String get minimalInstallationTitle => 'Minimale Installation';

  @override
  String get minimalInstallationSubtitle => 'Webbrowser und grundlegende Dienstprogramme.';

  @override
  String get otherOptions => 'Weitere Optionen';

  @override
  String get installThirdPartyTitle => 'Software von Drittanbietern für Grafik- und WLAN-Hardware sowie zusätzliche Medienformate installieren';

  @override
  String get installThirdPartySubtitle => 'Diese Software unterliegt den Lizenzbedingungen, die in der Dokumentation enthalten sind. Ein Teil davon ist proprietär.';

  @override
  String get installDriversTitle => 'Software von Drittanbietern für Grafik- und WLAN-Hardware installieren';

  @override
  String get installDriversSubtitle => 'Diese Treiber unterliegen den Lizenzbedingungen, die in ihrer Dokumentation enthalten sind. Sie sind proprietär.';

  @override
  String get installCodecsTitle => 'Unterstützung für zusätzliche Medienformate herunterladen und installieren';

  @override
  String get installCodecsSubtitle => 'Diese Software unterliegt den Lizenzbedingungen, die in ihrer Dokumentation enthalten sind. Einige sind proprietär.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warnung:</font> Der Rechner ist nicht an eine Stromquelle angeschlossen.';
  }

  @override
  String get offlineWarning => 'Sie sind derzeit offline';

  @override
  String get chooseSecurityKeyTitle => 'Sicherheitsschlüssel auswählen';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Die Festplattenverschlüsselung schützt Ihre Dateien, falls Sie Ihren Rechner verlieren. Bei jedem Start des Rechners müssen Sie einen Sicherheitsschlüssel eingeben.\n\nAlle Dateien außerhalb von $RELEASE werden nicht verschlüsselt.';
  }

  @override
  String get chooseSecurityKeyHint => 'Wählen Sie einen Sicherheitsschlüssel aus';

  @override
  String get chooseSecurityKeyConfirmHint => 'Bestätigen Sie den Sicherheitsschlüssel';

  @override
  String get chooseSecurityKeyRequired => 'Ein Sicherheitsschlüssel ist erforderlich';

  @override
  String get chooseSecurityKeyMismatch => 'Die Sicherheitsschlüssel stimmen nicht überein';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warnung:</font> Falls Sie diesen Sicherheitsschlüssel verlieren, sind alle Daten verloren. Bei Bedarf können Sie sich den Schlüssel aufschreiben und ihn an einem sicheren Ort verwahren.';
  }

  @override
  String get installationTypeTitle => 'Installationsart';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Auf diesem Rechner befindet sich momentan $os. Wie möchten Sie vorgehen?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Auf diesem Computer sind aktuell $os1 und $os2 installiert. Was möchten Sie tun?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Auf diesem Computer sind aktuell mehrere Betriebssysteme installiert. Was möchten Sie tun?';

  @override
  String get installationTypeNoOSDetected => 'Auf diesem Rechner befinden sich momentan keine erkannten Betriebssysteme. Wie möchten Sie vorgehen?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Festplatte löschen und $DISTRO installieren';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warnung:</font> Dies wird alle Ihre Programme, Dokumente, Fotos, Musik und alle anderen Dateien in allen Betriebssystemen löschen.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Erweiterte Funktionen …';

  @override
  String get installationTypeAdvancedTitle => 'Erweiterte Funktionen';

  @override
  String get installationTypeNone => 'Keine';

  @override
  String get installationTypeNoneSelected => 'Keine ausgewählt';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'LVM bei der neuen $RELEASE -Installation verwenden';
  }

  @override
  String get installationTypeLVMSelected => 'LVM ausgewählt';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM und Verschlüsselung ausgewählt';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Die neue $RELEASE -Installation zur Sicherheit verschlüsseln';
  }

  @override
  String get installationTypeEncryptInfo => 'Im nächsten Schritt wählen Sie einen Sicherheitsschlüssel aus.';

  @override
  String get installationTypeZFS => 'EXPERIMENTELL: Festplatte löschen und ZFS verwenden';

  @override
  String get installationTypeZFSSelected => 'ZFS ausgewählt';

  @override
  String installationTypeReinstall(Object os) {
    return '$os löschen und neu installieren';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Warning:</font> Dies wird alle Ihre Programme, Dokumente, Fotos, Musik und alle anderen Dateien von $os löschen.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product neben $os installieren';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return '$product neben $os1 und $os2 installieren';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return '$product neben diesen installieren';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return '$product neben anderen Partitionen installieren';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumente, Musik und andere persönliche Dateien bleiben erhalten. Sie können bei jedem Start des Rechners auswählen, welches Betriebssystem Sie verwenden möchten.';

  @override
  String get installationTypeManual => 'Etwas Anderes';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Sie können selbst Partitionen erstellen, deren Größe ändern oder mehrere Partitionen für $DISTRO auswählen';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Festplatte löschen und $DISTRO installieren';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Laufwerk auswählen:';

  @override
  String get selectGuidedStorageInfoLabel => 'Die gesamte Festplatte wird verwendet:';

  @override
  String get selectGuidedStorageInstallNow => 'Jetzt installieren';

  @override
  String get installAlongsideSpaceDivider => 'Weisen Sie dem Laufwerk Speicherplatz zu, indem Sie die Trennlinie darunter ziehen:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num kleinere Partitionen werden ausgeblendet, verwenden Sie das <a href=\"$url\">erweiterte Partitionierungswerkzeug⁣</a> für mehr Kontrolle';
  }

  @override
  String get installAlongsideResizePartition => 'Größe der Partition ändern';

  @override
  String get installAlongsideAllocateSpace => 'Speicherplatz zuweisen';

  @override
  String get installAlongsideFiles => 'Dateien';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Größe:';

  @override
  String get installAlongsideAvailable => 'Verfügbar:';

  @override
  String get allocateDiskSpace => 'Festplattenspeicher zuweisen';

  @override
  String get startInstallingButtonText => 'Installieren';

  @override
  String get diskHeadersDevice => 'Laufwerk';

  @override
  String get diskHeadersType => 'Verwendung';

  @override
  String get diskHeadersMountPoint => 'Einhängepunkt';

  @override
  String get diskHeadersSize => 'Größe';

  @override
  String get diskHeadersUsed => 'Belegt';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Formatieren';

  @override
  String get freeDiskSpace => 'Freier Speicherplatz';

  @override
  String get newPartitionTable => 'Neue Partitionstabelle';

  @override
  String get newPartitionTableConfirmationTitle => 'Eine neue leere Partitionstabelle auf diesem Gerät erstellen?';

  @override
  String get newPartitionTableConfirmationMessage => 'Sie haben ein ganzes Gerät zur Partitionierung ausgewählt. Wenn Sie mit der Erstellung einer neuen Partitionstabelle fortfahren, werden alle aktuellen Partitionen entfernt.\n\nBeachten Sie, dass Sie diesen Vorgang später rückgängig machen können, wenn Sie dies wünschen.';

  @override
  String get tooManyPrimaryPartitions => 'Zu viele primäre Partitionen';

  @override
  String get partitionLimitReached => 'Grenze erreicht';

  @override
  String get bootLoaderDevice => 'Laufwerk zur Installation des Bootloaders';

  @override
  String get partitionCreateTitle => 'Partition erstellen';

  @override
  String get partitionEditTitle => 'Partition bearbeiten';

  @override
  String get partitionSizeLabel => 'Größe:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Typ der neuen Partition:';

  @override
  String get partitionTypePrimary => 'Primär';

  @override
  String get partitionTypeLogical => 'Logisch';

  @override
  String get partitionLocationLabel => 'Ort der neuen Partition:';

  @override
  String get partitionLocationBeginning => 'Anfang dieses Bereichs';

  @override
  String get partitionLocationEnd => 'Ende dieses Bereichs';

  @override
  String get partitionFormatLabel => 'Verwendet als:';

  @override
  String get partitionFormatExt4 => 'Ext4-Journaling-Dateisystem';

  @override
  String get partitionFormatExt3 => 'Ext3-Journaling-Dateisystem';

  @override
  String get partitionFormatExt2 => 'Ext2-Dateisystem';

  @override
  String get partitionFormatBtrfs => 'btrfs-Journaling-Dateisystem';

  @override
  String get partitionFormatJfs => 'JFS-Journaling-Dateisystem';

  @override
  String get partitionFormatXfs => 'XFS-Journaling-Dateisystem';

  @override
  String get partitionFormatFat => 'FAT-Dateisystem';

  @override
  String get partitionFormatFat12 => 'FAT12-Dateisystem';

  @override
  String get partitionFormatFat16 => 'FAT16-Dateisystem';

  @override
  String get partitionFormatFat32 => 'FAT32-Dateisystem';

  @override
  String get partitionFormatSwap => 'Auslagerungsbereich';

  @override
  String get partitionFormatIso9660 => 'ISO-9660-Dateisystem';

  @override
  String get partitionFormatVfat => 'VFAT-Dateisystem';

  @override
  String get partitionFormatNtfs => 'NTFS-Dateisystem';

  @override
  String get partitionFormatReiserFS => 'ReiserFS-Dateisystem';

  @override
  String get partitionFormatZfsroot => 'ZFS-Root-Dateisystem';

  @override
  String get partitionFormatNone => 'Unformatiert lassen';

  @override
  String get partitionErase => 'Partition formatieren';

  @override
  String get partitionMountPointLabel => 'Einhängepunkt:';

  @override
  String get whoAreYouPageTitle => 'Wer sind Sie?';

  @override
  String get whoAreYouPageAutoLogin => 'Automatisch anmelden';

  @override
  String get whoAreYouPageRequirePassword => 'Mein Passwort zum Anmelden abfragen';

  @override
  String get whoAreYouPageRealNameLabel => 'Ihr Name';

  @override
  String get whoAreYouPageRealNameRequired => 'Ein Name ist erforderlich';

  @override
  String get whoAreYouPageRealNameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Name Ihres Rechners';

  @override
  String get whoAreYouPageComputerNameInfo => 'Der Name, der bei der Kommunikation mit anderen Rechnern verwendet wird.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Ein Rechnername ist erforderlich';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Dieser Rechnername ist zu lang.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Der Rechnername ist ungültig';

  @override
  String get whoAreYouPageUsernameLabel => 'Einen Benutzernamen auswählen';

  @override
  String get whoAreYouPageUsernameRequired => 'Ein Benutzername ist erforderlich';

  @override
  String get whoAreYouPageInvalidUsername => 'Der Benutzername ist ungültig';

  @override
  String get whoAreYouPageUsernameInUse => 'Dieser Benutzername existiert bereits.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Dieser Name ist für die Systemnutzung reserviert.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Dieser Name enthält ungültige Zeichen.';

  @override
  String get whoAreYouPagePasswordLabel => 'Ein Passwort auswählen';

  @override
  String get whoAreYouPagePasswordRequired => 'Ein Passwort ist erforderlich';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bestätigen Sie Ihr Passwort';

  @override
  String get whoAreYouPagePasswordMismatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get whoAreYouPagePasswordShow => 'Anzeigen';

  @override
  String get whoAreYouPagePasswordHide => 'Ausblenden';

  @override
  String get writeChangesToDisk => 'Änderungen auf die Festplatte schreiben';

  @override
  String get writeChangesFallbackSerial => 'Festplatte';

  @override
  String get writeChangesDescription => 'Wenn Sie fortfahren, werden die unten aufgeführten Änderungen auf die Festplatten geschrieben. Sie haben die Möglichkeit, weitere Änderungen manuell vorzunehmen.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Die Partitionstabellen der folgenden Laufwerke werden geändert:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Die folgenden Partitionsänderungen werden vorgenommen:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'Größe der Partition #$disk$partition von $oldsize auf $newsize geändert';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'Partition #$disk$partition formatiert als $format verwendet für $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'Partition #$disk$partition formatiert als $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'Partition #$disk$partition verwendet für $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'Partition #$disk$partition erstellt';
  }

  @override
  String get chooseYourLookPageTitle => 'Wählen Sie Ihr Aussehen aus';

  @override
  String get chooseYourLookPageHeader => 'Sie können dies später in den Einstellungen für das Erscheinungsbild jederzeit ändern.';

  @override
  String get chooseYourLookPageDarkSetting => 'Dunkel';

  @override
  String get chooseYourLookPageLightSetting => 'Hell';

  @override
  String get installationCompleteTitle => 'Installation abgeschlossen';

  @override
  String readyToUse(Object system) {
    return '**$system** ist installiert und einsatzbereit';
  }

  @override
  String restartInto(Object system) {
    return 'Neustart unter $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Sie können $RELEASE jetzt weiter ausprobieren, aber alle Änderungen, die Sie bis zu einem Neustart des Systems durchführen, werden nicht gespeichert.';
  }

  @override
  String get shutdown => 'Herunterfahren';

  @override
  String get restartNow => 'Jetzt neu starten';

  @override
  String get continueTesting => 'Testen fortsetzen';

  @override
  String get turnOffBitlockerTitle => 'BitLocker ausschalten';

  @override
  String get turnOffBitlockerDescription => 'Dieser Rechner verwendet die Windows-BitLocker-Verschlüsselung.\nSie müssen BitLocker in Windows deaktivieren, bevor Sie Ubuntu installieren.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Um Anweisungen zu erhalten, öffnen Sie diese Seite auf einem Smartphone oder einem anderen Gerät: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Neustart in Windows';

  @override
  String get whereAreYouPageTitle => 'Wo bist du?';

  @override
  String get whereAreYouLocationLabel => 'Standort';

  @override
  String get whereAreYouTimezoneLabel => 'Zeitzone';

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
  String get copyingFiles => 'Dateien werden kopiert …';

  @override
  String get installingSystem => 'System wird installiert …';

  @override
  String get configuringSystem => 'System wird eingerichtet …';

  @override
  String get installationFailed => 'Installation fehlgeschlagen';

  @override
  String get notEnoughDiskSpaceTitle => 'Entschuldigung';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';

  @override
  String get activeDirectoryOption => 'Active Directory verwenden';

  @override
  String get activeDirectoryInfo => 'Im nächsten Schritt geben Sie die Domäne und andere Details ein.';

  @override
  String get activeDirectoryTitle => 'Active Directory konfigurieren';

  @override
  String get activeDirectoryTestConnection => 'Verbindung testen';

  @override
  String get activeDirectoryDomainLabel => 'Domäne';

  @override
  String get activeDirectoryDomainEmpty => 'Erforderlich';

  @override
  String get activeDirectoryDomainTooLong => 'Zu lang';

  @override
  String get activeDirectoryDomainInvalidChars => 'Ungültige Zeichen';

  @override
  String get activeDirectoryDomainStartDot => 'Beginnt mit einem Punkt (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Endet mit einem Punkt (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Beginnt mit einem Bindestrich (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Endet mit einem Bindestrich (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Enthält mehrere aufeinanderfolgende Punkte (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domäne nicht gefunden';

  @override
  String get activeDirectoryAdminLabel => 'Domänenadministrator';

  @override
  String get activeDirectoryAdminEmpty => 'Erforderlich';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ungültige Zeichen';

  @override
  String get activeDirectoryPasswordLabel => 'Passwort';

  @override
  String get activeDirectoryPasswordEmpty => 'Erforderlich';

  @override
  String get activeDirectoryErrorTitle => 'Fehler beim Einrichten der Verbindung zum Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Entschuldigung, Active Directory kann im Moment nicht eingerichtet werden. Besuchen Sie für Hilfe <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, sobald Ihr System hochgefahren und in Betrieb ist.';
}
