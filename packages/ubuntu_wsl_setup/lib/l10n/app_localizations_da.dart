


import 'app_localizations.dart';

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Exit';

  @override
  String get finishButton => 'Færdiggør';

  @override
  String get saveButton => 'Gem';

  @override
  String get setupButton => 'Opret';

  @override
  String get selectLanguageTitle => 'Vælg dit sprog';

  @override
  String get profileSetupTitle => 'Profil setup';

  @override
  String get profileSetupHeader => 'Lav venligst en default UNIX bruger konto. For mere information besøg: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Dit navn';

  @override
  String get profileSetupRealnameRequired => 'Et navn er påkrævet';

  @override
  String get profileSetupUsernameHint => 'Vælg et brugernavn';

  @override
  String get profileSetupUsernameHelper => 'Brugernavnet behøver ikke at matche dit Windows-brugernavn.';

  @override
  String get profileSetupPasswordHint => 'Vælg en adgangskode';

  @override
  String get profileSetupConfirmPasswordHint => 'Bekræft din adgangskode';

  @override
  String get profileSetupShowAdvancedOptions => 'Vis avanceret valgmuligheder næste side';

  @override
  String get profileSetupPasswordMismatch => 'Adgangskoden matcher ikke';

  @override
  String get profileSetupUsernameRequired => 'Et brugernavn er påkrævet';

  @override
  String get profileSetupUsernameInvalid => 'Brugernavnet er ugyldigt';

  @override
  String get profileSetupUsernameInUse => 'Brugernavnet eksisterer allerede.';

  @override
  String get profileSetupUsernameSystemReserved => 'Dette navn er reserveret for systembrug.';

  @override
  String get profileSetupUsernameTooLong => 'Dette navn er for langt.';

  @override
  String get profileSetupUsernameInvalidChars => 'Dette navn indeholder ugyldige tegn.';

  @override
  String get profileSetupPasswordRequired => 'En adgangskode er påkrævet';

  @override
  String get advancedSetupTitle => 'Avanceret setup';

  @override
  String get advancedSetupHeader => 'På denne side, kan du tilpasse Ubuntu WSL til dine behov.';

  @override
  String get advancedSetupMountLocationHint => 'Montering lokation';

  @override
  String get advancedSetupMountLocationHelper => 'Lokation for automontering';

  @override
  String get advancedSetupMountLocationInvalid => 'Lokationen er ugyldig';

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
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Configuration - Advanced options';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'Enabled';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Mount /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes…';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Setup complete';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hi $user,\nYou have successfully completed the setup.';
  }

  @override
  String get setupCompleteUpdate => 'It is suggested to run the following command to update Ubuntu to the latest version:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';

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
