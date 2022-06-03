


import 'app_localizations.dart';

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Avsluta';

  @override
  String get finishButton => 'Slutför';

  @override
  String get saveButton => 'Spara';

  @override
  String get setupButton => 'Ställ in';

  @override
  String get selectLanguageTitle => 'Välj ditt språk';

  @override
  String get profileSetupTitle => 'Ställ in profil';

  @override
  String get profileSetupHeader => 'Skapa ett standard UNIX-användarkonto. För mer information besök: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ditt namn';

  @override
  String get profileSetupRealnameRequired => 'Ett namn krävs';

  @override
  String get profileSetupUsernameHint => 'Välj ett användarnamn';

  @override
  String get profileSetupUsernameHelper => 'Användarnamnet behöver inte matcha ditt Windows-användarnamn.';

  @override
  String get profileSetupPasswordHint => 'Välj ett lösenord';

  @override
  String get profileSetupConfirmPasswordHint => 'Bekräfta ditt lösenord';

  @override
  String get profileSetupShowAdvancedOptions => 'Visa avancerade alternativ nästa sida';

  @override
  String get profileSetupPasswordMismatch => 'Lösenorden stämmer inte överens';

  @override
  String get profileSetupUsernameRequired => 'Ett användarnamn krävs';

  @override
  String get profileSetupUsernameInvalid => 'Användarnamnet är ogiltigt';

  @override
  String get profileSetupUsernameInUse => 'Det där användarnamnet existerar redan.';

  @override
  String get profileSetupUsernameSystemReserved => 'Det där namnet är reserverat för system-användning.';

  @override
  String get profileSetupUsernameTooLong => 'Det där namnet är för långt.';

  @override
  String get profileSetupUsernameInvalidChars => 'Det där namnet innehåller ogiltiga tecken.';

  @override
  String get profileSetupPasswordRequired => 'Ett lösenord krävs';

  @override
  String get advancedSetupTitle => 'Avancerad inställning';

  @override
  String get advancedSetupHeader => 'På den här sidan kan du anpassa Ubuntu WSL efter dina behov.';

  @override
  String get advancedSetupMountLocationHint => 'Monteringsplats';

  @override
  String get advancedSetupMountLocationHelper => 'Plats för den automatiska monteringen';

  @override
  String get advancedSetupMountLocationInvalid => 'Platsen är ogiltig';

  @override
  String get advancedSetupMountOptionHint => 'Monteringsalternativ';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Aktivera generering av resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Genom att välja aktiveras automatisk DISPLAY-miljöinställning. Tredjeparts X-server krävs.';

  @override
  String get configurationUITitle => 'Ubuntu WSL-konfigurationsgränssnitt - Avancerade alternativ';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilitet';

  @override
  String get configurationUIInteroperabilityTitle => 'Aktiverat';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Montera automatiskt';

  @override
  String get configurationUIAutoMountTitle => 'Aktiverad';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Montera /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTIELL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Aktiverad';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Tillämpar ändringar…';

  @override
  String get applyingChangesDisclaimer => 'Det här kan ta flera minuter beroende på din internetanslutning.';

  @override
  String get setupCompleteTitle => 'Installationen är klar';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hej $user,\nDu har slutfört installationen.';
  }

  @override
  String get setupCompleteUpdate => 'Det föreslås att du kör följande kommando för att uppdatera Ubuntu till den senaste versionen:';

  @override
  String get setupCompleteRestart => '* Alla inställningar träder i kraft efter omstart av Ubuntu.';
}
