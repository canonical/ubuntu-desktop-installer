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
    return 'Installer les paquets pour un meilleur support des $lang langues';
  }

  @override
  String get installLangPacksSubtitle => 'Non recommandé pour des connexions lentes.';

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
  String get configurationUIInteroperabilitySubtitle => 'Si l\'interopérabilité est activée.';

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
    return 'Salut $user,\nVous avez terminé la configuration.';
  }

  @override
  String get setupCompleteUpdate => 'Il est conseillé d\'exécuter les commandes suivantes afin de conserver Ubuntu à jour :';

  @override
  String get setupCompleteRestart => '* Les changements prendront effet après le redémarrage d\'Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Bienvenue sur Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initialisation...';

  @override
  String get installationSlidesUnpacking => 'Dépaquetage du distro';

  @override
  String get installationSlidesInstalling => 'Presque fini. L\'installeur va bientôt demander votre attention.';

  @override
  String get installationSlidesLaunching => 'Démarrage du distro...';

  @override
  String get installationSlidesErrorMsg => 'Quelque chose s\'est mal passé.';

  @override
  String get installationSlidesErrorTitle => 'Quelque chose s\'est mal passé';

  @override
  String get installationSlidesErrorSub => 'Veuillez redémarrer WSL avec les commandes suivantes et réessayer à nouveau : \n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nUne erreur irréparable est arrivée. \n \nVeuillez fermer cette apllication, ouvrir Powershell ou le terminal et entrer les commandes suivantes :\n';

  @override
  String get installationSlidesDone => 'Tout est prêt. En espérant que vous vous amuserez en utilisant Ubuntu sur WSL';

  @override
  String get installationSlidesExitTitle => 'Êtes-vous sûr de vouloir partir ?';

  @override
  String get installationSlidesExitContents => 'Fermer cette fenêtre n\'empêchera pas l\'installation de continuer en arrière-plan. \n \nDe toute façon, vous pouvez continuer d\'explorer ce que vous pouvez faire avec Ubuntu sur WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Nous avons presque terminé';

  @override
  String get installationSlidesCustomExitContents => 'Plus que quelques étapes à compléter dans la fenêtre principale d\'installation. \nPouvons-nous quitter celle-ci et aller là-bas ?';

  @override
  String get installationSlidesOk => 'D\'accord';

  @override
  String get installationSlidesLeave => 'Partir';

  @override
  String get installationSlidesCancel => 'Annuler';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu sur WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Un environnement Ubuntu complet, intégré de manière profonde avec Windows, pour le développement et l\'exécution d\'applications Linux. Optimisé pour l\'informatique en nuage, le Web, la science des données, l\'Internet des Objets, et votre propre amusement !';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL pour \nle développement Web';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Développez dans WSL en utilisant les IDE natifs de Windows incluant VS Code et IntelliJ et bénéficiez du support complet de NodeJS et Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL pour la Science des Données';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack vous permet de maximiser les performaces de vos projets dans les sciences des données et l\'apprentissage automatique en plus des pilotes natifs Windows NVIDIA.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL pour \nles Applications Graphiques';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Développez et prévisualisez vos applications Web et graphiques sur Linux en utilisant WSLg pour du développement multi-plateforme.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL pour DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Garantissez la compatibilité de la chaîne de traitement CI/CD en développant sur Ubuntu WSL localement avant de publier le tout sur un environnement de production Ubuntu';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL pour les Entreprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Autonomiser les développeurs dans \nun écosystème Windows pour \nentreprises avec un Ubuntu LTS certifié.';

  @override
  String get installationSlidesFindOutMore => 'En savoir plus';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visiter ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' pour plus d\'informations à propos d\'Ubuntu sur WSL et pour savoir comment Canonical aide les développeurs et les organisations.';
}
