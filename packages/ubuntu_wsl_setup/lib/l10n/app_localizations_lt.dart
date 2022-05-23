


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
}
