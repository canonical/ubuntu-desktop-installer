import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Вийти';

  @override
  String get finishButton => 'Завершити';

  @override
  String get saveButton => 'Зберегти';

  @override
  String get setupButton => 'Встановити';

  @override
  String get selectLanguageTitle => 'Оберіть мову';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'Налаштування профілю';

  @override
  String get profileSetupHeader => 'Будь ласка, створіть типовий обліковий запис користувача UNIX. Для отримання додаткової інформації відвідайте: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ваше ім\'я';

  @override
  String get profileSetupRealnameRequired => 'Ім’я - обов’язково';

  @override
  String get profileSetupUsernameHint => 'Оберіть ім’я користувача';

  @override
  String get profileSetupUsernameHelper => 'Ім’я користувача не повинно збігатися з вашим ім’ям користувача Windows.';

  @override
  String get profileSetupPasswordHint => 'Виберіть пароль';

  @override
  String get profileSetupConfirmPasswordHint => 'Підтвердити пароль';

  @override
  String get profileSetupShowAdvancedOptions => 'Показати розширені параметри на наступній сторінці';

  @override
  String get profileSetupPasswordMismatch => 'Паролі не збігаються';

  @override
  String get profileSetupUsernameRequired => 'Ім’я користувача - обов\'язково';

  @override
  String get profileSetupUsernameInvalid => 'Ім’я користувача непридатне';

  @override
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'Пароль - обов’язково';

  @override
  String get advancedSetupTitle => 'Розширені налаштування';

  @override
  String get advancedSetupHeader => 'На цій сторінці ви можете налаштувати Ubuntu WSL відповідно до ваших потреб.';

  @override
  String get advancedSetupMountLocationHint => 'Місце монтування';

  @override
  String get advancedSetupMountLocationHelper => 'Місце автоматичного монтування';

  @override
  String get advancedSetupMountLocationInvalid => 'Місце непридатне';

  @override
  String get advancedSetupMountOptionHint => 'Параметри монтування';

  @override
  String get advancedSetupMountOptionHelper => 'Параметри монтування для автоматичного монтування';

  @override
  String get advancedSetupHostGenerationTitle => 'Увімкнути створення hosts';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Дозволяє повторно генерувати /etc/hosts під час кожного запуску.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Увімкнути створення resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Дозволяє повторно генерувати /etc/resolv.conf під час кожного запуску.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI інтеграція';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Дозволяє автоматичне налаштування оточення DISPLAY. Потрібен сторонній X-сервер.';

  @override
  String get configurationUITitle => 'Інтерфейс користувача налаштування Ubuntu WSL (експериментальний)';

  @override
  String get configurationUIInteroperabilityHeader => 'Взаємодія';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Автоматичне монтування';

  @override
  String get configurationUIAutoMountTitle => 'Увімкнено';

  @override
  String get configurationUIAutoMountSubtitle => 'Показує чи ввімкнено функцію автоматичного монтування. Ця функція дозволяє монтувати диск Windows у WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Монтування у /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Показує чи буде змонтовано пристрої з /etc/fstab. Чи файл конфігурації /etc/fstab містить їх?';

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
  String get setupCompleteTitle => 'Встановлення завершено';

  @override
  String setupCompleteHeader(Object user) {
    return 'Вітаємо, $user!\nВи успішно завершили встановлення.';
  }

  @override
  String get setupCompleteUpdate => 'Для оновлення Ubuntu до останньої версії рекомендується виконати наступну команду:';

  @override
  String get setupCompleteRestart => '* Усі налаштування набудуть чинності після перезапуску Ubuntu.';

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
  String get installationSlidesOk => 'OK';

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
