


import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Instalador do Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instalar o Ubuntu';
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
  String get tryOrInstallPageTitle => 'Experimentar ou instalar';

  @override
  String get repairInstallation => 'Reparar instalação';

  @override
  String get repairInstallationDescription => 'A reparação reinstalará todos os softwares instalados sem alterar documentos ou configurações.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Experimentar o Ubuntu';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Pode experimentar o Ubuntu sem fazer nenhuma alteração no seu computador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar o Ubuntu';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar o Ubuntu ao lado do (ou em substituição ao) seu sistema operativo atual. Isto não deve demorar muito.';
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
  String get chooseSecurityKeyTitle => 'Choose a security key';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of $RELEASE will not be encrypted.';
  }

  @override
  String get chooseSecurityKeyHint => 'Choose a security key';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirm the security key';

  @override
  String get chooseSecurityKeyRequired => 'A security key is required';

  @override
  String get chooseSecurityKeyMismatch => 'The security keys do not match';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Tipo de installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Este computador possui $os atualmente instalado. O que deseja fazer?';
  }

  @override
  String get installationTypeNoOSDetected => 'Este computador não possui sistemas operacionais detectados atualmente. O que deseja fazer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Apagar o disco e instalar o Ubuntu';
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
    return 'Usar LVM com a nova instalação do Ubuntu';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Criptograsfar a nova instalação do Ubuntu para maior segurança';
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
  String get installationTypeAlongsideInfo => 'Documentos, músicas e outros ficheiros pessoais serão mantidos. Poderá selecionar qual sistema operacional usar cada vez que o computador iniciar.';

  @override
  String get installationTypeManual => 'Opção avançada';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Apagar o disco e instalar o Ubuntu';
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
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Escolha um nome de utilizador';

  @override
  String get whoAreYouPageUsernameRequired => 'Nome de utilizador é obrigatório';

  @override
  String get whoAreYouPageInvalidUsername => 'O nome de utilizador informado é inválido';

  @override
  String get whoAreYouPagePasswordLabel => 'Escolha uma palavra-passe';

  @override
  String get whoAreYouPagePasswordRequired => 'A palavra-passe é obrigatória';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme a sua palavra-passe';

  @override
  String get whoAreYouPagePasswordMismatch => 'As palavras-passe não correspondem';

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
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partição #$disk${partition} como $format usada para $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partição #$disk${partition} como $format';
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
  String get chooseYourLookPageLightBodyText => 'Tudo está claro e brilhante';

  @override
  String get chooseYourLookPageDarkBodyText => 'Olá, escuridão, minha velha amiga';

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
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para obter instruções, abra esta página num telefone ou outro aparelho: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar no Windows';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get appTitle => 'Instalador do Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Instalar o Ubuntu';
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
  String get tryOrInstallPageTitle => 'Experimentar ou instalar';

  @override
  String get repairInstallation => 'Reparar instalação';

  @override
  String get repairInstallationDescription => 'A reparação reinstalará todos os softwares instalados sem alterar documentos ou configurações.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Experimentar o Ubuntu';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Você pode experimentar o Ubuntu sem fazer nenhuma alteração no seu computador.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Instalar o Ubuntu';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Instalar o Ubuntu ao lado do (ou em substituição ao) seu sistema operacional atual. Isto não deve demorar muito.';
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
  String get dontInstallDriverSoftwareNowDescription => 'Você pode instalar depois pelo Programas & Atualizações.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Chave de segurança é obrigatória';

  @override
  String get secureBootSecurityKeysDontMatch => 'Chaves de segurança não correspondem';

  @override
  String get updatesOtherSoftwarePageTitle => 'Atualizações e outros softwares';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quais apps você gostaria de instalar para começar?';

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
  String get installationTypeTitle => 'Tipo de installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Este computador possui $os atualmente instalado. O que você deseja fazer?';
  }

  @override
  String get installationTypeNoOSDetected => 'Este computador não possui sistemas operacionais detectados atualmente. O que você deseja fazer?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Apagar o disco e instalar o Ubuntu';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Aviso:</font> Isso vai apagar todos os seus programas, documentos, fotos, músicas, e quaisquer outrso arquivos em todos os sistemas operacionais existentes.';
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
    return 'Usar LVM com a nova instalação do Ubuntu';
  }

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Criptograsfar a nova instalação do Ubuntu para maior segurança';
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
    return '<font color=\"$color\">Aviso:</font> Isso vai apagar todos os programas do $os, documentos, fotos, músicas e quaisquer outros arquivos.';
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
    return 'Você pode criar ou redimensionar partições manualmente ou escolher múltiplas partições para o Ubuntu.';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Apagar o disco e instalar o Ubuntu';
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
  String get partitionFormatFat12 => 'Sistema de arquivos FA12';

  @override
  String get partitionFormatFat16 => 'Sistema de arquivos FA16';

  @override
  String get partitionFormatFat32 => 'Sistema de arquivos FAT32';

  @override
  String get partitionFormatSwap => 'Swap area';

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
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Escolha um nome de usuário';

  @override
  String get whoAreYouPageUsernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get whoAreYouPageInvalidUsername => 'O nome de usuário informado é inválido';

  @override
  String get whoAreYouPagePasswordLabel => 'Escolha uma senha';

  @override
  String get whoAreYouPagePasswordRequired => 'A senha é obrigatória';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirme sua senha';

  @override
  String get whoAreYouPagePasswordMismatch => 'As senhas não correspondem';

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
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partição #$disk${partition} como $format usada para $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partição #$disk${partition} como $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Escolha seu visual';

  @override
  String get chooseYourLookPageHeader => 'Você pode sempre alterar isso depois nas configurações de aparência.';

  @override
  String get chooseYourLookPageDarkSetting => 'Escuro';

  @override
  String get chooseYourLookPageLightSetting => 'Claro';

  @override
  String get chooseYourLookPageLightBodyText => 'Tudo está claro e brilhante';

  @override
  String get chooseYourLookPageDarkBodyText => 'Olá, escuridão, minha velha amiga';

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
  String get turnOffBitlockerDescription => 'Este computador usa criptografia do Windows BitLocker. Você precisa desativar o BitLocker no Windows antes de instalar o Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Para obter instruções, abra esta página em um telefone ou outro dispositivo: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Reiniciar no Windows';
}
