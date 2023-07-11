import 'ubuntu_provision_localizations.dart';

/// The translations for Occitan (`oc`).
class UbuntuProvisionLocalizationsOc extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsOc([String locale = 'oc']) : super(locale);

  @override
  String get timezonePageTitle => 'Seleccionatz vòstre fus orari';

  @override
  String get timezoneLocationLabel => 'Localizacion';

  @override
  String get timezoneTimezoneLabel => 'Fus orari';

  @override
  String get keyboardTitle => 'Agençament del clavièr';

  @override
  String get keyboardHeader => 'Indicatz l’agençament del clavièr :';

  @override
  String get keyboardTestHint => 'Picatz de tèxt aquí per ensajar lo clavièr';

  @override
  String get keyboardDetectTitle => 'Detectar l’agençament del clavièr';

  @override
  String get keyboardDetectButton => 'Detectar';

  @override
  String get keyboardVariantLabel => 'Varianta del clavièr :';

  @override
  String get keyboardPressKeyLabel => 'Mercés de quichar una de las tòcas seguentas :';

  @override
  String get keyboardKeyPresentLabel => 'La tòca seguenta es presenta sul clavièr ?';

  @override
  String get themePageTitle => 'Causissètz vòstre tèma';

  @override
  String get themePageHeader => 'La poiretz cambiar mai tard en anant a las preferéncias d’aparéncia.';

  @override
  String get themeDark => 'Fosc';

  @override
  String get themeLight => 'Clar';

  @override
  String localePageTitle(Object DISTRO) {
    return 'La benvenguda a $DISTRO';
  }

  @override
  String get localeHeader => 'Causissètz vòstra lenga :';

  @override
  String get identityPageTitle => 'Configuratz vòstre compte';

  @override
  String get identityAutoLogin => 'Se connectar automaticament';

  @override
  String get identityRequirePassword => 'Demandar mon senhal per dobrir una session';

  @override
  String get identityRealNameLabel => 'Vòstre prenom';

  @override
  String get identityRealNameRequired => 'Cal un prenom';

  @override
  String get identityRealNameTooLong => 'Aqueste nom es tròp long.';

  @override
  String get identityHostnameLabel => 'Lo nom de l’ordenador';

  @override
  String get identityHostnameInfo => 'Lo nom qu’utiliza per comunicar amb d’autres ordenadors.';

  @override
  String get identityHostnameRequired => 'Un nom d’ordenador es requerit';

  @override
  String get identityHostnameTooLong => 'Aqueste nom d’ordenador es tròp long.';

  @override
  String get identityInvalidHostname => 'Lo nom de l’ordenador es invalid';

  @override
  String get identityUsernameLabel => 'Causissètz un nom d’utilizaire';

  @override
  String get identityUsernameRequired => 'Un nom d’utilizaire es requerit';

  @override
  String get identityInvalidUsername => 'Lo nom d’utilizaire es requerit';

  @override
  String get identityUsernameInUse => 'Aqueste nom d’utilizaire existís ja.';

  @override
  String get identityUsernameSystemReserved => 'Aqueste nom es reservat per l’usatge del sistèma.';

  @override
  String get identityUsernameTooLong => 'Aqueste nom es tròp long.';

  @override
  String get identityUsernameInvalidChars => 'Aqueste nom conten de caractèrs invalids.';

  @override
  String get identityPasswordLabel => 'Causissètz un senhal';

  @override
  String get identityPasswordRequired => 'Un senhal es requerit';

  @override
  String get identityConfirmPasswordLabel => 'Confirmar lo senhal';

  @override
  String get identityPasswordMismatch => 'Los senhals correspondon pas';

  @override
  String get identityPasswordShow => 'Mostrar';

  @override
  String get identityPasswordHide => 'Rescondre';

  @override
  String get identityActiveDirectoryOption => 'Utilizar Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Picaretz lo domeni e los autres detalhs a l’etapa que ven.';
}
