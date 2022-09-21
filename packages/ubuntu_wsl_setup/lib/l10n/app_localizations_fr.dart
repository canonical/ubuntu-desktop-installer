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
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'Configuration du profil';

  @override
  String get profileSetupHeader => 'Veuillez créer un compte utilisateur par défaut. Pour plus d\'informations rendez vous sur <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

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
  String get profileSetupShowAdvancedOptions => 'Voir les options avancées';

  @override
  String get profileSetupPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get profileSetupUsernameRequired => 'Un nom d\'utilisateur est requis';

  @override
  String get profileSetupUsernameInvalid => 'Ce nom d\'utilisateur est invalide';

  @override
  String get profileSetupUsernameInUse => 'Ce nom d\'utilisateur existe déjà.';

  @override
  String get profileSetupUsernameSystemReserved => 'Ce nom d\'utilisateur est réservé pour le système.';

  @override
  String get profileSetupUsernameTooLong => 'Ce nom est trop long.';

  @override
  String get profileSetupUsernameInvalidChars => 'Ce nom contient des caractères invalides.';

  @override
  String get profileSetupPasswordRequired => 'Un mot de passe est requis';

  @override
  String get advancedSetupTitle => 'Installation avancée';

  @override
  String get advancedSetupHeader => 'Sur cette page, vous pouvez configurer Ubuntu WSL selon vos souhaits.';

  @override
  String get advancedSetupMountLocationHint => 'Emplacement de montage';

  @override
  String get advancedSetupMountLocationHelper => 'Point de montage pour le montage automatique';

  @override
  String get advancedSetupMountLocationInvalid => 'L’emplacement n’est pas valide';

  @override
  String get advancedSetupMountOptionHint => 'Option de montage';

  @override
  String get advancedSetupMountOptionHelper => 'Options pour le montage automatique';

  @override
  String get advancedSetupHostGenerationTitle => 'Activer la génération du fichier hosts';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Choisir cette option génère le fichier /etc/hosts à chaque démarrage.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Activer la génération de resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Choisir cette option génère le fichier /etc/resolv.conf à chaque démarrage.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Intégration avec l\'interface graphique';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Cette option définit la variable DISPLAY dans l\'environnement. Un serveur X tiers est requis.';

  @override
  String get configurationUITitle => 'Configuration d\'Ubuntu WSL - Options avancées';

  @override
  String get configurationUIInteroperabilityHeader => 'Interopérabilité';

  @override
  String get configurationUIInteroperabilityTitle => 'Activé';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Activer l\'interopérabilité.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Ajouter au PATH Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Cette option ajoute le chemin d\'exécution Windows au chemin d\'exécution de WSL';

  @override
  String get configurationUIAutoMountHeader => 'Montage automatique';

  @override
  String get configurationUIAutoMountTitle => 'Activé';

  @override
  String get configurationUIAutoMountSubtitle => 'Active le montage automatique. Cette fonctionnalité permet de monter le disque Windows dans WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Monter /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Active le montage de /etc/fstab. Ce fichier contient les informations sur le montage des systèmes de fichier.';

  @override
  String get configurationUISystemdHeader => 'EXPÉRIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Activé';

  @override
  String get configurationUISystemdSubtitle => 'Activer systemd au démarrage. ATTENTION : C\'est une fonctionnalité expérimentale.';

  @override
  String get applyingChanges => 'Application des changements…';

  @override
  String get applyingChangesDisclaimer => 'Cela peut prendre plusieurs minutes en fonction de votre connection internet.';

  @override
  String get setupCompleteTitle => 'Configuration terminée';

  @override
  String setupCompleteHeader(Object user) {
    return 'Salut $user,\nVous avez terminé la configuration avec succès.';
  }

  @override
  String get setupCompleteUpdate => 'Il est conseillé d\'exécuter les commandes suivantes afin de conserver Ubuntu à jour :';

  @override
  String get setupCompleteRestart => '* Les changements prendront effet après le redémarrage d\'Ubuntu.';

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
