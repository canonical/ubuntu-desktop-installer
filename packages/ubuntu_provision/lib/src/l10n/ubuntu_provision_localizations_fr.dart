import 'ubuntu_provision_localizations.dart';

/// The translations for French (`fr`).
class UbuntuProvisionLocalizationsFr extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get timezonePageTitle => 'Sélectionnez votre fuseau horaire';

  @override
  String get timezoneLocationLabel => 'Localisation';

  @override
  String get timezoneTimezoneLabel => 'Fuseau horaire';

  @override
  String get keyboardTitle => 'Disposition du clavier';

  @override
  String get keyboardHeader => 'Indiquez la disposition de votre clavier :';

  @override
  String get keyboardTestHint => 'Saisissez du texte ici pour tester votre clavier';

  @override
  String get keyboardDetectTitle => 'Détecter la disposition du clavier';

  @override
  String get keyboardDetectButton => 'Détecter';

  @override
  String get keyboardVariantLabel => 'Variante du clavier :';

  @override
  String get keyboardPressKeyLabel => 'Veuillez appuyer sur l’une des touches suivantes :';

  @override
  String get keyboardKeyPresentLabel => 'Cette touche est-elle présente sur votre clavier ?';

  @override
  String get themePageTitle => 'Choisissez l’apparence';

  @override
  String get themePageHeader => 'Vous pourrez la changer ultérieurement dans les préférences d’apparence.';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeLight => 'Clair';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Bienvenue à $DISTRO';
  }

  @override
  String get localeHeader => 'Choisissez votre langue :';
}
