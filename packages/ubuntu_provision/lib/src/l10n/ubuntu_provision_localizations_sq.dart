import 'ubuntu_provision_localizations.dart';

/// The translations for Albanian (`sq`).
class UbuntuProvisionLocalizationsSq extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get timezonePageTitle => 'Ku ndodheni?';

  @override
  String get timezoneLocationLabel => 'Vendndodhja';

  @override
  String get timezoneTimezoneLabel => 'Zona orare';

  @override
  String get keyboardTitle => 'Keyboard layout';

  @override
  String get keyboardHeader => 'Choose your keyboard layout:';

  @override
  String get keyboardTestHint => 'Type here to test your keyboard';

  @override
  String get keyboardDetectTitle => 'Detect keyboard layout';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Please press one of the following keys:';

  @override
  String get keyboardKeyPresentLabel => 'Is the following key present on your keyboard?';

  @override
  String get themePageTitle => 'Zgjidh pamjen tënde';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'E errët';

  @override
  String get themeLight => 'E çelur';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Choose your language:';

  @override
  String get identityPageTitle => 'Kush jeni ju?';

  @override
  String get identityAutoLogin => 'Hyr automatikisht';

  @override
  String get identityRequirePassword => 'Kërko fjalëkalimin tim për të hyrë';

  @override
  String get identityRealNameLabel => 'Emri juaj';

  @override
  String get identityRealNameRequired => 'A name is required';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'Your computer\'s name';

  @override
  String get identityHostnameInfo => 'Emri që ai përdor kur flet me kompjuterat e tjerë.';

  @override
  String get identityHostnameRequired => 'A computer name is required';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'The computer name is invalid';

  @override
  String get identityUsernameLabel => 'Pick a username';

  @override
  String get identityUsernameRequired => 'A username is required';

  @override
  String get identityInvalidUsername => 'The username is invalid';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'Zgjidh një fjalëkalim';

  @override
  String get identityPasswordRequired => 'A password is required';

  @override
  String get identityConfirmPasswordLabel => 'Confirm your password';

  @override
  String get identityPasswordMismatch => 'The passwords do not match';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';
}
