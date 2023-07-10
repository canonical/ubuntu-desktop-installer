import 'ubuntu_provision_localizations.dart';

/// The translations for Hungarian (`hu`).
class UbuntuProvisionLocalizationsHu extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get timezonePageTitle => 'Időzóna kiválasztása';

  @override
  String get timezoneLocationLabel => 'Hely';

  @override
  String get timezoneTimezoneLabel => 'Időzóna';

  @override
  String get keyboardTitle => 'Billentyűzetkiosztás';

  @override
  String get keyboardHeader => 'Válasszon billentyűzetkiosztást:';

  @override
  String get keyboardTestHint => 'Gépeljen itt a billentyűzet kipróbálásához';

  @override
  String get keyboardDetectTitle => 'Billentyűzetkiosztás felismerése';

  @override
  String get keyboardDetectButton => 'Felismerés';

  @override
  String get keyboardVariantLabel => 'Billentyűzetváltozat:';

  @override
  String get keyboardPressKeyLabel => 'Nyomja meg a következő billentyűk egyikét:';

  @override
  String get keyboardKeyPresentLabel => 'A következő billentyű rajta van a billentyűzetén?';

  @override
  String get themePageTitle => 'Téma kiválasztása';

  @override
  String get themePageHeader => 'Ezt később bármikor megváltoztathatja a megjelenési beállításokban.';

  @override
  String get themeDark => 'Sötét';

  @override
  String get themeLight => 'Világos';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Üdvözli a(z) $DISTRO!';
  }

  @override
  String get localeHeader => 'Válasszon nyelvet:';
}
