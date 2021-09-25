


import 'ubuntu_localizations.dart';

/// The translations for Italian (`it`).
class UbuntuLocalizationsIt extends UbuntuLocalizations {
  UbuntuLocalizationsIt([String locale = 'it']) : super(locale);

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

/// The translations for Italian, as used in Italy (`it_IT`).
class UbuntuLocalizationsItIt extends UbuntuLocalizationsIt {
  UbuntuLocalizationsItIt(): super('it_IT');

  @override
  String get languageName => 'Italiano';

  @override
  String get backAction => 'Torna indietro';

  @override
  String get continueAction => 'Continua';
}
