import 'ubuntu_provision_localizations.dart';

/// The translations for Norwegian Bokmål (`nb`).
class UbuntuProvisionLocalizationsNb extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get timezonePageTitle => 'Hvem er du?';

  @override
  String get timezoneLocationLabel => 'Sted';

  @override
  String get timezoneTimezoneLabel => 'Tidssone';

  @override
  String get keyboardTitle => 'Tastaturoppsett';

  @override
  String get keyboardHeader => 'Velg tastaturoppsettet ditt:';

  @override
  String get keyboardTestHint => 'Skriv her for å teste tastaturet';

  @override
  String get keyboardDetectTitle => 'Finn tastaturoppsett';

  @override
  String get keyboardDetectButton => 'Oppdag';

  @override
  String get keyboardVariantLabel => 'Tastaturvariant:';

  @override
  String get keyboardPressKeyLabel => 'Trykk på en av følgende taster:';

  @override
  String get keyboardKeyPresentLabel => 'Finnes følgende tast på tastaturet ditt?';

  @override
  String get themePageTitle => 'Velg utseende';

  @override
  String get themePageHeader => 'Du kan alltid endre dette senere i utseende-innstillingene.';

  @override
  String get themeDark => 'Mørk';

  @override
  String get themeLight => 'Lys';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Velkommen til $DISTRO';
  }

  @override
  String get localeHeader => 'Velg ditt språk:';
}
