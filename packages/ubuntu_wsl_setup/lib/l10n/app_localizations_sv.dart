


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
