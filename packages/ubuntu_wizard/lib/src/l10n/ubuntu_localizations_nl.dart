


import 'ubuntu_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class UbuntuLocalizationsNl extends UbuntuLocalizations {
  UbuntuLocalizationsNl([String locale = 'nl']) : super(locale);

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

/// The translations for Dutch Flemish, as used in Netherlands (`nl_NL`).
class UbuntuLocalizationsNlNl extends UbuntuLocalizationsNl {
  UbuntuLocalizationsNlNl(): super('nl_NL');

  @override
  String get languageName => 'Nederlands';

  @override
  String get backAction => 'Terug';

  @override
  String get continueAction => 'Volgende';
}
