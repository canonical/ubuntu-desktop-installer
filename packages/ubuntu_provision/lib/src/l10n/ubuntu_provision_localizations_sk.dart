import 'ubuntu_provision_localizations.dart';

/// The translations for Slovak (`sk`).
class UbuntuProvisionLocalizationsSk extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get timezonePageTitle => 'Vyberte si svoje časové pásmo';

  @override
  String get timezoneLocationLabel => 'Umiestnenie';

  @override
  String get timezoneTimezoneLabel => 'Časové pásmo';

  @override
  String get keyboardTitle => 'Rozloženie klávesnice';

  @override
  String get keyboardHeader => 'Vyberte si rozloženie klávesnice:';

  @override
  String get keyboardTestHint => 'Správne fungovanie rozloženia si môžete vyskúšať tu';

  @override
  String get keyboardDetectTitle => 'Zistiť rozloženie klávesnice';

  @override
  String get keyboardDetectButton => 'Zistiť';

  @override
  String get keyboardVariantLabel => 'Variant klávesnice:';

  @override
  String get keyboardPressKeyLabel => 'Stlačte niektorú z nasledujúcich kláves:';

  @override
  String get keyboardKeyPresentLabel => 'Máte na klávesnici nasledujúci kláves?';

  @override
  String get themePageTitle => 'Vyberte si motív vzhľadu';

  @override
  String get themePageHeader => 'Môžete ho neskôr kedykoľvek zmeniť v nastaveniach vzhľadu.';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get themeLight => 'Svetlý';
}
