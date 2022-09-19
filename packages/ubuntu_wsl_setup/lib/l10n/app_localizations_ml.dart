import 'app_localizations.dart';

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ഉബുണ്ടു WSL';

  @override
  String get windowTitle => 'ഉബുണ്ടു WSL';

  @override
  String get exitButton => 'ഉപേക്ഷിക്കുക';

  @override
  String get finishButton => 'പൂർത്തിയാക്കുക';

  @override
  String get saveButton => 'സേവ് ചെയ്യുക';

  @override
  String get setupButton => 'സജ്ജീകരണം';

  @override
  String get selectLanguageTitle => 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'പ്രൊഫൈൽ സജ്ജീകരണം';

  @override
  String get profileSetupHeader => 'ദയവായി ഒരു ഡിഫോൾട്ട് UNIX ഉപയോക്തൃ അക്കൗണ്ട് സൃഷ്‌ടിക്കുക. കൂടുതൽ വിവരങ്ങൾക്ക് <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a> സന്ദർശിക്കുക';

  @override
  String get profileSetupRealnameLabel => 'താങ്കളുടെ പേര്';

  @override
  String get profileSetupRealnameRequired => 'ഒരു പേര് ആവശ്യമാണ്';

  @override
  String get profileSetupUsernameHint => 'ഒരു ഉപയോക്തൃനാമം തിരഞ്ഞെടുക്കുക';

  @override
  String get profileSetupUsernameHelper => 'ഉപയോക്തൃനാമം നിങ്ങളുടെ വിൻഡോസ് ഉപയോക്തൃനാമവുമായി പൊരുത്തപ്പെടേണ്ടതില്ല.';

  @override
  String get profileSetupPasswordHint => 'ഒരു പാസ്വേഡ് തിരഞ്ഞെടുക്കുക';

  @override
  String get profileSetupConfirmPasswordHint => 'നിങ്ങളുടെ പാസ്‌വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get profileSetupShowAdvancedOptions => 'അടുത്ത പേജിൽ വിപുലമായ ഓപ്ഷനുകൾ കാണിക്കുക';

  @override
  String get profileSetupPasswordMismatch => 'പാസ്‌വേഡുകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get profileSetupUsernameRequired => 'ഒരു ഉപയോക്തൃനാമം ആവശ്യമാണ്';

  @override
  String get profileSetupUsernameInvalid => 'ഉപയോക്തൃനാമം അസാധുവാണ്';

  @override
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'ഒരു പാസ്‌വേഡ് ആവശ്യമാണ്';

  @override
  String get advancedSetupTitle => 'വിപുലമായ സജ്ജീകരണം';

  @override
  String get advancedSetupHeader => 'ഈ പേജിൽ, നിങ്ങളുടെ ആവശ്യങ്ങൾക്ക് ഉബുണ്ടു WSL സജ്ജീകരിക്കാൻ കഴിയും.';

  @override
  String get advancedSetupMountLocationHint => 'മൗണ്ട് ചെയ്യുന്ന ലൊക്കേഷൻ';

  @override
  String get advancedSetupMountLocationHelper => 'ഓട്ടോമൗണ്ടിനുള്ള സ്ഥലം';

  @override
  String get advancedSetupMountLocationInvalid => 'ലൊക്കേഷൻ അസാധുവാണ്';

  @override
  String get advancedSetupMountOptionHint => 'മൌണ്ട് ഓപ്ഷൻ';

  @override
  String get advancedSetupMountOptionHelper => 'ഓട്ടോമൗണ്ടിനായി പാസ്സാക്കിയ മൗണ്ട് ഓപ്ഷൻ';

  @override
  String get advancedSetupHostGenerationTitle => 'ഹോസ്റ്റ് ജനറേഷൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get advancedSetupHostGenerationSubtitle => 'തിരഞ്ഞെടുക്കുന്നത് എല്ലാ തുടക്കത്തിലും /etc/hosts റീ-ജനറേഷൻ പ്രവർത്തനക്ഷമമാക്കുന്നു.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'resolv.conf ജനറേഷൻ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'തിരഞ്ഞെടുക്കുന്നത് എല്ലാ തുടക്കത്തിലും /etc/resolv.conf റീ-ജനറേഷൻ പ്രവർത്തനക്ഷമമാക്കുന്നു.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI സംയോജനം';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'തിരഞ്ഞെടുക്കുന്നത് സ്വയമേവയുള്ള DISPLAY പരിസ്ഥിതി സജ്ജീകരണം പ്രവർത്തനക്ഷമമാക്കുന്നു. മൂന്നാം-കക്ഷി X സെർവർ ആവശ്യമാണ്.';

  @override
  String get configurationUITitle => 'ഉബുണ്ടു WSL കോൺഫിഗറേഷൻ UI (പരീക്ഷണാത്മകം)';

  @override
  String get configurationUIInteroperabilityHeader => 'പരസ്പര പ്രവർത്തനക്ഷമത';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'ഓട്ടോ-മൌണ്ട്';

  @override
  String get configurationUIAutoMountTitle => 'പ്രവർത്തനക്ഷമമാക്കി';

  @override
  String get configurationUIAutoMountSubtitle => 'ഓട്ടോ-മൗണ്ട് സവിശേഷത പ്രവർത്തനക്ഷമമാക്കിയിട്ടുണ്ടോ എന്ന്. WSL-ൽ വിൻഡോസ് ഡ്രൈവ് മൗണ്ട് ചെയ്യാൻ ഈ സവിശേഷത നിങ്ങളെ അനുവദിക്കുന്നു.';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab മൌണ്ട് ചെയ്യുക';

  @override
  String get configurationUIMountFstabSubtitle => '/etc/fstab മൗണ്ട് ചെയ്യുമോ എന്ന്. കോൺഫിഗറേഷൻ ഫയൽ /etc/fstab അടങ്ങിയിരിക്കുന്നു???';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes…';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'സജ്ജീകരണം പൂർത്തിയായി';

  @override
  String setupCompleteHeader(Object user) {
    return 'ഹായ് $user,\nനിങ്ങൾ സജ്ജീകരണം വിജയകരമായി പൂർത്തിയാക്കി.';
  }

  @override
  String get setupCompleteUpdate => 'ഉബുണ്ടു ഏറ്റവും പുതിയ പതിപ്പിലേക്ക് അപ്‌ഡേറ്റ് ചെയ്യുന്നതിന് ഇനിപ്പറയുന്ന കമാൻഡ് പ്രവർത്തിപ്പിക്കാൻ നിർദ്ദേശിക്കുന്നു:';

  @override
  String get setupCompleteRestart => '* ഉബുണ്ടു പുനരാരംഭിച്ചതിന് ശേഷം എല്ലാ ക്രമീകരണങ്ങളും പ്രാബല്യത്തിൽ വരും.';

  @override
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Launching distro...';

  @override
  String get installationSlidesErrorMsg => 'Something went wrong.';

  @override
  String get installationSlidesErrorTitle => 'Something went wrong';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'Cancel';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
