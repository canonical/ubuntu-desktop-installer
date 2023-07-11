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

  @override
  String get themePageTitle => 'നിങ്ങളുടെ രൂപം തിരഞ്ഞെടുക്കുക';

  @override
  String get themePageHeader => 'രൂപഭാവ ക്രമീകരണങ്ങളിൽ നിങ്ങൾക്ക് ഇത് പിന്നീട് എപ്പോൾ വേണമെങ്കിലും മാറ്റാവുന്നതാണ്.';

  @override
  String get themeDark => 'ഇരുട്ട്';

  @override
  String get themeLight => 'വെളിച്ചം';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Choose your language:';

  @override
  String get identityPageTitle => 'നിങ്ങൾ ആരാണ്?';

  @override
  String get identityAutoLogin => 'സ്വയമേവ ലോഗിൻ ചെയ്യുക';

  @override
  String get identityRequirePassword => 'ലോഗിൻ ചെയ്യാൻ എന്റെ പാസ്‌വേഡ് ആവശ്യപ്പെടുക';

  @override
  String get identityRealNameLabel => 'താങ്കളുടെ പേര്';

  @override
  String get identityRealNameRequired => 'ഒരു പേര് ആവശ്യമാണ്';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'നിങ്ങളുടെ കമ്പ്യൂട്ടറിന്റെ പേര്';

  @override
  String get identityHostnameInfo => 'മറ്റ് കമ്പ്യൂട്ടറുകളുമായി സംസാരിക്കുമ്പോൾ അത് ഉപയോഗിക്കുന്ന പേര്.';

  @override
  String get identityHostnameRequired => 'ഒരു കമ്പ്യൂട്ടറിന്റെ പേര് ആവശ്യമാണ്';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'കമ്പ്യൂട്ടറിന്റെ പേര് അസാധുവാണ്';

  @override
  String get identityUsernameLabel => 'ഒരു യൂസർനെയിം തിരഞ്ഞെടുക്കുക';

  @override
  String get identityUsernameRequired => 'ഒരു യൂസർനെയിം ആവശ്യമാണ്';

  @override
  String get identityInvalidUsername => 'യൂസർനെയിം അസാധുവാണ്';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'ഒരു പാസ്വേഡ് തിരഞ്ഞെടുക്കുക';

  @override
  String get identityPasswordRequired => 'ഒരു പാസ്‌വേഡ് ആവശ്യമാണ്';

  @override
  String get identityConfirmPasswordLabel => 'നിങ്ങളുടെ പാസ്‌വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get identityPasswordMismatch => 'പാസ്‌വേഡുകൾ പൊരുത്തപ്പെടുന്നില്ല';

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
}
