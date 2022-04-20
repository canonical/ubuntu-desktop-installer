


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
  String get configurationUIMountFstabSubtitle => 'Ob /etc/fstab eingehängt werden soll. Die Konfigurationsdatei /etc/fstab enthält die ???';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTELL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Aktiviert';

  @override
  String get configurationUISystemdSubtitle => 'Ob systemd beim Booten aktiviert werden soll. ACHTUNG: Dies ist eine experimentelle Funktion.';

  @override
  String get applyingChanges => 'Änderungen werden angewendet...';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

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
}
