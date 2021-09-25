


import 'ubuntu_localizations.dart';

/// The translations for Occitan (`oc`).
class UbuntuLocalizationsOc extends UbuntuLocalizations {
  UbuntuLocalizationsOc([String locale = 'oc']) : super(locale);

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

/// The translations for Occitan, as used in France (`oc_FR`).
class UbuntuLocalizationsOcFr extends UbuntuLocalizationsOc {
  UbuntuLocalizationsOcFr(): super('oc_FR');

  @override
  String get languageName => 'Occitan';

  @override
  String get backAction => 'Tornar';

  @override
  String get continueAction => 'Contunhar';
}
