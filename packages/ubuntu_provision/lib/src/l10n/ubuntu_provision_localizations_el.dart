import 'ubuntu_provision_localizations.dart';

/// The translations for Modern Greek (`el`).
class UbuntuProvisionLocalizationsEl extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'Διάταξη πληκτρολογίου';

  @override
  String get keyboardHeader => 'Επιλογή διάταξης πληκτρολογίου:';

  @override
  String get keyboardTestHint => 'Πληκτρολογήστε εδώ για να δοκιμάσετε το πληκτρολόγιό σας';

  @override
  String get keyboardDetectTitle => 'Εντοπισμός διάταξης πληκτρολογίου';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Παρακαλώ πιέστε ένα από τα ακόλουθα πλήκτρα:';

  @override
  String get keyboardKeyPresentLabel => 'Υπάρχει στο πληκτρολόγιό σας το ακόλουθο πλήκτρο;';
}
