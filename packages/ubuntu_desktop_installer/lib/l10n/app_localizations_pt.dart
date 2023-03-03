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
  String get pressOneKey => 'Prima uma das seguintes teclas:';

  @override
  String get isKeyPresent => 'A seguinte tecla está presente no seu teclado?';

  @override
  String get configureSecureBootTitle => 'Configurar o Arranque Seguro';

  @override
  String get configureSecureBootDescription => 'Optou por instalar drivers de terceiros. Isso requer desativar o Arranque Seguro.\nPara isso, é preciso escolher uma chave de segurança agora e entrar com ela quando o sistema reiniciar.';

  @override
  String get configureSecureBootOption => 'Configurar o Arranque Seguro';

  @override
  String get chooseSecurityKey => 'Escolha uma chave de segurança';

  @override
  String get confirmSecurityKey => 'Confirme a chave de segurança';

  @override
  String get dontInstallDriverSoftwareNow => 'Não instalar os drivers agora';

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
  String get installDriversTitle => 'Instalar controladores de gráficos e Wi-Fi de terceiros';

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
  String get newPartitionTableConfirmationTitle => 'Criar uma nova tabela de partições neste dispositivo?';

  @override
  String get newPartitionTableConfirmationMessage => 'Você selecionou um dispositivo inteiro para particionar. se prosseguir com a criação de uma nova tabela de partições nele, todas as suas partições serão removidas\n\nNote que você poderá desfazer essa operação depois se desejar.';

  @override
  String get tooManyPrimaryPartitions => 'Demasiadas partições primárias';

  @override
  String get partitionLimitReached => 'limite atingido';

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
  String get partitionFormatZfsroot => 'Sistema de ficheiros raiz ZFS';

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
    return '**$system** está instalado e pronto para usar.';
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
  String welcomeSlideTitle(Object RELEASE) {
    return 'Bem-vindo ao $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Rápido e cheio de novas funcionalidades, a última versão $RELEASE torna a computação mais fácil do que nunca. Aqui estão algumas novidades para dar uma vista de olhos...';
  }

  @override
  String get softwareSlideTitle => 'Encontrar ainda mais software';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Diga adeus à pesquisa na web por software. Com acesso à Snap Store e ao arquivo de software $RELEASE, você pode encontrar e instalar novos aplicativos facilmente. Apenas escreva o que procura ou explore as categorias com comentários de outros utilizadores.';
  }

  @override
  String get musicSlideTitle => 'Leve a sua música consigo';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE vem com o incrível player de media Rhythmbox. com avançadas opções de reprodução de media, é simples de sequenciar os sons perfeitos. e funciona perfeitamente com CDs,tocadores de musica portáteis então você pode aproveitar todas as suas musicas aonde quiser.';
  }

  @override
  String get musicSlideRhythmbox => 'Player de música Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Divirta-se com as suas fotos';

  @override
  String get photoSlideDescription => 'Shotwell é um pratico gerenciador de fotos que está pronto para seus dispositivos. Conecte sua câmera ou celular para transferir suas fotos, então é fácil de compartilha-las e manter elas seguras. e se você está se sentindo criativo, você pode encontrar muitos outros aplicativos de fotos na Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Gerenciador de fotos Shotwell';

  @override
  String get photoSlideGimp => 'Editor de imagens GIMP';

  @override
  String get photoSlideShotcut => 'Editor de vídeos Shotcut';

  @override
  String get webSlideTitle => 'Aproveite ao máximo a web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE incluí Firefox,o navegador web usado por milhões de pessoas pelo mundo.e aplicativos web que você usa frequentemente (como Facebook ou Gmail, por exemplo) podem ser fixados na sua área de trabalho para acessa-lo mais rápido,assim como aplicativos no seu computador.';
  }

  @override
  String get webSlideFirefox => 'Navegador web Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Tudo que você precisa no seu escritório';

  @override
  String get officeSlideDescription => 'O LibreOffice é uma suite de escritório livre com tudo o que precisa para criar documentos, folhas de cálculo e apresentações. Compatível com formatos de ficheiros Microsoft Office, dá-lhe todas as funcionalidades de que necessita.';

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
    return 'No centro da filosofia $RELEASE está a crença de que a informática é para todos. Com ferramentas avançadas de acessibilidade e opções para mudar o idioma, cores e tamanho do texto, o $RELEASE torna a computação fácil - quem quer que seja e onde quer que esteja.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Opções de personalização';

  @override
  String get accessSlideAppearance => 'Aparência';

  @override
  String get accessSlideAssistiveTechnologies => 'Tecnologias de assistência';

  @override
  String get accessSlideLanguageSupport => 'Suporte de idioma';

  @override
  String get supportSlideTitle => 'Ajuda e suporte';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'A documentação oficial abrange muitos dos aspetos mais comuns do $RELEASE. Está disponível <a href=\"https://help.ubuntu.com\">online</a> e por meio do ícone de Ajuda no doca.';
  }

  @override
  String get supportSlideQuestions => 'No <a href=\"https://askubuntu.com\">Ask Ubuntu</a> pode fazer perguntas e pesquisar uma coleção impressionante de perguntas já respondidas. O suporte no seu próprio idioma pode ser fornecido na sua <a href=\"https://loco.ubuntu.com/teams\">equipa da comunidade local</a>.';

  @override
  String get supportSlideResources => 'Para indicações de outros recursos úteis, visite o <a href=\"https://www.ubuntu.com/support/community-support\">Suporte da comunidade</a> ou o <a href=\"https://www.ubuntu.com/support\">Suporte comercial</a>.';

  @override
  String get includedSoftware => 'Software incluído';

  @override
  String get availableSoftware => 'Software disponível';

  @override
  String get supportedSoftware => 'Software suportado';

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
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test Connection';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryAdminLabel => 'Domain Administrator';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';
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
    return '<font color=\"$color\">Atenção</font>: O computador não está conectado a uma fonte de energia.';
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
    return '<font color=\"$color\">Atenção</font>: Se você perder esta chave de segurança, todos os dados estarão perdidos. Se precisar, anote sua chave no papel e coloque-a em um local seguro.';
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
  String get tooManyPrimaryPartitions => 'Há partições primárias demais';

  @override
  String get partitionLimitReached => 'limite atingido';

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
  String get officeSlideDescription => 'LibreOffice é um pacote de office gratuito com tudo o que você precisa para criar documentos, planilhas e apresentações. Compatível com os formatos de arquivos do Microsoft Office, que tem todas as funcionalidades que você precisa e sem custo.';

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
    return 'No coração da filosofia do $RELEASE está a crença de que a computação é para todos. Com ferramentas avançadas de acessibilidade e opções para mudar o idioma, esquema de cores e tamanho de letra, $RELEASE torna a computação fácil — quem quer que você seja e onde quer que você esteja.';
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
}
