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
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

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
  String get configurationUIInteroperabilitySubtitle => 'Whether the interoperability is enabled.';

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
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Launching distro...';

  @override
  String get installationSlidesErrorMsg => 'Something went wrong.';

  @override
  String get installationSlidesErrorTitle => 'Something went wrong';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'Cancel';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
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
  String installLangPacksTitle(String lang) {
    return 'Instalando pacotes para melhor $lang suporte de linguagem';
  }

  @override
  String get installLangPacksSubtitle => 'não recomendado para conexões lentas.';

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
  String get profileSetupUsernameSystemReserved => 'Esse nome de usuário é reservado para uso do sistema.';

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
  String get configurationUIInteroperabilitySubtitle => 'a interoperabilidade está habilitada.';

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
  String get applyingChangesDisclaimer => 'Isso pode levar vários minutos dependendo da sua conexão com a internet.';

  @override
  String get setupCompleteTitle => 'Configuração concluída';

  @override
  String setupCompleteHeader(Object user) {
    return 'Olá $user,\nVocê completou a configuração com sucesso.';
  }

  @override
  String get setupCompleteUpdate => 'Recomendamos rodar os seguintes commandos para atualizar o Ubuntu para a última versão:';

  @override
  String get setupCompleteRestart => '* Todas as configurações serão aplicadas após reiniciar o Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Bem-vindo ao Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Inicializando...';

  @override
  String get installationSlidesUnpacking => 'Descompactando o distro';

  @override
  String get installationSlidesInstalling => 'Quase pronto. O instalador exigirá sua atenção em breve.';

  @override
  String get installationSlidesLaunching => 'Iniciando distro...';

  @override
  String get installationSlidesErrorMsg => 'Algo deu errado.';

  @override
  String get installationSlidesErrorTitle => 'Algo deu errado';

  @override
  String get installationSlidesErrorSub => 'Por favor, reinicie o WSL com o seguinte comando e tente novamente:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nOcorreu um erro irrecuperável.\n\nPor favor feche este aplicativo, abra o Powershell ou prompt de comandos e execute os seguintes comandos:\n';

  @override
  String get installationSlidesDone => 'Tudo pronto. Aproveite o Ubuntu no WSL';

  @override
  String get installationSlidesExitTitle => 'Você realmente quer sair?';

  @override
  String get installationSlidesExitContents => 'Ao fechar esta janela você não interromperá a instalação que vai continuar em segundo plano..\n\nAlém disso, você pode seguir explorando o que você pode fazer com o Ubuntu no WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Estamos quase terminando';

  @override
  String get installationSlidesCustomExitContents => 'Faltam apenas algumas etapas para concluir na janela principal do instalador.\nPodemos sair daqui e ir até lá?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Sair';

  @override
  String get installationSlidesCancel => 'Cancelar';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu no WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Um ambiente do Ubuntu completo, profundamente integrado com Windows, para facilitar desenvolvimento e execução de aplicativos do Linux. Otimizado para nuvem, web, ciência de dados, IOT e diversão!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL para\nDesenvolvimento Web';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Desenvolva em WSL usando IDEs nativos do Windows, incluindo VS Code e IntelliJ e aproveite o suporte total do NodeJS e Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL para Ciência de Dados';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'O Data Science Stack da NVIDIA permite maximizar o desempenho dos projetos de Ciência de Dados e Aprendizagem Automática em cima dos drivers nativos da NVIDIA do Windows.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL para\nAplicativos Gráficos';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Desenvolve e visualize aplicativos web e gráficos no Linux usando WSLg para desenvolvimento multiplataforma.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL para DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Assegure a compatibilidade do CI/CD pipeline, desenvolvendo localmente no Ubuntu WSL antes de publicar num ambiente de produção do Ubuntu';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL para Empresas';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Capacite os desenvolvedores num ecossistema empresarial do Windows\ncom um certificado do\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Saiba mais';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visite ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' para saber mais sobre Ubuntu no WSL e como o Canonical apóia desenvolvedores e organizações.';
}
