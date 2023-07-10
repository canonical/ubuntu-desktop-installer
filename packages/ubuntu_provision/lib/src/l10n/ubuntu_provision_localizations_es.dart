import 'ubuntu_provision_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class UbuntuProvisionLocalizationsEs extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get timezonePageTitle => 'Selecciona tu zona horaria';

  @override
  String get timezoneLocationLabel => 'Ubicación';

  @override
  String get timezoneTimezoneLabel => 'Huso horario';

  @override
  String get keyboardTitle => 'Distribución del teclado';

  @override
  String get keyboardHeader => 'Elija la distribución del teclado:';

  @override
  String get keyboardTestHint => 'Escriba aquí para probar el teclado';

  @override
  String get keyboardDetectTitle => 'Detectar la distribución del teclado';

  @override
  String get keyboardDetectButton => 'Detectar';

  @override
  String get keyboardVariantLabel => 'Variante del teclado:';

  @override
  String get keyboardPressKeyLabel => 'Pulse una de estas teclas:';

  @override
  String get keyboardKeyPresentLabel => '¿Está presente la siguiente tecla en su teclado?';

  @override
  String get themePageTitle => 'Elige tu tema';

  @override
  String get themePageHeader => 'Puede cambiarlo después en la configuración de apariencia.';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeLight => 'Claro';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Bienvenido a $DISTRO';
  }

  @override
  String get localeHeader => 'Elija su idioma:';

  @override
  String get identityPageTitle => 'Crea tú cuenta';

  @override
  String get identityAutoLogin => 'Acceder automáticamente';

  @override
  String get identityRequirePassword => 'Solicitar mi contraseña para acceder';

  @override
  String get identityRealNameLabel => 'Su nombre';

  @override
  String get identityRealNameRequired => 'Se necesita un nombre';

  @override
  String get identityRealNameTooLong => 'Este nombre es demasiado largo.';

  @override
  String get identityHostnameLabel => 'El nombre del equipo';

  @override
  String get identityHostnameInfo => 'El nombre que utiliza al comunicarse con otros equipos.';

  @override
  String get identityHostnameRequired => 'Se necesita un nombre de equipo';

  @override
  String get identityHostnameTooLong => 'El nombre del ordenador es demasiado largo.';

  @override
  String get identityInvalidHostname => 'El nombre del equipo no es válido';

  @override
  String get identityUsernameLabel => 'Elija un nombre de usuario';

  @override
  String get identityUsernameRequired => 'Se necesita un nombre de usuario';

  @override
  String get identityInvalidUsername => 'El nombre de usuario no es válido';

  @override
  String get identityUsernameInUse => 'Ese nombre de usuario ya existe.';

  @override
  String get identityUsernameSystemReserved => 'Ese nombre está reservado para uso del sistema.';

  @override
  String get identityUsernameTooLong => 'Ese nombre es demasiado extenso.';

  @override
  String get identityUsernameInvalidChars => 'Ese nombre contiene caracteres no válidos.';

  @override
  String get identityPasswordLabel => 'Elija una contraseña';

  @override
  String get identityPasswordRequired => 'Se requiere una contraseña';

  @override
  String get identityConfirmPasswordLabel => 'Confirme su contraseña';

  @override
  String get identityPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get identityPasswordShow => 'Mostrar';

  @override
  String get identityPasswordHide => 'Ocultar';

  @override
  String get identityActiveDirectoryOption => 'Utilizar el directorio activo';

  @override
  String get identityActiveDirectoryInfo => 'En el siguiente paso introducirá el dominio y otros datos.';
}
