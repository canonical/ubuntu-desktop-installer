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
}
