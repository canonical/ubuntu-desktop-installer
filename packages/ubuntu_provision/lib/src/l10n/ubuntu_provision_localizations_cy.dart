import 'ubuntu_provision_localizations.dart';

/// The translations for Welsh (`cy`).
class UbuntuProvisionLocalizationsCy extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Lleoliad';

  @override
  String get timezoneTimezoneLabel => 'Cylchfa amser';

  @override
  String get keyboardTitle => 'Cynllun bysellfwrdd';

  @override
  String get keyboardHeader => 'Dewiswch gynllun eich bysellfwrdd:';

  @override
  String get keyboardTestHint => 'Teipiwch yma i brofi\'ch bysellfwrdd';

  @override
  String get keyboardDetectTitle => 'Canfod Cynllun Bysellfwrdd';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Pwyswch un o\'r bysellau canlynol:';

  @override
  String get keyboardKeyPresentLabel => 'Ydy\'r fysell ganlynol yn bresennol ar eich bysellfwrdd?';
}
