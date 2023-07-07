import 'ubuntu_provision_localizations.dart';

/// The translations for German (`de`).
class UbuntuProvisionLocalizationsDe extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get timezonePageTitle => 'Wählen Sie Ihre Zeitzone aus';

  @override
  String get timezoneLocationLabel => 'Standort';

  @override
  String get timezoneTimezoneLabel => 'Zeitzone';

  @override
  String get keyboardTitle => 'Tastaturbelegung';

  @override
  String get keyboardHeader => 'Wählen Sie Ihre Tastaturbelegung aus:';

  @override
  String get keyboardTestHint => 'Geben Sie hier etwas ein, um Ihre Tastaturbelegung zu überprüfen';

  @override
  String get keyboardDetectTitle => 'Tastaturbelegung erkennen';

  @override
  String get keyboardDetectButton => 'Erkennen';

  @override
  String get keyboardVariantLabel => 'Tastaturvariante:';

  @override
  String get keyboardPressKeyLabel => 'Bitte drücken Sie eine der folgenden Tasten:';

  @override
  String get keyboardKeyPresentLabel => 'Ist die folgende Taste auf Ihrer Tastatur vorhanden?';

  @override
  String get themePageTitle => 'Wählen Sie Ihr Thema aus';

  @override
  String get themePageHeader => 'Sie können dies später in den Einstellungen für das Erscheinungsbild jederzeit ändern.';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeLight => 'Hell';
}
