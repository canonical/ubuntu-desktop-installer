


import 'app_localizations.dart';

/// The translations for Nepali (`ne`).
class AppLocalizationsNe extends AppLocalizations {
  AppLocalizationsNe([String locale = 'ne']) : super(locale);

  @override
  String get appTitle => 'उबुन्टु WSL';

  @override
  String get windowTitle => 'उबुन्टु WSL';

  @override
  String get exitButton => 'बाहिर निस्कनुहोस्';

  @override
  String get finishButton => 'समाप्त गर्नुहोस्';

  @override
  String get saveButton => 'बचत गर्नुहोस्';

  @override
  String get setupButton => 'सेटअप';

  @override
  String get selectLanguageTitle => 'आफ्नो भाषा चयन गर्नुहोस्';

  @override
  String get profileSetupTitle => 'प्रोफाइल सेटअप';

  @override
  String get profileSetupHeader => 'कृपया पूर्वनिर्धारित UNIX प्रयोगकर्ता खाता सिर्जना गर्नुहोस्। थप जानकारीको लागि यहाँ जानुहोस्: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'तपाईंको नाम';

  @override
  String get profileSetupRealnameRequired => 'तपाईको नाम आवश्यक छ';

  @override
  String get profileSetupUsernameHint => 'प्रयोगकर्ता नाम छान्नुहोस्';

  @override
  String get profileSetupUsernameHelper => 'तपाइँ विन्डो प्रयोगकर्ता नाम भन्दा फरक प्रयोगकर्ता नाम प्रयोग गर्न सक्नुहुन्छ';

  @override
  String get profileSetupPasswordHint => 'पासवर्ड टाइप गर्नुहोस्';

  @override
  String get profileSetupConfirmPasswordHint => 'आफ्नो पासवर्ड फेरि टाइप गर्नुहोस्';

  @override
  String get profileSetupShowAdvancedOptions => 'Show advanced options next page';

  @override
  String get profileSetupPasswordMismatch => 'पासवर्डहरू मेल खाएनन्';

  @override
  String get profileSetupUsernameRequired => 'एक प्रयोगकर्ता नाम आवश्यक छ';

  @override
  String get profileSetupUsernameInvalid => 'The username is invalid';

  @override
  String get profileSetupUsernameInUse => 'That user name already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'पासवर्ड आवश्यक छ';

  @override
  String get advancedSetupTitle => 'उन्नत सेटअप';

  @override
  String get advancedSetupHeader => 'In this page, you can tweak Ubuntu WSL to your needs.';

  @override
  String get advancedSetupMountLocationHint => 'माउन्ट स्थान';

  @override
  String get advancedSetupMountLocationHelper => 'अटोमाउन्टको लागि स्थान';

  @override
  String get advancedSetupMountLocationInvalid => 'स्थान अमान्य छ';

  @override
  String get advancedSetupMountOptionHint => 'माउन्ट विकल्प';

  @override
  String get advancedSetupMountOptionHelper => 'अटोमाउन्टको लागि माउन्ट विकल्प पारित गरियो';

  @override
  String get advancedSetupHostGenerationTitle => 'होस्ट जेनेरेसन सक्षम गर्नुहोस्';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Enable resolv.conf Generation';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Configuration - Advanced options';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'Enabled';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Mount /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the???';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes...';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Setup complete';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hi $user,\nYou have successfully completed the setup.';
  }

  @override
  String get setupCompleteUpdate => 'It is suggested to run the following command to update Ubuntu to the latest version:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';
}
