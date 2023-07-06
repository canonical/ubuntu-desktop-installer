import 'ubuntu_provision_localizations.dart';

/// The translations for Irish (`ga`).
class UbuntuProvisionLocalizationsGa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'Leagan amach méarchláir';

  @override
  String get keyboardHeader => 'Roghnaigh leagan amach do mhéarchláir:';

  @override
  String get keyboardTestHint => 'Scríobh anseo chun do mhéarchlár a tástáil';

  @override
  String get keyboardDetectTitle => 'Aimsigh leagan amach an méarchláir';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Brúigh cheann de na heochracha se:';

  @override
  String get keyboardKeyPresentLabel => 'An bhfuil an eochair seo ann ar do mhéarchlár?';
}
