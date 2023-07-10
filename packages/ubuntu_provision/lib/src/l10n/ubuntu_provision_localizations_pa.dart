import 'ubuntu_provision_localizations.dart';

/// The translations for Panjabi Punjabi (`pa`).
class UbuntuProvisionLocalizationsPa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'ਕੀ-ਬੋਰਡ ਲੇਆਉਟ';

  @override
  String get keyboardHeader => 'ਆਪਣਾ ਕੀਬੋਰਡ ਲੇਆਉਟ ਚੁਣੋ:';

  @override
  String get keyboardTestHint => 'ਆਪਣੇ ਕੀਬੋਰਡ ਨੂੰ ਟੈਸਟ ਕਰਨ ਲਈ ਇੱਥੇ ਲਿਖੋ';

  @override
  String get keyboardDetectTitle => 'ਕੀਬੋਰਡ ਲੇਆਉਟ ਖੋਜੋ';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'ਅੱਗੇ ਦਿੱਤੀਆਂ ਸਵਿੱਚਾਂ ਦੱਬੋ:';

  @override
  String get keyboardKeyPresentLabel => 'ਕੀ ਤੁਹਾਡੇ ਕੀਬੋਰਡ ਉੱਤੇ ਅੱਗੇ ਦਿੱਤੀ ਸਵਿੱਚ ਮੌਜੂਦ ਹੈ?';

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
