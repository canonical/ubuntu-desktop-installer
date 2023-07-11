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

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test domain connectivity';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domain not found';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';

  @override
  String get activeDirectoryErrorTitle => 'Error configuring connection to Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';

  @override
  String get networkPageTitle => 'Connect to a network';

  @override
  String get networkPageHeader => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by Ethernet cable, or choose a Wi-Fi network';

  @override
  String get networkWiredOption => 'Use wired connection';

  @override
  String get networkWiredNone => 'No wired connection detected';

  @override
  String get networkWiredOff => 'Wired connection is turned off';

  @override
  String get networkWiredDisabled => 'To use Ethernet on this computer, a wired connection must be enabled';

  @override
  String get networkWiredEnable => 'Enable wired';

  @override
  String get networkWifiOption => 'Connect to a Wi-Fi network';

  @override
  String get networkWifiOff => 'Wireless networking disabled';

  @override
  String get networkWifiNone => 'No Wi-Fi devices detected';

  @override
  String get networkWifiDisabled => 'To use Wi-Fi on this computer, wireless networking must be enabled';

  @override
  String get networkWifiEnable => 'Enable Wi-Fi';

  @override
  String get networkHiddenWifiOption => 'Connect to a hidden Wi-Fi network';

  @override
  String get networkHiddenWifiNameLabel => 'Network name';

  @override
  String get networkHiddenWifiNameRequired => 'A network name is required';

  @override
  String get networkNoneOption => 'I don\'t want to connect to the internet just now';
}
