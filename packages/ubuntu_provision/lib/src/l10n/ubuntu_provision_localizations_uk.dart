import 'ubuntu_provision_localizations.dart';

/// The translations for Ukrainian (`uk`).
class UbuntuProvisionLocalizationsUk extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get timezonePageTitle => 'Де ви знаходитесь?';

  @override
  String get timezoneLocationLabel => 'Місце розташування';

  @override
  String get timezoneTimezoneLabel => 'Часовий пояс';

  @override
  String get keyboardTitle => 'Розкладка клавіатури';

  @override
  String get keyboardHeader => 'Оберіть розкладку клавіатури:';

  @override
  String get keyboardTestHint => 'Введіть що-небудь, щоб перевірити клавіатуру';

  @override
  String get keyboardDetectTitle => 'Визначити розкладку клавіатури';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Будь ласка, натисніть одну з цих клавiш:';

  @override
  String get keyboardKeyPresentLabel => 'Чи присутня ця клавіша на клавіатурі?';

  @override
  String get themePageTitle => 'Оберіть зовнішній вигляд';

  @override
  String get themePageHeader => 'Ви завжди можете змінити це пізніше в налаштуваннях зовнішнього вигляду.';

  @override
  String get themeDark => 'Темний';

  @override
  String get themeLight => 'Світлий';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Оберіть мову:';

  @override
  String get identityPageTitle => 'Хто ви?';

  @override
  String get identityAutoLogin => 'Входити автоматично';

  @override
  String get identityRequirePassword => 'Для входу потрібен пароль';

  @override
  String get identityRealNameLabel => 'Ваше ім\'я';

  @override
  String get identityRealNameRequired => 'Потрібно вказати ім\'я';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'Iм\'я вашого комп\'ютера';

  @override
  String get identityHostnameInfo => 'Iм\'я, яке використовується для зв\'язку з іншими комп\'ютерами.';

  @override
  String get identityHostnameRequired => 'Потрібно вказати ім\'я комп\'ютера';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'Ім\'я комп\'ютера вказано невірно';

  @override
  String get identityUsernameLabel => 'Оберіть ім\'я користувача';

  @override
  String get identityUsernameRequired => 'Потрібно ввести ім\'я користувача';

  @override
  String get identityInvalidUsername => 'Ім\'я користувача вказано невірно';

  @override
  String get identityUsernameInUse => 'Таке ім\'я користувача вже існує.';

  @override
  String get identityUsernameSystemReserved => 'Це ім\'я зарезервоване для використання в системі.';

  @override
  String get identityUsernameTooLong => 'Це ім\'я занадто довге.';

  @override
  String get identityUsernameInvalidChars => 'Це ім\'я містить недопустимі символи.';

  @override
  String get identityPasswordLabel => 'Оберіть пароль';

  @override
  String get identityPasswordRequired => 'Потрібно ввести пароль';

  @override
  String get identityConfirmPasswordLabel => 'Підтвердить пароль';

  @override
  String get identityPasswordMismatch => 'Паролі не збігаються';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';
}
