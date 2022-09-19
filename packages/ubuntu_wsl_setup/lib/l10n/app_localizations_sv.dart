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
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

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
  String get advancedSetupHostGenerationTitle => 'Aktivera värdgenerering';

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
  String get configurationUIInteroperabilitySubtitle => 'Huruvida interoperabiliteten är aktiverad eller inte.';

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

  @override
  String get installationSlidesWelcome => 'Välkommen till Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initierar...';

  @override
  String get installationSlidesUnpacking => 'Packar upp distron';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Startar distro...';

  @override
  String get installationSlidesErrorMsg => 'Något gick fel.';

  @override
  String get installationSlidesErrorTitle => 'Något gick fel';

  @override
  String get installationSlidesErrorSub => 'Starta om WSL med följande kommando och försök igen:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nEtt oåterkalleligt fel inträffade.\n\nStäng det här programmet, öppna Powershell eller kommandotolken och utför följande kommandon:\n';

  @override
  String get installationSlidesDone => 'Allt är Redo. Njut av att använda Ubuntu på WSL';

  @override
  String get installationSlidesExitTitle => 'Är du säker på att du vill lämna?';

  @override
  String get installationSlidesExitContents => 'Att stänga det här fönstret hindrar inte installationen från att fortsätta i bakgrunden.\n\nDessutom kan du fortsätta att utforska vad du kan göra med Ubuntu på WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Vi är nästan klara';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Lämna';

  @override
  String get installationSlidesCancel => 'Avbryt';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu på WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'En komplett Ubuntu-miljö, djupt integrerad med Windows, för Linux-applikationsutveckling och exekvering. Optimerad för moln, webb, datavetenskap, IOT och kul!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL för\nWebbutveckling';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL för datavetenskap';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL för\nGrafiska program';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL för DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL för företag';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Besök ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' för att ta reda på mer om Ubuntu på WSL och hur Canonical stödjer utvecklare och organisationer.';
}
