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
}
