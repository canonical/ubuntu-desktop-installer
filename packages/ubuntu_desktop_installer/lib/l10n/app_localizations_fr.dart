


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
  String get welcome => 'Bienvenue';

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
  String get pressOneKey => 'Veuillez appuyer sur l\'une des touches suivantes :';

  @override
  String get isKeyPresent => 'Cette touche est-elle présente sur votre clavier ?';

  @override
  String get configureSecureBootTitle => 'Configurer Secure Boot';

  @override
  String get configureSecureBootDescription => 'Vous avez choisi d\'installer des pilotes logiciels tiers. Cela nécessite de désactiver Secure Boot.\nPour cela, vous devez choisir une clé de sécurité maintenant, et l\'entrer quand le système démarrera.';

  @override
  String get configureSecureBootOption => 'Configurer Secure Boot';

  @override
  String get chooseSecurityKey => 'Choisir un code de sécurité';

  @override
  String get confirmSecurityKey => 'Confirmer le code de sécurité';

  @override
  String get dontInstallDriverSoftwareNow => 'Ne pas installer le pilote maintenant';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Vous pouvez l\'installer ultérieurement depuis Logiciel & Mises à jour.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'La clé de sécurité est nécessaire';

  @override
  String get secureBootSecurityKeysDontMatch => 'Les codes de sécurité ne correspondent pas';

  @override
  String get connectToInternetPageTitle => 'Se connecter à internet';

  @override
  String get connectToInternetDescription => 'Connecter cet ordinateur à internet aidera Ubuntu à installer des logiciels supplémentaires et à déterminer votre fuseau horaire.\n\nConnectez un câble Ethernet, ou choisissez un réseau Wifi';

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
  String get selectWifiNetwork => 'Se connecter à un réseau Wifi';

  @override
  String get noInternet => 'Je ne souhaite pas me connecter à internet pour l\'instant';

  @override
  String get wirelessNetworkingDisabled => 'Le réseau sans fil est désactivé';

  @override
  String get noWifiDevicesDetected => 'Aucun périphérique Wifi détecté';

  @override
  String get wifiMustBeEnabled => 'Pour utiliser le Wifi sur cet ordinateur, cette fonctionnalité doit être activée';

  @override
  String get enableWifi => 'Activer le Wifi';

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
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Choisir un code de sécurité';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Le chiffrement du disque protège vos fichiers au cas où vous perdriez votre ordinateur. Il exige que vous saisissiez une clef de sécurité à chaque fois que l\'ordinateur démarre. \n\nTous les fichiers en dehors de $RELEASE ne seront pas chiffrés.';
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
    return '<font color=\"$color\">Attention</font> : Si vous oubliez la clé de sécurité, toutes les données seront perdues. Il est recommandé de noter cette clé puis de la stocker dans en lieu sûr.';
  }

  @override
  String get installationTypeTitle => 'Type d’installation';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Cet ordinateur est installé avec $os. Que voulez-vous faire ?';
  }

  @override
  String get installationTypeNoOSDetected => 'Aucun système d’exploitation n’a été détecté sur cet ordinateur. Que voulez-vous faire ?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Effacer le disque et installer $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Attention:</font> Cela va supprimer tous vos programmes, documents, photos, musiques, et tous les autres fichiers sur tous les systèmes d\'exploitation.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Fonctions avancées ...';

  @override
  String get installationTypeAdvancedTitle => 'Fonctions avancées';

  @override
  String get installationTypeNone => 'Aucune';

  @override
  String get installationTypeNoneSelected => 'Aucune sélectionnée';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Utiliser LVM pour la nouvelle installation $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM sélectionné';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Chiffrer la nouvelle installation de $RELEASE pour la sécurité';
  }

  @override
  String get installationTypeEncryptInfo => 'Vous allez choisir une clé de sécurité à l\'étape suivante.';

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
  String get allocateDiskSpace => 'Allouer de l’espace disque';

  @override
  String get startInstallingButtonText => 'Commencer l’installation';

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
  String get freeDiskSpace => 'espace libre';

  @override
  String get newPartitionTable => 'Nouvelle table de partition';

  @override
  String get newPartitionTableConfirmationTitle => 'Créer une nouvelle table de partitions sur ce périphérique ?';

  @override
  String get newPartitionTableConfirmationMessage => 'Vous avez sélectionné un périphérique entier à partitionner. Si vous continuez en créant une nouvelle table de partitions, toutes les partitions actuellement sur ce périphérique seront supprimées.\n\nVous pourrez annuler cette opération plus tard si vous le souhaitez.';

  @override
  String get bootLoaderDevice => 'Périphérique pour installer le chargeur d\'amorçage';

  @override
  String get partitionCreateTitle => 'Créer une partition';

  @override
  String get partitionEditTitle => 'Modifier la partition';

  @override
  String get partitionSizeLabel => 'Taille :';

  @override
  String get partitionUnitB => 'o';

  @override
  String get partitionUnitKB => 'ko';

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
  String get whoAreYouPageComputerNameLabel => 'Le nom de votre ordinateur';

  @override
  String get whoAreYouPageComputerNameInfo => 'Le nom qu’il utilise pour communiquer avec d’autres ordinateurs.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Un nom pour l\'ordinateur est requis';

  @override
  String get whoAreYouPageInvalidComputerName => 'Ce nom d\'ordinateur est invalide';

  @override
  String get whoAreYouPageUsernameLabel => 'Choisir un nom d’utilisateur';

  @override
  String get whoAreYouPageUsernameRequired => 'Un nom d\'utilisateur est requis';

  @override
  String get whoAreYouPageInvalidUsername => 'Ce nom d\'utilisateur est invalide';

  @override
  String get whoAreYouPagePasswordLabel => 'Choisir un mot de passe';

  @override
  String get whoAreYouPagePasswordRequired => 'Un mot de passe est requis';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirmez votre mot de passe';

  @override
  String get whoAreYouPagePasswordMismatch => 'Les mots de passe ne correspondent pas';

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
  String get writeChangesPartitionsHeader => 'Les partitions suivantes seront formattées :';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'la partition #$disk${partition} en $format est utilisée pour $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} en $format';
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
  String get chooseYourLookPageLightBodyText => 'Clair et brillant';

  @override
  String get chooseYourLookPageDarkBodyText => 'Sombre et foncé';

  @override
  String get installationCompleteTitle => 'Installation terminée';

  @override
  String readyToUse(Object system) {
    return '**$system** est installé et prêt à être utilisé.';
  }

  @override
  String restartInto(Object system) {
    return 'Redémarrer sous $system';
  }

  @override
  String get shutdown => 'Éteindre';

  @override
  String get turnOffBitlockerTitle => 'Désactiver BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Cet ordinateur utilise le chiffrement BitLocker de Windows.\nVous devez désactiver BitLocker dans Windows avant d\'installer Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Pour obtenir des instructions, ouvrez cette page sur un téléphone ou un autre appareil : <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Redémarrer sous Windows';
}
