import 'ubuntu_provision_localizations.dart';

/// The translations for Russian (`ru`).
class UbuntuProvisionLocalizationsRu extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get timezonePageTitle => 'Выберите свой часовой пояс';

  @override
  String get timezoneLocationLabel => 'Место нахождения';

  @override
  String get timezoneTimezoneLabel => 'Часовой пояс';

  @override
  String get keyboardTitle => 'Раскладка клавиатуры';

  @override
  String get keyboardHeader => 'Выберите раскладку клавиатуры:';

  @override
  String get keyboardTestHint => 'Напечатайте здесь, чтобы проверить свою клавиатуру';

  @override
  String get keyboardDetectTitle => 'Определить раскладку клавиатуры';

  @override
  String get keyboardDetectButton => 'Определить';

  @override
  String get keyboardVariantLabel => 'Вариант клавиатуры:';

  @override
  String get keyboardPressKeyLabel => 'Нажмите одну из следующих клавиш:';

  @override
  String get keyboardKeyPresentLabel => 'Есть ли следующая клавиша на вашей клавиатуре?';

  @override
  String get themePageTitle => 'Выберите свою тему';

  @override
  String get themePageHeader => 'Вы всегда можете изменить это позже в настройках внешнего вида.';

  @override
  String get themeDark => 'Тёмный';

  @override
  String get themeLight => 'Светлый';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Добро пожаловать в $DISTRO';
  }

  @override
  String get localeHeader => 'Выберите язык:';

  @override
  String get identityPageTitle => 'Создание своей учётной записи';

  @override
  String get identityAutoLogin => 'Входить в систему автоматически';

  @override
  String get identityRequirePassword => 'Требовать пароль для входа в систему';

  @override
  String get identityRealNameLabel => 'Ваше имя';

  @override
  String get identityRealNameRequired => 'Укажите имя';

  @override
  String get identityRealNameTooLong => 'Слишком длинное имя.';

  @override
  String get identityHostnameLabel => 'Имя компьютера';

  @override
  String get identityHostnameInfo => 'Имя, используемое при общении с другими компьютерами.';

  @override
  String get identityHostnameRequired => 'Требуется имя компьютера';

  @override
  String get identityHostnameTooLong => 'Слишком длинное имя компьютера.';

  @override
  String get identityInvalidHostname => 'Недопустимое имя компьютера';

  @override
  String get identityUsernameLabel => 'Выберите имя пользователя';

  @override
  String get identityUsernameRequired => 'Необходимо имя пользователя';

  @override
  String get identityInvalidUsername => 'Недопустимое имя пользователя';

  @override
  String get identityUsernameInUse => 'Это имя пользователя уже существует.';

  @override
  String get identityUsernameSystemReserved => 'Это имя зарезервировано для использования системой.';

  @override
  String get identityUsernameTooLong => 'Это имя слишком длинное.';

  @override
  String get identityUsernameInvalidChars => 'Это имя содержит недопустимые символы.';

  @override
  String get identityPasswordLabel => 'Выберите пароль';

  @override
  String get identityPasswordRequired => 'Требуется пароль';

  @override
  String get identityConfirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get identityPasswordMismatch => 'Пароли не совпадают';

  @override
  String get identityPasswordShow => 'Показать';

  @override
  String get identityPasswordHide => 'Скрыть';

  @override
  String get identityActiveDirectoryOption => 'Использовать Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Вы введёте домен и другие данные на следующем шаге.';

  @override
  String get activeDirectoryTitle => 'Настроить Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Проверка подключения к домену';

  @override
  String get activeDirectoryDomainLabel => 'Домен';

  @override
  String get activeDirectoryDomainEmpty => 'Требуется';

  @override
  String get activeDirectoryDomainTooLong => 'Слишком длинный';

  @override
  String get activeDirectoryDomainInvalidChars => 'Недопустимые символы';

  @override
  String get activeDirectoryDomainStartDot => 'Начинается с точки (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Заканчивается точкой (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Начинается со знака дефиса (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Заканчивается знаком дефиса (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Содержит несколько последовательных точек (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Домен не найден';

  @override
  String get activeDirectoryAdminLabel => 'Пользователь, присоединившийся к домену';

  @override
  String get activeDirectoryAdminEmpty => 'Требуется';

  @override
  String get activeDirectoryAdminInvalidChars => 'Недопустимые символы';

  @override
  String get activeDirectoryPasswordLabel => 'Пароль';

  @override
  String get activeDirectoryPasswordEmpty => 'Требуется';

  @override
  String get activeDirectoryErrorTitle => 'Ошибка настройки подключения к Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Извините, Active Directory не может быть настроен в данный момент. Как только ваша система будет запущена, посетите <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> для получения помощи.';

  @override
  String get networkPageTitle => 'Подключение к сети';

  @override
  String get networkPageHeader => 'Соединение данного компьютера с интернетом позволит Ubuntu установить дополнительное программное обеспечение и поможет выбрать ваш часовой пояс.\n\nПрисоедините кабель сети интернет или выберите сеть Wi-Fi';

  @override
  String get networkWiredOption => 'Использовать проводное подключение';

  @override
  String get networkWiredNone => 'Проводное подключение не обнаружено';

  @override
  String get networkWiredOff => 'Проводное подключение отключено';

  @override
  String get networkWiredDisabled => 'Чтобы воспользоваться сетью интернет на этом компьютере, должно быть включено проводное соединение';

  @override
  String get networkWiredEnable => 'Включить проводное подключение';

  @override
  String get networkWifiOption => 'Подключиться к сети Wi-Fi';

  @override
  String get networkWifiOff => 'Беспроводная сеть отключена';

  @override
  String get networkWifiNone => 'Устройства Wi-Fi не обнаружены';

  @override
  String get networkWifiDisabled => 'Чтобы использовать на этом компьютере Wi-Fi, необходимо включить беспроводную сеть';

  @override
  String get networkWifiEnable => 'Включить Wi-Fi';

  @override
  String get networkHiddenWifiOption => 'Подключиться к скрытой сети Wi-Fi';

  @override
  String get networkHiddenWifiNameLabel => 'Название сети';

  @override
  String get networkHiddenWifiNameRequired => 'Укажите название сети';

  @override
  String get networkNoneOption => 'Прямо сейчас я не хочу подключаться к Интернету';
}
