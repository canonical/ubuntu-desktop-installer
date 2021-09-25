


import 'ubuntu_localizations.dart';

/// The translations for Russian (`ru`).
class UbuntuLocalizationsRu extends UbuntuLocalizations {
  UbuntuLocalizationsRu([String locale = 'ru']) : super(locale);

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

/// The translations for Russian, as used in Russian Federation (`ru_RU`).
class UbuntuLocalizationsRuRu extends UbuntuLocalizationsRu {
  UbuntuLocalizationsRuRu(): super('ru_RU');

  @override
  String get languageName => 'Русский';

  @override
  String get backAction => 'Назад';

  @override
  String get continueAction => 'Продолжить';
}
