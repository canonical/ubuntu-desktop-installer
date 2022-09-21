import 'app_localizations.dart';

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Ubuntu i WSL';

  @override
  String get windowTitle => 'Ubuntu i WSL';

  @override
  String get exitButton => 'Avslutt';

  @override
  String get finishButton => 'Finsk';

  @override
  String get saveButton => 'Lagre';

  @override
  String get setupButton => 'Innstillinger';

  @override
  String get selectLanguageTitle => 'Velg ditt språk';

  @override
  String installLangPacksTitle(String lang) {
    return 'Installer pakker for bedre $lang-språkstøtte';
  }

  @override
  String get installLangPacksSubtitle => 'Ikke anbefalt for trege tilkoblinger.';

  @override
  String get profileSetupTitle => 'Profil innstillinger';

  @override
  String get profileSetupHeader => 'Opprett en standard UNIX-brukerkonto. For mer informasjon besøk: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ditt navn';

  @override
  String get profileSetupRealnameRequired => 'Et navn er krevet';

  @override
  String get profileSetupUsernameHint => 'Velg et brukernavn';

  @override
  String get profileSetupUsernameHelper => 'Brukernavnet trenger ikke å samsvare med ditt Windows-brukernavn.';

  @override
  String get profileSetupPasswordHint => 'Velg et passord';

  @override
  String get profileSetupConfirmPasswordHint => 'Bekreft passordet ditt';

  @override
  String get profileSetupShowAdvancedOptions => 'Vis avanserte alternativer på neste side';

  @override
  String get profileSetupPasswordMismatch => 'Passordene samsvarer ikke';

  @override
  String get profileSetupUsernameRequired => 'Brukernavn kreves';

  @override
  String get profileSetupUsernameInvalid => 'Brukernavnet er ugyldig';

  @override
  String get profileSetupUsernameInUse => 'Dette brukernavnet finnes allerede.';

  @override
  String get profileSetupUsernameSystemReserved => 'Dette navnet er reservert for systembruk.';

  @override
  String get profileSetupUsernameTooLong => 'Navnet er for langt.';

  @override
  String get profileSetupUsernameInvalidChars => 'Navnet inneholder ugyldige tegn.';

  @override
  String get profileSetupPasswordRequired => 'Et passord kreves';

  @override
  String get advancedSetupTitle => 'Avansert oppsett';

  @override
  String get advancedSetupHeader => 'På denne siden kan du tilpasse Ubuntu WSL til ditt bruk.';

  @override
  String get advancedSetupMountLocationHint => 'Mount location';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'The location is invalid';

  @override
  String get advancedSetupMountOptionHint => 'Monteringsvalg';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Skru på vertsgenerering';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Skrur på re-generering av /etc/hosts for hver oppstart.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Skru på resolv.conf-generering';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Skrur på re-generering av /etc/resolv.conf for hver oppstart.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Grensesnittsintegrasjon';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Configuration - Advanced options';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilitet';

  @override
  String get configurationUIInteroperabilityTitle => 'Påskrudd';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Hvorvidt interoperabilitet er påskrudd.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'Påskrudd';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Monter /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

  @override
  String get configurationUISystemdHeader => 'EKSPERIMENTELT - Systemd';

  @override
  String get configurationUISystemdTitle => 'Påskrudd';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Utfører endringer …';

  @override
  String get applyingChangesDisclaimer => 'Dette kan ta flere minutter, avhengig av din tilkobling til Internett.';

  @override
  String get setupCompleteTitle => 'Oppsett fullført';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hei $user,\nDu har fullført oppsettet.';
  }

  @override
  String get setupCompleteUpdate => 'Det anbefales å kjøre følgende kommando for å oppgradere Ubuntu til nyeste versjon:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Utpakking av distribusjonen';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Starter distribusjonen …';

  @override
  String get installationSlidesErrorMsg => 'Noe gikk galt.';

  @override
  String get installationSlidesErrorTitle => 'Noe gikk galt.';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'Alt i orden. Nyt Ubuntu på WSL';

  @override
  String get installationSlidesExitTitle => 'Er du sikker på at du vil forlate?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Forlat';

  @override
  String get installationSlidesCancel => 'Avbryt';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu på WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nvev-utvikling';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Finn ut mer';

  @override
  String get installationSlidesFindOutMoreVisit => 'Besøk ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
