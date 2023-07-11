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

  @override
  String get activeDirectoryTitle => 'Agordi Aktivan Dosierujon';

  @override
  String get activeDirectoryTestConnection => 'Provi konekton al la domanio';

  @override
  String get activeDirectoryDomainLabel => 'Domanio';

  @override
  String get activeDirectoryDomainEmpty => 'Deviga';

  @override
  String get activeDirectoryDomainTooLong => 'Tro longa';

  @override
  String get activeDirectoryDomainInvalidChars => 'Nevalidaj signoj';

  @override
  String get activeDirectoryDomainStartDot => 'Komenciĝas per punkto (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Finiĝas per punkto (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Komenciĝas per dividstreko (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Finiĝas per dividstreko (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Enhavas plurajn sinsekvajn punktojn (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domanio ne troviĝis';

  @override
  String get activeDirectoryAdminLabel => 'Uzanto por aliĝi al la domanio';

  @override
  String get activeDirectoryAdminEmpty => 'Deviga';

  @override
  String get activeDirectoryAdminInvalidChars => 'Nevalidaj signoj';

  @override
  String get activeDirectoryPasswordLabel => 'Pasvorto';

  @override
  String get activeDirectoryPasswordEmpty => 'Deviga';

  @override
  String get activeDirectoryErrorTitle => 'Eraro agordante konekton al Aktiva Dosierujo';

  @override
  String get activeDirectoryErrorMessage => 'Pardonu, Aktiva Dosierujo ne estas agordebla nuntempe. Post kiam via sistemo funkcias, vizitu <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> por helpo.';

  @override
  String get networkPageTitle => 'Konekti al reto';

  @override
  String get networkPageHeader => 'Konektado de ĉi tiu komputilo al Interreto helpos Ubuntu instali ajnajn kromajn programojn bezonatajn kaj helpos vin elekti vian horzonon.\n\nKonektu per Eterreta kablo, aŭ elektu sendratan reton.';

  @override
  String get networkWiredOption => 'Uzi dratan konekton';

  @override
  String get networkWiredNone => 'Neniu drata konekto troviĝis';

  @override
  String get networkWiredOff => 'Drataj retoj estas malŝaltitaj';

  @override
  String get networkWiredDisabled => 'Por uzi Eterreton kun ĉi tiu komputilo, vi devas ebligi dratajn retojn';

  @override
  String get networkWiredEnable => 'Ebligi dratajn retojn';

  @override
  String get networkWifiOption => 'Konekti al sendrata reto';

  @override
  String get networkWifiOff => 'Sendrataj retoj estas malŝaltitaj';

  @override
  String get networkWifiNone => 'Neniu sendratreta aparato troviĝis';

  @override
  String get networkWifiDisabled => 'Por uzi sendratajn retojn kun ĉi tiu komputilo, vi devas ebligi sendratajn retojn';

  @override
  String get networkWifiEnable => 'Ebligi sendratajn retojn';

  @override
  String get networkHiddenWifiOption => 'Konekti al kaŝita sendrata reto';

  @override
  String get networkHiddenWifiNameLabel => 'Nomo de reto';

  @override
  String get networkHiddenWifiNameRequired => 'Nomo de reto estas postulata';

  @override
  String get networkNoneOption => 'Mi ne volas konekti al Interreto nun';
}
