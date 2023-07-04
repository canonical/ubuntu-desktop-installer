import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Programme d’installation du bureau Ubuntu';

  @override
  String windowTitle(Object RELEASE) {
    return 'Installer $RELEASE';
  }

  @override
  String get changeButtonText => 'Changer';

  @override
  String get restartButtonText => 'Redémarrer';

  @override
  String get revertButtonText => 'Rétablir';

  @override
  String get quitButtonText => 'Quitter l’installation';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Bienvenue à $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Préparation d’$DISTRO…';
  }

  @override
  String get welcomeHeader => 'Choisissez votre langue :';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'Essayer ou installer $DISTRO';
  }

  @override
  String get repairInstallation => 'Réparer l’installation';

  @override
  String get repairInstallationDescription => 'La réparation réinstallera tous les logiciels installés en conservant les documents et les paramètres.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Essayer $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Vous pouvez essayer $RELEASE sans appliquer aucun changement à votre ordinateur.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Installer $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Installer $RELEASE à côté (ou en remplacement) de votre système d’exploitation actuel. Ceci ne devrait pas prendre trop longtemps.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Vous pouvez éventuellement lire les <a href=\"$url\">notes de publication</a>.';
  }

  @override
  String get rstTitle => 'RST est activé';

  @override
  String get rstHeader => 'Désactivez RST pour continuer';

  @override
  String get rstDescription => 'Cet ordinateur utilise la technologie RST (Rapid Storage Technology) d’Intel. Il est nécessaire de désactiver RST sous Windows avant d’installer Ubuntu.';

  @override
  String rstInstructions(Object url) {
    return 'Pour obtenir des instructions, scannez le code QR sur un autre appareil ou visitez le site : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardTitle => 'Disposition du clavier';

  @override
  String get keyboardHeader => 'Indiquez la disposition de votre clavier :';

  @override
  String get keyboardTestHint => 'Saisissez du texte ici pour tester votre clavier';

  @override
  String get keyboardDetectTitle => 'Détecter la disposition du clavier';

  @override
  String get keyboardDetectButton => 'Détecter';

  @override
  String get keyboardVariantLabel => 'Variante du clavier :';

  @override
  String get keyboardPressKeyLabel => 'Veuillez appuyer sur l’une des touches suivantes :';

  @override
  String get keyboardKeyPresentLabel => 'Cette touche est-elle présente sur votre clavier ?';

  @override
  String get configureSecureBootTitle => 'Configurer Secure Boot';

  @override
  String get configureSecureBootDescription => 'Vous avez choisi d’installer des pilotes logiciels tiers. Cela nécessite de désactiver Secure Boot.\nPour cela, vous devez choisir une clé de sécurité maintenant, et l’entrer quand le système démarrera.';

  @override
  String get configureSecureBootOption => 'Configurer Secure Boot';

  @override
  String get chooseSecurityKey => 'Choisir un code de sécurité';

  @override
  String get confirmSecurityKey => 'Confirmer le code de sécurité';

  @override
  String get dontInstallDriverSoftwareNow => 'Ne pas installer le pilote maintenant';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Vous pouvez l’installer ultérieurement depuis Logiciel & Mises à jour.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'La clé de sécurité est nécessaire';

  @override
  String get secureBootSecurityKeysDontMatch => 'Les codes de sécurité ne correspondent pas';

  @override
  String get showSecurityKey => 'Montrer la clé de sécurité';

  @override
  String get connectToInternetPageTitle => 'Se connecter à un réseau';

  @override
  String get connectToInternetDescription => 'Connecter cet ordinateur à internet aidera Ubuntu à installer des logiciels supplémentaires et à déterminer votre fuseau horaire.\n\nConnectez un câble Ethernet, ou choisissez un réseau Wi-Fi';

  @override
  String get useWiredConnection => 'Utiliser une connexion câblée';

  @override
  String get noWiredConnection => 'Aucune connexion câblée détectée';

  @override
  String get wiredDisabled => 'La connexion câblée est désactivée';

  @override
  String get wiredMustBeEnabled => 'Pour utiliser Ethernet sur cet ordinateur, une connexion câblée doit être activée';

  @override
  String get enableWired => 'Activer une connexion câblée';

  @override
  String get selectWifiNetwork => 'Se connecter à un réseau Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Se connecter à un réseau Wi-Fi caché';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nom du réseau';

  @override
  String get hiddenWifiNetworkNameRequired => 'Un nom de réseau est requis';

  @override
  String get noInternet => 'Je ne souhaite pas me connecter à internet pour l’instant';

  @override
  String get wirelessNetworkingDisabled => 'Le réseau sans fil est désactivé';

  @override
  String get noWifiDevicesDetected => 'Aucun périphérique Wi-Fi détecté';

  @override
  String get wifiMustBeEnabled => 'Pour utiliser le Wi-Fi sur cet ordinateur, cette fonctionnalité doit être activée';

  @override
  String get enableWifi => 'Activer le Wi-Fi';

  @override
  String get connectButtonText => 'Se connecter';

  @override
  String get updatesOtherSoftwarePageTitle => 'Applications et mises à jour';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quelles applications souhaitez-vous installer pour commencer ?';

  @override
  String get normalInstallationTitle => 'Installation normale';

  @override
  String get normalInstallationSubtitle => 'Navigateur internet, utilitaires, bureautique, jeux et lecteurs multimédia.';

  @override
  String get minimalInstallationTitle => 'Installation minimale';

  @override
  String get minimalInstallationSubtitle => 'Navigateur web et utilitaires de base.';

  @override
  String get otherOptions => 'Autres options';

  @override
  String get installThirdPartyTitle => 'Installer des logiciels tiers pour le support du matériel graphique et Wi-Fi, ainsi que des formats multimédia supplémentaires';

  @override
  String get installThirdPartySubtitle => 'Ce logiciel est soumis à des termes de licence inclus dans sa documentation. Certains sont propriétaires.';

  @override
  String get installDriversTitle => 'Installer des logiciels tiers pour le support du matériel graphique et Wi-Fi';

  @override
  String get installDriversSubtitle => 'Ces pilotes sont soumis à des termes de licence inclus dans leurs documentations. Ils sont propriétaires.';

  @override
  String get installCodecsTitle => 'Télécharger et installer la prise en charge de formats de multimédias supplémentaires';

  @override
  String get installCodecsSubtitle => 'Ce logiciel est soumis à des termes de licence inclus dans sa documentation. Certains sont propriétaires.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\"> Avertissement :</font> L’ordinateur n’est pas branché à une source d’alimentation.';
  }

  @override
  String get offlineWarning => 'Vous êtes actuellement hors ligne';

  @override
  String get chooseSecurityKeyTitle => 'Code de sécurité';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Le chiffrement du disque protège vos fichiers au cas où vous perdriez votre ordinateur. Il exige que vous saisissiez une clef de sécurité à chaque fois que l’ordinateur démarre.\n\nTous les fichiers en dehors d’$RELEASE ne seront pas chiffrés.';
  }

  @override
  String get chooseSecurityKeyHint => 'Choisir un code de sécurité';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirmer le code de sécurité';

  @override
  String get chooseSecurityKeyRequired => 'Un code de sécurité est requis';

  @override
  String get chooseSecurityKeyMismatch => 'Les codes de sécurité ne correspondent pas';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Attention :</font> Si vous oubliez la clé de sécurité, toutes les données seront perdues. Il est recommandé de noter cette clé puis de la stocker dans en lieu sûr.';
  }

  @override
  String get installationTypeTitle => 'Type d’installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Cet ordinateur est installé avec $os. Que voulez-vous faire ?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Cet ordinateur est installé avec $os1 et $os2. Que voulez-vous faire ?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Cet ordinateur est installé avec plusieurs systèmes d’exploitation. Que voulez-vous faire ?';

  @override
  String get installationTypeNoOSDetected => 'Aucun système d’exploitation n’a été détecté sur cet ordinateur. Que voulez-vous faire ?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Effacer le disque et installer $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Attention :</font> Cela va supprimer tous vos programmes, documents, photos, musiques, et tous les autres fichiers sur tous les systèmes d’exploitation.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Fonctions avancées…';

  @override
  String get installationTypeAdvancedTitle => 'Fonctions avancées';

  @override
  String get installationTypeNone => 'Aucune';

  @override
  String get installationTypeNoneSelected => 'Aucune sélectionnée';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Utiliser LVM pour la nouvelle installation d’$RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM sélectionné';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM et chiffrement sélectionnés';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Chiffrer la nouvelle installation d’$RELEASE pour la sécurité';
  }

  @override
  String get installationTypeEncryptInfo => 'Vous allez choisir une clé de sécurité à l’étape suivante.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL : Effacer le disque et utiliser ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS sélectionné';

  @override
  String installationTypeReinstall(Object os) {
    return 'Supprimer $os et réinstaller';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Attention :</font> Cela va supprimer tous vos programmes, documents, photos, musiques, et tous les fichiers de $os.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Installer $product à côté de $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Installer $product à côté de $os1 et $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Installer $product à côté d’eux';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Installer $product à côté des autres partitions';
  }

  @override
  String get installationTypeAlongsideInfo => 'Les documents, musiques et autres fichiers personnels seront conservés. Vous pouvez choisir le système d’exploitation à lancer au moment du démarrage de l’ordinateur.';

  @override
  String get installationTypeManual => 'Partitionnement manuel';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Vous pouvez créer ou redimensionner les partitions vous-même, ou choisir plusieurs partitions pour $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Effacer le disque et installer $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Sélectionnez le disque :';

  @override
  String get selectGuidedStorageInfoLabel => 'La totalité du disque sera utilisée :';

  @override
  String get selectGuidedStorageInstallNow => 'Installer maintenant';

  @override
  String get installAlongsideSpaceDivider => 'Allouez de l’espace disque en déplaçant le séparateur ci-dessous :';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num partitions plus petites sont masquées, utilisez <a href=\"$url\">l’outil de partitionnement avancé</a> pour plus de contrôle';
  }

  @override
  String get installAlongsideResizePartition => 'Redimensionner la partition';

  @override
  String get installAlongsideAllocateSpace => 'Allouer de l’espace';

  @override
  String get installAlongsideFiles => 'Fichiers';

  @override
  String get installAlongsidePartition => 'Partition :';

  @override
  String get installAlongsideSize => 'Taille :';

  @override
  String get installAlongsideAvailable => 'Disponible :';

  @override
  String get allocateDiskSpace => 'Partitionnement manuel';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Les points de montage doivent commencer par \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Les points de montage ne doivent pas contenir d\'espaces';

  @override
  String get startInstallingButtonText => 'Installer';

  @override
  String get diskHeadersDevice => 'Périphérique';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Point de montage';

  @override
  String get diskHeadersSize => 'Taille';

  @override
  String get diskHeadersUsed => 'Utilisé';

  @override
  String get diskHeadersSystem => 'Système';

  @override
  String get diskHeadersFormat => 'Formatter';

  @override
  String get freeDiskSpace => 'Espace libre';

  @override
  String get newPartitionTable => 'Nouvelle table de partition';

  @override
  String get newPartitionTableConfirmationTitle => 'Nouvelle partition vide';

  @override
  String get newPartitionTableConfirmationMessage => 'La création d’une nouvelle table de partitions sur un périphérique entier supprimera toutes ses partitions actuelles. Vous pourrez annuler cette opération plus tard si vous le souhaitez.';

  @override
  String get tooManyPrimaryPartitions => 'Trop de partitions primaires';

  @override
  String get partitionLimitReached => 'Limite atteinte';

  @override
  String get bootLoaderDevice => 'Périphérique pour installer le chargeur d’amorçage (bootloader)';

  @override
  String get partitionCreateTitle => 'Créer une partition';

  @override
  String get partitionEditTitle => 'Modifier la partition';

  @override
  String get partitionSizeLabel => 'Taille :';

  @override
  String get partitionTypeLabel => 'Type pour la nouvelle partition :';

  @override
  String get partitionTypePrimary => 'Primaire';

  @override
  String get partitionTypeLogical => 'Logique';

  @override
  String get partitionLocationLabel => 'Emplacement pour la nouvelle partition :';

  @override
  String get partitionLocationBeginning => 'Début de cet espace';

  @override
  String get partitionLocationEnd => 'Fin de cet espace';

  @override
  String get partitionFormatLabel => 'Utilisée comme :';

  @override
  String get partitionFormatNone => 'Laisser non formatée';

  @override
  String partitionFormatKeep(Object format) {
    return 'Laisser formatée en $format';
  }

  @override
  String get partitionErase => 'Formatter la partition';

  @override
  String get partitionMountPointLabel => 'Point de montage :';

  @override
  String get identityPageTitle => 'Configurez votre compte';

  @override
  String get identityAutoLogin => 'Ouvrir la session automatiquement';

  @override
  String get identityRequirePassword => 'Demander mon mot de passe pour ouvrir une session';

  @override
  String get identityRealNameLabel => 'Votre nom';

  @override
  String get identityRealNameRequired => 'Votre nom est requis';

  @override
  String get identityRealNameTooLong => 'Ce nom est trop long.';

  @override
  String get identityHostnameLabel => 'Le nom de votre ordinateur';

  @override
  String get identityHostnameInfo => 'Le nom qu’il utilise pour communiquer avec d’autres ordinateurs.';

  @override
  String get identityHostnameRequired => 'Un nom pour l’ordinateur est requis';

  @override
  String get identityHostnameTooLong => 'Ce nom est trop long.';

  @override
  String get identityInvalidHostname => 'Ce nom d’ordinateur est invalide';

  @override
  String get identityUsernameLabel => 'Choisir un nom d’utilisateur';

  @override
  String get identityUsernameRequired => 'Un nom d’utilisateur est requis';

  @override
  String get identityInvalidUsername => 'Ce nom d’utilisateur est invalide';

  @override
  String get identityUsernameInUse => 'Ce nom d’utilisateur existe déjà.';

  @override
  String get identityUsernameSystemReserved => 'Ce nom est réservé pour le système.';

  @override
  String get identityUsernameTooLong => 'Ce nom est trop long.';

  @override
  String get identityUsernameInvalidChars => 'Ce nom contient des caractères invalides.';

  @override
  String get identityPasswordLabel => 'Choisir un mot de passe';

  @override
  String get identityPasswordRequired => 'Un mot de passe est requis';

  @override
  String get identityConfirmPasswordLabel => 'Confirmez votre mot de passe';

  @override
  String get identityPasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get identityPasswordShow => 'Montrer';

  @override
  String get identityPasswordHide => 'Cacher';

  @override
  String get writeChangesToDisk => 'Prêt à installer';

  @override
  String get writeChangesFallbackSerial => 'disque';

  @override
  String get writeChangesDescription => 'Si vous continuez, les changements ci-dessous seront écrits sur les disques. Vous pourrez faire des changements ultérieurs manuellement.';

  @override
  String get writeChangesDevicesTitle => 'Disques';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Les tables de partitions des périphériques suivants seront modifiées :';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Les modification suivantes sur les partitions seront appliquées :';

  @override
  String writeChangesPartitionResized(Object sysname, Object oldsize, Object newsize) {
    return 'la partition <b>$sysname</b> redimensionnée de <b>$oldsize</b> à <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object sysname, Object format, Object mount) {
    return 'la partition <b>$sysname</b> formatée en <b>$format</b> utilisée pour <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object sysname, Object format) {
    return 'la partition <b>$sysname</b> formatée en <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object sysname, Object mount) {
    return 'la partition <b>$sysname</b> utilisée pour <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object sysname) {
    return 'la partition <b>$sysname</b> créée';
  }

  @override
  String get themePageTitle => 'Choisissez l’apparence';

  @override
  String get themePageHeader => 'Vous pourrez la changer ultérieurement dans les préférences d’apparence.';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeLight => 'Clair';

  @override
  String get installationCompleteTitle => 'Installation terminée';

  @override
  String readyToUse(Object system) {
    return '**$system** est installé et prêt à être utilisé';
  }

  @override
  String restartInto(Object system) {
    return 'Redémarrer sous $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Vous pouvez maintenant continuer à tester $RELEASE, mais tant que vous n’aurez pas redémarré votre ordinateur, les changements effectués ou les documents créés ne seront pas préservés.';
  }

  @override
  String get shutdown => 'Éteindre';

  @override
  String get restartNow => 'Redémarrer maintenant';

  @override
  String get continueTesting => 'Continuer à tester';

  @override
  String get bitlockerTitle => 'BitLocker est activé';

  @override
  String get bitlockerHeader => 'Désactivez BitLocker pour continuer';

  @override
  String bitlockerDescription(Object option) {
    return 'Cet ordinateur utilise le chiffrement BitLocker de Windows.\nVous devez utiliser Windows pour créer de l’espace libre ou choisir \'$option\' pour continuer.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Pour obtenir des instructions, scannez le code QR sur un autre appareil ou visitez le site : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Redémarrer sous Windows';

  @override
  String get restartIntoWindowsTitle => 'Redémarrer sous Windows ?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Voulez-vous vraiment redémarrer votre ordinateur ? Vous devrez redémarrer l’installation d’$DISTRO ultérieurement pour compléter l’installation d’$DISTRO.';
  }

  @override
  String get timezonePageTitle => 'Sélectionnez votre fuseau horaire';

  @override
  String get timezoneLocationLabel => 'Localisation';

  @override
  String get timezoneTimezoneLabel => 'Fuseau horaire';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Bienvenue à $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Disponible :';

  @override
  String get installationSlidesIncluded => 'Inclus :';

  @override
  String get installationSlidesWelcomeTitle => 'Rapide, gratuit et plein de nouvelles fonctionnalités';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'La dernière version d’$DISTRO rend l’informatique plus facile que jamais.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Que vous soyez développeur, créateur, joueur ou administrateur, vous trouverez de nouveaux outils pour améliorer votre productivité et votre expérience sur $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Toutes les applications dont vous avez besoin';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Installez, gérez et mettez à jour toutes vos applications dans Ubuntu Software, y compris des milliers d’applications provenant du Snap Store et de l’archive $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Développez avec le meilleur de l’open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO est le poste de travail idéal pour le développement d’applications ou de sites Web, la science des données, l’intelligence artificielle et l’apprentissage automatique, ainsi que pour le devops et l’administration. Chaque version $DISTRO inclut les dernières chaînes d’outils et prend en charge tous les principaux environnements de développement intégrés.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Améliorez votre créativité';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Si vous êtes animateur, concepteur, créateur vidéo ou développeur de jeux, il est facile d\'amener vos flux de travail sur $DISTRO grâce à la prise en charge de logiciels et d\'applications open source et standard de l\'industrie.';
  }

  @override
  String get installationSlidesGamingTitle => 'Idéal pour les jeux';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO prend en charge les derniers pilotes NVIDIA et Mesa pour améliorer les performances et la compatibilité. Des milliers de jeux pour Windows fonctionnent parfaitement sur $DISTRO via des applications telles que Steam, sans aucune configuration supplémentaire.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Privé et sécurisé';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO fournit tous les outils dont vous avez besoin pour rester privé et sécurisé en ligne. Il intègre un pare-feu et un réseau privé virtuel (VPN), ainsi qu’une série d’applications axées sur la protection de la vie privée, afin que vous puissiez contrôler pleinement vos données.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Toutes les versions LTS d’$DISTRO sont accompagnées de cinq ans de correctifs de sécurité, qui s’étendent à dix ans dans le cas d’un abonnement Ubuntu Pro.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Augmentez votre productivité';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop comprend LibreOffice, une suite d’applications open source compatibles avec Microsoft Office pour les documents, les feuilles de calcul et les présentations. Des outils de collaboration populaires sont également disponibles.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Accès pour tous';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'Au cœur de la philosophie d’$DISTRO se trouve la conviction que l’informatique doit être accessible à tous. Proposant des outils d’accessibilité avancés et des options telles que le choix de la langue, du thème de couleurs, de la taille des polices, $DISTRO vous rend l’informatique facile – qui que vous soyez, où que vous soyez.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Lecteur d’écran Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Prise en charge des langues';

  @override
  String get installationSlidesSupportTitle => 'Aide et assistance';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'La documentation officielle d’$DISTRO est disponible en ligne et via l’icône Aide dans le dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu couvre une gamme de questions et de réponses. Discours Ubuntu fournit des guides et des discussions pour les nouveaux utilisateurs et les utilisateurs expérimentés.';

  @override
  String get installationSlidesSupportEnterprise => 'Pour les entreprises, Canonical propose un support commercial qui facilite l’intégration et la gestion d’Ubuntu en toute sécurité sur le lieu de travail.';

  @override
  String get installationSlidesSupportResources => 'Ressources utiles :';

  @override
  String get installationSlidesSupportDocumentation => 'Documentation officielle';

  @override
  String get installationSlidesSupportUbuntuPro => 'Assistance professionnelle 24h/24 et 7j/7 avec Ubuntu Pro';

  @override
  String get copyingFiles => 'Copie des fichiers…';

  @override
  String get installingSystem => 'Installation du système…';

  @override
  String get configuringSystem => 'Configuration du système…';

  @override
  String get installationFailed => 'Échec de l’installation';

  @override
  String get notEnoughDiskSpaceTitle => 'Pas assez d’espace';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Espace disque insuffisant pour installer $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Disponible :';

  @override
  String get notEnoughDiskSpaceRequired => 'Requis :';

  @override
  String get activeDirectoryOption => 'Utiliser Active Directory';

  @override
  String get activeDirectoryInfo => 'Vous saisirez le domaine et d’autres détails à l’étape suivante.';

  @override
  String get activeDirectoryTitle => 'Configurer Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Tester la connectivité au domaine';

  @override
  String get activeDirectoryDomainLabel => 'Domaine';

  @override
  String get activeDirectoryDomainEmpty => 'Obligatoire';

  @override
  String get activeDirectoryDomainTooLong => 'Trop long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Caractères non valides';

  @override
  String get activeDirectoryDomainStartDot => 'Commence par un point (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Se termine par un point (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Commence par un trait d’union (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Se termine par un trait d’union (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contient deux points adjacents (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domaine introuvable';

  @override
  String get activeDirectoryAdminLabel => 'Nom d’utilisateur pour rejoindre le domaine';

  @override
  String get activeDirectoryAdminEmpty => 'Obligatoire';

  @override
  String get activeDirectoryAdminInvalidChars => 'Caractères non valides';

  @override
  String get activeDirectoryPasswordLabel => 'Mot de passe';

  @override
  String get activeDirectoryPasswordEmpty => 'Obligatoire';

  @override
  String get activeDirectoryErrorTitle => 'Erreur lors de la configuration de la connexion à Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Désolé, Active Directory ne peut pas être configuré pour le moment. Une fois que votre système est opérationnel, consultez <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> pour obtenir de l’aide.';
}
