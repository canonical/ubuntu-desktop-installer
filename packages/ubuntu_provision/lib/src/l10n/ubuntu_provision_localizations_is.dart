import 'ubuntu_provision_localizations.dart';

/// The translations for Icelandic (`is`).
class UbuntuProvisionLocalizationsIs extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsIs([String locale = 'is']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'Lyklaborðsútfærsla';

  @override
  String get keyboardHeader => 'Veldu lyklaborðsútfærslu:';

  @override
  String get keyboardTestHint => 'Innsláðu hér til að prófa lyklaborðið þitt';

  @override
  String get keyboardDetectTitle => 'Greina Sjálfvirkt Lyklaborðsútfærslu';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Please press one of the following keys:';

  @override
  String get keyboardKeyPresentLabel => 'Is the following key present on your keyboard?';

  @override
  String get themePageTitle => 'Choose your theme';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Choose your language:';
}
