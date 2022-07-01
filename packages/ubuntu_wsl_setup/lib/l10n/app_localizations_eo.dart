


import 'app_localizations.dart';

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get appTitle => 'Ubuntu sur Windows-Subsistemo por Linux';

  @override
  String get windowTitle => 'Ubuntu sur Windows-Subsistemo por Linux';

  @override
  String get exitButton => 'Foriri';

  @override
  String get finishButton => 'Fini';

  @override
  String get saveButton => 'Konservi';

  @override
  String get setupButton => 'Agordi';

  @override
  String get selectLanguageTitle => 'Elektu vian lingvon';

  @override
  String get profileSetupTitle => 'Agordi profilon';

  @override
  String get profileSetupHeader => 'Bonvolu krei implicitan Uniksan konton. Por pliaj informoj, vizitu la paĝon <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Via nomo';

  @override
  String get profileSetupRealnameRequired => 'Nomo bezoniĝas';

  @override
  String get profileSetupUsernameHint => 'Elektu salutnomon';

  @override
  String get profileSetupUsernameHelper => 'La salutnomo ne devas kongrui kun via salutnomo por Windows.';

  @override
  String get profileSetupPasswordHint => 'Elektu pasvorton';

  @override
  String get profileSetupConfirmPasswordHint => 'Konfirmu vian pasvorton';

  @override
  String get profileSetupShowAdvancedOptions => 'Montri altnivelajn opciojn sur la sekva paĝo';

  @override
  String get profileSetupPasswordMismatch => 'La pasvortoj ne kongruas';

  @override
  String get profileSetupUsernameRequired => 'Salutnomo bezoniĝas';

  @override
  String get profileSetupUsernameInvalid => 'La salutnomo ne validas';

  @override
  String get profileSetupUsernameInUse => 'Tiu salutnomo jam ekzistas.';

  @override
  String get profileSetupUsernameSystemReserved => 'Tiu salutnomo estas rezervita por sistema uzado.';

  @override
  String get profileSetupUsernameTooLong => 'Tiu salutnomo estas tro longa.';

  @override
  String get profileSetupUsernameInvalidChars => 'Tiu salutnomo enhavas nevalidajn signojn.';

  @override
  String get profileSetupPasswordRequired => 'Pasvorto bezoniĝas';

  @override
  String get advancedSetupTitle => 'Altnivela agordado';

  @override
  String get advancedSetupHeader => 'Per ĉi tiu paĝo, vi povas laŭbezone agordi Ubuntu sur Windows-Subsistemo por Linux.';

  @override
  String get advancedSetupMountLocationHint => 'Surmeta loko';

  @override
  String get advancedSetupMountLocationHelper => 'Loko de la aŭtomata surmeto';

  @override
  String get advancedSetupMountLocationInvalid => 'La loko ne validas';

  @override
  String get advancedSetupMountOptionHint => 'Opcioj pri surmetado';

  @override
  String get advancedSetupMountOptionHelper => 'Opcioj pri surmetado donotaj al la komando de aŭtomata surmetado';

  @override
  String get advancedSetupHostGenerationTitle => 'Aŭtomate faradi dosieron de gastigantoj';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Aŭtomate refari la dosieron /etc/hosts post ĉiu starto.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Aŭtomate faradi resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Aŭtomate refari la dosieron /etc/resolv.conf post ĉiu starto.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Integrado de grafika fasado';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Ĉi tiu opcio ebligas aŭtomatan agordadon de la medivariablo DISPLAY. Postulas triapartian X-servilon.';

  @override
  String get configurationUITitle => 'Agordado de Ubuntu sur Windows-Subsistemo por Linux – Opcioj por spertuloj';

  @override
  String get configurationUIInteroperabilityHeader => 'Kunfunkciado';

  @override
  String get configurationUIInteroperabilityTitle => 'Ŝaltita';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Ĉu ŝalti Kunfunkciadon.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Postmeti vojprefikson de Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Ĉu postglui la medivariablon «Path» de Windows al la medivariablo «PATH» de Windows-subsistemo por Linux';

  @override
  String get configurationUIAutoMountHeader => 'Aŭtomata Surmeto';

  @override
  String get configurationUIAutoMountTitle => 'Ŝaltita';

  @override
  String get configurationUIAutoMountSubtitle => 'Ĉu aŭtomate surmenti diskojn. Ĉi tiu funkcio ebligas surmetadon de Windows-disko por Windows-Subsistemo por Linux.';

  @override
  String get configurationUIMountFstabTitle => 'Surmeti /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Ĉu surmeti /etc/fstab. Ĉi tiu dosiero enhavas informojn pri la surmetotaj dosiersistemoj.';

  @override
  String get configurationUISystemdHeader => 'EKSPERIMENTA – systemd';

  @override
  String get configurationUISystemdTitle => 'Ŝaltita';

  @override
  String get configurationUISystemdSubtitle => 'Ĉu aktivigi systemd dum startigo de komputilo. AVERTO: Ĉi tio estas eksperimenta funkcio.';

  @override
  String get applyingChanges => 'Efektivigante ŝanĝojn…';

  @override
  String get applyingChangesDisclaimer => 'Tio eble daŭros kelkajn minutojn depende de via Interreta konekto.';

  @override
  String get setupCompleteTitle => 'Instalado finiĝis';

  @override
  String setupCompleteHeader(Object user) {
    return 'Saluton $user,\nVi sukcese finis la instaladon.';
  }

  @override
  String get setupCompleteUpdate => 'Ni konsilas vin ruli la jenan komandon por ĝisdatigi Ubuntu al la plej nova versio:';

  @override
  String get setupCompleteRestart => '* Ĉiuj agordoj estos efektivaj post restarto de Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Launching distro...';

  @override
  String get installationSlidesErrorMsg => 'Something went wrong.';

  @override
  String get installationSlidesErrorTitle => 'Something went wrong';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'Ok';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'Cancel';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

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
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
