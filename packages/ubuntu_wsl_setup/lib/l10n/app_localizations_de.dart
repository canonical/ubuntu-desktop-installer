import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Beenden';

  @override
  String get finishButton => 'Fertigstellen';

  @override
  String get saveButton => 'Speichern';

  @override
  String get setupButton => 'Einrichtung';

  @override
  String get selectLanguageTitle => 'Wählen Sie Ihre Sprache aus';

  @override
  String installLangPacksTitle(String lang) {
    return 'Pakete für bessere $lang Sprachunterstützung installieren';
  }

  @override
  String get installLangPacksSubtitle => 'Für langsame Verbindungen nicht empfohlen.';

  @override
  String get profileSetupTitle => 'Profileinrichtung';

  @override
  String get profileSetupHeader => 'Bitte erstellen Sie ein Standard-UNIX-Benutzerkonto. Weitere Informationen finden Sie unter: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ihr Name';

  @override
  String get profileSetupRealnameRequired => 'Ein Name ist erforderlich';

  @override
  String get profileSetupUsernameHint => 'Einen Benutzernamen auswählen';

  @override
  String get profileSetupUsernameHelper => 'Der Benutzername muss nicht mit Ihrem Windows-Benutzernamen übereinstimmen.';

  @override
  String get profileSetupPasswordHint => 'Ein Passwort auswählen';

  @override
  String get profileSetupConfirmPasswordHint => 'Bestätigen Sie Ihr Passwort';

  @override
  String get profileSetupShowAdvancedOptions => 'Erweiterte Optionen auf der nächsten Seite anzeigen';

  @override
  String get profileSetupPasswordMismatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get profileSetupUsernameRequired => 'Ein Benutzername ist erforderlich';

  @override
  String get profileSetupUsernameInvalid => 'Der Benutzername ist ungültig';

  @override
  String get profileSetupUsernameInUse => 'Dieser Benutzername existiert bereits.';

  @override
  String get profileSetupUsernameSystemReserved => 'Dieser Name ist für die Systemnutzung reserviert.';

  @override
  String get profileSetupUsernameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get profileSetupUsernameInvalidChars => 'Dieser Name enthält ungültige Zeichen.';

  @override
  String get profileSetupPasswordRequired => 'Ein Passwort ist erforderlich';

  @override
  String get advancedSetupTitle => 'Erweiterte Einrichtung';

  @override
  String get advancedSetupHeader => 'Auf dieser Seite können Sie Ubuntu WSL an Ihre Bedürfnisse anpassen.';

  @override
  String get advancedSetupMountLocationHint => 'Einhängeort';

  @override
  String get advancedSetupMountLocationHelper => 'Ort für das automatische Einhängen';

  @override
  String get advancedSetupMountLocationInvalid => 'Der Ort ist ungültig';

  @override
  String get advancedSetupMountOptionHint => 'Einhängeoption';

  @override
  String get advancedSetupMountOptionHelper => 'Einhängeoption, die für die automatische Einhängung übergeben wurde';

  @override
  String get advancedSetupHostGenerationTitle => 'Generierung des Hosts aktivieren';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Wenn diese Option ausgewählt ist, wird /etc/hosts bei jedem Start neu generiert.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Generierung der resolv.conf aktivieren';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Wenn diese Option ausgewählt ist, wird /etc/resolv.conf bei jedem Start neu generiert.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI-Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Wenn diese Option ausgewählt ist, wird die DISPLAY-Umgebung automatisch eingerichtet. X-Server eines Drittanbieters erforderlich.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Konfigurations-UI (experimentell)';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilität';

  @override
  String get configurationUIInteroperabilityTitle => 'Aktiviert';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Ob die Interoperabilität aktiviert ist.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Windows-Pfad anhängen';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Ob der Windows-Pfad an die Pfads-Umgebungsvariable in der WSL angehängt werden soll';

  @override
  String get configurationUIAutoMountHeader => 'Automatisches Einhängen';

  @override
  String get configurationUIAutoMountTitle => 'Aktiviert';

  @override
  String get configurationUIAutoMountSubtitle => 'Ob die Funktion zum automatischen Einhängen aktiviert ist. Mit dieser Funktion können Sie Windows-Laufwerke in WSL einhängen.';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab einhängen';

  @override
  String get configurationUIMountFstabSubtitle => 'Ob /etc/fstab eingehängt werden soll. Diese Datei enthält Informationen über die Dateisysteme, die das System einhängen wird.';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTELL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Aktiviert';

  @override
  String get configurationUISystemdSubtitle => 'Ob systemd beim Booten aktiviert werden soll. ACHTUNG: Dies ist eine experimentelle Funktion.';

  @override
  String get applyingChanges => 'Änderungen werden angewendet…';

  @override
  String get applyingChangesDisclaimer => 'Dies kann je nach Ihrer Internetverbindung einige Minuten dauern.';

  @override
  String get setupCompleteTitle => 'Einrichtung abgeschlossen';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hallo $user,\nSie haben die Einrichtung abgeschlossen.';
  }

  @override
  String get setupCompleteUpdate => 'Es wird empfohlen, den folgenden Befehl auszuführen, um Ubuntu auf die neueste Version zu aktualisieren:';

  @override
  String get setupCompleteRestart => '* Alle Einstellungen werden erst nach einem Neustart von Ubuntu wirksam.';

  @override
  String get installationSlidesWelcome => 'Willkommen bei Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Wird initialisiert ...';

  @override
  String get installationSlidesUnpacking => 'Distro wird entpackt';

  @override
  String get installationSlidesInstalling => 'Fast fertig. Das Installationsprogramm wird bald Ihre Aufmerksamkeit benötigen.';

  @override
  String get installationSlidesLaunching => 'Distro wird gestartet ...';

  @override
  String get installationSlidesErrorMsg => 'Etwas ist schiefgelaufen.';

  @override
  String get installationSlidesErrorTitle => 'Etwas ist schiefgelaufen';

  @override
  String get installationSlidesErrorSub => 'Bitte starten Sie das WSL mit dem folgenden Befehl neu und versuchen Sie es erneut:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nEs ist ein nicht behebbarer Fehler aufgetreten.\n\nBitte schließen Sie diese Anwendung, öffnen Sie die Powershell oder die Eingabeaufforderung und geben Sie die folgenden Befehle ein:\n';

  @override
  String get installationSlidesDone => 'Alles bereit. Viel Spaß mit Ubuntu auf dem WSL';

  @override
  String get installationSlidesExitTitle => 'Sind Sie sicher, dass Sie gehen möchten?';

  @override
  String get installationSlidesExitContents => 'Das Schließen dieses Fensters verhindert nicht, dass die Installation im Hintergrund fortgesetzt wird.\n\nAußerdem können Sie weiter erkunden, was Sie mit Ubuntu auf dem WSL machen können.';

  @override
  String get installationSlidesCustomExitTitle => 'Wir sind fast fertig';

  @override
  String get installationSlidesCustomExitContents => 'Es sind nur noch ein paar Schritte im Hauptfenster des Installationsprogramms zu erledigen.\nKönnen wir dieses Fenster verlassen und dorthin gehen?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Verlassen';

  @override
  String get installationSlidesCancel => 'Abbrechen';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu auf dem WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Eine vollständige Ubuntu-Umgebung, die tief in Windows integriert ist, für die Entwicklung und Ausführung von Linux-Anwendungen. Optimiert für Cloud, Web, Datenwissenschaft, Internet der Dinge und Spaß!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL für\nWeb-Entwicklung';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Entwickeln Sie in WSL mit nativen Windows-IDEs wie VS Code und IntelliJ und profitieren Sie von der vollständigen Unterstützung für NodeJS und Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL für Datenwissenschaft';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'Mit dem NVIDIA Data Science Stack können Sie die Leistung von Datenanalyse- und Machine-Learning-Projekten auf der Grundlage nativer Windows NVIDIA-Treiber maximieren.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL für\nGrafische Anwendungen';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Entwickeln und erstellen Sie eine Vorschau von Web- und grafischen Anwendungen unter Linux mit WSLg für die plattformübergreifende Entwicklung.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL für DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Stellen Sie die Kompatibilität der CI/CD-Pipeline sicher, indem Sie lokal auf Ubuntu WSL entwickeln, bevor Sie sie in einer Ubuntu-Produktionsumgebung veröffentlichen';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL für Unternehmen';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Stärken Sie Entwickler in einem\nWindows Unternehmens-Ökosystem\nmit einem zertifizierten Ubuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Mehr dazu erfahren';

  @override
  String get installationSlidesFindOutMoreVisit => 'Besuchen Sie ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' um mehr über Ubuntu auf WSL zu erfahren und darüber, wie Canonical Entwickler und Organisationen unterstützt.';
}
