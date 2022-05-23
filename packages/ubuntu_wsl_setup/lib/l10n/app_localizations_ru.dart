


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
}
