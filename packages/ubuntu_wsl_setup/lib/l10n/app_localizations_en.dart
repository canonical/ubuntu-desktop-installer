


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Exit';

  @override
  String get finishButton => 'Finish';

  @override
  String get saveButton => 'Save';

  @override
  String get setupButton => 'Setup';

  @override
  String get selectLanguageTitle => 'Select your language';

  @override
  String get profileSetupTitle => 'Profile setup';

  @override
  String get profileSetupHeader => 'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Your name';

  @override
  String get profileSetupRealnameRequired => 'A name is required';

  @override
  String get profileSetupUsernameHint => 'Pick a username';

  @override
  String get profileSetupUsernameHelper => 'The username does not need to match your windows username.';

  @override
  String get profileSetupPasswordHint => 'Choose a password';

  @override
  String get profileSetupConfirmPasswordHint => 'Confirm your password';

  @override
  String get profileSetupShowAdvancedOptions => 'Show advanced options next page';

  @override
  String get profileSetupPasswordMismatch => 'The passwords do not match';

  @override
  String get profileSetupUsernameRequired => 'A username is required';

  @override
  String get profileSetupUsernameInvalid => 'The username is invalid';

  @override
  String get profileSetupPasswordRequired => 'A password is required';

  @override
  String get advancedSetupTitle => 'Advanced setup';

  @override
  String get advancedSetupHeader => 'In this page, you can tweak Ubuntu WSL to your needs.';

  @override
  String get advancedSetupMountLocationHint => 'Mount location';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'The location is invalid';

  @override
  String get advancedSetupMountOptionHint => 'Mount option';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

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
  String get configurationUITitle => 'Ubuntu WSL configuration UI (experimental)';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUILegacyGUIIntegrationTitle => 'Legacy GUI Integration';

  @override
  String get configurationUILegacyGUIIntegrationSubtitle => 'This option enables the Legacy GUI Integration on Windows 10. Requires Third-party X server.';

  @override
  String get configurationUILegacyAudioIntegrationTitle => 'Legacy Audio Integration';

  @override
  String get configurationUILegacyAudioIntegrationSubtitle => 'This option enables the Legacy Audio Integration on Windows 10. Requires PulseAudio for Windows installed.';

  @override
  String get configurationUIAdvancedIPDetectionTitle => 'Advanced IP Detection';

  @override
  String get configurationUIAdvancedIPDetectionSubtitle => 'This option enables advanced detection of IP by Windows IPv4 Address which is more reliable to use with WSL2.\nRequires WSL interoperability enabled.';

  @override
  String get configurationUIMessageOfTheDayHeader => 'Message Of The Day (MOTD)';

  @override
  String get configurationUIWSLNewsTitle => 'WSL News';

  @override
  String get configurationUIWSLNewsSubtitle => 'This option allows you to control your MOTD News. Toggling it on allows you to see the MOTD.';

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
  String get setupCompleteTitle => 'Setup complete';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hi $user,\nYou have successfully completed the setup.';
  }

  @override
  String get setupCompleteUpdate => 'It is suggested to run the following command to update Ubuntu to the latest version:';

  @override
  String get setupCompleteManage => 'You can use the builtin ubuntuwsl command to manage your WSL settings:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';
}

/// The translations for English, as used in the United States (`en_US`).
class AppLocalizationsEnUs extends AppLocalizationsEn {
  AppLocalizationsEnUs(): super('en_US');

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Exit';

  @override
  String get finishButton => 'Finish';

  @override
  String get saveButton => 'Save';

  @override
  String get setupButton => 'Setup';

  @override
  String get selectLanguageTitle => 'Select your language';

  @override
  String get profileSetupTitle => 'Profile setup';

  @override
  String get profileSetupHeader => 'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Your name';

  @override
  String get profileSetupRealnameRequired => 'A name is required';

  @override
  String get profileSetupUsernameHint => 'Pick a username';

  @override
  String get profileSetupUsernameHelper => 'The username does not need to match your windows username.';

  @override
  String get profileSetupPasswordHint => 'Choose a password';

  @override
  String get profileSetupConfirmPasswordHint => 'Confirm your password';

  @override
  String get profileSetupShowAdvancedOptions => 'Show advanced options next page';

  @override
  String get profileSetupPasswordMismatch => 'The passwords do not match';

  @override
  String get profileSetupUsernameRequired => 'A username is required';

  @override
  String get profileSetupUsernameInvalid => 'The username is invalid';

  @override
  String get profileSetupPasswordRequired => 'A password is required';

  @override
  String get advancedSetupTitle => 'Advanced setup';

  @override
  String get advancedSetupHeader => 'In this page, you can tweak Ubuntu WSL to your needs.';

  @override
  String get advancedSetupMountLocationHint => 'Mount location';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'The location is invalid';

  @override
  String get advancedSetupMountOptionHint => 'Mount option';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

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
  String get configurationUITitle => 'Ubuntu WSL configuration UI (experimental)';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUILegacyGUIIntegrationTitle => 'Legacy GUI Integration';

  @override
  String get configurationUILegacyGUIIntegrationSubtitle => 'This option enables the Legacy GUI Integration on Windows 10. Requires Third-party X server.';

  @override
  String get configurationUILegacyAudioIntegrationTitle => 'Legacy Audio Integration';

  @override
  String get configurationUILegacyAudioIntegrationSubtitle => 'This option enables the Legacy Audio Integration on Windows 10. Requires PulseAudio for Windows installed.';

  @override
  String get configurationUIAdvancedIPDetectionTitle => 'Advanced IP Detection';

  @override
  String get configurationUIAdvancedIPDetectionSubtitle => 'This option enables advanced detection of IP by Windows IPv4 Address which is more reliable to use with WSL2.\nRequires WSL interoperability enabled.';

  @override
  String get configurationUIMessageOfTheDayHeader => 'Message Of The Day (MOTD)';

  @override
  String get configurationUIWSLNewsTitle => 'WSL News';

  @override
  String get configurationUIWSLNewsSubtitle => 'This option allows you to control your MOTD News. Toggling it on allows you to see the MOTD.';

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
  String get setupCompleteTitle => 'Setup complete';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hi $user,\nYou have successfully completed the setup.';
  }

  @override
  String get setupCompleteUpdate => 'It is suggested to run the following command to update Ubuntu to the latest version:';

  @override
  String get setupCompleteManage => 'You can use the builtin ubuntuwsl command to manage your WSL settings:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';
}
