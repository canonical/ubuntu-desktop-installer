import 'ubuntu_provision_localizations.dart';

/// The translations for Czech (`cs`).
class UbuntuProvisionLocalizationsCs extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get timezonePageTitle => 'Vyberte své časové pásmo';

  @override
  String get timezoneLocationLabel => 'Umístění';

  @override
  String get timezoneTimezoneLabel => 'Časové pásmo';

  @override
  String get keyboardTitle => 'Rozvržení klávesnice';

  @override
  String get keyboardHeader => 'Zvolte si rozvržení klávesnice:';

  @override
  String get keyboardTestHint => 'Správné fungování rozvržení si můžete vyzkoušet zde';

  @override
  String get keyboardDetectTitle => 'Zjistit rozvržení klávesnice';

  @override
  String get keyboardDetectButton => 'Zjistit';

  @override
  String get keyboardVariantLabel => 'Varianta klávesnice:';

  @override
  String get keyboardPressKeyLabel => 'Stiskněte některou z následujících kláves:';

  @override
  String get keyboardKeyPresentLabel => 'Máte na klávesnici následující klávesu?';
}
