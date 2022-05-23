


import 'app_localizations.dart';

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Ubuntu i WSL';

  @override
  String get windowTitle => 'Ubuntu i WSL';

  @override
  String get exitButton => 'Avslutt';

  @override
  String get finishButton => 'Finsk';

  @override
  String get saveButton => 'Lagre';

  @override
  String get setupButton => 'Innstillinger';

  @override
  String get selectLanguageTitle => 'Velg ditt språk';

  @override
  String get profileSetupTitle => 'Profil innstillinger';

  @override
  String get profileSetupHeader => 'Opprett en standard UNIX-brukerkonto. For mer informasjon besøk: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ditt navn';

  @override
  String get profileSetupRealnameRequired => 'Et navn er krevet';

  @override
  String get profileSetupUsernameHint => 'Velg et brukernavn';

  @override
  String get profileSetupUsernameHelper => 'The username does not need to match your windows username.';

  @override
  String get profileSetupPasswordHint => 'Velg et passord';

  @override
  String get profileSetupConfirmPasswordHint => 'Bekreft passordet ditt';

  @override
  String get profileSetupShowAdvancedOptions => 'Show advanced options next page';

  @override
  String get profileSetupPasswordMismatch => 'Passordene samsvarer ikke';

  @override
  String get profileSetupUsernameRequired => 'Brukernavn kreves';

  @override
  String get profileSetupUsernameInvalid => 'Brukernavnet er ugyldig';

  @override
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'Navnet er for langt.';

  @override
  String get profileSetupUsernameInvalidChars => 'Navnet inneholder ugyldige tegn.';

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
  String get configurationUIMountFstabTitle => 'Monter /etc/fstab';

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
  String get setupCompleteTitle => 'Oppsett fullført';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hi $user,\nYou have successfully completed the setup.';
  }

  @override
  String get setupCompleteUpdate => 'Det anbefales å kjøre følgende kommando for å oppgradere Ubuntu til nyeste versjon:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';
}
