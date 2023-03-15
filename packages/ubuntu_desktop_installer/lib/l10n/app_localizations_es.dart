import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Instalador de Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String get cancelButtonText => 'Cancelar';

  @override
  String get changeButtonText => 'Cambiar';

  @override
  String get okButtonText => 'Aceptar';

  @override
  String get noButtonText => 'No';

  @override
  String get restartButtonText => 'Reiniciar';

  @override
  String get revertButtonText => 'Revertir';

  @override
  String get yesButtonText => 'Sí';

  @override
  String get quitButtonText => 'Salir de la instalación';

  @override
  String get welcome => 'Le damos la bienvenida';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparando la $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Elija su idioma:';

  @override
  String get tryOrInstallPageTitle => 'Probar o instalar';

  @override
  String get repairInstallation => 'Reparar instalación';

  @override
  String get repairInstallationDescription => 'Al reparar se reinstalarán todos los programas instalados sin tocar los documentos ni la configuración.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Probar $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Puede probar $RELEASE sin efectuar ningún cambio en su equipo.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar $RELEASE junto con (o en lugar de) su sistema operativo actual. No debería tardar mucho.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Puede leer el <a href=\"$url\">informe de novedades</a>.';
  }

  @override
  String get turnOffRST => 'Desactivar RST';

  @override
  String get turnOffRSTDescription => 'Este equipo utiliza Intel RST (Rapid Storage Technology). Es necesario desactivar RST en Windows antes de instalar Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Para seguir las instrucciones, abra esta página en un teléfono u otro dispositivo: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Distribución del teclado';

  @override
  String get chooseYourKeyboardLayout => 'Elija la distribución del teclado:';

  @override
  String get typeToTest => 'Escriba aquí para probar el teclado';

  @override
  String get detectLayout => 'Detectar la distribución del teclado';

  @override
  String get detectButtonText => 'Detectar';

  @override
  String get keyboardVariant => 'Variante del teclado:';

  @override
  String get pressOneKey => 'Pulse una de estas teclas:';

  @override
  String get isKeyPresent => '¿Está presente la siguiente tecla en su teclado?';

  @override
  String get configureSecureBootTitle => 'Configurar Secure Boot';

  @override
  String get configureSecureBootDescription => 'Ha elegido instalar software de controladores de terceros. Esto requiere desactivar Secure Boot.\nPara ello, debe elegir una clave de seguridad ahora, e introducirla cuando se reinicie el sistema.';

  @override
  String get configureSecureBootOption => 'Configurar Secure Boot';

  @override
  String get chooseSecurityKey => 'Elija una clave de seguridad';

  @override
  String get confirmSecurityKey => 'Confirme la clave de seguridad';

  @override
  String get dontInstallDriverSoftwareNow => 'No instalar el software de controladores por ahora';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Puede instalarlo más tarde desde Software y Actualizaciones.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Se necesita una clave de seguridad';

  @override
  String get secureBootSecurityKeysDontMatch => 'Las claves de seguridad no coinciden';

  @override
  String get showSecurityKey => 'Mostrar la clave de seguridad';

  @override
  String get connectToInternetPageTitle => 'Conectarse a Internet';

  @override
  String get connectToInternetDescription => 'Conectar este equipo a Internet ayudará a Ubuntu a instalar cualquier software adicional necesario y ayudará a elegir su zona horaria.\n\nConectar por cable ethernet, o elegir una red Wi-Fi';

  @override
  String get useWiredConnection => 'Utilizar conexión por cable';

  @override
  String get noWiredConnection => 'No se ha detectado una conexión por cable';

  @override
  String get wiredDisabled => 'La conexión por cable está desactivada';

  @override
  String get wiredMustBeEnabled => 'Para utilizar ethernet en este ordenador, debe activarse una conexión por cable';

  @override
  String get enableWired => 'Activar por cable';

  @override
  String get selectWifiNetwork => 'Conectarse a una red Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Conectarse a una red Wi-Fi oculta';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nombre de la red';

  @override
  String get hiddenWifiNetworkNameRequired => 'Se requiere un nombre de red';

  @override
  String get noInternet => 'No quiero conectarme a internet ahora mismo';

  @override
  String get wirelessNetworkingDisabled => 'Red inalámbrica desactivada';

  @override
  String get noWifiDevicesDetected => 'No se han detectado dispositivos Wi-Fi';

  @override
  String get wifiMustBeEnabled => 'Para utilizar Wi-Fi en este equipo, la red inalámbrica debe estar activada';

  @override
  String get enableWifi => 'Activar Wi-Fi';

  @override
  String get connectButtonText => 'Conectar';

  @override
  String get updatesOtherSoftwarePageTitle => 'Actualizaciones y otro software';

  @override
  String get updatesOtherSoftwarePageDescription => '¿Qué aplicaciones le gustaría instalar para comenzar?';

  @override
  String get normalInstallationTitle => 'Instalación normal';

  @override
  String get normalInstallationSubtitle => 'Navegador web, utilidades, aplicaciones de oficina, juegos y reproductores de contenido.';

  @override
  String get minimalInstallationTitle => 'Instalación mínima';

  @override
  String get minimalInstallationSubtitle => 'Navegador web y utilidades básicas.';

  @override
  String get otherOptions => 'Otras opciones';

  @override
  String get installThirdPartyTitle => 'Instalar controladores de terceros para gráficos y dispositivos de Wi-Fi, así como formatos multimedia adicionales';

  @override
  String get installThirdPartySubtitle => 'Este software está sujeto a los términos de licencia incluidos en su documentación. Algunos son privativos.';

  @override
  String get installDriversTitle => 'Instalar software de terceros para gráficos y dispositivos de Wi-Fi';

  @override
  String get installDriversSubtitle => 'Estos controladores están sujetos a los términos de licencia incluidos en su documentación. Son privativos.';

  @override
  String get installCodecsTitle => 'Descarga e instala un soporte para formatos multimedia adicionales';

  @override
  String get installCodecsSubtitle => 'Este software está sujeto a los términos de licencia incluidos en su documentación. Algunos son privativos.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Advertencia:</font> El equipo no está conectado a una fuente de alimentación.';
  }

  @override
  String get offlineWarning => 'Actualmente no está conectado';

  @override
  String get chooseSecurityKeyTitle => 'Elegir una clave de seguridad';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'El cifrado de disco protege sus archivos en caso de que pierda el equipo. Requiere que introduzca una clave de seguridad cada vez que se inicie el equipo.\n\nLos archivos que estén fuera de $RELEASE no se cifrarán.';
  }

  @override
  String get chooseSecurityKeyHint => 'Elija una clave de seguridad';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirmar la clave de seguridad';

  @override
  String get chooseSecurityKeyRequired => 'Se necesita una clave de seguridad';

  @override
  String get chooseSecurityKeyMismatch => 'Las claves de seguridad no coinciden';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Advertencia:</font> Si pierde esta clave de seguridad, se perderán todos los datos. Si lo necesita, anote su clave y guárdela en un lugar seguro en algún otro sitio.';
  }

  @override
  String get installationTypeTitle => 'Tipo de instalación';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Actualmente este equipo tiene $os instalado. ¿Qué le gustaría hacer?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Actualmente este equipo tiene $os1 y $os2 instalado. ¿Qué le gustaría hacer?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Actualmente este equipo tiene varios sistemas operativos instalados. ¿Qué le gustaría hacer?';

  @override
  String get installationTypeNoOSDetected => 'Actualmente este equipo no tiene ningún sistema operativo detectado. ¿Qué le gustaría hacer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Borrar disco e instalar $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Advertencia:</font> Esto eliminará todos sus programas, documentos, fotos, música y cualquier otro archivo en todos los sistemas operativos.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Funciones avanzadas...';

  @override
  String get installationTypeAdvancedTitle => 'Características avanzadas';

  @override
  String get installationTypeNone => 'Ninguno';

  @override
  String get installationTypeNoneSelected => 'Nada seleccionado';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Usar LVM con la nueva instalación de $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM seleccionado';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM y cifrado seleccionado';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Cifrar la nueva instalación de $RELEASE para mayor seguridad';
  }

  @override
  String get installationTypeEncryptInfo => 'Elegirá una clave de seguridad en el siguiente paso.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Borrar disco y usar ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS seleccionado';

  @override
  String installationTypeReinstall(Object os) {
    return 'Borrar $os y reinstalar';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Advertencia:</font> Esto eliminará todos sus programas , documentos, fotos, música y cualquier otro archivo de $os.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Instalar $product junto a $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Instalar $product junto a $os1 y $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Instalar $product junto a estos';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Instalar $product junto a otras particiones';
  }

  @override
  String get installationTypeAlongsideInfo => 'Se conservarán los documentos, la música y otros archivos personales. Puede elegir qué sistema operativo quiere iniciar cada vez que arranque el equipo.';

  @override
  String get installationTypeManual => 'Otra cosa';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Puede crear o cambiar el tamaño de las particiones manualmente, o elegir varias particiones para $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Borrar el disco e instalar $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Seleccionar la unidad:';

  @override
  String get selectGuidedStorageInfoLabel => 'Se utilizará todo el disco:';

  @override
  String get selectGuidedStorageInstallNow => 'Instalar ahora';

  @override
  String get installAlongsideSpaceDivider => 'Asignar el espacio de la unidad arrastrando el divisor de abajo:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num particiones más pequeñas están ocultas, use la <a href=\"$url\">herramienta de partición avanzada</a> para un mayor control';
  }

  @override
  String get installAlongsideResizePartition => 'Redimensionar partición';

  @override
  String get installAlongsideAllocateSpace => 'Asignar espacio';

  @override
  String get installAlongsideFiles => 'Archivos';

  @override
  String get installAlongsidePartition => 'Partición:';

  @override
  String get installAlongsideSize => 'Tamaño:';

  @override
  String get installAlongsideAvailable => 'Disponible:';

  @override
  String get allocateDiskSpace => 'Asignar espacio de disco';

  @override
  String get startInstallingButtonText => 'Instalar';

  @override
  String get diskHeadersDevice => 'Dispositivo';

  @override
  String get diskHeadersType => 'Tipo';

  @override
  String get diskHeadersMountPoint => 'Punto de montaje';

  @override
  String get diskHeadersSize => 'Tamaño';

  @override
  String get diskHeadersUsed => 'Usado';

  @override
  String get diskHeadersSystem => 'Sistema';

  @override
  String get diskHeadersFormat => 'Formato';

  @override
  String get freeDiskSpace => 'Espacio libre';

  @override
  String get newPartitionTable => 'Nueva tabla de particiones';

  @override
  String get newPartitionTableConfirmationTitle => '¿Quiere crear una tabla de particiones nueva en este dispositivo?';

  @override
  String get newPartitionTableConfirmationMessage => 'Ha optado por particionar un dispositivo entero. Si continúa con la creación de la tabla de particiones nueva en el dispositivo, las particiones que haya desaparecerán.\n\nObserve que puede deshacer esta operación más adelante, si lo desea.';

  @override
  String get tooManyPrimaryPartitions => 'Demasiadas particiones primarias';

  @override
  String get partitionLimitReached => 'Límite alcanzado';

  @override
  String get bootLoaderDevice => 'Dispositivo donde instalar el cargador de arranque';

  @override
  String get partitionCreateTitle => 'Crear partición';

  @override
  String get partitionEditTitle => 'Editar partición';

  @override
  String get partitionSizeLabel => 'Tamaño:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Tipo de la partición nueva:';

  @override
  String get partitionTypePrimary => 'Primaria';

  @override
  String get partitionTypeLogical => 'Lógica';

  @override
  String get partitionLocationLabel => 'Ubicación de la partición nueva:';

  @override
  String get partitionLocationBeginning => 'Inicio de este espacio';

  @override
  String get partitionLocationEnd => 'Fin de este espacio';

  @override
  String get partitionFormatLabel => 'Utilizada como:';

  @override
  String get partitionFormatExt4 => 'Sistema de archivos transaccional Ext4';

  @override
  String get partitionFormatExt3 => 'Sistema de archivos transaccional Ext3';

  @override
  String get partitionFormatExt2 => 'Sistema de archivos Ext2';

  @override
  String get partitionFormatBtrfs => 'Sistema de archivos transaccional btrfs';

  @override
  String get partitionFormatJfs => 'Sistema de archivos transaccional JFS';

  @override
  String get partitionFormatXfs => 'Sistema de archivos transaccional XFS';

  @override
  String get partitionFormatFat => 'Sistema de archivos FAT';

  @override
  String get partitionFormatFat12 => 'Sistema de archivos FAT12';

  @override
  String get partitionFormatFat16 => 'Sistema de archivos FAT16';

  @override
  String get partitionFormatFat32 => 'Sistema de archivos FAT32';

  @override
  String get partitionFormatSwap => 'Área de intercambio';

  @override
  String get partitionFormatIso9660 => 'Sistema de archivos ISO 9660';

  @override
  String get partitionFormatVfat => 'Sistema de archivos VFAT';

  @override
  String get partitionFormatNtfs => 'Sistema de archivos NTFS';

  @override
  String get partitionFormatReiserFS => 'Sistema de archivos ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Sistema de archivos raíz ZFS';

  @override
  String get partitionFormatNone => 'Dejar sin formatear';

  @override
  String get partitionErase => 'Formatear la partición';

  @override
  String get partitionMountPointLabel => 'Punto de montaje:';

  @override
  String get whoAreYouPageTitle => '¿Quién es usted?';

  @override
  String get whoAreYouPageAutoLogin => 'Acceder automáticamente';

  @override
  String get whoAreYouPageRequirePassword => 'Solicitar mi contraseña para acceder';

  @override
  String get whoAreYouPageRealNameLabel => 'Su nombre';

  @override
  String get whoAreYouPageRealNameRequired => 'Se necesita un nombre';

  @override
  String get whoAreYouPageRealNameTooLong => 'Este nombre es demasiado largo.';

  @override
  String get whoAreYouPageComputerNameLabel => 'El nombre del equipo';

  @override
  String get whoAreYouPageComputerNameInfo => 'El nombre que utiliza al comunicarse con otros equipos.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Se necesita un nombre de equipo';

  @override
  String get whoAreYouPageComputerNameTooLong => 'El nombre del ordenador es demasiado largo.';

  @override
  String get whoAreYouPageInvalidComputerName => 'El nombre del equipo no es válido';

  @override
  String get whoAreYouPageUsernameLabel => 'Elija un nombre de usuario';

  @override
  String get whoAreYouPageUsernameRequired => 'Se necesita un nombre de usuario';

  @override
  String get whoAreYouPageInvalidUsername => 'El nombre de usuario no es válido';

  @override
  String get whoAreYouPageUsernameInUse => 'Ese nombre de usuario ya existe.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Ese nombre está reservado para uso del sistema.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Ese nombre es demasiado extenso.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Ese nombre contiene caracteres no válidos.';

  @override
  String get whoAreYouPagePasswordLabel => 'Elija una contraseña';

  @override
  String get whoAreYouPagePasswordRequired => 'Se requiere una contraseña';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme su contraseña';

  @override
  String get whoAreYouPagePasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get whoAreYouPagePasswordShow => 'Mostrar';

  @override
  String get whoAreYouPagePasswordHide => 'Ocultar';

  @override
  String get writeChangesToDisk => 'Escribir cambios en el disco';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Si continúa, los cambios enumerados más abajo se escribirán en los discos. Podrá efectuar más cambios manualmente.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Las tablas de partición de los siguientes dispositivos se modifican:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Se aplicarán los cambios siguientes a las particiones:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partición #$disk$partition redimensionada de $oldsize a $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partición #$disk$partition formateada como $format utilizada para $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partición #$disk$partition formateada como $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partición #$disk$partition utilizada para $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partición #$disk$partition creada';
  }

  @override
  String get chooseYourLookPageTitle => 'Seleccione el aspecto';

  @override
  String get chooseYourLookPageHeader => 'Puede cambiarlo después en la configuración de apariencia.';

  @override
  String get chooseYourLookPageDarkSetting => 'Oscuro';

  @override
  String get chooseYourLookPageLightSetting => 'Claro';

  @override
  String get installationCompleteTitle => 'Finalizó la instalación';

  @override
  String readyToUse(Object system) {
    return '**$system** está instalado y listo para usarse';
  }

  @override
  String restartInto(Object system) {
    return 'Reiniciar en $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Puede continuar probando $RELEASE ahora, pero hasta que reinicie el equipo, los cambios que realice o los documentos que guarde no se conservarán.';
  }

  @override
  String get shutdown => 'Apagar';

  @override
  String get restartNow => 'Reiniciar ahora';

  @override
  String get continueTesting => 'Continuar probando';

  @override
  String get turnOffBitlockerTitle => 'Desactivar BitLocker';

  @override
  String get turnOffBitlockerDescription => 'El equipo utiliza el cifrado BitLocker de Windows.\nDebe desactivar BitLocker en Windows antes de instalar Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para seguir las instrucciones, abra esta página en un teléfono u otro dispositivo: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar en Windows';

  @override
  String get whereAreYouPageTitle => '¿Dónde se encuentra?';

  @override
  String get whereAreYouLocationLabel => 'Ubicación';

  @override
  String get whereAreYouTimezoneLabel => 'Huso horario';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Le damos la bienvenida a $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Rápido y repleto de funcionalidades nuevas, la versión más reciente de $RELEASE hace que la informática sea más fácil que nunca. Echemos un vistazo…';
  }

  @override
  String get softwareSlideTitle => 'Encuentre aun más aplicaciones';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Olvídese de buscar programas nuevos en la web. Acceda a la tienda de snaps y al archivo de programas de $RELEASE para instalar aplicaciones nuevas con facilidad. Tan solo escriba un término de búsqueda, o bien, explore las categorías (gráficos y fotografía, juegos, productividad…) y obtenga reseñas valiosas de otros usuarios.';
  }

  @override
  String get musicSlideTitle => 'Lleve su música consigo';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE incluye el fantástico reproductor de música Rhythmbox. Con sus avanzadas opciones de reproducción, es sencillo programar las canciones perfectas. Además, se integra a la perfección con discos CD y reproductores portátiles, por lo que podrá disfrutar de toda su música dondequiera que vaya.';
  }

  @override
  String get musicSlideRhythmbox => 'Reproductor de música Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Diviértase con sus fotos';

  @override
  String get photoSlideDescription => 'Shotwell es un práctico gestor de imágenes que está preparado para sus dispositivos. Conecte una cámara o un teléfono para transferir sus fotos; es fácil compartirlas y mantenerlas seguras. Y, para sacar provecho de su creatividad, hallará otras aplicaciones de retoque fotográfico en Software de Ubuntu.';

  @override
  String get photoSlideShotwell => 'Gestor fotográfico Shotwell';

  @override
  String get photoSlideGimp => 'Editor de imágenes GIMP';

  @override
  String get photoSlideShotcut => 'Editor de vídeos Shotcut';

  @override
  String get webSlideTitle => 'Saque el máximo partido de la web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE incluye Firefox, el navegador web que utilizan millones de personas alrededor del mundo. Y las aplicaciones web que usa frecuentemente (como Facebook o Gmail, por ejemplo) pueden anclarse en el escritorio para un acceso rápido, igual que aplicaciones en su equipo.';
  }

  @override
  String get webSlideFirefox => 'Navegador web Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Todo lo que necesita para la oficina';

  @override
  String get officeSlideDescription => 'LibreOffice es un paquete ofimático que incluye todo lo necesario para crear documentos, hojas de cálculo y presentaciones. Además de ser compatible con los formatos de archivo de Microsoft Office, le ofrece todas las prestaciones que necesita, y sin tener que pagar nada.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Acceso para todos';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'En el corazón de la filosofía de $RELEASE reside la creencia de que la informática es para todas las personas. Las herramientas avanzadas de accesibilidad y las opciones de idioma, colores y tamaño del texto hacen que la computación con $RELEASE sea sencilla, sea quien sea y esté donde esté.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Opciones de personalización';

  @override
  String get accessSlideAppearance => 'Apariencia';

  @override
  String get accessSlideAssistiveTechnologies => 'Tecnologías de asistencia';

  @override
  String get accessSlideLanguageSupport => 'Soporte de idiomas';

  @override
  String get supportSlideTitle => 'Ayuda y asistencia';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'La documentación oficial abarca muchas de las áreas comunes acerca de $RELEASE. Está disponible <a href=\"https://help.ubuntu.com\">en la web</a> y a través del icono de ayuda en el iniciador.';
  }

  @override
  String get supportSlideQuestions => 'En <a href=\"https://askubuntu.com\">Ask Ubuntu</a> puede formular preguntas y explorar una inmensa colección de dudas ya respondidas. Es posible que su <a href=\"https://loco.ubuntu.com/teams\">equipo comunitario regional</a> ofrezca asistencia en su idioma.';

  @override
  String get supportSlideResources => 'Para explorar más recursos, visite las páginas de <a href=\"https://www.ubuntu.com/support/community-support\">asistencia comunitaria</a> y <a href=\"https://www.ubuntu.com/support\">comercial</a>.';

  @override
  String get includedSoftware => 'Programas incluidos';

  @override
  String get availableSoftware => 'Programas disponibles';

  @override
  String get supportedSoftware => 'Programas compatibles';

  @override
  String get copyingFiles => 'Copiando archivos…';

  @override
  String get installingSystem => 'Instalando el sistema…';

  @override
  String get configuringSystem => 'Configurando el sistema…';

  @override
  String get installationFailed => 'Falló la instalación';

  @override
  String get notEnoughDiskSpaceTitle => 'Disculpe';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Por lo menos necesita $SIZE de espacio en disco para instalar $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'El equipo solo tiene $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'El disco más grande del equipo es de solo $SIZE.';
  }

  @override
  String get activeDirectoryOption => 'Utilizar el directorio activo';

  @override
  String get activeDirectoryInfo => 'En el siguiente paso introducirá el dominio y otros datos.';

  @override
  String get activeDirectoryTitle => 'Configurar el directorio activo';

  @override
  String get activeDirectoryTestConnection => 'Probar la conexión del dominio';

  @override
  String get activeDirectoryDomainLabel => 'Dominio';

  @override
  String get activeDirectoryDomainEmpty => 'Obligatorio';

  @override
  String get activeDirectoryDomainTooLong => 'Demasiado largo';

  @override
  String get activeDirectoryDomainInvalidChars => 'Caracteres incorrectos';

  @override
  String get activeDirectoryDomainStartDot => 'Empieza por punto (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Termina en punto (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Empieza por guión (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Termina en guión (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contiene múltiples puntos (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Dominio no encontrado';

  @override
  String get activeDirectoryAdminLabel => 'Usuario uniendose al dominio';

  @override
  String get activeDirectoryAdminEmpty => 'Obligatorio';

  @override
  String get activeDirectoryAdminInvalidChars => 'Caracteres incorrectos';

  @override
  String get activeDirectoryPasswordLabel => 'Contraseña';

  @override
  String get activeDirectoryPasswordEmpty => 'Obligatorio';

  @override
  String get activeDirectoryErrorTitle => 'Error al configurar la conexión con Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Lo sentimos, Active Directory no se puede configurar en este momento. Una vez que el sistema esté en funcionamiento, visite <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> para obtener ayuda.';
}
