import 'ubuntu_provision_localizations.dart';

/// The translations for Albanian (`sq`).
class UbuntuProvisionLocalizationsSq extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get timezonePageTitle => 'Ku ndodheni?';

  @override
  String get timezoneLocationLabel => 'Vendndodhja';

  @override
  String get timezoneTimezoneLabel => 'Zona orare';

  @override
  String get keyboardTitle => 'Keyboard layout';

  @override
  String get keyboardHeader => 'Choose your keyboard layout:';

  @override
  String get keyboardTestHint => 'Type here to test your keyboard';

  @override
  String get keyboardDetectTitle => 'Detect keyboard layout';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Please press one of the following keys:';

  @override
  String get keyboardKeyPresentLabel => 'Is the following key present on your keyboard?';

  @override
  String get themePageTitle => 'Zgjidh pamjen tënde';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'E errët';

  @override
  String get themeLight => 'E çelur';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Choose your language:';
}
