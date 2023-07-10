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
}
