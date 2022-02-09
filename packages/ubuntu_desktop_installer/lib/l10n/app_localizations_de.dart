


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
  String get welcome => 'Willkommen';

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
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Mit einem WLAN-Netzwerk verbinden';

  @override
  String get hiddenWifiNetwork => 'Connect to a hidden Wi-Fi network';

  @override
  String get hiddenWifiNetworkNameLabel => 'Network name';

  @override
  String get hiddenWifiNetworkNameRequired => 'A network name is required';

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
  String get installThirdPartyTitle => 'Installieren Sie Software von Drittanbietern für Grafik- und Wi-Fi-Hardware sowie für zusätzliche Medienformate';

  @override
  String get installThirdPartySubtitle => 'Diese Software unterliegt den Lizenzbedingungen, die in der Dokumentation enthalten sind. Ein Teil davon ist proprietär.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warnung</font>: Der Rechner ist nicht an eine Stromquelle angeschlossen.';
  }

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
    return '<font color=\"$color\">Warnung</font>: Falls Sie diesen Sicherheitsschlüssel verlieren, sind alle Daten verloren. Bei Bedarf können Sie sich den Schlüssel aufschreiben und ihn an einem sicheren Ort verwahren.';
  }

  @override
  String get installationTypeTitle => 'Installationsart';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Auf diesem Rechner befindet sich momentan $os. Wie möchten Sie vorgehen?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

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
  String get allocateDiskSpace => 'Festplattenspeicher zuweisen';

  @override
  String get startInstallingButtonText => 'Installation starten';

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
  String get newPartitionTableConfirmationMessage => 'Sie haben ein ganzes Gerät zur Partitionierung ausgewählt. Wenn Sie mit der Erstellung einer neuen Partitionstabelle auf dem Gerät fortfahren, werden alle aktuellen Partitionen entfernt.\n\nBeachten Sie, dass Sie diesen Vorgang später rückgängig machen können, wenn Sie dies wünschen.';

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
  String get partitionUnitKB => 'KB';

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
  String get whoAreYouPageComputerNameLabel => 'Name Ihres Rechners';

  @override
  String get whoAreYouPageComputerNameInfo => 'Der Name, der bei der Kommunikation mit anderen Rechnern verwendet wird.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Ein Rechnername ist erforderlich';

  @override
  String get whoAreYouPageInvalidComputerName => 'Der Rechnername ist ungültig';

  @override
  String get whoAreYouPageUsernameLabel => 'Einen Benutzernamen auswählen';

  @override
  String get whoAreYouPageUsernameRequired => 'Ein Benutzername ist erforderlich';

  @override
  String get whoAreYouPageInvalidUsername => 'Der Benutzername ist ungültig';

  @override
  String get whoAreYouPagePasswordLabel => 'Ein Passwort auswählen';

  @override
  String get whoAreYouPagePasswordRequired => 'Ein Passwort ist erforderlich';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Bestätigen Sie Ihr Passwort';

  @override
  String get whoAreYouPagePasswordMismatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get writeChangesToDisk => 'Änderungen auf die Festplatte schreiben';

  @override
  String get writeChangesFallbackSerial => 'Festplatte';

  @override
  String get writeChangesDescription => 'Wenn Sie fortfahren, werden die unten aufgeführten Änderungen auf die Festplatten geschrieben. Sie haben die Möglichkeit, weitere Änderungen manuell vorzunehmen.';

  @override
  String get writeChangesPartitionTablesHeader => 'Die Partitionstabellen der folgenden Laufwerke werden geändert:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Die folgenden Partitionen werden formatiert:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'Partition #$disk${partition} als $format benutzt für $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'Partition #$disk${partition} als $format';
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
  String get chooseYourLookPageLightBodyText => 'Alles ist hell und freundlich';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hallo Dunkelheit, mein alter Freund';

  @override
  String get installationCompleteTitle => 'Installation abgeschlossen';

  @override
  String readyToUse(Object system) {
    return '**$system** ist installiert und einsatzbereit.';
  }

  @override
  String restartInto(Object system) {
    return 'Neustart unter $system';
  }

  @override
  String get shutdown => 'Herunterfahren';

  @override
  String get turnOffBitlockerTitle => 'BitLocker ausschalten';

  @override
  String get turnOffBitlockerDescription => 'Dieser Rechner verwendet die Windows-BitLocker-Verschlüsselung.\nSie müssen BitLocker in Windows deaktivieren, bevor Sie Ubuntu installieren.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Um Anweisungen zu erhalten, öffnen Sie diese Seite auf einem Smartphone oder einem anderen Gerät: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Neustart unter Windows';

  @override
  String get whereAreYouPageTitle => 'Where are you?';

  @override
  String get whereAreYouLocationLabel => 'Location';

  @override
  String get whereAreYouTimezoneLabel => 'Timezone';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Fast and full of new features, the latest version of $RELEASE makes computing easier than ever. Here are just a few cool new things to look out for...';
  }

  @override
  String get softwareSlideTitle => 'Find even more software';

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
  String get officeSlideDescription => 'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.';

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
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, $RELEASE makes computing easy - whoever and wherever you are.';
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
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
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
}
