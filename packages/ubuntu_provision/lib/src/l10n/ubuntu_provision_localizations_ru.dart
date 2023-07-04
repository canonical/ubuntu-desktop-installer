import 'ubuntu_provision_localizations.dart';

/// The translations for Russian (`ru`).
class UbuntuProvisionLocalizationsRu extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get timezonePageTitle => 'Выберите свой часовой пояс';

  @override
  String get timezoneLocationLabel => 'Место нахождения';

  @override
  String get timezoneTimezoneLabel => 'Часовой пояс';
}
