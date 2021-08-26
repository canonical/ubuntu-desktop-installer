


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get backButton => 'Go Back';

  @override
  String get continueButton => 'Continue';

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
  String get configurationUITitle => 'Ubuntu WSL configuration UI (experimental)';

  @override
  String get setupCompleteTitle => 'Setup complete';
}

/// The translations for English, as used in the United States (`en_US`).
class AppLocalizationsEnUs extends AppLocalizationsEn {
  AppLocalizationsEnUs(): super('en_US');

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get backButton => 'Go Back';

  @override
  String get continueButton => 'Continue';

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
  String get configurationUITitle => 'Ubuntu WSL configuration UI (experimental)';

  @override
  String get setupCompleteTitle => 'Setup complete';
}
