


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
