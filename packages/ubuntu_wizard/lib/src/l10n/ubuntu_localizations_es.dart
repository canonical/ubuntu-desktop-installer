


import 'ubuntu_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class UbuntuLocalizationsEs extends UbuntuLocalizations {
  UbuntuLocalizationsEs([String locale = 'es']) : super(locale);

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


}
