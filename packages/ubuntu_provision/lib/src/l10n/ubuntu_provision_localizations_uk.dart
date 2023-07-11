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

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test domain connectivity';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domain not found';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';

  @override
  String get activeDirectoryErrorTitle => 'Error configuring connection to Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';

  @override
  String get networkPageTitle => 'Підключитись до інтернету';

  @override
  String get networkPageHeader => 'Підключення цього комп\'ютера до Інтернету допоможе Ubuntu встановити необхідне додаткове програмне забезпечення та вибрати часовий пояс.\n\nПідключіться за допомогою кабелю Ethernet або виберіть Wi-Fi мережу';

  @override
  String get networkWiredOption => 'Використовувати дротове підключення';

  @override
  String get networkWiredNone => 'Дротового підключення не виявлено';

  @override
  String get networkWiredOff => 'Дротове підключення вимкнено';

  @override
  String get networkWiredDisabled => 'Для використання Ethernet на цьому комп\'ютері повинно бути включено дротове підключення';

  @override
  String get networkWiredEnable => 'Увімкнути дротове підключення';

  @override
  String get networkWifiOption => 'Підключитися до Wi-Fi мережі';

  @override
  String get networkWifiOff => 'Бездротове підключення вимкнено';

  @override
  String get networkWifiNone => 'Не знайдено жодного Wi-Fi пристрою';

  @override
  String get networkWifiDisabled => 'Для використання Wi-Fi на цьому комп\'ютері має бути ввімкнений бездротовий зв’язок';

  @override
  String get networkWifiEnable => 'Ввімкнути Wi-Fi';

  @override
  String get networkHiddenWifiOption => 'Підключитися до прихованої Wi-Fi мережі';

  @override
  String get networkHiddenWifiNameLabel => 'Назва мережі';

  @override
  String get networkHiddenWifiNameRequired => 'Необхідно вказати назву мережі';

  @override
  String get networkNoneOption => 'Я не хочу зараз підключатися до Інтернету';
}
