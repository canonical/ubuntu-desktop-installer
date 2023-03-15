import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Instalador do Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instalar o $RELEASE';
  }

  @override
  String get cancelButtonText => 'Cancelar';

  @override
  String get changeButtonText => 'Alterar';

  @override
  String get okButtonText => 'Aceitar';

  @override
  String get noButtonText => 'Não';

  @override
  String get restartButtonText => 'Reiniciar';

  @override
  String get revertButtonText => 'Reverter';

  @override
  String get yesButtonText => 'Sim';

  @override
  String get quitButtonText => 'Sair da instalação';

  @override
  String get welcome => 'Bem-vindo';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

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
    return 'Experimentar o $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Pode experimentar o $RELEASE sem precisar de fazer qualquer alteração no seu computador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar o $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar o $RELEASE ao lado do (ou em substituição ao) seu sistema operativo atual. Isto não deve demorar muito.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Talvez queira ler as <a href=\"$url\">notas de lançamento</a>.';
  }

  @override
  String get turnOffRST => 'Desligue a RST';

  @override
  String get turnOffRSTDescription => 'Este computador usa Intel RST (Rapid Storage Technology). Precisa de desligar a RST no Windows antes de instalar o Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Abra esta página num telemóvel ou outro aparelho para encontrar instruções: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Disposição do teclado';

  @override
  String get chooseYourKeyboardLayout => 'Escolha a disposição do seu teclado:';

  @override
  String get typeToTest => 'Digite aqui para testar o seu teclado';

  @override
  String get detectLayout => 'Detetar a disposição do teclado';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Prima uma das seguintes teclas:';

  @override
  String get isKeyPresent => 'A seguinte tecla está presente no seu teclado?';

  @override
  String get configureSecureBootTitle => 'Configurar o Arranque Seguro';

  @override
  String get configureSecureBootDescription => 'Optou por instalar controladores de terceiros. Isto requer desativar o Arranque Seguro.\nPara isso, é preciso escolher uma chave de segurança agora e entrar com ela quando o sistema reiniciar.';

  @override
  String get configureSecureBootOption => 'Configurar o Arranque Seguro';

  @override
  String get chooseSecurityKey => 'Escolha uma chave de segurança';

  @override
  String get confirmSecurityKey => 'Confirme a chave de segurança';

  @override
  String get dontInstallDriverSoftwareNow => 'Não instalar os controladores por agora';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Pode instalar depois pelo Software e Atualizações.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'A chave de segurança é obrigatória';

  @override
  String get secureBootSecurityKeysDontMatch => 'As chaves de segurança não coincidem';

  @override
  String get showSecurityKey => 'Mostrar chave de segurança';

  @override
  String get connectToInternetPageTitle => 'Ligar à Internet';

  @override
  String get connectToInternetDescription => 'Ao ligar este computador à Internet irá ajudar o Ubuntu a instalar qualquer software extra necessário e ajudá-lo com o seu fuso horário.\n\nLigar por cabo de rede, ou escolha uma rede Wi-Fi';

  @override
  String get useWiredConnection => 'Usar uma ligação por cabo';

  @override
  String get noWiredConnection => 'Ligação por cabo detetada';

  @override
  String get wiredDisabled => 'Ligação por cabo está desligada';

  @override
  String get wiredMustBeEnabled => 'Para usar ethernet neste computador, uma ligação por cabo deve ser ativada';

  @override
  String get enableWired => 'Ligação por cabo ativada';

  @override
  String get selectWifiNetwork => 'Ligar a uma rede Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Ligar a uma rede Wi-Fi oculta';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nome da rede';

  @override
  String get hiddenWifiNetworkNameRequired => 'Um nome de rede é necessário';

  @override
  String get noInternet => 'Não pretendo ligar à Internet por agora';

  @override
  String get wirelessNetworkingDisabled => 'Rede sem fios desativada';

  @override
  String get noWifiDevicesDetected => 'Sem dispositivos Wi-Fi detetados';

  @override
  String get wifiMustBeEnabled => 'Para usar Wi-Fi neste computador, uma rede sem fios deve ser ativada';

  @override
  String get enableWifi => 'Ativar Wi-Fi';

  @override
  String get connectButtonText => 'Ligar';

  @override
  String get updatesOtherSoftwarePageTitle => 'Atualizações e outros softwares';

  @override
  String get updatesOtherSoftwarePageDescription => 'Que aplicações gostaria de instalar para começar?';

  @override
  String get normalInstallationTitle => 'Instalação normal';

  @override
  String get normalInstallationSubtitle => 'Navegador web, utilitários, software de escritório, jogos e reprodutores multimédia.';

  @override
  String get minimalInstallationTitle => 'Instalação mínima';

  @override
  String get minimalInstallationSubtitle => 'Navegador web e utilitários básicos.';

  @override
  String get otherOptions => 'Outras opções';

  @override
  String get installThirdPartyTitle => 'Instalar software de terceiros para hardware gráfico e de Wi-Fi, bem como formatos de multimédia adicionais';

  @override
  String get installThirdPartySubtitle => 'Este software está sujeito aos termos de licença incluídos nas suas documentações. Alguns são proprietários.';

  @override
  String get installDriversTitle => 'Instalar software de terceiros para placas gráficas e Wi-Fi';

  @override
  String get installDriversSubtitle => 'Estes controladores estão sujeitos aos termos de licença incluídos com sua documentação. São proprietários.';

  @override
  String get installCodecsTitle => 'Baixar e instalar suporte para formatos de multimédia adicionais';

  @override
  String get installCodecsSubtitle => 'Este software está sujeito aos termos de licença incluídos com a sua documentação. Alguns são proprietários.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Aviso</font>: O computador não está ligado a uma fonte de energia.';
  }

  @override
  String get offlineWarning => 'Você está off-line no momento';

  @override
  String get chooseSecurityKeyTitle => 'Escolha uma chave de segurança';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'A encriptação de disco protege os seus ficheiros em caso de perda do seu computador. Isso requer que digite uma chave de segurança a cada vez que o computador ligar.\n\nQuaisquer ficheiros fora do $RELEASE não serão encriptados.';
  }

  @override
  String get chooseSecurityKeyHint => 'Escolha uma chave de segurança';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirme a chave de segurança';

  @override
  String get chooseSecurityKeyRequired => 'Uma chave de segurança é necessária';

  @override
  String get chooseSecurityKeyMismatch => 'As chaves de segurança não coincidem';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Atenção</font>: Se perder esta chave de segurança, todos os dados serão perdidos. Se precisar, escreva a sua chave num papel e ponha num local seguro.';
  }

  @override
  String get installationTypeTitle => 'Tipo de instalação';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Este computador tem o $os atualmente instalado. O que gostaria de fazer?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Este computador tem o $os1 e o $os2. O que pretende fazer?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Este computador tem vários sistemas operativos instalados. O que pretende fazer?';

  @override
  String get installationTypeNoOSDetected => 'Este computador não tem atualmente nenhum sistema operativo detetado. O que gostaria de fazer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Apagar o disco e instalar o $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Aviso:</font> Isso vai apagar todos os seus programas, documentos, fotos, músicas e quaisquer outros ficheiros em todos os sistemas operativos existentes.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Funcionalidades avançadas...';

  @override
  String get installationTypeAdvancedTitle => 'Funcionalidades avançadas';

  @override
  String get installationTypeNone => 'Nenhuma';

  @override
  String get installationTypeNoneSelected => 'Nenhuma selecionada';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Usar LVM com a nova instalação do $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM e encriptação selecionado';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Criptografar a nova instalação do $RELEASE para maior segurança';
  }

  @override
  String get installationTypeEncryptInfo => 'Deverá escolher uma chave de segurança no passo seguinte.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Apagar o disco e usar ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selecionado';

  @override
  String installationTypeReinstall(Object os) {
    return 'Apagar o $os e reinstalar';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Aviso:</font> Isso vai apagar todos os programas do $os, documentos, fotos, músicas e quaisquer outros ficheiros.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Instalar o $product junto com $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Instalar o $product ao lado do $os1 e do $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Instalar o $product ao lado deles';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Instalar o $product ao lado de outras partições';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documentos, músicas e outros ficheiros pessoais serão mantidos. Poderá selecionar qual o sistema operativo a usar cada vez que o computador iniciar.';

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
  String get installAlongsideSpaceDivider => 'Alocar espaço no disco ao arrastar o divisor abaixo:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num pequenas partições estão ocultas, utilize a <a href=\"$url\"> ferramenta de particionamento avançado</a> para mais controlo';
  }

  @override
  String get installAlongsideResizePartition => 'Redimensionar partição';

  @override
  String get installAlongsideAllocateSpace => 'Alocar espaço';

  @override
  String get installAlongsideFiles => 'Ficheiros';

  @override
  String get installAlongsidePartition => 'Partição:';

  @override
  String get installAlongsideSize => 'Tamanho:';

  @override
  String get installAlongsideAvailable => 'Disponível:';

  @override
  String get allocateDiskSpace => 'Alocar espaço em disco';

  @override
  String get startInstallingButtonText => 'Instalar';

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
  String get freeDiskSpace => 'Espaço livre';

  @override
  String get newPartitionTable => 'Nova tabela de partições';

  @override
  String get newPartitionTableConfirmationTitle => 'Criar uma nova tabela de partições neste dispositivo?';

  @override
  String get newPartitionTableConfirmationMessage => 'Você selecionou um dispositivo inteiro para particionar. se prosseguir com a criação de uma nova tabela de partições nele, todas as suas partições serão removidas\n\nNote que você poderá desfazer essa operação depois se desejar.';

  @override
  String get tooManyPrimaryPartitions => 'Demasiadas partições primárias';

  @override
  String get partitionLimitReached => 'Limite atingido';

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
  String get partitionUnitKB => 'kB';

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
  String get partitionFormatZfsroot => 'Sistema de ficheiros root ZFS';

  @override
  String get partitionFormatNone => 'Deixar sem formatação';

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
  String get whoAreYouPageRealNameTooLong => 'Esse nome é demasiado longo.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nome do seu computador';

  @override
  String get whoAreYouPageComputerNameInfo => 'O nome usado para falar com outros computadores.';

  @override
  String get whoAreYouPageComputerNameRequired => 'O nome do computador é obrigatório';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Esse nome é demasiado longo.';

  @override
  String get whoAreYouPageInvalidComputerName => 'O nome do computador não é válido';

  @override
  String get whoAreYouPageUsernameLabel => 'Escolha um nome de utilizador';

  @override
  String get whoAreYouPageUsernameRequired => 'Nome de utilizador é obrigatório';

  @override
  String get whoAreYouPageInvalidUsername => 'O nome de utilizador informado é inválido';

  @override
  String get whoAreYouPageUsernameInUse => 'Esse nome de utilizador já existe.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Esse nome é reservado para utilização do sistema.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Esse nome é demasiado longo.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Esse nome contém caracteres inválidos.';

  @override
  String get whoAreYouPagePasswordLabel => 'Escolha uma palavra-passe';

  @override
  String get whoAreYouPagePasswordRequired => 'A palavra-passe é obrigatória';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme a sua palavra-passe';

  @override
  String get whoAreYouPagePasswordMismatch => 'As palavras-passe não correspondem';

  @override
  String get whoAreYouPagePasswordShow => 'Mostrar';

  @override
  String get whoAreYouPagePasswordHide => 'Ocultar';

  @override
  String get writeChangesToDisk => 'Gravar alterações no disco';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Se prosseguir, as mudanças listadas abaixo serão escritas nos discos. Será capaz de realizar alterações posteriores manualmente.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'As tabelas de partições dos seguintes aparelhos foram alteradas:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'As seguintes alterações às partições serão aplicadas:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partição #$disk$partition redimensionada de $oldsize para $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partição #$disk$partition formatada como $format usada para $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partição #$disk$partition formatada como $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partição #$disk$partition usada para $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partição #$disk$partition criada';
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
    return '**$system** está instalado e pronto para usar';
  }

  @override
  String restartInto(Object system) {
    return 'Reiniciar no $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Pode continuar a testar o $RELEASE agora, mas até reiniciar o computador, quaisquer alterações que faça ou documentos que guarde não serão preservados.';
  }

  @override
  String get shutdown => 'Desligar';

  @override
  String get restartNow => 'Reiniciar agora';

  @override
  String get continueTesting => 'Continuar a testar';

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
  String get whereAreYouPageTitle => 'Onde está?';

  @override
  String get whereAreYouLocationLabel => 'Localização';

  @override
  String get whereAreYouTimezoneLabel => 'Fuso horário';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Available:';

  @override
  String get installationSlidesIncluded => 'Included:';

  @override
  String get installationSlidesWelcomeTitle => 'Fast, free and full of new features';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'The latest version of $DISTRO makes computing easier than ever.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'All the applications you need';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and $DISTRO archive.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Develop with the best of open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Enhance your creativity';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'Great for gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Private and secure';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'All $DISTRO LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Power up your productivity';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Access for everyone';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Screen Reader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Language support';

  @override
  String get installationSlidesSupportTitle => 'Help & Support';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'The official $DISTRO documentation is available both online and via the Help icon in the dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'Helpful resources:';

  @override
  String get installationSlidesSupportDocumentation => 'Official documentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Enterprise-grade 24/7 support with Ubuntu Pro';

  @override
  String get copyingFiles => 'A copiar ficheiros…';

  @override
  String get installingSystem => 'A instalar o sistema…';

  @override
  String get configuringSystem => 'A configurar o sistema…';

  @override
  String get installationFailed => 'Falha ao instalar';

  @override
  String get notEnoughDiskSpaceTitle => 'Lamentamos';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'É necessário pelo menos $SIZE de espaço em disco para instalar o $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Este computador tem apenas $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'O maior disco deste computador é de apenas $SIZE.';
  }

  @override
  String get activeDirectoryOption => 'Usar o Active Directory';

  @override
  String get activeDirectoryInfo => 'Irá introduzir o domínio e outros detalhes no próximo passo.';

  @override
  String get activeDirectoryTitle => 'Configurar o Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Testar ligação';

  @override
  String get activeDirectoryDomainLabel => 'Domínio';

  @override
  String get activeDirectoryDomainEmpty => 'Obrigatório';

  @override
  String get activeDirectoryDomainTooLong => 'Demasiado comprido';

  @override
  String get activeDirectoryDomainInvalidChars => 'Caracteres inválidos';

  @override
  String get activeDirectoryDomainStartDot => 'Começa com um ponto (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Termina com um ponto (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Começa com um hífen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Termina com um hífen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contém vários pontos sequenciados (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domínio não encontrado';

  @override
  String get activeDirectoryAdminLabel => 'Administrador de domínio';

  @override
  String get activeDirectoryAdminEmpty => 'Obrigatório';

  @override
  String get activeDirectoryAdminInvalidChars => 'Caracteres inválidos';

  @override
  String get activeDirectoryPasswordLabel => 'Palavra-passe';

  @override
  String get activeDirectoryPasswordEmpty => 'Obrigatório';

  @override
  String get activeDirectoryErrorTitle => 'Erro ao configurando a ligação ao Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';
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
  String get quitButtonText => 'Sair da instalação';

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
  String get showSecurityKey => 'Mostrar chave de segurança';

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
  String get installDriversTitle => 'Instalar drives de terceiros de wifi e gráficos';

  @override
  String get installDriversSubtitle => 'Esses drivers estão sujeitos aos termos de licença incluídos em sua documentação. Eles são proprietários.';

  @override
  String get installCodecsTitle => 'Baixar e instalar suporte para formatos de mídia adicionais';

  @override
  String get installCodecsSubtitle => 'Este software está sujeito aos termos de licença incluídos em sua documentação. Alguns são proprietários.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Atenção:</font> O computador não está conectado a uma fonte de energia.';
  }

  @override
  String get offlineWarning => 'Você está off-line no momento';

  @override
  String get chooseSecurityKeyTitle => 'Escolha uma chave de segurança';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'A criptografia de disco protege seus arquivos caso você perca seu computador. Ele exige que você insira uma chave de segurança toda vez que o computador for inicializado.\n\nQuaisquer arquivos fora de $RELEASE não serão criptografados.';
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
    return '<font color=\"$color\">Atenção:</font> Se você perder esta chave de segurança, todos os dados estarão perdidos. Se precisar, anote sua chave em um papel e coloque-a em um local seguro.';
  }

  @override
  String get installationTypeTitle => 'Tipo de instalação';

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
  String get installationTypeNone => 'Nada';

  @override
  String get installationTypeNoneSelected => 'Nada selecionado';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Usar LVM com a nova instalação do $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM e criptografia selecionados';

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
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Instale $product junto com $os1 e $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Instale $product junto com eles';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Instale $product junto com outras partições';
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
  String get installAlongsideSpaceDivider => 'Aloque espaço em disco arrastando o divisor abaixo:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num partições menores estão ocultas, use a <a href=\"$url\">ferramenta de particionamento avançada</a> para obter mais controle';
  }

  @override
  String get installAlongsideResizePartition => 'Redimensionar partição';

  @override
  String get installAlongsideAllocateSpace => 'Alocar espaço';

  @override
  String get installAlongsideFiles => 'Arquivos';

  @override
  String get installAlongsidePartition => 'Partição:';

  @override
  String get installAlongsideSize => 'Tamanho:';

  @override
  String get installAlongsideAvailable => 'Disponível:';

  @override
  String get allocateDiskSpace => 'Alocar espaço em disco';

  @override
  String get startInstallingButtonText => 'Instalar';

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
  String get freeDiskSpace => 'Espaço livre';

  @override
  String get newPartitionTable => 'Nova tabela de partições';

  @override
  String get newPartitionTableConfirmationTitle => 'Criar uma nova tabela de partições vazia neste dispositivo?';

  @override
  String get newPartitionTableConfirmationMessage => 'Você selecionou dispositivo inteiro para particionar. Se prosseguir com a criação de uma nova tabela de partições no dispositivo, como resultado serão removidas todas as partições atuais.\n\nObserve que você poderá desfazer esta operação mais tarde, se desejar.';

  @override
  String get tooManyPrimaryPartitions => 'Há partições primárias demais';

  @override
  String get partitionLimitReached => 'Limite atingido';

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
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Tipo para a nova partição:';

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
  String get partitionFormatNone => 'Deixar sem formatação';

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
  String get whoAreYouPageRealNameTooLong => 'O nome é longo demais.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nome do seu computador';

  @override
  String get whoAreYouPageComputerNameInfo => 'O nome usado para falar com outros computadores.';

  @override
  String get whoAreYouPageComputerNameRequired => 'O nome do computador é obrigatório';

  @override
  String get whoAreYouPageComputerNameTooLong => 'O nome do computador é longo demais.';

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
  String get whoAreYouPagePasswordShow => 'Mostrar';

  @override
  String get whoAreYouPagePasswordHide => 'Ocultar';

  @override
  String get writeChangesToDisk => 'Gravar alterações no disco';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Se você continuar, as mudanças listadas abaixo serão escritas nos discos. Você será capaz de realizar alterações posteriores manualmente.';

  @override
  String get writeChangesPartitionTablesHeader => 'As tabelas de partições dos seguintes dispositivos foram alteradas:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'As seguintes partições serão formatadas:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'Partição #$disk$partition alterado de $oldsize para $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partição #$disk$partition formatada usando $format para $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partição #$disk$partition formatada usando: $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partição #$disk$partition usado para $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partição #$disk$partition criada';
  }

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
  String restartWarning(Object RELEASE) {
    return 'Você pode continuar testando o $RELEASE agora, mas ao reiniciar o computador, todas as alterações feitas ou documentos armazenados não serão preservados.';
  }

  @override
  String get shutdown => 'Desligar';

  @override
  String get restartNow => 'Reiniciar agora';

  @override
  String get continueTesting => 'Continuar testando';

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
  String get copyingFiles => 'Copiando arquivos…';

  @override
  String get installingSystem => 'Instalando o sistema…';

  @override
  String get configuringSystem => 'Iniciando o sistema…';

  @override
  String get installationFailed => 'Instalação falhou';

  @override
  String get notEnoughDiskSpaceTitle => 'Desculpa';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Você precisa de $SIZE de espaço no disco para instalar o $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Esse computador tem apenas $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'O maior disco neste computador é de apenas $SIZE.';
  }

  @override
  String get activeDirectoryOption => 'Usar o Active Directory';

  @override
  String get activeDirectoryInfo => 'Você inserirá o domínio e outros detalhes na próxima etapa.';

  @override
  String get activeDirectoryTitle => 'Configurar o Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Testar conectividade ao domínio';

  @override
  String get activeDirectoryDomainLabel => 'Domínio';

  @override
  String get activeDirectoryDomainEmpty => 'Necessário';

  @override
  String get activeDirectoryDomainTooLong => 'Longo demais';

  @override
  String get activeDirectoryDomainInvalidChars => 'Caracteres inválidos';

  @override
  String get activeDirectoryDomainStartDot => 'Começa com um ponto (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Termina com um ponto (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Começa com um hífen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Termina com um hífen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contém vários pontos sequenciados (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domínio não encontrado';

  @override
  String get activeDirectoryAdminLabel => 'Usuário de ingresso no domínio';

  @override
  String get activeDirectoryAdminEmpty => 'Necessário';

  @override
  String get activeDirectoryAdminInvalidChars => 'Caracteres inválidos';

  @override
  String get activeDirectoryPasswordLabel => 'Senha';

  @override
  String get activeDirectoryPasswordEmpty => 'Necessário';

  @override
  String get activeDirectoryErrorTitle => 'Erro ao configurar a conexão com o Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Desculpe, o Active Directory não pôde ser configurado no momento. Assim que seu sistema esteja instalado e funcionando, visite <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> para ajuda.';
}
