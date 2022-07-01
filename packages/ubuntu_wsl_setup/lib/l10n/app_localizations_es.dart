


import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Ubuntu en WSL';

  @override
  String get windowTitle => 'Ubuntu en WSL';

  @override
  String get exitButton => 'Salir';

  @override
  String get finishButton => 'Finalizar';

  @override
  String get saveButton => 'Guardar';

  @override
  String get setupButton => 'Puesta en marcha';

  @override
  String get selectLanguageTitle => 'Seleccione su idioma';

  @override
  String get profileSetupTitle => 'Preparación del perfil';

  @override
  String get profileSetupHeader => 'Cree una cuenta de usuario UNIX predeterminada. Para obtener más información al respecto: <a href=\"https://aka.ms/wslusers\">aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Su nombre';

  @override
  String get profileSetupRealnameRequired => 'Se necesita un nombre';

  @override
  String get profileSetupUsernameHint => 'Elija un nombre de usuario';

  @override
  String get profileSetupUsernameHelper => 'Este nombre de usuario no necesita coincidir con el de Windows.';

  @override
  String get profileSetupPasswordHint => 'Elija una contraseña';

  @override
  String get profileSetupConfirmPasswordHint => 'Confirme su contraseña';

  @override
  String get profileSetupShowAdvancedOptions => 'Mostrar opciones avanzadas en la próxima página';

  @override
  String get profileSetupPasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get profileSetupUsernameRequired => 'Se necesita un nombre de usuario';

  @override
  String get profileSetupUsernameInvalid => 'El nombre de usuario no es válido';

  @override
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'Se necesita una contraseña';

  @override
  String get advancedSetupTitle => 'Configuración avanzada';

  @override
  String get advancedSetupHeader => 'En esta página puede adaptar Ubuntu en WSL a sus necesidades.';

  @override
  String get advancedSetupMountLocationHint => 'Ubicación de montaje';

  @override
  String get advancedSetupMountLocationHelper => 'Ubicación del montaje automático';

  @override
  String get advancedSetupMountLocationInvalid => 'La ubicación no es válida';

  @override
  String get advancedSetupMountOptionHint => 'Opción de montaje';

  @override
  String get advancedSetupMountOptionHelper => 'Opción de montaje transmitida para el montaje automático';

  @override
  String get advancedSetupHostGenerationTitle => 'Activar generación de anfitrión';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Seleccionar esta opción regenerará /etc/hosts en cada inicio.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Activar generación de resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Seleccionar esta opción regenerará /etc/resolv.conf en cada inicio.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Integración de interfaces gráficas';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Seleccionar esta opción configurará automáticamente el entorno DISPLAY. Se necesita un servidor X de terceros.';

  @override
  String get configurationUITitle => 'Configuración de Ubuntu en WSL. Opciones avanzadas';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperatividad';

  @override
  String get configurationUIInteroperabilityTitle => 'Activada';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Indica si se activará la interoperatividad.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Anexar ruta de acceso de Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Indica si la ruta de Windows se anexará a la variable de entorno PATH en WSL';

  @override
  String get configurationUIAutoMountHeader => 'Montaje automático';

  @override
  String get configurationUIAutoMountTitle => 'Activado';

  @override
  String get configurationUIAutoMountSubtitle => 'Indica si la función de montaje automático está activada. Esta función le permite montar la unidad de Windows en WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Montar /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Indica si se montará /etc/fstab. El archivo de configuración /etc/fstab contiene???';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL: systemd';

  @override
  String get configurationUISystemdTitle => 'Activado';

  @override
  String get configurationUISystemdSubtitle => 'Indica si se activará systemd al momento de arrancar. PRECAUCIÓN: es una funcionalidad experimental.';

  @override
  String get applyingChanges => 'Aplicando cambios…';

  @override
  String get applyingChangesDisclaimer => 'El proceso puede demorar algunos minutos, según la capacidad de la conexión a Internet.';

  @override
  String get setupCompleteTitle => 'Puesta en marcha finalizada';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hola, $user:\nHa finalizado con éxito la configuración.';
  }

  @override
  String get setupCompleteUpdate => 'Se sugiere ejecutar esta orden para actualizar Ubuntu a la versión más reciente:';

  @override
  String get setupCompleteRestart => '* Todas las configuraciones surtirán efecto tras reiniciar Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Launching distro...';

  @override
  String get installationSlidesErrorMsg => 'Something went wrong.';

  @override
  String get installationSlidesErrorTitle => 'Something went wrong';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'Ok';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'Cancel';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
