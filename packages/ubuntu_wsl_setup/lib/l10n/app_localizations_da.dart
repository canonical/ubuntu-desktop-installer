


import 'app_localizations.dart';

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Exit';

  @override
  String get finishButton => 'Færdiggør';

  @override
  String get saveButton => 'Gem';

  @override
  String get setupButton => 'Opret';

  @override
  String get selectLanguageTitle => 'Vælg dit sprog';

  @override
  String get profileSetupTitle => 'Profil setup';

  @override
  String get profileSetupHeader => 'Lav venligst en default UNIX bruger konto. For mere information besøg: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Dit navn';

  @override
  String get profileSetupRealnameRequired => 'Et navn er påkrævet';

  @override
  String get profileSetupUsernameHint => 'Vælg et brugernavn';

  @override
  String get profileSetupUsernameHelper => 'Brugernavnet behøver ikke at matche dit Windows-brugernavn.';

  @override
  String get profileSetupPasswordHint => 'Vælg en adgangskode';

  @override
  String get profileSetupConfirmPasswordHint => 'Bekræft din adgangskode';

  @override
  String get profileSetupShowAdvancedOptions => 'Vis avanceret valgmuligheder næste side';

  @override
  String get profileSetupPasswordMismatch => 'Adgangskoden matcher ikke';

  @override
  String get profileSetupUsernameRequired => 'Et brugernavn er påkrævet';

  @override
  String get profileSetupUsernameInvalid => 'Brugernavnet er ugyldigt';

  @override
  String get profileSetupUsernameInUse => 'Brugernavnet eksisterer allerede.';

  @override
  String get profileSetupUsernameSystemReserved => 'Dette navn er reserveret for systembrug.';

  @override
  String get profileSetupUsernameTooLong => 'Dette navn er for langt.';

  @override
  String get profileSetupUsernameInvalidChars => 'Dette navn indeholder ugyldige tegn.';

  @override
  String get profileSetupPasswordRequired => 'En adgangskode er påkrævet';

  @override
  String get advancedSetupTitle => 'Avanceret setup';

  @override
  String get advancedSetupHeader => 'På denne side, kan du tilpasse Ubuntu WSL til dine behov.';

  @override
  String get advancedSetupMountLocationHint => 'Montering lokation';

  @override
  String get advancedSetupMountLocationHelper => 'Lokation for automontering';

  @override
  String get advancedSetupMountLocationInvalid => 'Lokationen er ugyldig';

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
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

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
