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

  @override
  String get identityPageTitle => 'A fiók beállítása';

  @override
  String get identityAutoLogin => 'Automatikus bejelentkezés';

  @override
  String get identityRequirePassword => 'Jelszavam kérése a bejelentkezéshez';

  @override
  String get identityRealNameLabel => 'Az Ön neve';

  @override
  String get identityRealNameRequired => 'A név megadása kötelező';

  @override
  String get identityRealNameTooLong => 'Ez a név túl hosszú.';

  @override
  String get identityHostnameLabel => 'Az Ön számítógépének neve';

  @override
  String get identityHostnameInfo => 'A más számítógépekkel való kommunikáció során használt név.';

  @override
  String get identityHostnameRequired => 'A számítógépnév megadása kötelező';

  @override
  String get identityHostnameTooLong => 'Ez a számítógépnév túl hosszú.';

  @override
  String get identityInvalidHostname => 'A számítógép neve érvénytelen';

  @override
  String get identityUsernameLabel => 'Felhasználónév választása';

  @override
  String get identityUsernameRequired => 'A felhasználónév megadása kötelező';

  @override
  String get identityInvalidUsername => 'A felhasználónév érvénytelen';

  @override
  String get identityUsernameInUse => 'Ez a felhasználónév már létezik.';

  @override
  String get identityUsernameSystemReserved => 'Ez a név a rendszer számára van fenntartva.';

  @override
  String get identityUsernameTooLong => 'Ez a név túl hosszú.';

  @override
  String get identityUsernameInvalidChars => 'Ez a név érvénytelen karaktereket tartalmaz.';

  @override
  String get identityPasswordLabel => 'Jelszó választása';

  @override
  String get identityPasswordRequired => 'A jelszó megadása kötelező';

  @override
  String get identityConfirmPasswordLabel => 'Jelszó megerősítése';

  @override
  String get identityPasswordMismatch => 'A jelszavak nem egyeznek';

  @override
  String get identityPasswordShow => 'Megjelenítés';

  @override
  String get identityPasswordHide => 'Elrejtés';

  @override
  String get identityActiveDirectoryOption => 'Active Directory használata';

  @override
  String get identityActiveDirectoryInfo => 'A tartományt és egyéb részleteket a következő lépésben fogja megadni.';
}
