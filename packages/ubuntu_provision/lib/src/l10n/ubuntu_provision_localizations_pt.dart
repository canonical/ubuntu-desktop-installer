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
}
