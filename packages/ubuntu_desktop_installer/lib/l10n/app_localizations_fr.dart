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
  String get cancelButtonText => 'Annuler';

  @override
  String get changeButtonText => 'Changer';

  @override
  String get okButtonText => 'Ok';

  @override
  String get noButtonText => 'Non';

  @override
  String get restartButtonText => 'Redémarrer';

  @override
  String get revertButtonText => 'Rétablir';

  @override
  String get yesButtonText => 'Oui';

  @override
  String get quitButtonText => 'Quitter l’installation';

  @override
  String get welcome => 'Bienvenue';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Choisissez votre langue :';

  @override
  String get tryOrInstallPageTitle => 'Essayer ou installer';

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
  String get turnOffRST => 'Désactiver RST';

  @override
  String get turnOffRSTDescription => 'Cet ordinateur utilise la technologie RST (Rapid Storage Technology) d’Intel. Il est nécessaire de désactiver RST sous Windows avant d’installer Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Pour des instructions détaillées, veuillez ouvrir ce lien sur un téléphone ou un autre appareil : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Disposition du clavier';

  @override
  String get chooseYourKeyboardLayout => 'Indiquez la disposition de votre clavier :';

  @override
  String get typeToTest => 'Saisissez du texte ici pour tester votre clavier';

  @override
  String get detectLayout => 'Détecter la disposition du clavier';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Veuillez appuyer sur l’une des touches suivantes :';

  @override
  String get isKeyPresent => 'Cette touche est-elle présente sur votre clavier ?';

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
  String get connectToInternetPageTitle => 'Se connecter à internet';

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
  String get updatesOtherSoftwarePageTitle => 'Mises à jour et autres logiciels';

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
    return '<font color=\"$color\"> Avertissement:</font> L’ordinateur n’est pas branché à une source d’alimentation.';
  }

  @override
  String get offlineWarning => 'Vous êtes actuellement hors ligne';

  @override
  String get chooseSecurityKeyTitle => 'Choisir un code de sécurité';

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
    return '<font color=\"$color\">Attention :</font> Si vous oubliez la clé de sécurité, toutes les données seront perdues. Il est recommandé de noter cette clé puis de la stocker dans en lieu sûr.';
  }

  @override
  String get installationTypeTitle => 'Type d’installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Cet ordinateur est installé avec $os. Que voulez-vous faire ?';
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
    return '<font color=\"$color\">Attention:</font> Cela va supprimer tous vos programmes, documents, photos, musiques, et tous les autres fichiers sur tous les systèmes d’exploitation.';
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
  String get installationTypeZFS => 'EXPERIMENTAL : Effacer le disque et utiliser ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS sélectionné';

  @override
  String installationTypeReinstall(Object os) {
    return 'Supprimer $os et réinstaller';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Attention :</font> Cela va supprimer tous vos programmes, documents, photos, musiques, et tous les fichiers de $os.';
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
  String get installationTypeManual => 'Autre chose';

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
  String get installAlongsideSpaceDivider => 'Allouez de l’espace disque en déplaçant le séparateur ci-dessous :';

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
  String get installAlongsidePartition => 'Partition :';

  @override
  String get installAlongsideSize => 'Taille :';

  @override
  String get installAlongsideAvailable => 'Disponible :';

  @override
  String get allocateDiskSpace => 'Allouer de l’espace disque';

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
  String get newPartitionTableConfirmationTitle => 'Créer une nouvelle table de partitions sur ce périphérique ?';

  @override
  String get newPartitionTableConfirmationMessage => 'Vous avez sélectionné un périphérique entier à partitionner. Si vous continuez en créant une nouvelle table de partitions, toutes les partitions actuellement sur ce périphérique seront supprimées.\n\nVous pourrez annuler cette opération plus tard si vous le souhaitez.';

  @override
  String get tooManyPrimaryPartitions => 'Trop de partitions primaires';

  @override
  String get partitionLimitReached => 'Limite atteinte';

  @override
  String get bootLoaderDevice => 'Périphérique pour installer le chargeur d’amorçage';

  @override
  String get partitionCreateTitle => 'Créer une partition';

  @override
  String get partitionEditTitle => 'Modifier la partition';

  @override
  String get partitionSizeLabel => 'Taille :';

  @override
  String get partitionUnitB => 'o';

  @override
  String get partitionUnitKB => 'Ko';

  @override
  String get partitionUnitMB => 'Mo';

  @override
  String get partitionUnitGB => 'Go';

  @override
  String get partitionTypeLabel => 'Type pour la nouvelle partition :';

  @override
  String get partitionTypePrimary => 'Primaire';

  @override
  String get partitionTypeLogical => 'Logique';

  @override
  String get partitionLocationLabel => 'Emplacement pour la nouvelle partition :';

  @override
  String get partitionLocationBeginning => 'Début de cet espace';

  @override
  String get partitionLocationEnd => 'Fin de cet espace';

  @override
  String get partitionFormatLabel => 'Utilisée comme :';

  @override
  String get partitionFormatExt4 => 'Système de fichiers Ext4 journalisé';

  @override
  String get partitionFormatExt3 => 'Système de fichiers Ext3 journalisé';

  @override
  String get partitionFormatExt2 => 'Système de fichiers Ext2';

  @override
  String get partitionFormatBtrfs => 'Système de fichiers btrfs journalisé';

  @override
  String get partitionFormatJfs => 'Système de fichiers JFS journalisé';

  @override
  String get partitionFormatXfs => 'Système de fichiers XFS journalisé';

  @override
  String get partitionFormatFat => 'Système de fichiers FAT';

  @override
  String get partitionFormatFat12 => 'Système de fichiers FAT12';

  @override
  String get partitionFormatFat16 => 'Système de fichiers FAT16';

  @override
  String get partitionFormatFat32 => 'Système de fichiers FAT32';

  @override
  String get partitionFormatSwap => 'Espace de swap';

  @override
  String get partitionFormatIso9660 => 'Système de fichiers ISO 9660';

  @override
  String get partitionFormatVfat => 'Système de fichiers VFAT';

  @override
  String get partitionFormatNtfs => 'Système de fichiers NTFS';

  @override
  String get partitionFormatReiserFS => 'Système de fichiers ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Système de fichiers racine ZFS';

  @override
  String get partitionFormatNone => 'Laisser non formatée';

  @override
  String get partitionErase => 'Formatter la partition';

  @override
  String get partitionMountPointLabel => 'Point de montage :';

  @override
  String get whoAreYouPageTitle => 'Qui êtes-vous ?';

  @override
  String get whoAreYouPageAutoLogin => 'Ouvrir la session automatiquement';

  @override
  String get whoAreYouPageRequirePassword => 'Demander mon mot de passe pour ouvrir une session';

  @override
  String get whoAreYouPageRealNameLabel => 'Votre nom';

  @override
  String get whoAreYouPageRealNameRequired => 'Votre nom est requis';

  @override
  String get whoAreYouPageRealNameTooLong => 'Ce nom est trop long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Le nom de votre ordinateur';

  @override
  String get whoAreYouPageComputerNameInfo => 'Le nom qu’il utilise pour communiquer avec d’autres ordinateurs.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Un nom pour l’ordinateur est requis';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Ce nom est trop long.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Ce nom d’ordinateur est invalide';

  @override
  String get whoAreYouPageUsernameLabel => 'Choisir un nom d’utilisateur';

  @override
  String get whoAreYouPageUsernameRequired => 'Un nom d’utilisateur est requis';

  @override
  String get whoAreYouPageInvalidUsername => 'Ce nom d’utilisateur est invalide';

  @override
  String get whoAreYouPageUsernameInUse => 'Ce nom d’utilisateur existe déjà.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Ce nom est réservé pour le système.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Ce nom est trop long.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Ce nom contient des caractères invalides.';

  @override
  String get whoAreYouPagePasswordLabel => 'Choisir un mot de passe';

  @override
  String get whoAreYouPagePasswordRequired => 'Un mot de passe est requis';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirmez votre mot de passe';

  @override
  String get whoAreYouPagePasswordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get whoAreYouPagePasswordShow => 'Montrer';

  @override
  String get whoAreYouPagePasswordHide => 'Cacher';

  @override
  String get writeChangesToDisk => 'Appliquer les changements sur les disques';

  @override
  String get writeChangesFallbackSerial => 'disque';

  @override
  String get writeChangesDescription => 'Si vous continuez, les changements ci-dessous seront écrits sur les disques. Vous pourrez faire des changements ultérieurs manuellement.';

  @override
  String get writeChangesPartitionTablesHeader => 'Les tables de partitions des périphériques suivants seront modifiées :';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Les modification suivantes sur les partitions seront appliquées :';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'la partition #$disk$partition redimensionnée de $oldsize à $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'la partition #$disk$partition formatée en $format utilisée pour $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'la partition #$disk$partition formatée en $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'la partition #$disk$partition utilisée pour $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'la partition #$disk$partition créée';
  }

  @override
  String get chooseYourLookPageTitle => 'Choisissez l’apparence';

  @override
  String get chooseYourLookPageHeader => 'Vous pourrez la changer ultérieurement dans les préférences d’apparence.';

  @override
  String get chooseYourLookPageDarkSetting => 'Sombre';

  @override
  String get chooseYourLookPageLightSetting => 'Clair';

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
  String get turnOffBitlockerTitle => 'Désactiver BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Cet ordinateur utilise le chiffrement BitLocker de Windows.\nVous devez désactiver BitLocker dans Windows avant d’installer Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Pour obtenir des instructions, ouvrez cette page sur un téléphone ou un autre appareil : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Redémarrer sous Windows';

  @override
  String get whereAreYouPageTitle => 'Où êtes-vous ?';

  @override
  String get whereAreYouLocationLabel => 'Localisation';

  @override
  String get whereAreYouTimezoneLabel => 'Fuseau horaire';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Available:';

  @override
  String get installationSlidesIncluded => 'Included:';

  @override
  String get installationSlidesWelcomeTitle => 'Fast, free and full of new features';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'The latest version of $DISTRO makes computing easier than ever.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'All the applications you need';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and $DISTRO archive.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Develop with the best of open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Enhance your creativity';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'Great for gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Private and secure';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'All $DISTRO LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Power up your productivity';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Access for everyone';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Screen Reader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Language support';

  @override
  String get installationSlidesSupportTitle => 'Help & Support';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'The official $DISTRO documentation is available both online and via the Help icon in the dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'Helpful resources:';

  @override
  String get installationSlidesSupportDocumentation => 'Official documentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Enterprise-grade 24/7 support with Ubuntu Pro';

  @override
  String get copyingFiles => 'Copie des fichiers…';

  @override
  String get installingSystem => 'Installation du système…';

  @override
  String get configuringSystem => 'Configuration du système…';

  @override
  String get installationFailed => 'Échec de l’installation';

  @override
  String get notEnoughDiskSpaceTitle => 'Désolé';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Vous avec besoin d’au moins $SIZE d’espace disque pour installer $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Cet ordinateur n’a que $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'Le plus grand disque sur cet ordinateur n’a que $SIZE.';
  }

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
  String get activeDirectoryDomainStartHyphen => 'Commence par un trait d\'union (-)';

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
