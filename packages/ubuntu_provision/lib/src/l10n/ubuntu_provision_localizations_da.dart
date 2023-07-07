import 'ubuntu_provision_localizations.dart';

/// The translations for Danish (`da`).
class UbuntuProvisionLocalizationsDa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get timezonePageTitle => 'Vælg din tidszone';

  @override
  String get timezoneLocationLabel => 'Placering';

  @override
  String get timezoneTimezoneLabel => 'Tidszone';

  @override
  String get keyboardTitle => 'Tastaturopsætning';

  @override
  String get keyboardHeader => 'Vælg din tastaturopsætning:';

  @override
  String get keyboardTestHint => 'Tast her, for at afprøve dit tastatur';

  @override
  String get keyboardDetectTitle => 'Opfang tastaturopsætning';

  @override
  String get keyboardDetectButton => 'Opfang';

  @override
  String get keyboardVariantLabel => 'Tastaturvariant:';

  @override
  String get keyboardPressKeyLabel => 'Tryk venligst på en af følgende taster:';

  @override
  String get keyboardKeyPresentLabel => 'Er følgende tast tilstede på dit tastatur?';
}
