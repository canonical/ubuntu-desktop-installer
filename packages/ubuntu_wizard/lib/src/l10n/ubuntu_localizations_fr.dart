


import 'ubuntu_localizations.dart';

/// The translations for French (`fr`).
class UbuntuLocalizationsFr extends UbuntuLocalizations {
  UbuntuLocalizationsFr([String locale = 'fr']) : super(locale);

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

/// The translations for French, as used in France (`fr_FR`).
class UbuntuLocalizationsFrFr extends UbuntuLocalizationsFr {
  UbuntuLocalizationsFrFr(): super('fr_FR');

  @override
  String get languageName => 'Français';

  @override
  String get backAction => 'Retour';

  @override
  String get continueAction => 'Continuer';
}
