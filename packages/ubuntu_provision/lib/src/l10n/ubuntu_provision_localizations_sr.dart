import 'ubuntu_provision_localizations.dart';

/// The translations for Serbian (`sr`).
class UbuntuProvisionLocalizationsSr extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'Распоред тастатуре';

  @override
  String get keyboardHeader => 'Изаберите ваш распоред тастатуре:';

  @override
  String get keyboardTestHint => 'Куцајте овде како би испробали вашу тастатуру';

  @override
  String get keyboardDetectTitle => 'Откриј распоред тастатуре';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Молимо притисните један од следећих тастера:';

  @override
  String get keyboardKeyPresentLabel => 'Да ли следећи тастер постоји на вашој тастатури?';

  @override
  String get themePageTitle => 'Choose your theme';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';
}
