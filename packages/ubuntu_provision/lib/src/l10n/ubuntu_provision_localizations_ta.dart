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

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Choose your language:';

  @override
  String get identityPageTitle => 'நீங்கள் யார்?';

  @override
  String get identityAutoLogin => 'தானியங்கியாக உள்நுழையவும்';

  @override
  String get identityRequirePassword => 'உள்நுழைய எனது கடவுச்சொல் தேவை';

  @override
  String get identityRealNameLabel => 'உங்கள் பெயர்';

  @override
  String get identityRealNameRequired => 'ஒரு பெயர் தேவை';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'உங்கள் கணினியின் பெயர்';

  @override
  String get identityHostnameInfo => 'மற்ற கணினிகளுடன் பேசும்போது அது பயன்படுத்தும் பெயர்.';

  @override
  String get identityHostnameRequired => 'கணினி பெயர் தேவை';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'கணினியின் பெயர் தவறானது';

  @override
  String get identityUsernameLabel => 'பயனர்பெயரை தேர்ந்தெடுங்கள்';

  @override
  String get identityUsernameRequired => 'ஒரு பயனர்பெயர் தேவை';

  @override
  String get identityInvalidUsername => 'பயனர்பெயர் தவறானது';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'கடவுச்சொல்லை தேர்வு செய்யவும்';

  @override
  String get identityPasswordRequired => 'கடவுச்சொல் தேவை';

  @override
  String get identityConfirmPasswordLabel => 'உங்கள் கடவுச்சொல்லை உறுதிப்படுத்தவும்';

  @override
  String get identityPasswordMismatch => 'கடவுச்சொற்கள் பொருந்தவில்லை';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';
}
