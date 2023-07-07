import 'ubuntu_provision_localizations.dart';

/// The translations for Tamil (`ta`).
class UbuntuProvisionLocalizationsTa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'விசைப்பலகை அமைப்பு';

  @override
  String get keyboardHeader => 'உங்களின் விசைப்பலகை அமைப்பைத் தேர்வு செய்யவும்:';

  @override
  String get keyboardTestHint => 'உங்கள் விசைப்பலகையை சோதிக்க இங்கு தட்டச்சு செய்யவும்';

  @override
  String get keyboardDetectTitle => 'விசைப்பலகையின் அமைப்பைக் கண்டறியவும்';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'பின்வரும் விசைகளில் ஒன்றை அழுத்துங்கள்:';

  @override
  String get keyboardKeyPresentLabel => 'பின்வரும் விசை உங்களுடைய தட்டச்சு பலகையில் இருக்கிறதா?';

  @override
  String get themePageTitle => 'உங்கள் தோற்றத்தை தேர்வு செய்யவும்';

  @override
  String get themePageHeader => 'தோற்ற அமைப்புகளில் இதை எப்போது வேண்டுமானாலும் மாற்றலாம்.';

  @override
  String get themeDark => 'கருமை';

  @override
  String get themeLight => 'Light';
}
