


import 'app_localizations.dart';

/// The translations for Occitan (`oc`).
class AppLocalizationsOc extends AppLocalizations {
  AppLocalizationsOc([String locale = 'oc']) : super(locale);

  @override
  String get appTitle => 'Programa d’installacion del burèu Ubuntu';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installar $RELEASE';
  }

  @override
  String get cancelButtonText => 'Anullar';

  @override
  String get changeButtonText => 'Modificar';

  @override
  String get okButtonText => 'D’acòrdi';

  @override
  String get noButtonText => 'Non';

  @override
  String get restartButtonText => 'Reaviar';

  @override
  String get revertButtonText => 'Restablir';

  @override
  String get yesButtonText => 'Òc';

  @override
  String get welcome => 'La benvenguda';

  @override
  String get tryOrInstallPageTitle => 'Ensajar o installar';

  @override
  String get repairInstallation => 'Reparar l’installacion';

  @override
  String get repairInstallationDescription => 'La reparacion tornarà installar totes los logicials installats en servant los documents e los paramètres.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Ensajar $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Podètz ensajar $RELEASE sens aplicar cap de modificacion a vòstre ordenador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installar $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installar $RELEASE a costat (o a la plaça) de vòstre sistèma operatiu actual. Aquò deuriá pas trigar.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Podètz tanben legir las <a href=\"$url\">nòtas de version</a>.';
  }

  @override
  String get turnOffRST => 'Desactivar RST';

  @override
  String get turnOffRSTDescription => 'Aqueste ordenador utiliza la tecnologia RST (Rapid Storage Technology) d’Intel. Cal desactivar RST jos Windows abans d’installar Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Per las consignas detalhadas, mercés de dobrir aqueste ligam sus un mobil o un autre aparelh : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Agençament del clavièr';

  @override
  String get chooseYourKeyboardLayout => 'Indicatz l’agençament del clavièr :';

  @override
  String get typeToTest => 'Picatz de tèxt aquí per ensajar lo clavièr';

  @override
  String get detectLayout => 'Detectar l’agençament del clavièr';

  @override
  String get pressOneKey => 'Mercés de quichar una de las tòcas seguentas :';

  @override
  String get isKeyPresent => 'La tòca seguenta es presenta sul clavièr ?';

  @override
  String get configureSecureBootTitle => 'Configurar l’amorçatge segur';

  @override
  String get configureSecureBootDescription => 'Avètz causit d’installar de pilòts tèrces. Aquò requerís la desactivacion de l’amorçatge segur.\nPer aquò far, devètz causir una clau de seguretat ara, e la picar quand lo sistèma avia.';

  @override
  String get configureSecureBootOption => 'Configurar l’amorçatge segur';

  @override
  String get chooseSecurityKey => 'Causir una clau de seguretat';

  @override
  String get confirmSecurityKey => 'Confirmat la clau de seguretat';

  @override
  String get dontInstallDriverSoftwareNow => 'Installar pas lo logicial pilòt pel moment';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Lo podètz installar mai tard de Logicials e Mesas a jorn estant.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'La clau de seguretat es requerida';

  @override
  String get secureBootSecurityKeysDontMatch => 'Las claus de seguretat correspondon pas';

  @override
  String get connectToInternetPageTitle => 'Se connectar a internet';

  @override
  String get connectToInternetDescription => 'Connectar aqueste ordenador a internet permetrà a Ubuntu d’installar de logicials suplementaris e de definir vòstre fus orari.\n\nConnectatz un cable Ethernet, o causissètz un ret Wifi';

  @override
  String get useWiredConnection => 'Utilizar una connexion filara';

  @override
  String get noWiredConnection => 'Cap de connexion filara pas detectada';

  @override
  String get wiredDisabled => 'La connexion filara es desactivada';

  @override
  String get wiredMustBeEnabled => 'Per utilizar l’Ethernet sus aqueste ordenador, una connexion filara deu èsser activada';

  @override
  String get enableWired => 'Activar la connexion filara';

  @override
  String get selectWifiNetwork => 'Se connectar a un ret Wifi';

  @override
  String get noInternet => 'Vòli pas me connectar a internet pel moment';

  @override
  String get wirelessNetworkingDisabled => 'Lo ret sens fial es desactivat';

  @override
  String get noWifiDevicesDetected => 'Cap de periferic Wifi pas detectat';

  @override
  String get wifiMustBeEnabled => 'Per utilizar lo Wifi sus aqueste ordenador, lo ret sens fial deu èsser activat';

  @override
  String get enableWifi => 'Activar lo Wifi';

  @override
  String get connectButtonText => 'Se connectar';

  @override
  String get updatesOtherSoftwarePageTitle => 'Mesas a jorn e logicials suplementaris';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quinas aplicacions volètz installar per començar ?';

  @override
  String get normalInstallationTitle => 'Installacion normala';

  @override
  String get normalInstallationSubtitle => 'Navegador internet, utilitaris, logicials de burèu, jòcs e lector multimèdia.';

  @override
  String get minimalInstallationTitle => 'Installacion minimala';

  @override
  String get minimalInstallationSubtitle => 'Navegador internet e utilitari de basa.';

  @override
  String get otherOptions => 'Autras opcions';

  @override
  String get installThirdPartyTitle => 'Installar de logicials tèrces pel material grafic e Wi-Fi e dels formats de mèdia suplementaris';

  @override
  String get installThirdPartySubtitle => 'Aqueste logicial es somés a de tèrmes de licéncia incluses dins sa documentacion. Certans son proprietaris.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Causida de clau de seguretat';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Lo chiframent del disc permet de protegir vòstres fichièrs se per cas perdètz vòstre ordenador. Requerís de picar una clau de seguretat cada còp que l’ordenador s’amòda.\n\nTotes los fichièrs en defòra de $RELEASE seràn pas chifrats.';
  }

  @override
  String get chooseSecurityKeyHint => 'Causissètz una clau de seguretat';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirmatz la clau de seguretat';

  @override
  String get chooseSecurityKeyRequired => 'Una clau de seguretat es requerida';

  @override
  String get chooseSecurityKeyMismatch => 'Las doas claus correspondon pas';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Atencion </font>: se perdètz aquesta clau de seguretat, totas las donadas seràn perdudas. Se cal, escrivètz vòstra clau e gardatz-la dins un endrech dins un lòc segur.';
  }

  @override
  String get installationTypeTitle => 'Tipe d’installacion';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Aqueste ordenador possedís actualament $os. De qué volètz far ?';
  }

  @override
  String get installationTypeNoOSDetected => 'Aqueste ordenador possedís pas cap de sistèma operatiu detectat actualament. De qué volètz far ?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Escafar lo disc e installar $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Avertiment :</font> aquò suprimirà totes vòstres programas, documents, fòtos e autres fichièrs de totes lo sistèmas operatius.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Foncionalitats avançadas...';

  @override
  String get installationTypeAdvancedTitle => 'Foncionalitats avançadas';

  @override
  String get installationTypeNone => 'Cap';

  @override
  String get installationTypeNoneSelected => 'Cap pas seleccionat';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Utilizar LVM amb l’installation de $RELEASE novèla';
  }

  @override
  String get installationTypeLVMSelected => 'LVM seleccionat';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Chifrar l’installacion de $RELEASE novèla per la seguretat';
  }

  @override
  String get installationTypeEncryptInfo => 'Causiretz una clau de seguretat a l’etapa seguenta.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL : escafar lo disc e utilizar ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS seleccionat';

  @override
  String installationTypeReinstall(Object os) {
    return 'Escafar $os e reinstallar';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Avertiment :</font> aquò suprimirà totes vòstres programas $os, documents, fòtos e autres fichièrs.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Installar $product al costat de $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Los documents, la musica e los autres fichièrs personals seràn gardats. Podètz causir quin sistèma operatiu volètz cada que l’ordenador s’aluca.';

  @override
  String get installationTypeManual => 'Quicòm mai';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Podètz crear o retalhar las particions vos meteis, o causir mantuna particion per $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Escafar lo disc e installar $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Seleccionatz lo disc :';

  @override
  String get selectGuidedStorageInfoLabel => 'Lo disc entièr serà utilizat :';

  @override
  String get selectGuidedStorageInstallNow => 'Installar ara';

  @override
  String get allocateDiskSpace => 'Atribuir l’espaci disc';

  @override
  String get startInstallingButtonText => 'Començar l’installacion';

  @override
  String get diskHeadersDevice => 'Disc';

  @override
  String get diskHeadersType => 'Tipe';

  @override
  String get diskHeadersMountPoint => 'Punt de montatge';

  @override
  String get diskHeadersSize => 'Talha';

  @override
  String get diskHeadersUsed => 'Utilizat';

  @override
  String get diskHeadersSystem => 'Sistèma';

  @override
  String get diskHeadersFormat => 'Formatar';

  @override
  String get freeDiskSpace => 'espaci liure';

  @override
  String get newPartitionTable => 'Taula de particion novèla';

  @override
  String get newPartitionTableConfirmationTitle => 'Crear una taula novèla de particions sus aqueste periferic ?';

  @override
  String get newPartitionTableConfirmationMessage => 'Avètz seleccionat un periferic complet de particionar. Se volètz contunhar en creant una taula de particions novèla, totas las particions actualament sus aqueste periferics seràn suprimidas.\n\nPoiretz anullar aquesta operacion mai tard s\'o volètz.';

  @override
  String get bootLoaderDevice => 'Periferic per l’installacion del gestionari d’aviada';

  @override
  String get partitionCreateTitle => 'Crear una particion';

  @override
  String get partitionEditTitle => 'Modificar una particion';

  @override
  String get partitionSizeLabel => 'Talha :';

  @override
  String get partitionUnitB => 'o';

  @override
  String get partitionUnitKB => 'Ko';

  @override
  String get partitionUnitMB => 'Mo';

  @override
  String get partitionUnitGB => 'Go';

  @override
  String get partitionTypeLabel => 'Tipe per la particion novèla :';

  @override
  String get partitionTypePrimary => 'Primària';

  @override
  String get partitionTypeLogical => 'Logicala';

  @override
  String get partitionLocationLabel => 'Emplaçament de la particion novèla :';

  @override
  String get partitionLocationBeginning => 'Debuta d’aqueste espaci';

  @override
  String get partitionLocationEnd => 'Fin d’aqueste espaci';

  @override
  String get partitionFormatLabel => 'Utilizada coma :';

  @override
  String get partitionFormatExt4 => 'sistèma de fichièr de jornalizacion Ext4';

  @override
  String get partitionFormatExt3 => 'sistèma de fichièr de jornalizacion Ext3';

  @override
  String get partitionFormatExt2 => 'sistèma de fichièr de jornalizacion Ext2';

  @override
  String get partitionFormatBtrfs => 'sistèma de fichièr de jornalizacion BTRFS';

  @override
  String get partitionFormatJfs => 'sistèma de fichièr de jornalizacion JFS';

  @override
  String get partitionFormatXfs => 'sistèma de fichièr de jornalizacion XFS';

  @override
  String get partitionFormatFat => 'sistèma de fichièr FAT';

  @override
  String get partitionFormatFat12 => 'sistèma de fichièr FAT12';

  @override
  String get partitionFormatFat16 => 'sistèma de fichièr FAT16';

  @override
  String get partitionFormatFat32 => 'sistèma de fichièr FAT32';

  @override
  String get partitionFormatSwap => 'zòna d’escambi';

  @override
  String get partitionFormatIso9660 => 'sistèma de fichièr ISO 9660';

  @override
  String get partitionFormatVfat => 'sistèma de fichièr VFAT';

  @override
  String get partitionFormatNtfs => 'sistèma de fichièr NTFS';

  @override
  String get partitionFormatReiserFS => 'sistèma de fichièr ReiserFS';

  @override
  String get partitionFormatZfsroot => 'sistèma de fichièr ZFS';

  @override
  String get partitionErase => 'Formatar la particion';

  @override
  String get partitionMountPointLabel => 'Punt de montatge :';

  @override
  String get whoAreYouPageTitle => 'Qual sètz ?';

  @override
  String get whoAreYouPageAutoLogin => 'Se connectar automaticament';

  @override
  String get whoAreYouPageRequirePassword => 'Demandar mon senhal per dobrir una session';

  @override
  String get whoAreYouPageRealNameLabel => 'Vòstre prenom';

  @override
  String get whoAreYouPageRealNameRequired => 'Cal un prenom';

  @override
  String get whoAreYouPageComputerNameLabel => 'Lo nom de l’ordenador';

  @override
  String get whoAreYouPageComputerNameInfo => 'Lo nom qu’utiliza per comunicar amb d’autres ordenadors.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Un nom d’ordenador es requerit';

  @override
  String get whoAreYouPageInvalidComputerName => 'Lo nom de l’ordenador es invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Causissètz un nom d’utilizaire';

  @override
  String get whoAreYouPageUsernameRequired => 'Un nom d’utilizaire es requerit';

  @override
  String get whoAreYouPageInvalidUsername => 'Lo nom d’utilizaire es requerit';

  @override
  String get whoAreYouPagePasswordLabel => 'Causissètz un senhal';

  @override
  String get whoAreYouPagePasswordRequired => 'Un senhal es requerit';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirmar lo senhal';

  @override
  String get whoAreYouPagePasswordMismatch => 'Los senhals correspondon pas';

  @override
  String get writeChangesToDisk => 'Aplicar las modificacions suls disques';

  @override
  String get writeChangesFallbackSerial => 'disc';

  @override
  String get writeChangesDescription => 'Se contunhatz, las modificacions çai-jos seràn escritas suls disques. Poiretz realizar de cambiaments mai tard a la man.';

  @override
  String get writeChangesPartitionTablesHeader => 'Las taulas de particions dels periferics seguents seràn modificadas :';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Las particions seguentas seràn formatadas :';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'la particion #$disk${partition} en $format utilizada per $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'particion #$disk${partition} en $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Causissètz l’aparéncia';

  @override
  String get chooseYourLookPageHeader => 'La poiretz cambiar mai tard en anant a las preferéncias d’aparéncia.';

  @override
  String get chooseYourLookPageDarkSetting => 'Fosc';

  @override
  String get chooseYourLookPageLightSetting => 'Clar';

  @override
  String get chooseYourLookPageLightBodyText => 'Clar e lusent';

  @override
  String get chooseYourLookPageDarkBodyText => 'Fosc e escur';

  @override
  String get installationCompleteTitle => 'Installacion acabada';

  @override
  String readyToUse(Object system) {
    return '**$system** es installat e prèst a utilizar.';
  }

  @override
  String restartInto(Object system) {
    return 'Reaviar jos $system';
  }

  @override
  String get shutdown => 'Atudar';

  @override
  String get turnOffBitlockerTitle => 'Desactivar BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Aqueste ordenador utiliza lo chiframent de Windows BitLocker.\n Vos cal desactivar BitLocker dins Windows abans d’installacion d’Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Per las consignas, dobrissètz aquesta pagina sus un mobil o un autre aparelh : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reaviar jos Windows';
}
