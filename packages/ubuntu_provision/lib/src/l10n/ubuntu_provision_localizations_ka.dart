import 'ubuntu_provision_localizations.dart';

/// The translations for Georgian (`ka`).
class UbuntuProvisionLocalizationsKa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'კლავიატური განლაგება';

  @override
  String get keyboardHeader => 'აირჩიეთ თქვენი კლავიატურის განლაგება:';

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
  String get localeHeader => 'აირჩიეთ თქვენი ენა:';
}
