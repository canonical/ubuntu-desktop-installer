import 'ubuntu_provision_localizations.dart';

/// The translations for Esperanto (`eo`).
class UbuntuProvisionLocalizationsEo extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get timezonePageTitle => 'Elektu vian horzonon';

  @override
  String get timezoneLocationLabel => 'Loko';

  @override
  String get timezoneTimezoneLabel => 'Horzono';

  @override
  String get keyboardTitle => 'Klavaranĝo';

  @override
  String get keyboardHeader => 'Elektu vian klavaranĝon:';

  @override
  String get keyboardTestHint => 'Tajpu ĉi tie por provi vian klavaron';

  @override
  String get keyboardDetectTitle => 'Rekoni klavaranĝon';

  @override
  String get keyboardDetectButton => 'Identigi';

  @override
  String get keyboardVariantLabel => 'Klavara varianto:';

  @override
  String get keyboardPressKeyLabel => 'Bonvolu premi unu el la jenaj klavoj:';

  @override
  String get keyboardKeyPresentLabel => 'Ĉu la jena klavo troviĝas en via klavaro?';

  @override
  String get themePageTitle => 'Elektu vian etoson';

  @override
  String get themePageHeader => 'Vi povas ŝanĝi tion poste per la agordoj pri Aspekto.';

  @override
  String get themeDark => 'Malhela';

  @override
  String get themeLight => 'Hela';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Bonvenon al $DISTRO';
  }

  @override
  String get localeHeader => 'Elektu vian lingvon:';

  @override
  String get identityPageTitle => 'Agordu vian konton';

  @override
  String get identityAutoLogin => 'Aŭtomate saluti';

  @override
  String get identityRequirePassword => 'Postuli mian pasvorton por salutado';

  @override
  String get identityRealNameLabel => 'Via nomo';

  @override
  String get identityRealNameRequired => 'Nomo bezoniĝas';

  @override
  String get identityRealNameTooLong => 'Tiu nomo estas tro longa.';

  @override
  String get identityHostnameLabel => 'Nomo de via komputilo';

  @override
  String get identityHostnameInfo => 'La nomo, kiun ĝi uzas por alparoli aliajn komputilojn.';

  @override
  String get identityHostnameRequired => 'Nomo de komputilo bezoniĝas';

  @override
  String get identityHostnameTooLong => 'Tiu nomo estas tro longa.';

  @override
  String get identityInvalidHostname => 'La nomo de komputilo ne validas';

  @override
  String get identityUsernameLabel => 'Elektu salutnomon';

  @override
  String get identityUsernameRequired => 'Salutnomo bezoniĝas';

  @override
  String get identityInvalidUsername => 'La salutnomo ne validas';

  @override
  String get identityUsernameInUse => 'Tiu salutnomo jam ekzistas.';

  @override
  String get identityUsernameSystemReserved => 'Tiu salutnomo estas rezervita por sistema uzado.';

  @override
  String get identityUsernameTooLong => 'Tiu salutnomo estas tro longa.';

  @override
  String get identityUsernameInvalidChars => 'Tiu salutnomo enhavas nevalidajn signojn.';

  @override
  String get identityPasswordLabel => 'Elektu pasvorton';

  @override
  String get identityPasswordRequired => 'Pasvorto bezoniĝas';

  @override
  String get identityConfirmPasswordLabel => 'Konfirmu vian pasvorton';

  @override
  String get identityPasswordMismatch => 'La pasvortoj ne kongruas';

  @override
  String get identityPasswordShow => 'Malkaŝi';

  @override
  String get identityPasswordHide => 'Kaŝi';

  @override
  String get identityActiveDirectoryOption => 'Uzi Aktivan Dosierujon';

  @override
  String get identityActiveDirectoryInfo => 'Vi tajpos la domanion kaj aliajn detalojn dum la sekva paŝo.';
}
