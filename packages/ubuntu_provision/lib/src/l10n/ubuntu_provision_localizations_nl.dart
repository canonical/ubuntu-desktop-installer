import 'ubuntu_provision_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class UbuntuProvisionLocalizationsNl extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'Toetsenbordindeling';

  @override
  String get keyboardHeader => 'Kies uw toetsenbordindeling:';

  @override
  String get keyboardTestHint => 'Type hieronder om het toetsenbord te testen';

  @override
  String get keyboardDetectTitle => 'Toetsenbordindeling bepalen';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Please press one of the following keys:';

  @override
  String get keyboardKeyPresentLabel => 'Is the following key present on your keyboard?';
}
