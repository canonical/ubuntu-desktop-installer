


import 'ubuntu_localizations.dart';

/// The translations for Portuguese (`pt`).
class UbuntuLocalizationsPt extends UbuntuLocalizations {
  UbuntuLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get countryCode => 'PT';

  @override
  String get languageName => 'Português';

  @override
  String get backAction => 'Go Back';

  @override
  String get continueAction => 'Continue';

  @override
  String get strongPassword => 'Strong password';

  @override
  String get fairPassword => 'Fair password';

  @override
  String get goodPassword => 'Good password';

  @override
  String get weakPassword => 'Weak password';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class UbuntuLocalizationsPtBr extends UbuntuLocalizationsPt {
  UbuntuLocalizationsPtBr(): super('pt_BR');

  @override
  String get countryCode => 'BR';

  @override
  String get languageName => 'Português do Brasil';

  @override
  String get backAction => 'Voltar';

  @override
  String get continueAction => 'Continuar';

  @override
  String get strongPassword => 'Senha forte';

  @override
  String get fairPassword => 'Senha justa';

  @override
  String get goodPassword => 'Senha boa';

  @override
  String get weakPassword => 'Senha fraca';
}
