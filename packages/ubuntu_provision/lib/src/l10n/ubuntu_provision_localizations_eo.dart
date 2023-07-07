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
}
