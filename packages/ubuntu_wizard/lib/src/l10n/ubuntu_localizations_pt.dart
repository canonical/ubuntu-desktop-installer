


import 'ubuntu_localizations.dart';

/// The translations for Portuguese (`pt`).
class UbuntuLocalizationsPt extends UbuntuLocalizations {
  UbuntuLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get languageName => '';

  @override
  String get strongPassword => 'Strong password';

  @override
  String get moderatePassword => 'Moderate password';

  @override
  String get weakPassword => 'Weak password';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class UbuntuLocalizationsPtBr extends UbuntuLocalizationsPt {
  UbuntuLocalizationsPtBr(): super('pt_BR');

  @override
  String get languageName => 'Português do Brasil';
}
