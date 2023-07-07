import 'ubuntu_provision_localizations.dart';

/// The translations for Malayalam (`ml`).
class UbuntuProvisionLocalizationsMl extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'കീബോർഡിന്റെ ക്രമീകരണം';

  @override
  String get keyboardHeader => 'നിങ്ങളുടെ കീബോർഡിന്റെ ക്രമീകരണം തിരഞ്ഞെടുക്കുക:';

  @override
  String get keyboardTestHint => 'നിങ്ങളുടെ കീബോർഡ് പരിശോധിക്കാൻ ഇവിടെ ടൈപ്പ് ചെയ്യുക';

  @override
  String get keyboardDetectTitle => 'കീബോർഡിന്റെ ക്രമീകരണം കണ്ടുപിടിക്കുക';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'ഈ കീകളിൽ ഒന്ന് അമർത്തുക:';

  @override
  String get keyboardKeyPresentLabel => 'നിങ്ങളുടെ കീബോർഡിൽ ഈ കീ നിലവിലുണ്ടോ?';
}
