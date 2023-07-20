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
  String get changeButtonText => 'Modificar';

  @override
  String get quitButtonText => 'Quitar l’installacion';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'La benvenguda a $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'Preparacion de $DISTRO…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Ensajar o installar $DISTRO';
  }

  @override
  String get welcomeRepairOption => 'Reparar l’installacion';

  @override
  String get welcomeRepairDescription => 'La reparacion tornarà installar totes los logicials installats en servant los documents e los paramètres.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'Ensajar $RELEASE';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'Podètz ensajar $RELEASE sens aplicar cap de modificacion a vòstre ordenador.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'Installar $RELEASE';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Installar $RELEASE a costat (o a la plaça) de vòstre sistèma operatiu actual. Aquò deuriá pas trigar.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Podètz tanben legir las <a href=\"$url\">nòtas de version</a>.';
  }

  @override
  String get rstTitle => 'RST es activat';

  @override
  String get rstHeader => 'Desactivatz lo RST per contunhar';

  @override
  String get rstDescription => 'Aqueste ordenador utiliza la tecnologia RST (Rapid Storage Technology) d’Intel. Cal desactivar RST jos Windows abans d’installar Ubuntu.';

  @override
  String rstInstructions(Object url) {
    return 'Per las consignas, numerizatz aqueste còdi QR sus un autre aparelh o consultatz : <a href=\"https://$url\">$url</a>';
  }

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
  String get showSecurityKey => 'Mostrar la clau de seguretat';

  @override
  String get updatesOtherSoftwarePageTitle => 'Aplicacions e mesas a jorn';

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
  String get installDriversTitle => 'Installar de logicials tèrces pel material grafic e Wi-Fi';

  @override
  String get installDriversSubtitle => 'Aquestes pilòts son someses a de licéncias que son inclusas dins lor documentacion. Son proprietaris.';

  @override
  String get installCodecsTitle => 'Telecargar e installar la presa en carga addicionala pels formats multimèdia';

  @override
  String get installCodecsSubtitle => 'Aqueste logicial es somés a de tèrmes de licéncia incluses dins sa documentacion. Certans son proprietaris.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Avertiment :</font> l’ordenador es pas brancat a una font d’alimentacion.';
  }

  @override
  String get offlineWarning => 'Sètz fòra linha';

  @override
  String get chooseSecurityKeyTitle => 'Clau de seguretat';

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
    return '<font color=\"$color\">Avertiment :</font> se perdètz aquesta clau de seguretat, totas las donadas seràn perdudas. Se cal, escrivètz vòstra clau e gardatz-la dins un endrech dins un lòc segur.';
  }

  @override
  String get installationTypeTitle => 'Tipe d’installacion';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Aqueste ordenador possedís actualament $os. De qué volètz far ?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Aqueste ordenador a $os1 e $os2 d’installats. De qué volètz far ?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Aqueste ordenador es installat amb mantun sistèma operatiu. De qué volètz far ?';

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
  String get installationTypeLVMEncryptionSelected => 'LVM e chiframent seleccionats';

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
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Installar $product a costat de $os1 e $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Installar $product a lor costat';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Installar $product a costat de las autras particions';
  }

  @override
  String get installationTypeAlongsideInfo => 'Los documents, la musica e los autres fichièrs personals seràn gardats. Podètz causir quin sistèma operatiu volètz cada que l’ordenador s’aluca.';

  @override
  String get installationTypeManual => 'Particionament manual';

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
  String get installAlongsideSpaceDivider => 'Alogatz l’espaci disc en desplaçant lo separador çai-jos :';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num particions mai pichonas son rescondudas, utilizatz <a href=\"$url\">l’aisinas de particionament avançat</a> per mai de contròla';
  }

  @override
  String get installAlongsideResizePartition => 'Redimensionar la particion';

  @override
  String get installAlongsideAllocateSpace => 'Alogar l’espaci';

  @override
  String get installAlongsideFiles => 'Fichièrs';

  @override
  String get installAlongsidePartition => 'Particion :';

  @override
  String get installAlongsideSize => 'Talha :';

  @override
  String get installAlongsideAvailable => 'Disponible :';

  @override
  String get allocateDiskSpace => 'Particionament manual';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Los ponches de montatge devon començar per « / »';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Los ponches de montatge pòdon pas conténer cap d’espaci';

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
  String get freeDiskSpace => 'Espaci liure';

  @override
  String get newPartitionTable => 'Taula de particion novèla';

  @override
  String get newPartitionTableConfirmationTitle => 'Particion novèla voida';

  @override
  String get newPartitionTableConfirmationMessage => 'La creacion d’una taula de particions novèla sus un periferic entièr suprimirà totas sas particions actualas. Poiretz anullar aquesta operacion mai tard s\'o volètz.';

  @override
  String get tooManyPrimaryPartitions => 'Tròp de particions primàrias';

  @override
  String get partitionLimitReached => 'Limit atenh';

  @override
  String get bootLoaderDevice => 'Periferic per l’installacion del gestionari d’aviada';

  @override
  String get partitionCreateTitle => 'Crear una particion';

  @override
  String get partitionEditTitle => 'Modificar una particion';

  @override
  String get partitionSizeLabel => 'Talha :';

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
  String get partitionFormatNone => 'utilizar pas la particion';

  @override
  String partitionFormatKeep(Object format) {
    return 'Gardar lo formatatge en $format';
  }

  @override
  String get partitionErase => 'Formatar la particion';

  @override
  String get partitionMountPointLabel => 'Punt de montatge :';

  @override
  String get confirmPageTitle => 'Lèst per installacion';

  @override
  String get confirmHeader => 'Se contunhatz, las modificacions çai-jos seràn escritas suls disques. Poiretz realizar de cambiaments mai tard a la man.';

  @override
  String get confirmDevicesTitle => 'Periferics';

  @override
  String get confirmPartitionsTitle => 'Particions';

  @override
  String get confirmPartitionTables => 'Las taulas de particions dels periferics seguents seràn modificadas :';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'Las modificacions seguenta seràn aplicadas a las particions :';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'la particion <b>$sysname</b> redimensionada de <b>$oldsize</b> a <b>$newsize</b>';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'la particion <b>$sysname</b> formatada en <b>$format</b> utilizada per <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'la particion <b>$sysname</b> formatada en <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'la particion <b>$sysname</b> utilizada per <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'particion <b>$sysname</b> creada';
  }

  @override
  String get confirmInstallButton => 'Installar';

  @override
  String get installationCompleteTitle => 'Installacion acabada';

  @override
  String readyToUse(Object system) {
    return '**$system** es installat e prèst a utilizar';
  }

  @override
  String restartInto(Object system) {
    return 'Reaviar jos $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Podètz téner d’ensajar $RELEASE ara, mas fins que reavietz l’ordenador, tota modificacion o document que creatz serà pas servat.';
  }

  @override
  String get shutdown => 'Atudar';

  @override
  String get restartNow => 'Reaviar ara';

  @override
  String get continueTesting => 'Contunhar d’ensajar';

  @override
  String get bitlockerTitle => 'BitLocker es activat';

  @override
  String get bitlockerHeader => 'Desactivatz BitLocker per contunhar';

  @override
  String bitlockerDescription(Object option) {
    return 'Aqueste ordenador utiliza lo chiframent de Windows BitLocker.\nVos cal utilizar Windows per crear un espaci liure o causir « $option » per contunhar.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Per las consignas, numerizatz aqueste còdi QR d’un autre aparelh estant o consultatz : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reaviar jos Windows';

  @override
  String get restartIntoWindowsTitle => 'Reaviar jos Windows ?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Volètz vertadièrament reaviar l’ordenador ? Deuretz relançar lo processús d’installacion de $DISTRO mai tard per terminar l’installacion de $DISTRO.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'La benvenguda a $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Disponible :';

  @override
  String get installationSlidesIncluded => 'Inclús :';

  @override
  String get installationSlidesWelcomeTitle => 'Rapid, gratuit e plen de foncionalitats novèlas';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'La darrièra version de $DISTRO fa venir l’informatica mai simpla que jamai.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Que siatz un desvolopaire, creator, jogaire o administrator, traparetz d’aisinas novèlas per melhorar vòstra productivitat e experiéncia sus $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Totas las aplicacions que vos fan mestièr';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Installatz, gerissètz e metatz a jorn vòstras aplicacions dins Ubuntu Software, incluses milierats d’aplicacions venent de Snap Store e dels archius $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Desvolopatz amb çò melhor del monde liure';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO es un pòst de trabalh ideal pel desvolopament de logicials o web, las sciéncias de las donadas, l’intelligéncia artificiala e l’aprentissatge automatic, mas tanben pel devops e l’administracion. Totas las versions de $DISTRO incluson las darrièras cadenas d’aisinas e prenon en carga totes los principals environaments de desvolopament integrats.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Melhoratz vòstra creativitat';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Se sètz animator, designer, cineasta o desvolopaire de jòcs, es facil de passar vòstre pòst de trabalh cap a $DISTRO gràcia a la compatibilitat de logicials e aplicacions liuras e dels estandards de l’industria.';
  }

  @override
  String get installationSlidesGamingTitle => 'Extra pels jòcs';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO pren en carga los darrièra pilòts NVIDIA e Mesa per melhorar las performanças e la compatibilitat. Milierats de jòcs per Windows foncionan coma cal sus $DISTRO via d’aplicacions coma Steam amb cap de configuracion suplementària.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privat e securizat';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provesís totas las aisinas que vos fa mestièr per demorar privat e segur en linha. Amb un parafuòc e la presa en carga VPN integrats e una seria d’aplicacions pensadas per la confidencialitat avètz tot lo contraròtle de vòstras donadas.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Totas las versions de $DISTRO LTS son fornidas amb cinc ans de patches de seguretat, fins a detz ans amb un abonament Ubuntu Pro.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Aumentatz vòstra productivitat';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop inclutz LibreOffice, una seguida burotica liura compatibla amb Microsoft Office pels documents, fuèlhs de calcul e las presentacion. D’espleches de collaboracion populars son tanben disponibles.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Accès per totes';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'Al còs de la filosofia de $DISTRO se tròba la conviccion que l’informatica deu èsser accessibla a totes. En prepausant d’aisinas d’accessibilitat avançadas e d’opcions per cambiar de lenga, de tèma de colors, de talha de polissas, $DISTRO vos fa venir l’informatica facila, qual que siatz e ont que siatz.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Lector d’ecran Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Presa en carga lingüistica';

  @override
  String get installationSlidesSupportTitle => 'Ajuda e assisténcia';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'La documentacion oficiala de $DISTRO es disponibla tant en linha coma via l’icòna Ajuda al dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu cobrís una larga plaja de questions e responsas e lo Discourse d’Ubuntu provesís de guidas e de discussions pels nòuvenguts e los utilizaires experimentats.';

  @override
  String get installationSlidesSupportEnterprise => 'Per las entrepresas Canonical fornís una assisténcia comerciala per facilitar l’integracion e la gestion d’Ubuntu en tota seguretat al lòc de trabalh.';

  @override
  String get installationSlidesSupportResources => 'Ressorsas utilas :';

  @override
  String get installationSlidesSupportDocumentation => 'Documentacion oficiala';

  @override
  String get installationSlidesSupportUbuntuPro => 'Assisténcia professionala disponibla 24h de 24h e 7 jorns de 7 amb Ubuntu Pro';

  @override
  String get copyingFiles => 'Còpia dels fichièrs…';

  @override
  String get installingSystem => 'Installacion del sistèma…';

  @override
  String get configuringSystem => 'Configuracion del sistèma…';

  @override
  String get installationFailed => 'Fracàs de l’installacion';

  @override
  String get notEnoughDiskSpaceTitle => 'Pas pro d’espaci';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Pas pro d’espaci per installar $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Disponible :';

  @override
  String get notEnoughDiskSpaceRequired => 'Requesit :';
}
