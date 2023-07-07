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
  String get changeButtonText => 'Ändern';

  @override
  String get restartButtonText => 'Neustart';

  @override
  String get revertButtonText => 'Zurücksetzen';

  @override
  String get quitButtonText => 'Installation beenden';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Willkommen bei $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return '$DISTRO wird vorbereitet …';
  }

  @override
  String localePageTitle(Object DISTRO) {
    return 'Willkommen bei $DISTRO';
  }

  @override
  String get localeHeader => 'Wählen Sie Ihre Sprache aus:';

  @override
  String welcomePageTitle(Object DISTRO) {
    return '$DISTRO ausprobieren oder installieren';
  }

  @override
  String get welcomeRepairOption => 'Installation reparieren';

  @override
  String get welcomeRepairDescription => 'Beim Reparieren wird die gesamte installierte Software neu installiert, ohne dass Dokumente oder Einstellungen angerührt werden.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return '$RELEASE ausprobieren';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'Sie können $RELEASE ausprobieren, ohne irgendwelche Änderungen an Ihrem Computer vorzunehmen.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return '$RELEASE installieren';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Installieren Sie $RELEASE neben (oder anstelle) Ihres aktuellen Betriebssystems. Dies sollte nicht allzu lange dauern.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Vielleicht möchten Sie die <a href=\"$url\">Veröffentlichungshinweise</a> lesen.';
  }

  @override
  String get rstTitle => 'RST ist aktiviert';

  @override
  String get rstHeader => 'Schalten Sie RST aus, um fortzufahren';

  @override
  String get rstDescription => 'Dieser Computer verwendet Intel RST (Rapid Storage Technology). Vor der Installation von Ubuntu muss RST in Windows ausgeschaltet werden.';

  @override
  String rstInstructions(Object url) {
    return 'Um Anweisungen zu erhalten, scannen Sie den QR-Code mit einem anderen Gerät oder besuchen Sie: <a href=\"https://$url\">$url</a>';
  }

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
  String get connectToInternetPageTitle => 'Mit einem Netzwerk verbinden';

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
  String get updatesOtherSoftwarePageTitle => 'Anwendungen und Aktualisierungen';

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
    return '<font color=\"$color\">Warnung:</font> Der Computer ist nicht an eine Stromquelle angeschlossen.';
  }

  @override
  String get offlineWarning => 'Sie sind derzeit offline';

  @override
  String get chooseSecurityKeyTitle => 'Sicherheitsschlüssel';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Die Festplattenverschlüsselung schützt Ihre Dateien, falls Sie Ihren Computer verlieren. Bei jedem Start des Computers müssen Sie einen Sicherheitsschlüssel eingeben.\n\nAlle Dateien außerhalb von $RELEASE werden nicht verschlüsselt.';
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
  String get installationTypeTitle => 'Art der Installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Auf diesem Computer befindet sich momentan $os. Wie möchten Sie vorgehen?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Auf diesem Computer sind aktuell $os1 und $os2 installiert. Was möchten Sie tun?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Auf diesem Computer sind aktuell mehrere Betriebssysteme installiert. Was möchten Sie tun?';

  @override
  String get installationTypeNoOSDetected => 'Auf diesem Computer befinden sich momentan keine erkannten Betriebssysteme. Wie möchten Sie vorgehen?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Festplatte löschen und $DISTRO installieren';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warnung:</font> Dies wird alle Ihre Programme, Dokumente, Fotos, Musik und alle anderen Dateien in allen Betriebssystemen löschen.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Erweiterte Funktionen ...';

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
  String get installationTypeAlongsideInfo => 'Dokumente, Musik und andere persönliche Dateien bleiben erhalten. Sie können bei jedem Start des Computers auswählen, welches Betriebssystem Sie verwenden möchten.';

  @override
  String get installationTypeManual => 'Manuelle Partitionierung';

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
  String get allocateDiskSpace => 'Manuelle Partitionierung';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Einhängepunkte müssen mit „/“ beginnen';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Einhängepunkte dürfen keine Leerzeichen enthalten';

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
  String get newPartitionTableConfirmationTitle => 'Neue leere Partition';

  @override
  String get newPartitionTableConfirmationMessage => 'Die Erstellung einer neuen Partitionstabelle auf einem gesamten Gerät entfernt alle aktuellen Partitionen. Dieser Vorgang kann bei Bedarf rückgängig gemacht werden.';

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
  String get partitionFormatNone => 'Unformatiert lassen';

  @override
  String partitionFormatKeep(Object format) {
    return 'Als $format formatiert lassen';
  }

  @override
  String get partitionErase => 'Partition formatieren';

  @override
  String get partitionMountPointLabel => 'Einhängepunkt:';

  @override
  String get identityPageTitle => 'Ihr Konto einrichten';

  @override
  String get identityAutoLogin => 'Automatisch anmelden';

  @override
  String get identityRequirePassword => 'Mein Passwort zum Anmelden abfragen';

  @override
  String get identityRealNameLabel => 'Ihr Name';

  @override
  String get identityRealNameRequired => 'Ein Name ist erforderlich';

  @override
  String get identityRealNameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get identityHostnameLabel => 'Name Ihres Computers';

  @override
  String get identityHostnameInfo => 'Der Name, der bei der Kommunikation mit anderen Computern verwendet wird.';

  @override
  String get identityHostnameRequired => 'Ein Computername ist erforderlich';

  @override
  String get identityHostnameTooLong => 'Dieser Computername ist zu lang.';

  @override
  String get identityInvalidHostname => 'Der Computername ist ungültig';

  @override
  String get identityUsernameLabel => 'Einen Benutzernamen auswählen';

  @override
  String get identityUsernameRequired => 'Ein Benutzername ist erforderlich';

  @override
  String get identityInvalidUsername => 'Der Benutzername ist ungültig';

  @override
  String get identityUsernameInUse => 'Dieser Benutzername existiert bereits.';

  @override
  String get identityUsernameSystemReserved => 'Dieser Name ist für die Systemnutzung reserviert.';

  @override
  String get identityUsernameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get identityUsernameInvalidChars => 'Dieser Name enthält ungültige Zeichen.';

  @override
  String get identityPasswordLabel => 'Ein Passwort auswählen';

  @override
  String get identityPasswordRequired => 'Ein Passwort ist erforderlich';

  @override
  String get identityConfirmPasswordLabel => 'Bestätigen Sie Ihr Passwort';

  @override
  String get identityPasswordMismatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get identityPasswordShow => 'Anzeigen';

  @override
  String get identityPasswordHide => 'Ausblenden';

  @override
  String get confirmPageTitle => 'Bereit zur Installation';

  @override
  String get confirmHeader => 'Wenn Sie fortfahren, werden die unten aufgeführten Änderungen auf die Festplatten geschrieben. Sie haben die Möglichkeit, weitere Änderungen manuell vorzunehmen.';

  @override
  String get confirmDevicesTitle => 'Geräte';

  @override
  String get confirmPartitionsTitle => 'Partitionen';

  @override
  String get confirmPartitionTables => 'Die Partitionstabellen der folgenden Laufwerke werden geändert:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'Die folgenden Partitionsänderungen werden vorgenommen:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'Größe der Partition <b>$sysname</b> von <b>$oldsize</b> auf <b>$newsize</b> geändert';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'Partition <b>$sysname</b> formatiert als <b>$format</b> verwendet für <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'Partition <b>$sysname</b> formatiert als <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'Partition <b>$sysname</b> verwendet für <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'Partition <b>$sysname</b> erstellt';
  }

  @override
  String get confirmInstallButton => 'Installieren';

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
  String get bitlockerTitle => 'BitLocker ist aktiviert';

  @override
  String get bitlockerHeader => 'Schalten Sie BitLocker aus, um fortzufahren';

  @override
  String bitlockerDescription(Object option) {
    return 'Dieser Computer verwendet die Windows-BitLocker-Verschlüsselung.\nSie müssen Windows verwenden, um freien Speicherplatz zu schaffen, oder wählen Sie \'$option\', um fortzufahren.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Für Anweisungen scannen Sie den QR-Code mit einem anderen Gerät oder besuchen Sie: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Neustart in Windows';

  @override
  String get restartIntoWindowsTitle => 'Neustart in Windows hinein?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Sind Sie sicher, dass Sie Ihren Computer neu starten möchten? Sie müssen die Installation von $DISTRO später neu starten, um die Installation von $DISTRO abzuschließen.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Willkommen bei $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Verfügbar:';

  @override
  String get installationSlidesIncluded => 'Einschließlich:';

  @override
  String get installationSlidesWelcomeTitle => 'Schnell, kostenlos und mit vielen neuen Funktionen';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'Die neueste Version von $DISTRO macht Computerarbeiten so einfach wie nie zuvor.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Egal, ob Sie Entwickler, Grafiker, Spieler oder Administrator sind, in $RELEASE finden Sie neue Werkzeuge, um Ihre Produktivität zu steigern und Ihre Erfahrung zu verbessern.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Alle Anwendungen, die Sie brauchen';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Installieren, verwalten und aktualisieren Sie alle Ihre Anwendungen in Ubuntu Software, einschließlich Tausender von Anwendungen aus dem Snap Store und dem $DISTRO-Archiv.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Entwickeln Sie mit dem Besten aus Open Source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO ist die ideale Arbeitsumgebung für App- oder Webentwicklung, Datenwissenschaft und KI/ML sowie für Devops und Administration. Jede $DISTRO-Version enthält die neuesten Toolchains und unterstützt alle wichtigen IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Steigern Sie Ihre Kreativität';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Wenn Sie ein Animator, Designer, Videokünstler oder Spieleentwickler sind, können Sie Ihre Arbeitsabläufe dank der Unterstützung von Open-Source- und Industriestandard-Software und -Anwendungen ganz einfach in $DISTRO einbringen.';
  }

  @override
  String get installationSlidesGamingTitle => 'Ideal für Spiele';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO unterstützt die neuesten NVIDIA- und Mesa-Treiber, um Leistung und Kompatibilität zu verbessern. Tausende von Windows-Titeln lassen sich auf $DISTRO über Anwendungen wie Steam ohne zusätzliche Konfiguration problemlos spielen.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privat und sicher';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO bietet alle Werkzeuge, die Sie brauchen, um privat und sicher online zu sein. Mit integrierter Firewall- und VPN-Unterstützung und einer Vielzahl von datenschutzfreundlichen Anwendungen, die Ihnen die volle Kontrolle über Ihre Daten geben.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Alle $DISTRO LTS-Versionen enthalten fünf Jahre lang Sicherheitspatches, mit einem Ubuntu Pro-Abonnement sogar zehn Jahre.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Erhöhen Sie Ihre Produktivität';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop enthält LibreOffice, eine Suite von Microsoft Office-kompatiblen quelloffenen Anwendungen für Dokumente, Tabellenkalkulationen und Präsentationen. Beliebte Werkzeuge für die Zusammenarbeit sind ebenfalls verfügbar.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Zugänglichkeit für alle';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'Im Mittelpunkt der $DISTRO-Philosophie steht die Überzeugung, dass Computer für alle da sind. Mit fortschrittlichen Werkzeugen für die Barrierefreiheit und Optionen zum Ändern von Sprache, Farben und Textgröße macht $DISTRO das Computerarbeiten einfach - egal wer und wo Sie sind.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca-Screenreader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Sprachunterstützung';

  @override
  String get installationSlidesSupportTitle => 'Hilfe & Unterstützung';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'Die offizielle $DISTRO-Dokumentation ist sowohl online als auch über das Hilfesymbol im Dock verfügbar.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu deckt eine Reihe von Fragen und Antworten ab und der Ubuntu Discourse bietet Anleitungen und Diskussionen für neue und erfahrene Benutzer.';

  @override
  String get installationSlidesSupportEnterprise => 'Für Unternehmensanwender bietet Canonical kommerzielle Unterstützung an, um die Einführung und sichere Verwaltung von Ubuntu am Arbeitsplatz zu erleichtern.';

  @override
  String get installationSlidesSupportResources => 'Hilfreiche Ressourcen:';

  @override
  String get installationSlidesSupportDocumentation => 'Offizielle Dokumentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Unternehmenstaugliche 24/7-Unterstützung mit Ubuntu Pro';

  @override
  String get copyingFiles => 'Dateien werden kopiert …';

  @override
  String get installingSystem => 'System wird installiert …';

  @override
  String get configuringSystem => 'System wird eingerichtet …';

  @override
  String get installationFailed => 'Installation fehlgeschlagen';

  @override
  String get notEnoughDiskSpaceTitle => 'Nicht genug Platz';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Nicht genügend Festplattenplatz für die Installation von $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Verfügbar:';

  @override
  String get notEnoughDiskSpaceRequired => 'Erforderlich:';

  @override
  String get activeDirectoryOption => 'Active Directory verwenden';

  @override
  String get activeDirectoryInfo => 'Im nächsten Schritt geben Sie die Domäne und andere Details ein.';

  @override
  String get activeDirectoryTitle => 'Active Directory konfigurieren';

  @override
  String get activeDirectoryTestConnection => 'Domänenverbindung testen';

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
  String get activeDirectoryAdminLabel => 'Benutzername für den Domänenbeitritt';

  @override
  String get activeDirectoryAdminEmpty => 'Erforderlich';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ungültige Zeichen';

  @override
  String get activeDirectoryPasswordLabel => 'Passwort';

  @override
  String get activeDirectoryPasswordEmpty => 'Erforderlich';

  @override
  String get activeDirectoryErrorTitle => 'Fehler beim Konfigurieren der Verbindung zum Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Entschuldigung, Active Directory kann im Moment nicht eingerichtet werden. Besuchen Sie für Hilfe <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, sobald Ihr System hochgefahren und in Betrieb ist.';
}
