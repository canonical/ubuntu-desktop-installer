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
  String get changeButtonText => 'Alterar';

  @override
  String get restartButtonText => 'Reiniciar';

  @override
  String get revertButtonText => 'Reverter';

  @override
  String get quitButtonText => 'Sair da instalação';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Bem-vindo ao $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'A preparar o $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Escolha o seu idioma:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Experimentar ou instalar o $DISTRO';
  }

  @override
  String get repairInstallation => 'Reparar instalação';

  @override
  String get repairInstallationDescription => 'A reparação reinstalará todos os softwares instalados sem alterar documentos ou definições.';

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
  String get turnOffRST => 'A RST está ativa';

  @override
  String get turnOffRSTTitle => 'Desligue a RST para continuar';

  @override
  String get turnOffRSTDescription => 'Este computador usa Intel RST (Rapid Storage Technology). Precisa de desligar a RST no Windows antes de instalar o Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Para obter instruções, digitalize o código QR noutro dispositivo ou visite: <a href=\"https://$url\">$url</a>';
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
  String get detectButtonText => 'Detetar';

  @override
  String get keyboardVariant => 'Variante do teclado:';

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
  String get connectToInternetPageTitle => 'Ligar a uma rede';

  @override
  String get connectToInternetDescription => 'Ao ligar este computador à Internet irá ajudar o Ubuntu a instalar qualquer software extra necessário e ajudá-lo com o seu fuso horário.\n\nLigar por cabo de rede, ou escolha uma rede Wi-Fi';

  @override
  String get useWiredConnection => 'Usar uma ligação por cabo de rede';

  @override
  String get noWiredConnection => 'Ligação por cabo de rede detetada';

  @override
  String get wiredDisabled => 'Ligação por cabo de rede está desligada';

  @override
  String get wiredMustBeEnabled => 'Para usar Ethernet neste computador, uma ligação por cabo de rede deve ser ativada';

  @override
  String get enableWired => 'Ligação por cabo de rede ativada';

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
  String get updatesOtherSoftwarePageTitle => 'Aplicações e atualizações';

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
  String get installCodecsTitle => 'Transferir e instalar suporte para formatos de multimédia adicionais';

  @override
  String get installCodecsSubtitle => 'Este software está sujeito aos termos de licença incluídos com a sua documentação. Alguns são proprietários.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Aviso:</font> O computador não está ligado a uma fonte de energia.';
  }

  @override
  String get offlineWarning => 'De momento está off-line';

  @override
  String get chooseSecurityKeyTitle => 'Chave de segurança';

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
    return '<font color=\"$color\">Atenção:</font> Se perder esta chave de segurança, todos os dados serão perdidos. Se precisar, escreva a sua chave num papel e ponha num local seguro.';
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
    return 'Instalar o $product junto com o $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Instalar o $product ao lado do $os1 e do $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Instalar o $product a seu lado';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Instalar o $product ao lado de outras partições';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documentos, músicas e outros ficheiros pessoais serão mantidos. Poderá selecionar qual o sistema operativo a usar cada vez que o computador iniciar.';

  @override
  String get installationTypeManual => 'Particionamento manual';

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
  String get allocateDiskSpace => 'Particionamento manual';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Os pontos de montagem devem começar com \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Os pontos de montagem não podem conter espaços';

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
  String get diskHeadersFormat => 'Formatar';

  @override
  String get freeDiskSpace => 'Espaço livre';

  @override
  String get newPartitionTable => 'Nova tabela de partições';

  @override
  String get newPartitionTableConfirmationTitle => 'Nova partição vazia';

  @override
  String get newPartitionTableConfirmationMessage => 'A criação de uma nova tabela de partições num dispositivo inteiro irá remover todas as suas atuais partições. Esta operação pode ser anulada, se necessário.';

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
  String get partitionFormatNone => 'Deixar sem formatação';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'Formatar a partição';

  @override
  String get partitionMountPointLabel => 'Ponto de montagem:';

  @override
  String get whoAreYouPageTitle => 'Configure a sua conta';

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
  String get writeChangesToDisk => 'Pronto para instalar';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Se prosseguir, as mudanças listadas abaixo serão escritas nos discos. Será capaz de realizar alterações posteriores manualmente.';

  @override
  String get writeChangesDevicesTitle => 'Dispositivos';

  @override
  String get writeChangesPartitionsTitle => 'Partições';

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
    return 'partição <b>$disk$partition</b> redimensionada de <b>$oldsize</b> para <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partição <b>$disk$partition</b> formatada como <b>$format</b> usada para <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partição <b>$disk$partition</b> formatada como <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partição <b>$disk$partition</b> usada para <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partição <b>$disk$partition</b> criada';
  }

  @override
  String get chooseYourLookPageTitle => 'Escolha o seu tema';

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
  String get turnOffBitlockerTitle => 'O BitLocker está ativo';

  @override
  String get turnOffBitlockerHeadline => 'Desligue o BitLocker para continuar';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'Este computador usa encriptação BitLocker do Windows.\nPrecisa de usar o Windows para libertar espaço ou escolha \'$option\' para continuar.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para obter instruções, digitalize o código QR noutro dispositivo ou visite: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar no Windows';

  @override
  String get restartIntoWindowsTitle => 'Reiniciar no Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Tem a certeza de que deseja reiniciar o computador? Precisará de reiniciar a instalação do $DISTRO mais tarde para concluir a instalação do $DISTRO.';
  }

  @override
  String get whereAreYouPageTitle => 'Selecione o seu fuso-horário';

  @override
  String get whereAreYouLocationLabel => 'Localização';

  @override
  String get whereAreYouTimezoneLabel => 'Fuso horário';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Bem-vindo ao $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Disponível:';

  @override
  String get installationSlidesIncluded => 'Incluído:';

  @override
  String get installationSlidesWelcomeTitle => 'Rápido, livre e cheio de novas funcionalidades';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'A última versão do $DISTRO torna a computação mais fácil do que nunca.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Quer seja programador, criador, jogador ou administrador, encontrará novas ferramentas para melhorar a sua produtividade e melhorar a sua experiência no $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Todas as aplicações de que precisa';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Instale, faça a gestão e atualize todas as suas aplicações no Ubuntu Software, incluindo milhares de aplicações tanto da Loja Snap como do arquivo do $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Desenvolva com o melhor do código aberto';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return 'O $DISTRO é a estação de trabalho ideal para o desenvolvimento de aplicações ou web, ciência de dados e IA/ML, bem como devops e administração. Cada lançamento do $DISTRO inclui as mais recentes cadeias de ferramentas e suporta todas as principais IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Aumente a sua criatividade';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Se é um animador, designer, criador de vídeo ou criador de jogos, é fácil trazer os seus fluxos de trabalho para o $DISTRO com suporte para software e aplicações de código aberto padrão da indústria.';
  }

  @override
  String get installationSlidesGamingTitle => 'Óptimo para jogos';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return 'O $DISTRO suporta os últimos controladores NVIDIA e Mesa para melhorar o desempenho e a compatibilidade. Milhares de títulos do Windows jogam-se muito bem no $DISTRO através de aplicações como Steam sem configuração adicional.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privado e seguro';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return 'O $DISTRO fornece todas as ferramentas necessárias para se manter privado e seguro online. Com firewall incorporado e suporte VPN e uma série de aplicações centradas na privacidade para garantir que tem o controlo total dos seus dados.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Todos as versões do $DISTRO LTS vêm com cinco anos de correções de segurança incluídos, prolongando-se até dez anos com uma subscrição Ubuntu Pro.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Potencie a sua produtividade';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return 'O $DISTRO Desktop inclui o LibreOffice, um conjunto de aplicações de código aberto compatíveis com o Microsoft Office para documentos, folhas de cálculo e apresentações. Estão também disponíveis ferramentas de colaboração populares.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Acesso para todos';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'No centro da filosofia do $DISTRO está a crença de que a informática é para todos. Com ferramentas avançadas de acessibilidade e opções para mudar o idioma, cores e tamanho do texto, o $DISTRO torna a computação fácil - quem quer que seja e onde quer que esteja.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Leitor de ecrã Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Suporte de idioma';

  @override
  String get installationSlidesSupportTitle => 'Ajuda e Suporte';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'A documentação oficial do $DISTRO está disponível tanto online como através do ícone da Ajuda na doca.';
  }

  @override
  String get installationSlidesSupportCommunity => 'O Ask Ubuntu abrange uma série de perguntas e respostas e o Ubuntu Discourse fornece guias e fóruns para utilizadores novos e experientes.';

  @override
  String get installationSlidesSupportEnterprise => 'Para os utilizadores empresariais, a Canonical fornece apoio comercial para facilitar a integração e gestão segura do Ubuntu no local de trabalho.';

  @override
  String get installationSlidesSupportResources => 'Recursos úteis:';

  @override
  String get installationSlidesSupportDocumentation => 'Documentação oficial';

  @override
  String get installationSlidesSupportUbuntuPro => 'Suporte de grau empresarial 24/7 com o Ubuntu Pro';

  @override
  String get copyingFiles => 'A copiar ficheiros…';

  @override
  String get installingSystem => 'A instalar o sistema…';

  @override
  String get configuringSystem => 'A configurar o sistema…';

  @override
  String get installationFailed => 'Falha ao instalar';

  @override
  String get notEnoughDiskSpaceTitle => 'Espaço insuficiente';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Não há espaço suficiente em disco para instalar o $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Disponível:';

  @override
  String get notEnoughDiskSpaceRequired => 'Necessário:';

  @override
  String get activeDirectoryOption => 'Usar o Active Directory';

  @override
  String get activeDirectoryInfo => 'Irá introduzir o domínio e outros detalhes no próximo passo.';

  @override
  String get activeDirectoryTitle => 'Configurar o Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Testar ligação de domínio';

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
  String get activeDirectoryAdminLabel => 'Domínio juntar-se ao utilizador';

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
  String get activeDirectoryErrorMessage => 'Lamentamos, o Active Directory não pode ser criado neste momento. Assim que o seu sistema estiver instalado e a funcionar, visite o <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> para ajuda.';
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
  String get changeButtonText => 'Alterar';

  @override
  String get restartButtonText => 'Reiniciar';

  @override
  String get revertButtonText => 'Desfazer';

  @override
  String get quitButtonText => 'Sair da instalação';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Boas-vindas ao $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparando o $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Escolha seu idioma:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Experimentar ou instalar o $DISTRO';
  }

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
  String get turnOffRST => 'O RST está habilitado';

  @override
  String get turnOffRSTTitle => 'Desligue o RST para continuar';

  @override
  String get turnOffRSTDescription => 'Este computador usa Intel RST (Rapid Storage Technology). Você precisa desligar a RST no Windows antes de instalar o Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Para instruções, escaneie o código QR em outro dispositivo ou visite: <a href=\"https://$url\">$url</a>';
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
  String get detectButtonText => 'Detectar';

  @override
  String get keyboardVariant => 'Disposição de teclado:';

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
  String get connectToInternetPageTitle => 'Conecte-se a uma rede';

  @override
  String get connectToInternetDescription => 'Ao conectar este computador à internet você facilitará ao Ubuntu instalação de qualquer software extra necessário e ajudará a determinar seu fuso horário.\n\nConecte-se via cabo Ethernet ou escolha uma rede Wi-Fi';

  @override
  String get useWiredConnection => 'Usar conexão via cabo';

  @override
  String get noWiredConnection => 'Nenhuma conexão a cabo detectada';

  @override
  String get wiredDisabled => 'Conexão a cabo está desligada';

  @override
  String get wiredMustBeEnabled => 'Para utilizar a Ethernet neste computador, uma conexão a cabo deve ser habilitada';

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
  String get updatesOtherSoftwarePageTitle => 'Aplicativos e atualizações';

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
  String get installDriversTitle => 'Instalar drivers de terceiros para Wi-Fi e placas gráficas';

  @override
  String get installDriversSubtitle => 'Esses drivers estão sujeitos aos termos de licença incluídos em suas documentações. Eles são proprietários.';

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
  String get chooseSecurityKeyTitle => 'Chave de segurança';

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
  String get installationTypeManual => 'Particionamento manual';

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
  String get allocateDiskSpace => 'Particionamento manual';

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
  String get newPartitionTableConfirmationTitle => 'Nova partição vazia';

  @override
  String get newPartitionTableConfirmationMessage => 'Criar uma nova tabela de partição em um dispositivo inteiro removerá todas as suas partições atuais. Esta operação pode ser desfeita se necessário.';

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
  String get partitionFormatNone => 'Deixar sem formatação';

  @override
  String get partitionErase => 'Formatar a partição';

  @override
  String get partitionMountPointLabel => 'Ponto de montagem:';

  @override
  String get whoAreYouPageTitle => 'Configurar sua conta';

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
  String get writeChangesToDisk => 'Pronto para instalar';

  @override
  String get writeChangesFallbackSerial => 'disco';

  @override
  String get writeChangesDescription => 'Se você continuar, as mudanças listadas abaixo serão escritas nos discos. Você será capaz de realizar alterações posteriores manualmente.';

  @override
  String get writeChangesDevicesTitle => 'Dispositivos';

  @override
  String get writeChangesPartitionsTitle => 'Partições';

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
    return 'partição <b>$disk$partition</b> alterada de <b>$oldsize</b> para <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partição <b>$disk$partition</b> formatada como <b>$format</b> usada para <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partição <b>$disk$partition</b> formatada como <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partição <b>$disk$partition</b> usada para <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partição <b>$disk$partition</b> criada';
  }

  @override
  String get chooseYourLookPageTitle => 'Escolha seu tema';

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
    return '**$system** está instalado e pronto pra uso';
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
  String get turnOffBitlockerTitle => 'BitLocker está habilitado';

  @override
  String get turnOffBitlockerHeadline => 'Desligue o BitLocker para continuar';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'Este computador usa criptografia BitLocker do Windows.\nVocê precisa usar o Windows para liberar espaço ou escolher \'$option\' para continuar .';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para instruções, escaneie o código QR em outro dispositivo ou visite: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar no Windows';

  @override
  String get restartIntoWindowsTitle => 'Reiniciar para o Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Tem certeza de que deseja reiniciar o computador? Você precisará reiniciar a instalação do $DISTRO mais tarde para concluí-la.';
  }

  @override
  String get whereAreYouPageTitle => 'Selecione seu fuso horário';

  @override
  String get whereAreYouLocationLabel => 'Localização';

  @override
  String get whereAreYouTimezoneLabel => 'Fuso horário';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Boas-vindas ao $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Disponível:';

  @override
  String get installationSlidesIncluded => 'Incluído:';

  @override
  String get installationSlidesWelcomeTitle => 'Rápido, gratuito e cheio de novos recursos';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'A mais recente versão do $DISTRO torna o uso do computador mais fácil do que nunca.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Seja você um desenvolvedor, criador, jogador ou administrador, você encontrará novas ferramentas para ampliar sua produtividade e aprimorar sua experiência no $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Todos os aplicativos que você precisa';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Instale, gerencie e atualize todos os seus aplicativos na Ubuntu Software, incluindo milhares de aplicativos tanto da Snap Store quanto dos repositórios do $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Desenvolva com o melhor do código aberto';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO é a estação de trabalho ideal para o desenvolvimento de aplicativos ou web, ciência de dados e IA/AM, bem como DevOps e administração. Cada versão do $DISTRO inclui as mais recentes cadeias de ferramentas e suporta todos os principais IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Aprimore sua criatividade';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Se você é um animador, designer, criador de vídeos ou desenvolvedor de jogos, é fácil trazer seu fluxo de trabalho ao $DISTRO com suporte para código aberto e também aplicativos e software padrões do setor.';
  }

  @override
  String get installationSlidesGamingTitle => 'Excelente para jogos';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return 'O $DISTRO suporta os mais recentes drivers NVIDIA e Mesa para melhorar a performance e compatibilidade. Milhares de jogos Windows rodam muito bem no $DISTRO através de aplicativos como a Steam sem nenhuma configuração adicional.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privativo e seguro';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return 'O $DISTRO fornece todas as ferramentas que você precisa para se manter seguro e anônimo online. Com um firewall integrado e suporte VPN, além de inúmeros aplicativos voltados à privacidade, você tem a garantia de controle total de seus dados.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Todos os lançamentos LTS do $DISTRO vêm com cinco anos de patches de segurança incluídos, estendendo-se a dez anos com uma assinatura do Ubuntu Pro.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Aumente a sua produtividade';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return 'O $DISTRO Desktop inclui o LibreOffice, um suíte de aplicativos de código aberto compatíveis com o Microsoft Office para documentos, planilhas e apresentações. Ferramentas de colaboração populares também estão disponíveis.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Acessível para todos';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'No coração da filosofia $DISTRO está a crença de que a computação é para todos. Com ferramentas avançadas de acessibilidade e opções para alterar o idioma, cores e o tamanho do texto, o $DISTRO facilita o uso do computador - quem e onde quer que você esteja.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Leitor de Tela Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Suporte a idioma';

  @override
  String get installationSlidesSupportTitle => 'Ajuda e Suporte';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'A documentação oficial do $DISTRO está disponível on-line e por meio do ícone de Ajuda na doca de aplicativos.';
  }

  @override
  String get installationSlidesSupportCommunity => 'O Ask Ubuntu cobre uma variedade de perguntas e respostas e o Ubuntu Discourse fornece guias e discussões para usuários novos e experientes.';

  @override
  String get installationSlidesSupportEnterprise => 'Para usuários corporativos, a Canonical fornece suporte comercial para facilitar a integração e o gerenciamento seguro do Ubuntu no local de trabalho.';

  @override
  String get installationSlidesSupportResources => 'Recursos úteis:';

  @override
  String get installationSlidesSupportDocumentation => 'Documentação oficial';

  @override
  String get installationSlidesSupportUbuntuPro => 'Suporte 24/7 de nível empresarial com Ubuntu Pro';

  @override
  String get copyingFiles => 'Copiando arquivos…';

  @override
  String get installingSystem => 'Instalando o sistema…';

  @override
  String get configuringSystem => 'Iniciando o sistema…';

  @override
  String get installationFailed => 'Instalação falhou';

  @override
  String get notEnoughDiskSpaceTitle => 'Espaço insuficiente';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Não há espaço suficiente no disco para instalar o $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Disponível:';

  @override
  String get notEnoughDiskSpaceRequired => 'Necessário:';

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
