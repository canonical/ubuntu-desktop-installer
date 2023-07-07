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
}
