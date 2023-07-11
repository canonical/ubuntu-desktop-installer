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

  @override
  String localePageTitle(Object DISTRO) {
    return 'Tervetuloa, tämä on $DISTRO';
  }

  @override
  String get localeHeader => 'Valitse kieli:';

  @override
  String get identityPageTitle => 'Määritä tili';

  @override
  String get identityAutoLogin => 'Kirjaudu sisään automaattisesti';

  @override
  String get identityRequirePassword => 'Vaadi salasana sisäänkirjautumiseen';

  @override
  String get identityRealNameLabel => 'Nimi';

  @override
  String get identityRealNameRequired => 'Nimi vaaditaan';

  @override
  String get identityRealNameTooLong => 'Nimi on liian pitkä.';

  @override
  String get identityHostnameLabel => 'Tietokoneen nimi';

  @override
  String get identityHostnameInfo => 'Nimi, jolla tietokone tunnistautuu toisille tietokoneille.';

  @override
  String get identityHostnameRequired => 'Tietokoneen nimi vaaditaan';

  @override
  String get identityHostnameTooLong => 'Tietokoneen nimi on liian pitkä.';

  @override
  String get identityInvalidHostname => 'Tietokoneen nimi on virheellinen';

  @override
  String get identityUsernameLabel => 'Valitse käyttäjätunnus';

  @override
  String get identityUsernameRequired => 'Käyttäjätunnus vaaditaan';

  @override
  String get identityInvalidUsername => 'Käyttäjätunnus on virheellinen';

  @override
  String get identityUsernameInUse => 'Kyseinen käyttäjänimi on jo olemassa.';

  @override
  String get identityUsernameSystemReserved => 'Kyseinen nimi on varattu järjestelmän käytettäväksi.';

  @override
  String get identityUsernameTooLong => 'Kyseinen nimi on liian pitkä.';

  @override
  String get identityUsernameInvalidChars => 'Kyseinen nimi sisältää virheellisiä merkkejä.';

  @override
  String get identityPasswordLabel => 'Valitse salasana';

  @override
  String get identityPasswordRequired => 'Salasana vaaditaan';

  @override
  String get identityConfirmPasswordLabel => 'Vahvista salasana';

  @override
  String get identityPasswordMismatch => 'Salasanat eivät täsmää';

  @override
  String get identityPasswordShow => 'Näytä';

  @override
  String get identityPasswordHide => 'Piilota';

  @override
  String get identityActiveDirectoryOption => 'Käytä Active Directorya';

  @override
  String get identityActiveDirectoryInfo => 'Kirjoitat domainin ja muut tiedot seuraavassa vaiheessa.';
}
