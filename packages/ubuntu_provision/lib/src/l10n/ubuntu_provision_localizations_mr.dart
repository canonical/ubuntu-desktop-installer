import 'ubuntu_provision_localizations.dart';

/// The translations for Marathi (`mr`).
class UbuntuProvisionLocalizationsMr extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'कळफलक मांडणी';

  @override
  String get keyboardHeader => 'आपल्या कळफलक(keyboard) मांडणीची निवड करा:';

  @override
  String get keyboardTestHint => 'आपले कळफलक चे परीक्षण साठी इथे टंकलेखन करा';

  @override
  String get keyboardDetectTitle => 'कळफलक मांडणीचा शोध';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'कृपया पुढे दिलेल्या कळापैकी कोणतीही एक कळ दाबून पहा.';

  @override
  String get keyboardKeyPresentLabel => 'पुढे दिलेली कळ तुमच्या कळफलकावर आहे का?';

  @override
  String get themePageTitle => 'Choose your theme';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';
}
