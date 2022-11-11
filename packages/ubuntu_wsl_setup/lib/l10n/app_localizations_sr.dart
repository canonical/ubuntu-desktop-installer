import 'app_localizations.dart';

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Убунту WSL';

  @override
  String get windowTitle => 'Убунту WSL';

  @override
  String get exitButton => 'Излаз';

  @override
  String get finishButton => 'Заврши';

  @override
  String get saveButton => 'Сачувај';

  @override
  String get setupButton => 'Инсталација';

  @override
  String get selectLanguageTitle => 'Изабери свој језик';

  @override
  String installLangPacksTitle(String lang) {
    return 'Инсталирај пакете за бољу подршку језика $lang';
  }

  @override
  String get installLangPacksSubtitle => 'Није препоручено за споре везе.';

  @override
  String get profileSetupTitle => 'Подешавања профила';

  @override
  String get profileSetupHeader => 'Молимо направите подразумевани UNIX налог. За више информација посетите: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ваше име';

  @override
  String get profileSetupRealnameRequired => 'Име је неопходно';

  @override
  String get profileSetupUsernameHint => 'Изаберите корисничко име';

  @override
  String get profileSetupUsernameHelper => 'Корисничко име не мора бити исто као ваше Windows корисничко име';

  @override
  String get profileSetupPasswordHint => 'Изаберите лозинку';

  @override
  String get profileSetupConfirmPasswordHint => 'Потврдите вашу лозинку';

  @override
  String get profileSetupShowAdvancedOptions => 'Прикажи следећу страну напредних подешавања';

  @override
  String get profileSetupPasswordMismatch => 'Лозинке се не подударају';

  @override
  String get profileSetupUsernameRequired => 'Корисничко име је неопходно';

  @override
  String get profileSetupUsernameInvalid => 'Корисничко име је погрешно';

  @override
  String get profileSetupUsernameInUse => 'Корисничко име већ постоји.';

  @override
  String get profileSetupUsernameSystemReserved => 'То име је већ резервисано систему.';

  @override
  String get profileSetupUsernameTooLong => 'То име је предугачко.';

  @override
  String get profileSetupUsernameInvalidChars => 'То име садржи невалидне карактере.';

  @override
  String get profileSetupPasswordRequired => 'Лозинка је неопходна';

  @override
  String get advancedSetupTitle => 'Напредна подешавања';

  @override
  String get advancedSetupHeader => 'На овој страници можете прилагодити Убунту WSL вашим потребама.';

  @override
  String get advancedSetupMountLocationHint => 'Mount location';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'Локација није валидна';

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
  String get configurationUITitle => 'Убунту WSL конфигурација ‐ Напредна подешавања';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUIInteroperabilityTitle => 'Укључено';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'Укључено';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Mount /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

  @override
  String get configurationUISystemdHeader => 'ЕКСПЕРИМЕНТАЛНО ‐ Systemd';

  @override
  String get configurationUISystemdTitle => 'Укључено';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Примењује промене…';

  @override
  String get applyingChangesDisclaimer => 'Можда ће бити неопходно неколико минута у зависности од ваше интернет конекције.';

  @override
  String get setupCompleteTitle => 'Инсталација завршена';

  @override
  String setupCompleteHeader(Object user) {
    return 'Здраво $user, \nЗавршили сте инсталацију.';
  }

  @override
  String get setupCompleteUpdate => 'Препоручено је покренути следећу команду како би ажурирали Убунту на најновију верзију:';

  @override
  String get setupCompleteRestart => '* Сва подешавања ће бити ефективна након поновног покретања Убунтуа.';

  @override
  String get installationSlidesWelcome => 'Добродошли у Убунту WSL';

  @override
  String get installationSlidesInitializing => 'Иницијализација...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Скоро завршено. Инсталацији ће ускоро бити потребна ваша пажња.';

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
  String get installationSlidesCustomExitTitle => 'Скоро смо готови';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'ОК';

  @override
  String get installationSlidesLeave => 'Изађи';

  @override
  String get installationSlidesCancel => 'Одустани';

  @override
  String get installationSlidesUbuntuOnWsl => 'Убунту на WSL';

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
  String get installationSlidesUbuntuWslEnterprises => 'Убунту WSL за предузећа';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Сазнајте више';

  @override
  String get installationSlidesFindOutMoreVisit => 'Посетите ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
