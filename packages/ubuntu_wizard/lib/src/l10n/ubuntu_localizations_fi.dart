


import 'ubuntu_localizations.dart';

/// The translations for Finnish (`fi`).
class UbuntuLocalizationsFi extends UbuntuLocalizations {
  UbuntuLocalizationsFi([String locale = 'fi']) : super(locale);

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

/// The translations for Finnish, as used in Finland (`fi_FI`).
class UbuntuLocalizationsFiFi extends UbuntuLocalizationsFi {
  UbuntuLocalizationsFiFi(): super('fi_FI');

  @override
  String get languageName => 'Suomi';

  @override
  String get backAction => 'Takaisin';

  @override
  String get continueAction => 'Jatka';

  @override
  String get strongPassword => 'Vahva salasana';

  @override
  String get moderatePassword => 'Kohtalainen salasana';

  @override
  String get weakPassword => 'Heikko salasana';
}
