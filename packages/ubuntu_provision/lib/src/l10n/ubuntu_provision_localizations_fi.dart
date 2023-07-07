import 'ubuntu_provision_localizations.dart';

/// The translations for Finnish (`fi`).
class UbuntuProvisionLocalizationsFi extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get timezonePageTitle => 'Valitse aikavyöhyke';

  @override
  String get timezoneLocationLabel => 'Sijainti';

  @override
  String get timezoneTimezoneLabel => 'Aikavyöhyke';

  @override
  String get keyboardTitle => 'Näppäimistön asettelu';

  @override
  String get keyboardHeader => 'Valitse näppäimistön asettelu:';

  @override
  String get keyboardTestHint => 'Kokeile näppäimistön asetuksia kirjoittamalla tähän';

  @override
  String get keyboardDetectTitle => 'Tunnista näppäimistön asettelu';

  @override
  String get keyboardDetectButton => 'Tunnista';

  @override
  String get keyboardVariantLabel => 'Näppäimistömuunnelma:';

  @override
  String get keyboardPressKeyLabel => 'Paina yhtä seuraavista näppäimistä:';

  @override
  String get keyboardKeyPresentLabel => 'Löytyykö seuraava näppäin näppäimistöstäsi?';

  @override
  String get themePageTitle => 'Valitse teema';

  @override
  String get themePageHeader => 'Voit vaihtaa ulkoasua milloin tahansa asetusten kautta.';

  @override
  String get themeDark => 'Tumma';

  @override
  String get themeLight => 'Vaalea';
}
