import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

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
  String installLangPacksTitle(String lang) {
    return 'Instalar paquetes para mejor compatibilidad con el $lang';
  }

  @override
  String get installLangPacksSubtitle => 'No recomendable para conexiones lentas.';

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
  String get profileSetupUsernameInUse => 'Ese nombre de usuario ya existe.';

  @override
  String get profileSetupUsernameSystemReserved => 'Ese nombre está reservado para el uso del sistema.';

  @override
  String get profileSetupUsernameTooLong => 'Ese nombre es demasiado largo.';

  @override
  String get profileSetupUsernameInvalidChars => 'Ese nombre contiene caracteres no válidos.';

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
  String get configurationUIMountFstabSubtitle => 'Si se montará /etc/fstab. Este archivo contiene información sobre los sistemas de archivos que se montarán en el sistema.';

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
    return 'Hola, $user:\nHa finalizado la configuración.';
  }

  @override
  String get setupCompleteUpdate => 'Se sugiere ejecutar esta orden para actualizar Ubuntu a la versión más reciente:';

  @override
  String get setupCompleteRestart => '* Todas las configuraciones surtirán efecto tras reiniciar Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Bienvenido a Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Iniciando...';

  @override
  String get installationSlidesUnpacking => 'Desembalando la distribución';

  @override
  String get installationSlidesInstalling => 'Casi listo. El instalador requerirá su atención pronto.';

  @override
  String get installationSlidesLaunching => 'Iniciando la distribución…';

  @override
  String get installationSlidesErrorMsg => 'Se ha producido un problema.';

  @override
  String get installationSlidesErrorTitle => 'Algo salió mal';

  @override
  String get installationSlidesErrorSub => 'Reinicie WSL con la orden siguiente y vuelva a intentarlo:\n\twsl --shutdown\n\twsl --unregister NOMBRE_DISTRO';

  @override
  String get installationSlidesErrorText => '\nSe ha producido un error irrecuperable.\n\nCierre esta aplicación, abra PowerShell o el símbolo del sistema y ejecute las órdenes siguientes:\n';

  @override
  String get installationSlidesDone => 'Todo listo. Disfrute usando Ubuntu en WSL';

  @override
  String get installationSlidesExitTitle => '¿Confirma que quiere abandonar?';

  @override
  String get installationSlidesExitContents => 'Cerrar esta ventana no impedirá que la instalación continúe en segundo plano.\n\nAdemás, puede seguir explorando lo que puede hacer con Ubuntu en WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Ya casi hemos terminado';

  @override
  String get installationSlidesCustomExitContents => 'Solo hay que completar algunos pasos en la ventana principal del instalador.\n¿Quiere salir de esta e ir allí?';

  @override
  String get installationSlidesOk => 'Aceptar';

  @override
  String get installationSlidesLeave => 'Abandonar';

  @override
  String get installationSlidesCancel => 'Cancelar';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu en WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Un entorno completo de Ubuntu, profundamente integrado con Windows, para el desarrollo y ejecución de aplicaciones Linux. Optimizado para la nube, la web, la ciencia de los datos, el IoT y la diversión.';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL para\nDesarrollo web';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Desarrolle en WSL utilizando IDEs nativos de Windows, como VS Code e IntelliJ, y benefíciese de la compatibilidad total con NodeJS y Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL para la ciencia de los datos';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack permite maximizar el rendimiento de los proyectos de ciencia de datos y aprendizaje automático sobre los controladores NVIDIA nativos de Windows.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu en WSL para\naplicaciones gráficas';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Desarrolle y previsualice aplicaciones web y gráficas en Linux utilizando WSLg para el desarrollo multiplataforma.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu en WSL para DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Garantice la compatibilidad de las canalizaciones de integración y entrega continuas desarrollando en Ubuntu en WSL antes de publicar en un entorno de producción Ubuntu.';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL para las empresas';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Capacite a los desarrolladores en un ecosistema empresarial de Windows\ncon un ecosistema empresarial certificado\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Más información';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visite ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' para saber más sobre Ubuntu en WSL y cómo Canonical apoya a los desarrolladores y organizaciones.';
}
