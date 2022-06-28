


import 'app_localizations.dart';

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Išeiti';

  @override
  String get finishButton => 'Užbaigti';

  @override
  String get saveButton => 'Įrašyti';

  @override
  String get setupButton => 'Sąranka';

  @override
  String get selectLanguageTitle => 'Pasirinkite kalbą';

  @override
  String get profileSetupTitle => 'Profilio sąranka';

  @override
  String get profileSetupHeader => 'Susikurkite numatytąją UNIX naudotojo paskyrą. Išsamesnei informacijai, apsilankykite: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Jūsų vardas';

  @override
  String get profileSetupRealnameRequired => 'Reikia nurodyti vardą';

  @override
  String get profileSetupUsernameHint => 'Pasirinkite naudotojo vardą';

  @override
  String get profileSetupUsernameHelper => 'Naudotojo vardas gali būti kitoks, nei jūsų „Windows“ naudotojo vardas.';

  @override
  String get profileSetupPasswordHint => 'Pasirinkite slaptažodį';

  @override
  String get profileSetupConfirmPasswordHint => 'Pakartokite slaptažodį';

  @override
  String get profileSetupShowAdvancedOptions => 'Rodyti išplėstines parinktis kitame puslapyje';

  @override
  String get profileSetupPasswordMismatch => 'Slaptažodžiai nesutampa';

  @override
  String get profileSetupUsernameRequired => 'Reikia nurodyti naudotojo vardą';

  @override
  String get profileSetupUsernameInvalid => 'Naudotojo vardas yra netinkamas';

  @override
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'Reikia nurodyti slaptažodį';

  @override
  String get advancedSetupTitle => 'Išplėstinė sąranka';

  @override
  String get advancedSetupHeader => 'Šiame puslapyje galite derinti Ubuntu WSL pagal savo poreikius.';

  @override
  String get advancedSetupMountLocationHint => 'Prijungti vietą';

  @override
  String get advancedSetupMountLocationHelper => 'Automatiniam prijungimui skirta vieta';

  @override
  String get advancedSetupMountLocationInvalid => 'Vieta yra netinkama';

  @override
  String get advancedSetupMountOptionHint => 'Prijungimo parinktis';

  @override
  String get advancedSetupMountOptionHelper => 'Automatiniam prijungimui perduodama prijungimo parinktis';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Enable resolv.conf Generation';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Grafinės naudotojo sąsajos integracija';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL konfigūracija - Išplėstinės parinktys';

  @override
  String get configurationUIInteroperabilityHeader => 'Sąveikumas';

  @override
  String get configurationUIInteroperabilityTitle => 'Įjungtas';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Ar sąveikumas yra įjungtas.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Automatinis prijungimas';

  @override
  String get configurationUIAutoMountTitle => 'Įjungtas';

  @override
  String get configurationUIAutoMountSubtitle => 'Ar automatinio prijungimo ypatybė yra įjungta. Ši ypatybė leidžia jums prijungti „Windows“ diską WSL posistemėje.';

  @override
  String get configurationUIMountFstabTitle => 'Prijungti /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

  @override
  String get configurationUISystemdHeader => 'EKSPERIMENTINIS - Systemd';

  @override
  String get configurationUISystemdTitle => 'Įjungtas';

  @override
  String get configurationUISystemdSubtitle => 'Ar paleidimo metu turėtų būti aktyvuota systemd. DĖMESIO: Tai yra eksperimentinė ypatybė.';

  @override
  String get applyingChanges => 'Applying changes…';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Sąranka baigta';

  @override
  String setupCompleteHeader(Object user) {
    return 'Sveiki $user,\nJūs sėkmingai užbaigėte sąranką.';
  }

  @override
  String get setupCompleteUpdate => 'Yra rekomenduojama paleisti šią komandą, kad Ubuntu būtų atnaujinta iki naujausios versijos:';

  @override
  String get setupCompleteRestart => '* Visi nustatymai įsigalios po to, kai paleisite Ubuntu iš naujo.';

  @override
  String get welcome => 'Welcome to Ubuntu WSL';

  @override
  String get initializing => 'Initializing...';

  @override
  String get unpacking => 'Unpacking the distro';

  @override
  String get installing => 'Almost done. The installer will require your attention soon.';

  @override
  String get launching => 'Launching distro...';

  @override
  String get errorMsg => 'Something went wrong.';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get errorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get done => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get exitTitle => 'Are you sure you want to leave?';

  @override
  String get exitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get customExitTitle => 'We are almost done';

  @override
  String get customExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Leave';

  @override
  String get cancel => 'Cancel';

  @override
  String get ubuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get ubuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get ubuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get ubuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get ubuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get findOutMore => 'Find out more';

  @override
  String get findOutMoreVisit => 'Visit ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
