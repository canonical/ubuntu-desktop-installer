


import 'ubuntu_localizations.dart';

/// The translations for English (`en`).
class UbuntuLocalizationsEn extends UbuntuLocalizations {
  UbuntuLocalizationsEn([String locale = 'en']) : super(locale);

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

/// The translations for English, as used in the United States (`en_US`).
class UbuntuLocalizationsEnUs extends UbuntuLocalizationsEn {
  UbuntuLocalizationsEnUs(): super('en_US');

  @override
  String get languageName => 'English';

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
