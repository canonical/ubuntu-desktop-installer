


import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Desktop Installer';

  @override
  String get windowTitle => 'Install Ubuntu';

  @override
  String get cancelButtonText => 'Cancel';

  @override
  String get changeButtonText => 'Change';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'No';

  @override
  String get restartButtonText => 'Restart';

  @override
  String get revertButtonText => 'Revert';

  @override
  String get yesButtonText => 'Yes';

  @override
  String get welcome => 'Welcome';

  @override
  String get tryOrInstallPageTitle => 'Try or install';

  @override
  String get repairInstallation => 'Repair installation';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String get tryUbuntu => 'Try Ubuntu';

  @override
  String get tryUbuntuDescription => 'You can try Ubuntu without making any changes to your computer.';

  @override
  String get installUbuntu => 'Install Ubuntu';

  @override
  String get installUbuntuDescription => 'Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.';

  @override
  String releaseNotesLabel(Object url) {
    return 'You may wish to read the <a href=\"$url\">release notes</a>.';
  }

  @override
  String get turnOffRST => 'Turn off RST';

  @override
  String get turnOffRSTDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Keyboard layout';

  @override
  String get chooseYourKeyboardLayout => 'Choose your keyboard layout:';

  @override
  String get typeToTest => 'Type here to test your keyboard';

  @override
  String get detectLayout => 'Detect Keyboard Layout';

  @override
  String get pressOneKey => 'Please press one of the following keys:';

  @override
  String get isKeyPresent => 'Is the following key present on your keyboard?';

  @override
  String get configureSecureBootTitle => 'Configure Secure Boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Configure Secure Boot';

  @override
  String get chooseSecurityKey => 'Choose a security key';

  @override
  String get confirmSecurityKey => 'Confirm the security key';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Security key is required';

  @override
  String get secureBootSecurityKeysDontMatch => 'Security keys do not match';

  @override
  String get updatesOtherSoftwarePageTitle => 'Updates and other software';

  @override
  String get updatesOtherSoftwarePageDescription => 'What apps would you like to install to start with?';

  @override
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Web browser, utilities, office software, games and media players.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

  @override
  String get minimalInstallationSubtitle => 'Web browser and basic utilities.';

  @override
  String get otherOptions => 'Other options';

  @override
  String get installThirdPartyTitle => 'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String get installationTypeTitle => 'Installation type';

  @override
  String installationTypeOSDetected(Object os) {
    return 'This computer currently has $os on it. What would you like to do?';
  }

  @override
  String get installationTypeNoOSDetected => 'This computer currently has no detected operating systems. What would you like to do?';

  @override
  String get installationTypeErase => 'Erase disk and install Ubuntu';

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Advanced Features...';

  @override
  String get installationTypeAdvancedTitle => 'Advanced features';

  @override
  String get installationTypeNone => 'None';

  @override
  String get installationTypeNoneSelected => 'None selected';

  @override
  String get installationTypeLVM => 'Use LVM with the new Ubuntu installation';

  @override
  String get installationTypeLVMSelected => 'LVM selected';

  @override
  String get installationTypeEncrypt => 'Encrypt the new Ubuntu installation for security';

  @override
  String get installationTypeEncryptInfo => 'You will choose a security key in the next step.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selected';

  @override
  String installationTypeReinstall(Object os) {
    return 'Erase $os and reinstall';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Warning:</font> This will delete all your $os programs, documents, photos, music, and any other files.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Install $product alongside $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Something else';

  @override
  String get installationTypeManualInfo => 'You can create or resize partitions yourself, or choose multiple partitions for Ubuntu';

  @override
  String get selectGuidedStoragePageTitle => 'Erase disk and install Ubuntu';

  @override
  String get selectGuidedStorageDropdownLabel => 'Select drive:';

  @override
  String get selectGuidedStorageInfoLabel => 'The entire disk will be used:';

  @override
  String get selectGuidedStorageInstallNow => 'Install Now';

  @override
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'Start Installing';

  @override
  String get diskHeadersDevice => 'Device';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Mount point';

  @override
  String get diskHeadersSize => 'Size';

  @override
  String get diskHeadersUsed => 'Used';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'free space';

  @override
  String get newPartitionTable => 'New partition table';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => 'Edit partition';

  @override
  String get partitionSizeLabel => 'Size:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Type for the new partition:';

  @override
  String get partitionTypePrimary => 'Primary';

  @override
  String get partitionTypeLogical => 'Logical';

  @override
  String get partitionLocationLabel => 'Location for the new partition:';

  @override
  String get partitionLocationBeginning => 'Beginning of this space';

  @override
  String get partitionLocationEnd => 'End of this space';

  @override
  String get partitionFormatLabel => 'Used as:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Ext2 file system';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT file system';

  @override
  String get partitionFormatFat12 => 'FAT12 file system';

  @override
  String get partitionFormatFat16 => 'FAT16 file system';

  @override
  String get partitionFormatFat32 => 'FAT32 file system';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 file system';

  @override
  String get partitionFormatVfat => 'VFAT file system';

  @override
  String get partitionFormatNtfs => 'NTFS file system';

  @override
  String get partitionFormatReiserFS => 'ReiserFS file system';

  @override
  String get partitionFormatZfsroot => 'ZFS root file system';

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Mount point:';

  @override
  String get whoAreYouPageTitle => 'Who are you?';

  @override
  String get whoAreYouPageAutoLogin => 'Log in automatically';

  @override
  String get whoAreYouPageRequirePassword => 'Require my password to log in';

  @override
  String get whoAreYouPageRealNameLabel => 'Your name';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageComputerNameLabel => 'Your computer\'s name';

  @override
  String get whoAreYouPageComputerNameInfo => 'The name it uses when it talks to other computers.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A computer name is required';

  @override
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Pick a username';

  @override
  String get whoAreYouPageUsernameRequired => 'A username is required';

  @override
  String get whoAreYouPageInvalidUsername => 'The username is invalid';

  @override
  String get whoAreYouPagePasswordLabel => 'Choose a password';

  @override
  String get whoAreYouPagePasswordRequired => 'A password is required';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirm your password';

  @override
  String get whoAreYouPagePasswordMismatch => 'The passwords do not match';

  @override
  String get writeChangesToDisk => 'Write changes to disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'The following partitions are going to be formatted:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} as $format used for $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} as $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Choose your look';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Dark';

  @override
  String get chooseYourLookPageLightSetting => 'Light';

  @override
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

  @override
  String get installationCompleteTitle => 'Installation complete';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Shut Down';

  @override
  String get turnOffBitlockerTitle => 'Turn off BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get appTitle => 'Instalador do Ubuntu Desktop';

  @override
  String get windowTitle => 'Instalar o Ubuntu';

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
  String get tryUbuntu => 'Experimentar o Ubuntu';

  @override
  String get tryUbuntuDescription => 'Você pode experimentar o Ubuntu sem fazer nenhuma alteração no seu computador.';

  @override
  String get installUbuntu => 'Instalar o Ubuntu';

  @override
  String get installUbuntuDescription => 'Instalar o Ubuntu ao lado do (ou em substituição ao) seu sistema operacional atual. Isto não deve demorar muito.';

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
  String get installationTypeErase => 'Apagar o disco e instalar o Ubuntu';

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
  String get installationTypeLVM => 'Usar LVM com a nova instalação do Ubuntu';

  @override
  String get installationTypeLVMSelected => 'LVM selecionado';

  @override
  String get installationTypeEncrypt => 'Criptograsfar a nova instalação do Ubuntu para maior segurança';

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
  String get installationTypeManualInfo => 'Você pode criar ou redimensionar partições manualmente ou escolher múltiplas partições para o Ubuntu.';

  @override
  String get selectGuidedStoragePageTitle => 'Apagar o disco e instalar o Ubuntu';

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
