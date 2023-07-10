import 'ubuntu_provision_localizations.dart';

/// The translations for Portuguese (`pt`).
class UbuntuProvisionLocalizationsPt extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get timezonePageTitle => 'Selecione o seu fuso-horário';

  @override
  String get timezoneLocationLabel => 'Localização';

  @override
  String get timezoneTimezoneLabel => 'Fuso horário';

  @override
  String get keyboardTitle => 'Disposição do teclado';

  @override
  String get keyboardHeader => 'Escolha a disposição do seu teclado:';

  @override
  String get keyboardTestHint => 'Digite aqui para testar o seu teclado';

  @override
  String get keyboardDetectTitle => 'Detetar a disposição do teclado';

  @override
  String get keyboardDetectButton => 'Detetar';

  @override
  String get keyboardVariantLabel => 'Variante do teclado:';

  @override
  String get keyboardPressKeyLabel => 'Prima uma das seguintes teclas:';

  @override
  String get keyboardKeyPresentLabel => 'A seguinte tecla está presente no seu teclado?';

  @override
  String get themePageTitle => 'Escolha o seu tema';

  @override
  String get themePageHeader => 'Pode sempre alterar isso depois nas definições de aparência.';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Bem-vindo ao $DISTRO';
  }

  @override
  String get localeHeader => 'Escolha o seu idioma:';

  @override
  String get identityPageTitle => 'Configure a sua conta';

  @override
  String get identityAutoLogin => 'Iniciar sessão automaticamente';

  @override
  String get identityRequirePassword => 'Solicitar minha palavra-passe para entrar';

  @override
  String get identityRealNameLabel => 'O seu nome';

  @override
  String get identityRealNameRequired => 'O nome é obrigatório';

  @override
  String get identityRealNameTooLong => 'Esse nome é demasiado comprido.';

  @override
  String get identityHostnameLabel => 'Nome do seu computador';

  @override
  String get identityHostnameInfo => 'O nome usado para falar com outros computadores.';

  @override
  String get identityHostnameRequired => 'O nome do computador é obrigatório';

  @override
  String get identityHostnameTooLong => 'Esse nome de computador é demasiado comprido.';

  @override
  String get identityInvalidHostname => 'O nome do computador não é válido';

  @override
  String get identityUsernameLabel => 'Escolha um nome de utilizador';

  @override
  String get identityUsernameRequired => 'É obrigatório um nome de utilizador';

  @override
  String get identityInvalidUsername => 'O nome de utilizador é inválido';

  @override
  String get identityUsernameInUse => 'Esse nome de utilizador já existe.';

  @override
  String get identityUsernameSystemReserved => 'Esse nome é reservado para utilização do sistema.';

  @override
  String get identityUsernameTooLong => 'Esse nome é demasiado comprido.';

  @override
  String get identityUsernameInvalidChars => 'Esse nome contém caracteres inválidos.';

  @override
  String get identityPasswordLabel => 'Escolha uma palavra-passe';

  @override
  String get identityPasswordRequired => 'A palavra-passe é obrigatória';

  @override
  String get identityConfirmPasswordLabel => 'Confirme a sua palavra-passe';

  @override
  String get identityPasswordMismatch => 'As palavras-passe não coincidem';

  @override
  String get identityPasswordShow => 'Mostrar';

  @override
  String get identityPasswordHide => 'Ocultar';

  @override
  String get identityActiveDirectoryOption => 'Usar o Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Irá introduzir o domínio e outros detalhes no próximo passo.';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class UbuntuProvisionLocalizationsPtBr extends UbuntuProvisionLocalizationsPt {
  UbuntuProvisionLocalizationsPtBr(): super('pt_BR');

  @override
  String get timezonePageTitle => 'Selecione seu fuso horário';

  @override
  String get timezoneLocationLabel => 'Localização';

  @override
  String get timezoneTimezoneLabel => 'Fuso horário';

  @override
  String get keyboardTitle => 'Layout do teclado';

  @override
  String get keyboardHeader => 'Escolha o layout do seu teclado:';

  @override
  String get keyboardTestHint => 'Digite aqui para testar seu teclado';

  @override
  String get keyboardDetectTitle => 'Detectar o layout do teclado';

  @override
  String get keyboardDetectButton => 'Detectar';

  @override
  String get keyboardVariantLabel => 'Disposição de teclado:';

  @override
  String get keyboardPressKeyLabel => 'Por favor pressione uma das seguintes teclas:';

  @override
  String get keyboardKeyPresentLabel => 'A seguinte tecla está presente no seu teclado?';

  @override
  String get themePageTitle => 'Escolha seu tema';

  @override
  String get themePageHeader => 'Você pode sempre alterar isso depois nas configurações de aparência.';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeLight => 'Claro';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Boas-vindas ao $DISTRO';
  }

  @override
  String get localeHeader => 'Escolha seu idioma:';

  @override
  String get identityPageTitle => 'Configurar sua conta';

  @override
  String get identityAutoLogin => 'Iniciar sessão automaticamente';

  @override
  String get identityRequirePassword => 'Solicitar minha senha para entrar';

  @override
  String get identityRealNameLabel => 'Seu nome';

  @override
  String get identityRealNameRequired => 'O nome é obrigatório';

  @override
  String get identityRealNameTooLong => 'O nome é longo demais.';

  @override
  String get identityHostnameLabel => 'Nome do seu computador';

  @override
  String get identityHostnameInfo => 'O nome usado para falar com outros computadores.';

  @override
  String get identityHostnameRequired => 'O nome do computador é obrigatório';

  @override
  String get identityHostnameTooLong => 'O nome do computador é longo demais.';

  @override
  String get identityInvalidHostname => 'O nome do computador não é válido';

  @override
  String get identityUsernameLabel => 'Escolha um nome de usuário';

  @override
  String get identityUsernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get identityInvalidUsername => 'O nome de usuário informado é inválido';

  @override
  String get identityUsernameInUse => 'Esse nome de usuário já existe.';

  @override
  String get identityUsernameSystemReserved => 'Esse nome é reservado para uso do sistema.';

  @override
  String get identityUsernameTooLong => 'Esse nome é muito comprido.';

  @override
  String get identityUsernameInvalidChars => 'Esse nome contém caracteres inválidos.';

  @override
  String get identityPasswordLabel => 'Escolha uma senha';

  @override
  String get identityPasswordRequired => 'A senha é obrigatória';

  @override
  String get identityConfirmPasswordLabel => 'Confirme sua senha';

  @override
  String get identityPasswordMismatch => 'As senhas não correspondem';

  @override
  String get identityPasswordShow => 'Mostrar';

  @override
  String get identityPasswordHide => 'Ocultar';

  @override
  String get identityActiveDirectoryOption => 'Usar o Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Você inserirá o domínio e outros detalhes na próxima etapa.';
}
