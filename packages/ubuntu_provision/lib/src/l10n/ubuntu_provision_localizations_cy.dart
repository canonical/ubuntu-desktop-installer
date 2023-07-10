import 'ubuntu_provision_localizations.dart';

/// The translations for Welsh (`cy`).
class UbuntuProvisionLocalizationsCy extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsCy([String locale = 'cy']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Lleoliad';

  @override
  String get timezoneTimezoneLabel => 'Cylchfa amser';

  @override
  String get keyboardTitle => 'Cynllun bysellfwrdd';

  @override
  String get keyboardHeader => 'Dewiswch gynllun eich bysellfwrdd:';

  @override
  String get keyboardTestHint => 'Teipiwch yma i brofi\'ch bysellfwrdd';

  @override
  String get keyboardDetectTitle => 'Canfod Cynllun Bysellfwrdd';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Pwyswch un o\'r bysellau canlynol:';

  @override
  String get keyboardKeyPresentLabel => 'Ydy\'r fysell ganlynol yn bresennol ar eich bysellfwrdd?';

  @override
  String get themePageTitle => 'Choose your theme';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Tywyll';

  @override
  String get themeLight => 'Golau';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Dewiswch eich iaith:';

  @override
  String get identityPageTitle => 'Pwy ydych chi?';

  @override
  String get identityAutoLogin => 'Mewngofnodi\'n awtomatig';

  @override
  String get identityRequirePassword => 'Gofyn am fy nghyfrinair i fewngofnodi';

  @override
  String get identityRealNameLabel => 'Eich enw';

  @override
  String get identityRealNameRequired => 'A name is required';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'Enw eich cyfrifiadur';

  @override
  String get identityHostnameInfo => 'Yr enw a ddefnydir pan yn cyfathrebu a chyfrifiaduron eraill.';

  @override
  String get identityHostnameRequired => 'A computer name is required';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'The computer name is invalid';

  @override
  String get identityUsernameLabel => 'Dewiswch enw defnyddiwr';

  @override
  String get identityUsernameRequired => 'A username is required';

  @override
  String get identityInvalidUsername => 'The username is invalid';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'Dewiswch gyfrinair';

  @override
  String get identityPasswordRequired => 'A password is required';

  @override
  String get identityConfirmPasswordLabel => 'Cadarnhewch eich cyfrinair';

  @override
  String get identityPasswordMismatch => 'Nid yw\'r cyfrineiriau yn cyd-fynd';

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
