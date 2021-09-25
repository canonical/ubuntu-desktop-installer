


import 'ubuntu_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class UbuntuLocalizationsEs extends UbuntuLocalizations {
  UbuntuLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get languageName => '';

  @override
  String get backAction => 'Go Back';

  @override
  String get continueAction => 'Continue';

  @override
  String get strongPassword => 'Strong password';

  @override
  String get moderatePassword => 'Moderate password';

  @override
  String get weakPassword => 'Weak password';
}

/// The translations for Spanish Castilian, as used in Spain (`es_ES`).
class UbuntuLocalizationsEsEs extends UbuntuLocalizationsEs {
  UbuntuLocalizationsEsEs(): super('es_ES');

  @override
  String get languageName => 'Español';

  @override
  String get backAction => 'Volver';

  @override
  String get continueAction => 'Continuar';
}
