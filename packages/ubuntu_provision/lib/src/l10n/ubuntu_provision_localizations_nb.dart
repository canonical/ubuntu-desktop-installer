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

  @override
  String get identityPageTitle => 'Hvem er du?';

  @override
  String get identityAutoLogin => 'Logg inn automatisk';

  @override
  String get identityRequirePassword => 'Krev passord for å logge inn';

  @override
  String get identityRealNameLabel => 'Ditt navn';

  @override
  String get identityRealNameRequired => 'Navn er påkrevd';

  @override
  String get identityRealNameTooLong => 'Navnet er for langt.';

  @override
  String get identityHostnameLabel => 'Datamaskinens navn';

  @override
  String get identityHostnameInfo => 'Navn brukt ved kommunikasjon med andre datamaskiner.';

  @override
  String get identityHostnameRequired => 'Et datamaskinsnavn er påkrevd';

  @override
  String get identityHostnameTooLong => 'Datamaskinsnavnet er for langt.';

  @override
  String get identityInvalidHostname => 'Datamaskinsnavnet er ugyldig';

  @override
  String get identityUsernameLabel => 'Velg et brukernavn';

  @override
  String get identityUsernameRequired => 'Et brukernavn er påkrevd';

  @override
  String get identityInvalidUsername => 'Brukernavnet er ugyldig';

  @override
  String get identityUsernameInUse => 'Brukernavnet finnes allerede.';

  @override
  String get identityUsernameSystemReserved => 'Navnet er reservert for systembruk.';

  @override
  String get identityUsernameTooLong => 'Navnet er for langt.';

  @override
  String get identityUsernameInvalidChars => 'Navnet inneholder ugyldige tegn.';

  @override
  String get identityPasswordLabel => 'Velg et passord';

  @override
  String get identityPasswordRequired => 'Et passord er påkrevd';

  @override
  String get identityConfirmPasswordLabel => 'Bekreft passordet ditt';

  @override
  String get identityPasswordMismatch => 'Passordene samsvarer ikke';

  @override
  String get identityPasswordShow => 'Vis';

  @override
  String get identityPasswordHide => 'Skjul';

  @override
  String get identityActiveDirectoryOption => 'Bruk Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Du skriver inn domene og andre detaljer i neste steg.';
}
