


import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Выход';

  @override
  String get finishButton => 'Закончить';

  @override
  String get saveButton => 'Сохранить';

  @override
  String get setupButton => 'Установить';

  @override
  String get selectLanguageTitle => 'Выбрать язык';

  @override
  String get profileSetupTitle => 'Настройка профиля';

  @override
  String get profileSetupHeader => 'Создайте учётную запись пользователя UNIX, используемую по умолчанию. Для получения дополнительной информации посетите: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ваше имя';

  @override
  String get profileSetupRealnameRequired => 'Укажите имя';

  @override
  String get profileSetupUsernameHint => 'Выберите имя пользователя';

  @override
  String get profileSetupUsernameHelper => 'Имя пользователя необязательно должно совпадать с именем пользователя Windows.';

  @override
  String get profileSetupPasswordHint => 'Выберите пароль';

  @override
  String get profileSetupConfirmPasswordHint => 'Подтвердите пароль';

  @override
  String get profileSetupShowAdvancedOptions => 'Показать дополнительные параметры на следующей странице';

  @override
  String get profileSetupPasswordMismatch => 'Пароли не совпадают';

  @override
  String get profileSetupUsernameRequired => 'Требуется имя пользователя';

  @override
  String get profileSetupUsernameInvalid => 'Недопустимое имя пользователя';

  @override
  String get profileSetupUsernameInUse => 'Это имя пользователя уже существует.';

  @override
  String get profileSetupUsernameSystemReserved => 'Это имя зарезервировано для использования системой.';

  @override
  String get profileSetupUsernameTooLong => 'Это имя слишком длинное.';

  @override
  String get profileSetupUsernameInvalidChars => 'Это имя содержит недопустимые символы.';

  @override
  String get profileSetupPasswordRequired => 'Требуется пароль';

  @override
  String get advancedSetupTitle => 'Дополнительные настройки';

  @override
  String get advancedSetupHeader => 'На этой странице вы можете настроить Ubuntu WSL под свои нужды.';

  @override
  String get advancedSetupMountLocationHint => 'Место монтирования';

  @override
  String get advancedSetupMountLocationHelper => 'Местоположение для автоматического монтирования';

  @override
  String get advancedSetupMountLocationInvalid => 'Недопустимое местоположение';

  @override
  String get advancedSetupMountOptionHint => 'Параметры монтирования';

  @override
  String get advancedSetupMountOptionHelper => 'Параметры, предназначенные для автоматического монтирования';

  @override
  String get advancedSetupHostGenerationTitle => 'Включить создание хоста';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Если параметр включен, то при каждом запуске будет проводиться генерация /etc/hosts.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Включить генерацию resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Если параметр включен, то при каждом запуске будет проводиться генерация /etc/resolv.conf.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Интеграция с графическим интерфейсом';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Выбор параметра включает автоматическую настройку среды DISPLAY. Требуется сторонний X-сервер.';

  @override
  String get configurationUITitle => 'Конфигурация Ubuntu WSL — Дополнительные параметры';

  @override
  String get configurationUIInteroperabilityHeader => 'Совместимость';

  @override
  String get configurationUIInteroperabilityTitle => 'Включено';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Включена ли совместимость.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Добавить путь Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Будет ли добавлен путь Windows в переменную PATH в WSL';

  @override
  String get configurationUIAutoMountHeader => 'Автоматическое монтирование';

  @override
  String get configurationUIAutoMountTitle => 'Включено';

  @override
  String get configurationUIAutoMountSubtitle => 'Включена ли функция автоматического монтирования. Эта функция позволяет монтировать диск Windows в WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Монтировать /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Будет ли монтироваться /etc/fstab. Этот файл содержит информацию о файловых системах и параметрах монтирования.';

  @override
  String get configurationUISystemdHeader => 'ЭКСПЕРИМЕНТАЛЬНО - Systemd';

  @override
  String get configurationUISystemdTitle => 'Включено';

  @override
  String get configurationUISystemdSubtitle => 'Следует ли активировать systemd во время загрузки. ВНИМАНИЕ: Это экспериментальная функция.';

  @override
  String get applyingChanges => 'Применение изменений…';

  @override
  String get applyingChangesDisclaimer => 'Это может занять несколько минут в зависимости от скорости вашего интернет-соединения.';

  @override
  String get setupCompleteTitle => 'Настройка завершена';

  @override
  String setupCompleteHeader(Object user) {
    return 'Привет $user,\nВы успешно завершили настройку.';
  }

  @override
  String get setupCompleteUpdate => 'Чтобы обновить Ubuntu до последней версии, необходимо запустить следующую команду:';

  @override
  String get setupCompleteRestart => '* Все настройки вступят в силу после перезапуска Ubuntu.';

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
