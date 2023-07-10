import 'ubuntu_provision_localizations.dart';

/// The translations for Catalan Valencian (`ca`).
class UbuntuProvisionLocalizationsCa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get timezonePageTitle => 'On sou?';

  @override
  String get timezoneLocationLabel => 'Ubicació';

  @override
  String get timezoneTimezoneLabel => 'Fus horari';

  @override
  String get keyboardTitle => 'Disposició de teclat';

  @override
  String get keyboardHeader => 'Trieu la vostra distribució de teclat:';

  @override
  String get keyboardTestHint => 'Escriviu aquí per provar el vostre teclat';

  @override
  String get keyboardDetectTitle => 'Detecta la disposició del teclat';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Premeu una de les tecles següents:';

  @override
  String get keyboardKeyPresentLabel => 'Teniu la tecla següent al vostre teclat?';

  @override
  String get themePageTitle => 'Trieu l’aspecte';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Fosc';

  @override
  String get themeLight => 'Clar';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Trieu la vostra llengua:';

  @override
  String get identityPageTitle => 'Qui sou?';

  @override
  String get identityAutoLogin => 'Entra de manera automàtica';

  @override
  String get identityRequirePassword => 'Fes que calgui una contrasenya per a entrar';

  @override
  String get identityRealNameLabel => 'El vostre nom';

  @override
  String get identityRealNameRequired => 'Cal un nom';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'El nom de l\'ordinador';

  @override
  String get identityHostnameInfo => 'El nom que utilitza quan es comunica amb altres ordinadors.';

  @override
  String get identityHostnameRequired => 'Cal un nom per a l\'ordinador';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'El nom de l\'ordinador no és vàlid';

  @override
  String get identityUsernameLabel => 'Trieu un nom d\'usuari';

  @override
  String get identityUsernameRequired => 'Cal un nom d\'usuari';

  @override
  String get identityInvalidUsername => 'El nom d\'usuari no és vàlid';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'Aquest nom és massa llarg.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'Trieu una contrasenya';

  @override
  String get identityPasswordRequired => 'Cal una contrasenya';

  @override
  String get identityConfirmPasswordLabel => 'Confirmeu la contrasenya';

  @override
  String get identityPasswordMismatch => 'Les contrasenyes no coincideixen';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';
}
