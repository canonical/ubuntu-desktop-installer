


import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Quitter';

  @override
  String get finishButton => 'Finir';

  @override
  String get saveButton => 'Enregistrer';

  @override
  String get setupButton => 'Configurer';

  @override
  String get selectLanguageTitle => 'Sélectionnez votre langue';

  @override
  String get profileSetupTitle => 'Configuration du profil';

  @override
  String get profileSetupHeader => 'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Votre nom';

  @override
  String get profileSetupRealnameRequired => 'Votre nom est requis';

  @override
  String get profileSetupUsernameHint => 'Choisir un nom d’utilisateur';

  @override
  String get profileSetupUsernameHelper => 'Le nom d’utilisateur n’a pas besoin de correspondre à votre nom d’utilisateur Windows.';

  @override
  String get profileSetupPasswordHint => 'Choisir un mot de passe';

  @override
  String get profileSetupConfirmPasswordHint => 'Confirmez votre mot de passe';

  @override
  String get profileSetupShowAdvancedOptions => 'Show advanced options next page';

  @override
  String get profileSetupPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get profileSetupUsernameRequired => 'Un nom d\'utilisateur est requis';

  @override
  String get profileSetupUsernameInvalid => 'Ce nom d\'utilisateur est invalide';

  @override
  String get profileSetupUsernameInUse => 'That user name already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'Un mot de passe est requis';

  @override
  String get advancedSetupTitle => 'Installation avancée';

  @override
  String get advancedSetupHeader => 'In this page, you can tweak Ubuntu WSL to your needs.';

  @override
  String get advancedSetupMountLocationHint => 'Emplacement de montage';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'L’emplacement n’est pas valide';

  @override
  String get advancedSetupMountOptionHint => 'Option de montage';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Activer la génération de resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Configuration - Advanced options';

  @override
  String get configurationUIInteroperabilityHeader => 'Interopérabilité';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Montage automatique';

  @override
  String get configurationUIAutoMountTitle => 'Activé';

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
  String get applyingChanges => 'Applying changes...';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Configuration terminée';

  @override
  String setupCompleteHeader(Object user) {
    return 'Salut $user,\nVous avez terminé la configuration avec succès.';
  }

  @override
  String get setupCompleteUpdate => 'It is suggested to run the following command to update Ubuntu to the latest version:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';
}
