


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
  String get connectToInternetPageTitle => 'Conectarse a Internet';

  @override
  String get connectToInternetDescription => 'Entablar una conexión a Internet en el equipo permitirá que Ubuntu instale componentes adicionales necesarios y le permitirá seleccionar su huso horario.\n\nConéctese mediante cable Ethernet o elija una red inalámbrica.';

  @override
  String get useWiredConnection => 'Utilizar conexión cableada';

  @override
  String get noWiredConnection => 'No se detectó ninguna conexión cableada';

  @override
  String get wiredDisabled => 'La conexión cableada está desactivada';

  @override
  String get wiredMustBeEnabled => 'Para utilizar Ethernet en el equipo, debe activarse una conexión cableada';

  @override
  String get enableWired => 'Activar conexión cableada';

  @override
  String get selectWifiNetwork => 'Conectar con una red inalámbrica';

  @override
  String get hiddenWifiNetwork => 'Conectar con una red inalámbrica oculta';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nombre de red';

  @override
  String get hiddenWifiNetworkNameRequired => 'Se necesita un nombre de red';

  @override
  String get noInternet => 'No me conectaré a Internet ahora';

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
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

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
  String get whoAreYouPageShowPassword => 'Mostrar contraseña';

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
    return 'Fast and full of new features, the latest version of $RELEASE makes computing easier than ever. Here are just a few cool new things to look out for...';
  }

  @override
  String get softwareSlideTitle => 'Find even more software';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Say goodbye to searching the web for new software. With access to the Snap Store and the $RELEASE software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.';
  }

  @override
  String get musicSlideTitle => 'Lleve su música consigo';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
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
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

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
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
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
  String get officeSlideDescription => 'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Access for everyone';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, $RELEASE makes computing easy - whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Opciones de personalización';

  @override
  String get accessSlideAppearance => 'Apariencia';

  @override
  String get accessSlideAssistiveTechnologies => 'Tecnologías de asistencia';

  @override
  String get accessSlideLanguageSupport => 'Compatibilidad lingüística';

  @override
  String get supportSlideTitle => 'Ayuda y asistencia';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Programas incluidos';

  @override
  String get availableSoftware => 'Programas disponibles';

  @override
  String get supportedSoftware => 'Programas compatibles';
}
