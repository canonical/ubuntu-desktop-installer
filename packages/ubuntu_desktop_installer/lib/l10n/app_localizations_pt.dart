


import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Instalador do Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String get cancelButtonText => 'Cancelar';

  @override
  String get changeButtonText => 'Alterar';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Não';

  @override
  String get restartButtonText => 'Reiniciar';

  @override
  String get revertButtonText => 'Desfazer';

  @override
  String get yesButtonText => 'Sim';

  @override
  String get quitButtonText => 'Quit Installation';

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get welcomeHeader => 'Escolha o seu idioma:';

  @override
  String get tryOrInstallPageTitle => 'Experimentar ou instalar';

  @override
  String get repairInstallation => 'Reparar instalação';

  @override
  String get repairInstallationDescription => 'A reparação reinstalará todos os softwares instalados sem alterar documentos ou configurações.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Experimentar $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Pode experimentar o $RELEASE sem precisar fazer qualquer alteração no seu computador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar o $RELEASE ao lado do (ou em substituição ao) seu sistema operacional atual. Isto não deve demorar muito.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Talvez queira ler as <a href=\"$url\">notas de lançamento</a>.';
  }

  @override
  String get turnOffRST => 'Desligue a RST';

  @override
  String get turnOffRSTDescription => 'Este computador usa Intel RST (Rapid Storage Technology). Precisa desligar a RST no Windows antes de instalar o Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Abra esta página num telemóvel ou outro aparelho para encontrar instruções: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Layout do teclado';

  @override
  String get chooseYourKeyboardLayout => 'Escolha o layout do seu teclado:';

  @override
  String get typeToTest => 'Digite aqui para testar o seu teclado';

  @override
  String get detectLayout => 'Detetar o layout do teclado';

  @override
  String get pressOneKey => 'Por favor pressione uma das seguintes teclas:';

  @override
  String get isKeyPresent => 'A seguinte tecla está presente no seu teclado?';

  @override
  String get configureSecureBootTitle => 'Configurar Secure Boot';

  @override
  String get configureSecureBootDescription => 'Optou por instalar drivers de terceiros. Isso requer desativar o Secure Boot.\nPara isso, precisa escolher uma chave de segurança agora e entrar com ela quando o sistema reiniciar.';

  @override
  String get configureSecureBootOption => 'Configurar Secure Boot';

  @override
  String get chooseSecurityKey => 'Escolha uma chave de segurança';

  @override
  String get confirmSecurityKey => 'Confirme a chave de segurança';

  @override
  String get dontInstallDriverSoftwareNow => 'Não instalar os drivers agora';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Pode instalar depois pelo Programas & Atualizações.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Chave de segurança é obrigatória';

  @override
  String get secureBootSecurityKeysDontMatch => 'Chaves de segurança não correspondem';

  @override
  String get showSecurityKey => 'Show security key';

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
  String get hiddenWifiNetwork => 'Connect to a hidden Wi-Fi network';

  @override
  String get hiddenWifiNetworkNameLabel => 'Network name';

  @override
  String get hiddenWifiNetworkNameRequired => 'A network name is required';

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
  String get updatesOtherSoftwarePageTitle => 'Atualizações e outros softwares';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quais apps gostaria de instalar para começar?';

  @override
  String get normalInstallationTitle => 'Instalação normal';

  @override
  String get normalInstallationSubtitle => 'Web browser, utilidades, pacote office, games and players de mídia.';

  @override
  String get minimalInstallationTitle => 'Instalação mínima';

  @override
  String get minimalInstallationSubtitle => 'Web browser utilidades básicas.';

  @override
  String get otherOptions => 'Outras opções';

  @override
  String get installThirdPartyTitle => 'Instalar software de terceiros para hardware gráfico e de Wi-Fi, bem como formatos de mídia adicionais';

  @override
  String get installThirdPartySubtitle => 'Este software está sujeito aos termos de licença incluídos nas suas documentações. Alguns são proprietários.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Escolha uma chave de segurança';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Encriptação de disco protege os seus ficheiros em caso de perda do seu computador. Isso requer que digite uma chave de segurança a cada vez que o computador ligar.\n\nQuaisquer ficheiros fora de $RELEASE não serão criptografados.';
  }

  @override
  String get chooseSecurityKeyHint => 'Escolha uma chave de segurança';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirme a chave de segurança';

  @override
  String get chooseSecurityKeyRequired => 'Uma chave de segurança é necessária';

  @override
  String get chooseSecurityKeyMismatch => 'As chaves de segurança não conferem';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Atenção</font>: Se perder esta chave de segurança, todos os dados estarão perdidos. Se precisar, escreva sua chave num papel e ponha num local seguro.';
  }

  @override
  String get installationTypeTitle => 'Tipo de installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Este computador possui $os atualmente instalado. O que deseja fazer?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

  @override
  String get installationTypeNoOSDetected => 'Este computador não possui sistemas operacionais detectados atualmente. O que deseja fazer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Apagar o disco e instalar o $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Aviso:</font> Isso vai apagar todos os seus programas, documentos, fotos, músicas e quaisquer outros ficheiros em todos os sistemas operativos existentes.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Recursos Avançados...';

  @override
  String get installationTypeAdvancedTitle => 'Recursos avançados';

  @override
  String get installationTypeNone => 'Nenhum';

  @override
  String get installationTypeNoneSelected => 'Nenhum selecionado';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Usar LVM com a nova instalação do $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Criptografar a nova instalação do $RELEASE para maior segurança';
  }

  @override
  String get installationTypeEncryptInfo => 'Deverá escolher uma chave de segurança no próximo passo.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Apagar o disco e usar ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selecionado';

  @override
  String installationTypeReinstall(Object os) {
    return 'Apagar $os e reinstalar';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Aviso:</font> Isso vai apagar todos os programas do $os, documentos, fotos, músicas e quaisquer outros ficheiros.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Instalar $product junto com $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Install $product alongside $os1 and $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Install $product alongside them';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Install $product alongside other partitions';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documentos, músicas e outros ficheiros pessoais serão mantidos. Poderá selecionar qual sistema operacional usar cada vez que o computador iniciar.';

  @override
  String get installationTypeManual => 'Opção avançada';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Pode criar ou redimensionar partições manualmente ou escolher múltiplas partições para o $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Apagar o disco e instalar o $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Selecione o disco:';

  @override
  String get selectGuidedStorageInfoLabel => 'O disco inteiro será utilizado:';

  @override
  String get selectGuidedStorageInstallNow => 'Instalar agora';

  @override
  String get installAlongsideSpaceDivider => 'Allocate drive space by dragging the divider below:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'Files';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Size:';

  @override
  String get installAlongsideAvailable => 'Available:';

  @override
  String get allocateDiskSpace => 'Alocar espaço em disco';

  @override
  String get startInstallingButtonText => 'Iniciar instalação';

  @override
  String get diskHeadersDevice => 'Aparelho';

  @override
  String get diskHeadersType => 'Tipo';

  @override
  String get diskHeadersMountPoint => 'Ponto de montagem';

  @override
  String get diskHeadersSize => 'Tamanho';

  @override
  String get diskHeadersUsed => 'Utilizado';

  @override
  String get diskHeadersSystem => 'Sistema';

  @override
  String get diskHeadersFormat => 'Formato';

  @override
  String get freeDiskSpace => 'espaço livre';

  @override
  String get newPartitionTable => 'Nova tabela de partições';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Aparelho para instalação do boot loader';

  @override
  String get partitionCreateTitle => 'Criar partição';

  @override
  String get partitionEditTitle => 'Editar partição';

  @override
  String get partitionSizeLabel => 'Tamanho:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Tipo para a nova partiçaõ:';

  @override
  String get partitionTypePrimary => 'Primária';

  @override
  String get partitionTypeLogical => 'Lógica';

  @override
  String get partitionLocationLabel => 'Localização para a nova partição:';

  @override
  String get partitionLocationBeginning => 'Início deste espaço';

  @override
  String get partitionLocationEnd => 'Final deste espaço';

  @override
  String get partitionFormatLabel => 'Utilizado como:';

  @override
  String get partitionFormatExt4 => 'Sistema de ficheiros Ext4 com journaling';

  @override
  String get partitionFormatExt3 => 'Sistema de ficheiros Ext3 com journaling';

  @override
  String get partitionFormatExt2 => 'Sistema de ficheiros Ext2';

  @override
  String get partitionFormatBtrfs => 'Sistema de ficheiros btrfs com journaling';

  @override
  String get partitionFormatJfs => 'Sistema de ficheiros JFS com journaling';

  @override
  String get partitionFormatXfs => 'Sistema de ficheiros XFS com journaling';

  @override
  String get partitionFormatFat => 'Sistema de ficheiros FAT';

  @override
  String get partitionFormatFat12 => 'Sistema de ficheiros FA12';

  @override
  String get partitionFormatFat16 => 'Sistema de ficheiros FA16';

  @override
  String get partitionFormatFat32 => 'Sistema de ficheiros FAT32';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'Sistema de ficheiros ISO 9660';

  @override
  String get partitionFormatVfat => 'Sistema de ficheiros VFAT';

  @override
  String get partitionFormatNtfs => 'Sistema de ficheiros NTFS';

  @override
  String get partitionFormatReiserFS => 'Sistema de ficheiros ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Sistema de ficheiros raiz ZFS';

  @override
  String get partitionErase => 'Formatar a partição';

  @override
  String get partitionMountPointLabel => 'Ponto de montagem:';

  @override
  String get whoAreYouPageTitle => 'Quem é?';

  @override
  String get whoAreYouPageAutoLogin => 'Iniciar sessão automaticamente';

  @override
  String get whoAreYouPageRequirePassword => 'Solicitar minha palavra-passe para entrar';

  @override
  String get whoAreYouPageRealNameLabel => 'O seu nome';

  @override
  String get whoAreYouPageRealNameRequired => 'O nome é obrigatório';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nome do seu computador';

  @override
  String get whoAreYouPageComputerNameInfo => 'O nome usado para falar com outros computadores.';

  @override
  String get whoAreYouPageComputerNameRequired => 'O nome do computador é obrigatório';

  @override
  String get whoAreYouPageInvalidComputerName => 'O nome do computador não é válido';

  @override
  String get whoAreYouPageUsernameLabel => 'Escolha um nome de utilizador';

  @override
  String get whoAreYouPageUsernameRequired => 'Nome de utilizador é obrigatório';

  @override
  String get whoAreYouPageInvalidUsername => 'O nome de utilizador informado é inválido';

  @override
  String get whoAreYouPageUsernameInUse => 'That user name already exists.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get whoAreYouPageUsernameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get whoAreYouPagePasswordLabel => 'Escolha uma palavra-passe';

  @override
  String get whoAreYouPagePasswordRequired => 'A palavra-passe é obrigatória';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme a sua palavra-passe';

  @override
  String get whoAreYouPagePasswordMismatch => 'As palavras-passe não correspondem';

  @override
  String get whoAreYouPageShowPassword => 'Show password';

  @override
  String get writeChangesToDisk => 'Gravar alterações no disco';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Se prosseguir, as mudanças listadas abaixo serão escritas nos discos. Será capaz de realizar alterações posteriores manualmente.';

  @override
  String get writeChangesPartitionTablesHeader => 'As tabelas de partições dos seguintes aparelhos foram alteradas:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'As seguintes partições serão formatadas:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition #$disk${partition} resized from $oldsize to $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} formatted as $format used for $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} formatted as $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition #$disk${partition} used for $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition #$disk${partition} created';
  }

  @override
  String get chooseYourLookPageTitle => 'Escolha o seu visual';

  @override
  String get chooseYourLookPageHeader => 'Pode sempre alterar isso depois nas configurações de aparência.';

  @override
  String get chooseYourLookPageDarkSetting => 'Escuro';

  @override
  String get chooseYourLookPageLightSetting => 'Claro';

  @override
  String get installationCompleteTitle => 'Instalação concluída';

  @override
  String readyToUse(Object system) {
    return '**$system** está instalado e pronto pra uso.';
  }

  @override
  String restartInto(Object system) {
    return 'Reiniciar no $system';
  }

  @override
  String get shutdown => 'Desligar';

  @override
  String get turnOffBitlockerTitle => 'Desligar BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Este computador usa criptografia do Windows BitLocker.\nPrecisa desativar o BitLocker no Windows antes de instalar o Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para obter instruções, abra esta página num telefone ou outro aparelho: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar no Windows';

  @override
  String get whereAreYouPageTitle => 'Where are you?';

  @override
  String get whereAreYouLocationLabel => 'Location';

  @override
  String get whereAreYouTimezoneLabel => 'Timezone';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
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
  String get musicSlideTitle => 'Take your music with you';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox Music Player';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Have fun with your photos';

  @override
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Shotwell Photo Manager';

  @override
  String get photoSlideGimp => 'GIMP Image Editor';

  @override
  String get photoSlideShotcut => 'Shotcut Video Editor';

  @override
  String get webSlideTitle => 'Make the most of the web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'Firefox web browser';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Everything you need for the office';

  @override
  String get officeSlideDescription => 'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Access for everyone';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, $RELEASE makes computing easy - whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Customization options';

  @override
  String get accessSlideAppearance => 'Appearance';

  @override
  String get accessSlideAssistiveTechnologies => 'Assistive technologies';

  @override
  String get accessSlideLanguageSupport => 'Language support';

  @override
  String get supportSlideTitle => 'Help and support';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Included software';

  @override
  String get availableSoftware => 'Available software';

  @override
  String get supportedSoftware => 'Supported software';

  @override
  String get copyingFiles => 'Copying files...';

  @override
  String get installingSystem => 'Installing system...';

  @override
  String get configuringSystem => 'Configuring system...';

  @override
  String get installationFailed => 'Installation failed';

  @override
  String get notEnoughDiskSpaceTitle => 'Sorry';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'You need at least $SIZE disk space to install $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'This computer has only $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'The biggest disk on this computer is only $SIZE.';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get appTitle => 'Instalador do Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String get cancelButtonText => 'Cancelar';

  @override
  String get changeButtonText => 'Alterar';

  @override
  String get okButtonText => 'Ok';

  @override
  String get noButtonText => 'Não';

  @override
  String get restartButtonText => 'Reiniciar';

  @override
  String get revertButtonText => 'Desfazer';

  @override
  String get yesButtonText => 'Sim';

  @override
  String get welcome => 'Bem-vindo';

  @override
  String get welcomeHeader => 'Escolha seu idioma:';

  @override
  String get tryOrInstallPageTitle => 'Experimentar ou instalar';

  @override
  String get repairInstallation => 'Reparar instalação';

  @override
  String get repairInstallationDescription => 'A reparação reinstalará todos os softwares instalados sem alterar documentos ou configurações.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Experimentar $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Você pode experimentar o $RELEASE sem precisar fazer qualquer alteração em seu computador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar o $RELEASE ao lado do (ou em substituição ao) seu sistema operacional atual. Isto não deve demorar muito.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Talvez você queira ler as <a href=\"$url\">notas de lançamento</a>.';
  }

  @override
  String get turnOffRST => 'Desligue a RST';

  @override
  String get turnOffRSTDescription => 'Este computador usa Intel RST (Rapid Storage Technology). Você precisa desligar a RST no Windows antes de instalar o Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Abra esta página em um celular ou outro dispositivo para encontrar instruções: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Layout do teclado';

  @override
  String get chooseYourKeyboardLayout => 'Escolha o layout do seu teclado:';

  @override
  String get typeToTest => 'Digite aqui para testar seu teclado';

  @override
  String get detectLayout => 'Detectar o layout do teclado';

  @override
  String get pressOneKey => 'Por favor pressione uma das seguintes teclas:';

  @override
  String get isKeyPresent => 'A seguinte tecla está presente no seu teclado?';

  @override
  String get configureSecureBootTitle => 'Configurar Secure Boot';

  @override
  String get configureSecureBootDescription => 'Você optou por instalar drivers de terceiros. Isso requer desabilitar o Secure Boot.\nPara isso, você precisa escolher uma chave de segurança agora e entrar com ela quando o sistema reiniciar.';

  @override
  String get configureSecureBootOption => 'Configurar Secure Boot';

  @override
  String get chooseSecurityKey => 'Escolha uma chave de segurança';

  @override
  String get confirmSecurityKey => 'Confirme a chave de segurança';

  @override
  String get dontInstallDriverSoftwareNow => 'Não instalar os drivers agora';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Você pode instalar depois usando Programas e Atualizações.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Chave de segurança é obrigatória';

  @override
  String get secureBootSecurityKeysDontMatch => 'Chaves de segurança não correspondem';

  @override
  String get connectToInternetPageTitle => 'Conecte-se à internet';

  @override
  String get connectToInternetDescription => 'Ao conectar este computador à internet você facilitará ao Ubuntu instalação de qualquer software extra necessário e ajudará a determinar seu fuso horário.\n\nConecte-se via cabo ethernet ou escolha uma rede Wi-Fi';

  @override
  String get useWiredConnection => 'Usar conexão via cabo';

  @override
  String get noWiredConnection => 'Nenhuma conexão a cabo detectada';

  @override
  String get wiredDisabled => 'Conexão a cabo está desligada';

  @override
  String get wiredMustBeEnabled => 'Para utilizar a ethernet neste computador, uma conexão a cabo deve ser habilitada';

  @override
  String get enableWired => 'Habilitar conexão a cabo';

  @override
  String get selectWifiNetwork => 'Conectar-se a uma rede Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Conectar-se a uma rede Wi-Fi oculta';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nome da rede';

  @override
  String get hiddenWifiNetworkNameRequired => 'É necessário um nome de rede';

  @override
  String get noInternet => 'Não quero conectar à internet neste momento';

  @override
  String get wirelessNetworkingDisabled => 'Rede WiFi está desabilitada';

  @override
  String get noWifiDevicesDetected => 'Nenhum dispositivo WiFi detectado';

  @override
  String get wifiMustBeEnabled => 'Para utilizar WiFi neste computador, a rede WiFi deve ser habilitada';

  @override
  String get enableWifi => 'Habilitar WiFi';

  @override
  String get connectButtonText => 'Conectar';

  @override
  String get updatesOtherSoftwarePageTitle => 'Atualizações e outros softwares';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quais apps você gostaria de instalar para começar?';

  @override
  String get normalInstallationTitle => 'Instalação normal';

  @override
  String get normalInstallationSubtitle => 'Navegador web, utilitários, pacote office, jogos e reprodutores de mídia.';

  @override
  String get minimalInstallationTitle => 'Instalação mínima';

  @override
  String get minimalInstallationSubtitle => 'Navegador web e utilitários básicos.';

  @override
  String get otherOptions => 'Outras opções';

  @override
  String get installThirdPartyTitle => 'Instalar software de terceiros para hardware gráfico e de Wi-Fi, bem como formatos de mídia adicionais';

  @override
  String get installThirdPartySubtitle => 'Este software está sujeito aos termos de licença incluídos em sua documentação. Alguns são proprietários.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Atenção</font>: O computador não está conectado a uma fonte de energia.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Escolha uma chave de segurança';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Encriptação de disco protege seus arquivos em caso de perda do seu computador. Isso requer que você digite uma chave de segurança a cada vez que o computador ligar.\n\nQuaisquer arquivos fora de $RELEASE não serão criptografados.';
  }

  @override
  String get chooseSecurityKeyHint => 'Escolha uma chave de segurança';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirme a chave de segurança';

  @override
  String get chooseSecurityKeyRequired => 'Uma chave de segurança é necessária';

  @override
  String get chooseSecurityKeyMismatch => 'As chaves de segurança não conferem';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Atenção</font>: Se você perder esta chave de segurança, todos os dados estarão perdidos. Se precisar, anote sua chave no papel e coloque-a em um local seguro.';
  }

  @override
  String get installationTypeTitle => 'Tipo de installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Este computador possui $os atualmente instalado. O que você deseja fazer?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Este computador tem atualmente $os1 e $os2 instalados. O que você gostaria de fazer?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Este computador possui atualmente múltiplos sistemas operacionais. O que você gostaria de fazer?';

  @override
  String get installationTypeNoOSDetected => 'Este computador não possui atualmente nenhum sistema operacional detectado. O que você deseja fazer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Apagar o disco e instalar o $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Atenção:</font> Isso vai apagar todos os seus programas, documentos, fotos, músicas, e quaisquer outros arquivos em todos os sistemas operacionais existentes.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Recursos avançados...';

  @override
  String get installationTypeAdvancedTitle => 'Recursos avançados';

  @override
  String get installationTypeNone => 'Nenhum';

  @override
  String get installationTypeNoneSelected => 'Nenhum selecionado';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Usar LVM com a nova instalação do $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Criptografar a nova instalação do $RELEASE para maior segurança';
  }

  @override
  String get installationTypeEncryptInfo => 'Você deverá escolher uma chave de segurança no próximo passo.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Apagar o disco e usar ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selecionado';

  @override
  String installationTypeReinstall(Object os) {
    return 'Apagar $os e reinstalar';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Atenção:</font> Isso vai apagar todos os programas do $os, documentos, fotos, músicas e quaisquer outros arquivos.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Instalar $product junto com $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documentos, músicas, e outros arquivos pessoais serão mantidos. Você poderá selecionar qual sistema operacional usar cada vez que o computador iniciar.';

  @override
  String get installationTypeManual => 'Opção avançada';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Você pode criar ou redimensionar partições manualmente ou escolher múltiplas partições para o $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Apagar o disco e instalar o $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Selecione o disco:';

  @override
  String get selectGuidedStorageInfoLabel => 'O disco inteiro será utilizado:';

  @override
  String get selectGuidedStorageInstallNow => 'Instalar agora';

  @override
  String get allocateDiskSpace => 'Alocar espaço em disco';

  @override
  String get startInstallingButtonText => 'Iniciar instalação';

  @override
  String get diskHeadersDevice => 'Dispositivo';

  @override
  String get diskHeadersType => 'Tipo';

  @override
  String get diskHeadersMountPoint => 'Ponto de montagem';

  @override
  String get diskHeadersSize => 'Tamanho';

  @override
  String get diskHeadersUsed => 'Utilizado';

  @override
  String get diskHeadersSystem => 'Sistema';

  @override
  String get diskHeadersFormat => 'Formato';

  @override
  String get freeDiskSpace => 'espaço livre';

  @override
  String get newPartitionTable => 'Nova tabela de partições';

  @override
  String get newPartitionTableConfirmationTitle => 'Criar uma nova tabela de partições vazia neste dispositivo?';

  @override
  String get newPartitionTableConfirmationMessage => 'Você selecionou dispositivo inteiro para particionar. Se prosseguir com a criação de uma nova tabela de partições no dispositivo, como resultado serão removidas todas as partições atuais.\n\nObserve que você poderá desfazer esta operação mais tarde, se desejar.';

  @override
  String get bootLoaderDevice => 'Dispositivo para instalação do boot loader';

  @override
  String get partitionCreateTitle => 'Criar partição';

  @override
  String get partitionEditTitle => 'Editar partição';

  @override
  String get partitionSizeLabel => 'Tamanho:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Tipo da nova partição:';

  @override
  String get partitionTypePrimary => 'Primária';

  @override
  String get partitionTypeLogical => 'Lógica';

  @override
  String get partitionLocationLabel => 'Localização para a nova partição:';

  @override
  String get partitionLocationBeginning => 'Início deste espaço';

  @override
  String get partitionLocationEnd => 'Final deste espaço';

  @override
  String get partitionFormatLabel => 'Utilizado como:';

  @override
  String get partitionFormatExt4 => 'Sistema de arquivos Ext4 com journaling';

  @override
  String get partitionFormatExt3 => 'Sistema de arquivos Ext3 com journaling';

  @override
  String get partitionFormatExt2 => 'Sistema de arquivos Ext2';

  @override
  String get partitionFormatBtrfs => 'Sistema de arquivos btrfs com journaling';

  @override
  String get partitionFormatJfs => 'Sistema de arquivos JFS com journaling';

  @override
  String get partitionFormatXfs => 'Sistema de arquivos XFS com journaling';

  @override
  String get partitionFormatFat => 'Sistema de arquivos FAT';

  @override
  String get partitionFormatFat12 => 'Sistema de arquivos FAT12';

  @override
  String get partitionFormatFat16 => 'Sistema de arquivos FAT16';

  @override
  String get partitionFormatFat32 => 'Sistema de arquivos FAT32';

  @override
  String get partitionFormatSwap => 'Espaço de Swap';

  @override
  String get partitionFormatIso9660 => 'Sistema de arquivos ISO 9660';

  @override
  String get partitionFormatVfat => 'Sistema de arquivos VFAT';

  @override
  String get partitionFormatNtfs => 'Sistema de arquivos NTFS';

  @override
  String get partitionFormatReiserFS => 'Sistema de arquivos ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Sistema de arquivos raiz ZFS';

  @override
  String get partitionErase => 'Formatar a partição';

  @override
  String get partitionMountPointLabel => 'Ponto de montagem:';

  @override
  String get whoAreYouPageTitle => 'Quem é você?';

  @override
  String get whoAreYouPageAutoLogin => 'Iniciar sessão automaticamente';

  @override
  String get whoAreYouPageRequirePassword => 'Solicitar minha senha para entrar';

  @override
  String get whoAreYouPageRealNameLabel => 'Seu nome';

  @override
  String get whoAreYouPageRealNameRequired => 'O nome é obrigatório';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nome do seu computador';

  @override
  String get whoAreYouPageComputerNameInfo => 'O nome usado para falar com outros computadores.';

  @override
  String get whoAreYouPageComputerNameRequired => 'O nome do computador é obrigatório';

  @override
  String get whoAreYouPageInvalidComputerName => 'O nome do computador não é válido';

  @override
  String get whoAreYouPageUsernameLabel => 'Escolha um nome de usuário';

  @override
  String get whoAreYouPageUsernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get whoAreYouPageInvalidUsername => 'O nome de usuário informado é inválido';

  @override
  String get whoAreYouPageUsernameInUse => 'Esse nome de usuário já existe.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Esse nome é reservado para uso do sistema.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Esse nome é muito comprido.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Esse nome contém caracteres inválidos.';

  @override
  String get whoAreYouPagePasswordLabel => 'Escolha uma senha';

  @override
  String get whoAreYouPagePasswordRequired => 'A senha é obrigatória';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme sua senha';

  @override
  String get whoAreYouPagePasswordMismatch => 'As senhas não correspondem';

  @override
  String get whoAreYouPageShowPassword => 'Mostrar senha';

  @override
  String get writeChangesToDisk => 'Gravar alterações no disco';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Se você prosseguir, as mudanças listadas abaixo serão escritas nos discos. Você será capaz de realizar alterações posteriores manualmente.';

  @override
  String get writeChangesPartitionTablesHeader => 'As tabelas de partições dos seguintes dispositivos foram alteradas:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'As seguintes partições serão formatadas:';

  @override
  String get chooseYourLookPageTitle => 'Escolha seu estilo';

  @override
  String get chooseYourLookPageHeader => 'Você pode sempre alterar isso depois nas configurações de aparência.';

  @override
  String get chooseYourLookPageDarkSetting => 'Escuro';

  @override
  String get chooseYourLookPageLightSetting => 'Claro';

  @override
  String get installationCompleteTitle => 'Instalação concluída';

  @override
  String readyToUse(Object system) {
    return '**$system** está instalado e pronto pra uso.';
  }

  @override
  String restartInto(Object system) {
    return 'Reiniciar no $system';
  }

  @override
  String get shutdown => 'Desligar';

  @override
  String get turnOffBitlockerTitle => 'Desligar BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Este computador usa criptografia do Windows BitLocker.\nVocê precisa desativar o BitLocker no Windows antes de instalar o Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para obter instruções, abra esta página em um telefone ou outro dispositivo: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar no Windows';

  @override
  String get whereAreYouPageTitle => 'Onde você está?';

  @override
  String get whereAreYouLocationLabel => 'Localização';

  @override
  String get whereAreYouTimezoneLabel => 'Fuso horário';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Bem-vindo ao $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Rápida e cheia de novas funcionalidades, a última versão do $RELEASE torna a computação mais fácil, como nunca antes. Aqui estão apenas algumas novidades legais para levar em conta...';
  }

  @override
  String get softwareSlideTitle => 'Encontre ainda mais software';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Diga adeus à busca de novos softwares na internet. Com acesso à Loja Snap e ao arquivos de software do $RELEASE, você pode encontrar e instalar novos aplicativos com facilidade. Basta digitar o que você está procurando ou explorar nas categorias como Gráfica e Fotografia, Jogos e Produtividade, junto com avaliações úteis de outros usuários.';
  }

  @override
  String get musicSlideTitle => 'Leve sua música com você';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE vem com o incrível reprodutor de música Rhythmbox. Com opções avançadas de reprodução, é modo simples de colocar na lista as músicas perfeitas. Funciona muito bem com CDs e dispositivos portáteis, para que você possa desfrutar de todas as suas músicas aonde você for.';
  }

  @override
  String get musicSlideRhythmbox => 'Reprodutor de música Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Divirta-se com suas fotos';

  @override
  String get photoSlideDescription => 'Shotwell é um prático gerenciador de fotos que é compatível com seus gadgets. Conecte uma câmera ou um celular para transferir suas fotos, compartilhá-las de forma fácil e mantê-las seguras. E se você sente-se criativo, pode encontrar muitos outros aplicativos da fotografia no Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Gerenciador de fotos Shotwell';

  @override
  String get photoSlideGimp => 'Editor de imagens GIMP';

  @override
  String get photoSlideShotcut => 'Editor de vídeo Shotcut';

  @override
  String get webSlideTitle => 'Tire o máximo proveito da internet';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE inclui o Firefox, um navegador usado por milhões de pessoas em todo o mundo. E os aplicativos que você usa com frequência (como por exemplo Facebook ou Gmail) podem ser colocados na sua área de trabalho para acesso mais rápido, de mesma forma como os aplicativos no seu computador.';
  }

  @override
  String get webSlideFirefox => 'Navegador Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Tudo o que você precisa para o escritório';

  @override
  String get officeSlideDescription => 'LibreOffice é um pacote de escritório gratuito com tudo o que você precisa para criar documentos, planilhas e apresentações. Compatível com os formatos de arquivos do Microsoft Office, que tem todas as funcionalidades que você precisa e sem custo desnecessário.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Acesso para todos';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'No coração da filosofia do $RELEASE está a crença de que a computação é para todos. Com ferramentas avançadas de acessibilidade e opções para mudar o idioma, esquema de cores e tamanho de letra, $RELEASE torna a computação fácil - quem quer que você seja e onde quer que você esteja.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Opções de personalização';

  @override
  String get accessSlideAppearance => 'Aparência';

  @override
  String get accessSlideAssistiveTechnologies => 'Tecnologias assistivas';

  @override
  String get accessSlideLanguageSupport => 'Suporte de idiomas';

  @override
  String get supportSlideTitle => 'Ajuda e suporte';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'A documentação oficial cobre muitas áreas mais comuns sobre $RELEASE. Está disponível tanto <a href=\"https://help.ubuntu.com\">online</a> como através do ícone de Ajuda no dock.';
  }

  @override
  String get supportSlideQuestions => 'No <a href=\"https://askubuntu.com\">Ask Ubuntu</a> você pode fazer perguntas e pesquisar numa coleção impressionante de perguntas já respondidas. O suporte em sua própria língua pode ser fornecido via <a href=\"https://loco.ubuntu.com/teams\">Equipe da comunidade local</a>.';

  @override
  String get supportSlideResources => 'Para obter dicas de outros recursos úteis, por favor, visite <a href=\"https://www.ubuntu.com/support/community-support\">Suporte da comunidade</a> ou <a href=\"https://www.ubuntu.com/support\">Suporte comercial</a>.';

  @override
  String get includedSoftware => 'Software incluído';

  @override
  String get availableSoftware => 'Software disponível';

  @override
  String get supportedSoftware => 'Software suportado';

  @override
  String get copyingFiles => 'Copiando arquivos...';

  @override
  String get installationFailed => 'Instalação falhou';
}
