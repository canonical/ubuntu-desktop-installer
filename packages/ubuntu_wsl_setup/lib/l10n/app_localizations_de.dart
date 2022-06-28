


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
    return 'Hallo $user,\nSie haben die Einrichtung erfolgreich abgeschlossen.';
  }

  @override
  String get setupCompleteUpdate => 'Es wird empfohlen, den folgenden Befehl auszuführen, um Ubuntu auf die neueste Version zu aktualisieren:';

  @override
  String get setupCompleteRestart => '* Alle Einstellungen werden erst nach einem Neustart von Ubuntu wirksam.';

  @override
  String get welcome => 'Welcome to Ubuntu WSL';

  @override
  String get initializing => 'Initializing...';

  @override
  String get unpacking => 'Unpacking the distro';

  @override
  String get installing => 'Almost done. The installer will require your attention soon.';

  @override
  String get launching => 'Launching distro...';

  @override
  String get errorMsg => 'Something went wrong.';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get errorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get done => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get exitTitle => 'Are you sure you want to leave?';

  @override
  String get exitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get customExitTitle => 'We are almost done';

  @override
  String get customExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Leave';

  @override
  String get cancel => 'Cancel';

  @override
  String get ubuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get ubuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get ubuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get ubuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get ubuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get findOutMore => 'Find out more';

  @override
  String get findOutMoreVisit => 'Visit ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
