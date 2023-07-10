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

  @override
  String get themePageTitle => 'Vælg til tema';

  @override
  String get themePageHeader => 'Du kan altid ændre dette senere, i indstillinger for udseende.';

  @override
  String get themeDark => 'Mørkt';

  @override
  String get themeLight => 'Lyst';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Velkommen til $DISTRO';
  }

  @override
  String get localeHeader => 'Vælg dit sprog:';

  @override
  String get identityPageTitle => 'Indstil din konto';

  @override
  String get identityAutoLogin => 'Log ind automatisk';

  @override
  String get identityRequirePassword => 'Kræv min adgangskode, for at logge ind';

  @override
  String get identityRealNameLabel => 'Dit navn';

  @override
  String get identityRealNameRequired => 'Et navn er påkrævet';

  @override
  String get identityRealNameTooLong => 'Navnet er for langt.';

  @override
  String get identityHostnameLabel => 'Din computers navn';

  @override
  String get identityHostnameInfo => 'Det navn den bruger, når den snakker med andre computere.';

  @override
  String get identityHostnameRequired => 'Et computernavn er påkrævet';

  @override
  String get identityHostnameTooLong => 'Det computernavn er for langt.';

  @override
  String get identityInvalidHostname => 'Computernavnet er ugyldigt';

  @override
  String get identityUsernameLabel => 'Vælg et brugernavn';

  @override
  String get identityUsernameRequired => 'Et brugernavn er påkrævet';

  @override
  String get identityInvalidUsername => 'Brugernavnet er ugyldigt';

  @override
  String get identityUsernameInUse => 'Det brugernavn findes allerede.';

  @override
  String get identityUsernameSystemReserved => 'Det navn er reserveret til systembrug.';

  @override
  String get identityUsernameTooLong => 'Det navn er for langt.';

  @override
  String get identityUsernameInvalidChars => 'Det navn indeholder ugyldige tegn.';

  @override
  String get identityPasswordLabel => 'Vælg en adgangskode';

  @override
  String get identityPasswordRequired => 'En adgangskode er påkrævet';

  @override
  String get identityConfirmPasswordLabel => 'Bekræft din adgangskode';

  @override
  String get identityPasswordMismatch => 'Adgangskoderne stemmer ikke overens';

  @override
  String get identityPasswordShow => 'Vis';

  @override
  String get identityPasswordHide => 'Skjul';

  @override
  String get identityActiveDirectoryOption => 'Brug Aktiv Sti';

  @override
  String get identityActiveDirectoryInfo => 'Du kan indtaste domæne og andre oplysninger i næste trin.';
}
