


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
  String get setupButton => 'Setup';

  @override
  String get selectLanguageTitle => 'Välj ditt språk';

  @override
  String get profileSetupTitle => 'Profile setup';

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
  String get profileSetupPasswordRequired => 'Ett lösenord krävs';

  @override
  String get advancedSetupTitle => 'Advanced setup';

  @override
  String get advancedSetupHeader => 'På den här sidan kan du anpassa Ubuntu WSL efter dina behov.';

  @override
  String get advancedSetupMountLocationHint => 'Monteringsplats';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'Platsen är ogiltig';

  @override
  String get advancedSetupMountOptionHint => 'Mount option';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Enable resolv.conf Generation';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Genom att välja aktiveras automatisk DISPLAY-miljöinställning. Tredjeparts X-server krävs.';

  @override
  String get configurationUITitle => 'Ubuntu WSL-konfigurationsgränssnitt (experimentellt)';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilitet';

  @override
  String get configurationUILegacyGUIIntegrationTitle => 'Äldre GUI-integration';

  @override
  String get configurationUILegacyGUIIntegrationSubtitle => 'Det här alternativet aktiverar äldre GUI-integration på Windows 10. Kräver tredjeparts X-server.';

  @override
  String get configurationUILegacyAudioIntegrationTitle => 'Äldre ljudintegration';

  @override
  String get configurationUILegacyAudioIntegrationSubtitle => 'This option enables the Legacy Audio Integration on Windows 10. Requires PulseAudio for Windows installed.';

  @override
  String get configurationUIAdvancedIPDetectionTitle => 'Avancerad IP-detektion';

  @override
  String get configurationUIAdvancedIPDetectionSubtitle => 'This option enables advanced detection of IP by Windows IPv4 Address which is more reliable to use with WSL2.\nRequires WSL interoperability enabled.';

  @override
  String get configurationUIMessageOfTheDayHeader => 'Dagens meddelande (MOTD)';

  @override
  String get configurationUIWSLNewsTitle => 'WSL nyheter';

  @override
  String get configurationUIWSLNewsSubtitle => 'This option allows you to control your MOTD News. Toggling it on allows you to see the MOTD.';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'Aktiverad';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Montera /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the???';

  @override
  String get setupCompleteTitle => 'Installationen är klar';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hej $user,\nDu har slutfört installationen.';
  }

  @override
  String get setupCompleteUpdate => 'Det föreslås att du kör följande kommando för att uppdatera Ubuntu till den senaste versionen:';

  @override
  String get setupCompleteManage => 'Du kan använda det inbyggda ubuntuwsl kommandot för att hantera dina WSL-inställningar:';

  @override
  String get setupCompleteRestart => '* Alla inställningar träder i kraft efter omstart av Ubuntu.';
}
