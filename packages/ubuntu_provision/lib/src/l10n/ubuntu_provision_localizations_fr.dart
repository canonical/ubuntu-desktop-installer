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

  @override
  String get identityPageTitle => 'Configurez votre compte';

  @override
  String get identityAutoLogin => 'Ouvrir la session automatiquement';

  @override
  String get identityRequirePassword => 'Demander mon mot de passe pour ouvrir une session';

  @override
  String get identityRealNameLabel => 'Votre nom';

  @override
  String get identityRealNameRequired => 'Votre nom est requis';

  @override
  String get identityRealNameTooLong => 'Ce nom est trop long.';

  @override
  String get identityHostnameLabel => 'Le nom de votre ordinateur';

  @override
  String get identityHostnameInfo => 'Le nom qu’il utilise pour communiquer avec d’autres ordinateurs.';

  @override
  String get identityHostnameRequired => 'Un nom pour l’ordinateur est requis';

  @override
  String get identityHostnameTooLong => 'Ce nom est trop long.';

  @override
  String get identityInvalidHostname => 'Ce nom d’ordinateur est invalide';

  @override
  String get identityUsernameLabel => 'Choisir un nom d’utilisateur';

  @override
  String get identityUsernameRequired => 'Un nom d’utilisateur est requis';

  @override
  String get identityInvalidUsername => 'Ce nom d’utilisateur est invalide';

  @override
  String get identityUsernameInUse => 'Ce nom d’utilisateur existe déjà.';

  @override
  String get identityUsernameSystemReserved => 'Ce nom est réservé pour le système.';

  @override
  String get identityUsernameTooLong => 'Ce nom est trop long.';

  @override
  String get identityUsernameInvalidChars => 'Ce nom contient des caractères invalides.';

  @override
  String get identityPasswordLabel => 'Choisir un mot de passe';

  @override
  String get identityPasswordRequired => 'Un mot de passe est requis';

  @override
  String get identityConfirmPasswordLabel => 'Confirmez votre mot de passe';

  @override
  String get identityPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get identityPasswordShow => 'Montrer';

  @override
  String get identityPasswordHide => 'Cacher';

  @override
  String get identityActiveDirectoryOption => 'Utiliser Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Vous saisirez le domaine et d’autres détails à l’étape suivante.';
}
