


import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Sair';

  @override
  String get finishButton => 'Concluir';

  @override
  String get saveButton => 'Salvar';

  @override
  String get setupButton => 'Configurar';

  @override
  String get selectLanguageTitle => 'Selecione seu idioma';

  @override
  String get profileSetupTitle => 'Configurar perfil';

  @override
  String get profileSetupHeader => 'Por favor crie a sua conta UNIX padrão. Para mais informações visite: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Seu nome';

  @override
  String get profileSetupRealnameRequired => 'Um nome é necessário';

  @override
  String get profileSetupUsernameHint => 'Escolha um nome de usuário';

  @override
  String get profileSetupUsernameHelper => 'O nome de usuário não precisa ser igual ao Windows.';

  @override
  String get profileSetupPasswordHint => 'Escolha uma senha';

  @override
  String get profileSetupConfirmPasswordHint => 'Confirme a senha';

  @override
  String get profileSetupShowAdvancedOptions => 'Mostrar opções avançadas na próxima página';

  @override
  String get profileSetupPasswordMismatch => 'As senhas não correspondem';

  @override
  String get profileSetupUsernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get profileSetupUsernameInvalid => 'O nome de usuário é inválido';

  @override
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'Senha é obrigatória';

  @override
  String get advancedSetupTitle => 'Configurações avançadas';

  @override
  String get advancedSetupHeader => 'Nessa página você pode ajustar o Ubuntu WSL de acordo com suas necessidades.';

  @override
  String get advancedSetupMountLocationHint => 'Ponto de montagem';

  @override
  String get advancedSetupMountLocationHelper => 'Local para montagem automática';

  @override
  String get advancedSetupMountLocationInvalid => 'O local informado é inválido';

  @override
  String get advancedSetupMountOptionHint => 'Opções de montagem';

  @override
  String get advancedSetupMountOptionHelper => 'Opções passadas para a montagem automática';

  @override
  String get advancedSetupHostGenerationTitle => 'Habilitar geração de host';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecione para habilitar re-criação do arquivo /etc/hosts a cada reinicialização do sistema.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Habilitar geração do arquivo resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecione para habilitar re-criação do arquivo /etc/resolv.conf a cada reinicialização do sistema.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Intergração gráfica';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecione para habilitar configuração automática do DISPLAY. É necessário X server de terceiros.';

  @override
  String get configurationUITitle => 'UI de Configuração do Ubuntu WSL (experimental)';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilidade';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Montagem Automática';

  @override
  String get configurationUIAutoMountTitle => 'Habiltar';

  @override
  String get configurationUIAutoMountSubtitle => 'Habilitar o recurso de montagem automática. Esse recurso permite a montagem automática dos drives do Windows no WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Montar /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Habilita a montagem do arquivo /etc/fstab. O arquivo de configuração /etc/fstab contém ???';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes…';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Configuração concluída';

  @override
  String setupCompleteHeader(Object user) {
    return 'Olá $user,\nVocê concluiu a configuração com sucesso.';
  }

  @override
  String get setupCompleteUpdate => 'Recomendamos rodar os seguintes commandos para atualizar o Ubuntu para a última versão:';

  @override
  String get setupCompleteRestart => '* Todas as configurações serão aplicadas após reiniciar o Ubuntu.';

  @override
  String get welcome => 'Welcome to Ubuntu WSL';

  @override
  String get initializing => 'Initializing...';

  @override
  String get unpacking => 'Unpacking the distro';

  @override
  String get installing => 'Almost done. The installer will require your attention soon.';

  @override
  String get launching => 'Launching distro...';

  @override
  String get errorMsg => 'Something went wrong.';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get errorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get done => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get exitTitle => 'Are you sure you want to leave?';

  @override
  String get exitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get customExitTitle => 'We are almost done';

  @override
  String get customExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Leave';

  @override
  String get cancel => 'Cancel';

  @override
  String get ubuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get ubuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get ubuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get ubuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get ubuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get findOutMore => 'Find out more';

  @override
  String get findOutMoreVisit => 'Visit ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Sair';

  @override
  String get finishButton => 'Concluir';

  @override
  String get saveButton => 'Salvar';

  @override
  String get setupButton => 'Configurar';

  @override
  String get selectLanguageTitle => 'Selecione seu idioma';

  @override
  String get profileSetupTitle => 'Configurar perfil';

  @override
  String get profileSetupHeader => 'Por favor crie a sua conta UNIX padrão. Para mais informações visite: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Seu nome';

  @override
  String get profileSetupRealnameRequired => 'Um nome é necessário';

  @override
  String get profileSetupUsernameHint => 'Escolha um nome de usuário';

  @override
  String get profileSetupUsernameHelper => 'O nome de usuário não precisa ser igual ao Windows.';

  @override
  String get profileSetupPasswordHint => 'Escolha uma senha';

  @override
  String get profileSetupConfirmPasswordHint => 'Confirme a senha';

  @override
  String get profileSetupShowAdvancedOptions => 'Mostrar opções avançadas na próxima página';

  @override
  String get profileSetupPasswordMismatch => 'As senhas não correspondem';

  @override
  String get profileSetupUsernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get profileSetupUsernameInvalid => 'O nome de usuário é inválido';

  @override
  String get profileSetupUsernameInUse => 'Esse nome de usuário já existe.';

  @override
  String get profileSetupUsernameSystemReserved => 'Esse nome de usuário é reservadopara uso do sistema.';

  @override
  String get profileSetupUsernameTooLong => 'Esse nome de usuário é muito longo.';

  @override
  String get profileSetupUsernameInvalidChars => 'Esse nome de usuário contém caracteres inválidos.';

  @override
  String get profileSetupPasswordRequired => 'Senha é obrigatória';

  @override
  String get advancedSetupTitle => 'Configurações avançadas';

  @override
  String get advancedSetupHeader => 'Nessa página você pode ajustar o Ubuntu WSL de acordo com suas necessidades.';

  @override
  String get advancedSetupMountLocationHint => 'Ponto de montagem';

  @override
  String get advancedSetupMountLocationHelper => 'Local para montagem automática';

  @override
  String get advancedSetupMountLocationInvalid => 'O local informado é inválido';

  @override
  String get advancedSetupMountOptionHint => 'Opções de montagem';

  @override
  String get advancedSetupMountOptionHelper => 'Opções passadas para a montagem automática';

  @override
  String get advancedSetupHostGenerationTitle => 'Habilitar geração de host';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecione para habilitar re-criação do arquivo /etc/hosts a cada reinicialização do sistema.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Habilitar geração do arquivo resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecione para habilitar re-criação do arquivo /etc/resolv.conf a cada reinicialização do sistema.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Intergração gráfica';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecione para habilitar configuração automática do DISPLAY. É necessário X server de terceiros.';

  @override
  String get configurationUITitle => 'Configuração Avançada do Ubuntu WSL';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilidade';

  @override
  String get configurationUIInteroperabilityTitle => 'Habilitado';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Habilitar interoperabilidade.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Adicionar Windows \"Path\"';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Adicionar o conteúdo da variável de ambiente \"Path\" do Windows à PATH no WSL';

  @override
  String get configurationUIAutoMountHeader => 'Montagem Automática';

  @override
  String get configurationUIAutoMountTitle => 'Habiltar';

  @override
  String get configurationUIAutoMountSubtitle => 'Habilitar o recurso de montagem automática. Esse recurso permite a montagem automática dos drives do Windows no WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Montar /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Habilita a montagem do arquivo /etc/fstab. Esse arquivo contém informações sobre os sistemas de arquivos que o sistema irá montar.';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Habilitado';

  @override
  String get configurationUISystemdSubtitle => 'Ativar o systemd durante o boot. ATENÇÃO: Esse recurso é experimental.';

  @override
  String get applyingChanges => 'Aplicando as alterações…';

  @override
  String get applyingChangesDisclaimer => 'Isso pode levar vários minutos dependendo da sua conexão com a Internet.';

  @override
  String get setupCompleteTitle => 'Configuração concluída';

  @override
  String setupCompleteHeader(Object user) {
    return 'Olá $user,\nVocê concluiu a configuração com sucesso.';
  }

  @override
  String get setupCompleteUpdate => 'Recomendamos rodar os seguintes commandos para atualizar o Ubuntu para a última versão:';

  @override
  String get setupCompleteRestart => '* Todas as configurações serão aplicadas após reiniciar o Ubuntu.';
}
