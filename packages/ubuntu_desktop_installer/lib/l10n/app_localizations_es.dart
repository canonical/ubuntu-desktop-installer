


import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Instalador de Ubuntu para escritorio';

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
  String get welcome => 'Le damos la bienvenida';

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
    return 'Puede probar $RELEASE sin efectuar ningún cambio en el equipo.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar $RELEASE junto con (o en lugar de) su sistema operativo actual. No demorará mucho.';
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
  String get pressOneKey => 'Presione alguna de las teclas siguientes:';

  @override
  String get isKeyPresent => '¿Su teclado incluye esta tecla?';

  @override
  String get configureSecureBootTitle => 'Configurar arranque seguro';

  @override
  String get configureSecureBootDescription => 'Ha optado por instalar controladores de terceros. Para ello, hace falta desactivar el arranque seguro.\nDebe elegir una clave de seguridad ahora, la cual introducirá cuando se reinicie el sistema.';

  @override
  String get configureSecureBootOption => 'Configurar arranque seguro';

  @override
  String get chooseSecurityKey => 'Elija una clave de seguridad';

  @override
  String get confirmSecurityKey => 'Confirme la clave de seguridad';

  @override
  String get dontInstallDriverSoftwareNow => 'No instalar controladores por ahora';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Puede instalarlos más adelante, en Software y actualizaciones.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Se requiere una clave de seguridad';

  @override
  String get secureBootSecurityKeysDontMatch => 'Las claves de seguridad no coinciden';

  @override
  String get connectToInternetPageTitle => 'Connect to internet';

  @override
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'Use wired connection';

  @override
  String get noWiredConnection => 'No wired connection detected';

  @override
  String get wiredDisabled => 'Wired connection is turned off';

  @override
  String get wiredMustBeEnabled => 'To use ethernet on this computer, a wired connection must be enabled';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Connect to a Wi-Fi network';

  @override
  String get noInternet => 'I don\'t want to connect to the internet just now';

  @override
  String get wirelessNetworkingDisabled => 'Wireless networking disabled';

  @override
  String get noWifiDevicesDetected => 'No Wi-Fi devices detected';

  @override
  String get wifiMustBeEnabled => 'To use Wi-Fi on this computer, wireless networking must be enabled';

  @override
  String get enableWifi => 'Enable Wi-Fi';

  @override
  String get connectButtonText => 'Connect';

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
  String get installThirdPartyTitle => 'Instalar controladores de terceros para gráficas y dispositivos de wifi, así como compatibilidad con más formatos de contenido multimedia';

  @override
  String get installThirdPartySubtitle => 'Estos programas están disponibles en virtud de los términos incluidos en su documentación. Algunos son privativos.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Elija una clave de seguridad';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'El cifrado del disco protege sus archivos en caso de extravío del equipo. Necesitará introducir una clave de seguridad cada vez que inicie el equipo.\n\nNo se cifrarán los archivos que se encuentren fuera de $RELEASE.';
  }

  @override
  String get chooseSecurityKeyHint => 'Elija una clave de seguridad';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirme la clave de seguridad';

  @override
  String get chooseSecurityKeyRequired => 'Se requiere una clave de seguridad';

  @override
  String get chooseSecurityKeyMismatch => 'Las claves de seguridad no coinciden';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Atención</font>: si pierde la clave de seguridad, perderá todos los datos. De ser necesario, escriba la clave y consérvela en un lugar seguro.';
  }

  @override
  String get installationTypeTitle => 'Tipo de instalación';

  @override
  String installationTypeOSDetected(Object os) {
    return 'El equipo actualmente tiene instalado $os. ¿Qué quiere hacer?';
  }

  @override
  String get installationTypeNoOSDetected => 'En el equipo no se ha detectado actualmente ningún sistema operativo. ¿Qué quiere hacer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Borrar disco e instalar $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Atención</font>: se eliminarán todos los programas, documentos, fotos, música y todos los demás archivos, en todos los sistemas operativos.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Características avanzadas…';

  @override
  String get installationTypeAdvancedTitle => 'Características avanzadas';

  @override
  String get installationTypeNone => 'Ninguna';

  @override
  String get installationTypeNoneSelected => 'No se seleccionó ninguna';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Utilizar LVM en la instalación nueva de $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'Se seleccionó LVM';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Cifrar la instalación nueva de $RELEASE por seguridad';
  }

  @override
  String get installationTypeEncryptInfo => 'En el próximo paso debe elegir una clave de seguridad.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: borrar disco y utilizar ZFS';

  @override
  String get installationTypeZFSSelected => 'Se seleccionó ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Borrar $os y reinstalar';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Atención</font>: se eliminarán los programas, documentos, fotos, música y todos los demás archivos en $os.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Instalar $product junto a $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Se conservarán los documentos, la música y los demás archivos personales. Podrá elegir el sistema operativo que quiere utilizar cada vez que arranca el equipo.';

  @override
  String get installationTypeManual => 'Algo más';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Puede crear o redimensionar las particiones por su cuenta, o bien, elegir varias particiones para $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Borrar disco e instalar $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Seleccione la unidad:';

  @override
  String get selectGuidedStorageInfoLabel => 'Se utilizará todo el disco:';

  @override
  String get selectGuidedStorageInstallNow => 'Instalar ahora';

  @override
  String get allocateDiskSpace => 'Asignar espacio de disco';

  @override
  String get startInstallingButtonText => 'Comenzar la instalación';

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
  String get freeDiskSpace => 'espacio disponible';

  @override
  String get newPartitionTable => 'Tabla de particiones nueva';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

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
  String get partitionTypeLabel => 'Tipo de partición:';

  @override
  String get partitionTypePrimary => 'Principal';

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
  String get whoAreYouPageRealNameRequired => 'Se requiere un nombre';

  @override
  String get whoAreYouPageComputerNameLabel => 'El nombre del equipo';

  @override
  String get whoAreYouPageComputerNameInfo => 'El nombre que utiliza al comunicarse con otros equipos.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Se requiere un nombre de equipo';

  @override
  String get whoAreYouPageInvalidComputerName => 'El nombre del equipo no es válido';

  @override
  String get whoAreYouPageUsernameLabel => 'Elija un nombre de usuario';

  @override
  String get whoAreYouPageUsernameRequired => 'Se requiere un nombre de usuario';

  @override
  String get whoAreYouPageInvalidUsername => 'El nombre de usuario no es válido';

  @override
  String get whoAreYouPagePasswordLabel => 'Elija una contraseña';

  @override
  String get whoAreYouPagePasswordRequired => 'Se requiere una contraseña';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme su contraseña';

  @override
  String get whoAreYouPagePasswordMismatch => 'Las contraseñas no coinciden';

  @override
  String get writeChangesToDisk => 'Escribir cambios en el disco';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Si continúa, los cambios enumerados más abajo se aplicarán en los discos. Podrá efectuar más cambios manualmente.';

  @override
  String get writeChangesPartitionTablesHeader => 'Las tablas de partición de los siguientes dispositivos se modifican:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Las particiones siguientes se van a formatear:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} as $format used for $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} as $format';
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
  String get chooseYourLookPageLightBodyText => 'Luminoso y brillante';

  @override
  String get chooseYourLookPageDarkBodyText => 'Oscuro';

  @override
  String get installationCompleteTitle => 'Finalizó la instalación';

  @override
  String readyToUse(Object system) {
    return '**$system** está instalado y listo para usarse.';
  }

  @override
  String restartInto(Object system) {
    return 'Reiniciar en $system';
  }

  @override
  String get shutdown => 'Apagar';

  @override
  String get turnOffBitlockerTitle => 'Desactivar BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para seguir las instrucciones, abra esta página en un teléfono u otro dispositivo: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar en Windows';
}
