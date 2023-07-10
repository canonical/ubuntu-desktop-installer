import 'ubuntu_provision_localizations.dart';

/// The translations for Basque (`eu`).
class UbuntuProvisionLocalizationsEu extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'Teklatuaren diseinua';

  @override
  String get keyboardHeader => 'Aukeratu zure teklatuaren diseinua:';

  @override
  String get keyboardTestHint => 'Idatzi hemen zure teklatua probatzeko';

  @override
  String get keyboardDetectTitle => 'Detektatu teklatuaren diseinua';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Mesedez, sakatu hurrengo tekletariko bat:';

  @override
  String get keyboardKeyPresentLabel => 'Hurrengo tekla zure teklatuan al dago?';

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
  String get localeHeader => 'Aukeratu zure hizkuntza:';
}
