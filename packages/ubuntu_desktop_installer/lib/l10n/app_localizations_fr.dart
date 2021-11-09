


import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Programme d’installation du bureau Ubuntu';

  @override
  String get windowTitle => 'Installer Ubuntu';

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
  String get tryUbuntu => 'Essayer Ubuntu';

  @override
  String get tryUbuntuDescription => 'Vous pouvez essayer Ubuntu sans appliquer aucun changement à votre ordinateur.';

  @override
  String get installUbuntu => 'Installer Ubuntu';

  @override
  String get installUbuntuDescription => 'Installer Ubuntu à côté (ou en remplacement) de votre système d’exploitation actuel. Ceci ne devrait pas prendre trop longtemps.';

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
  String get chooseYourKeyboardLayout => 'Indiquez la disposition de votre clavier :';

  @override
  String get typeToTest => 'Saisissez du texte ici pour tester votre clavier';

  @override
  String get detectLayout => 'Détecter la disposition du clavier';

  @override
  String get pressOneKey => 'Veuillez presser une des touches suivantes :';

  @override
  String get isKeyPresent => 'Est-ce que la touche suivante est présente sur votre clavier ?';

  @override
  String get configureSecureBootTitle => 'Configure Secure Boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Configure Secure Boot';

  @override
  String get chooseSecurityKey => 'Choose a security key';

  @override
  String get confirmSecurityKey => 'Confirm the security key';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Security key is required';

  @override
  String get secureBootSecurityKeysDontMatch => 'Security keys do not match';

  @override
  String get updatesOtherSoftwarePageTitle => 'Mises à jour et logiciels supplémentaires';

  @override
  String get updatesOtherSoftwarePageDescription => 'Quelles applications souhaitez-vous installer pour commencer?';

  @override
  String get normalInstallationTitle => 'Installation normale';

  @override
  String get normalInstallationSubtitle => 'Navigateur internet, utilitaires, bureautique, jeux et lecteurs multimédia.';

  @override
  String get minimalInstallationTitle => 'Installation minimale';

  @override
  String get minimalInstallationSubtitle => 'Navigateur internet et utilitaires de base.';

  @override
  String get otherOptions => 'Autres options';

  @override
  String get installThirdPartyTitle => 'Installer des logiciels tiers pour le support du matériel graphique et Wi-Fi, ainsi que des formats multimédia supplémentaires';

  @override
  String get installThirdPartySubtitle => 'Ce logiciel est soumis à des termes de licence inclus dans sa documentation. Certains sont propriétaires.';

  @override
  String get chooseSecurityKeyTitle => 'Choose a security key';

  @override
  String get chooseSecurityKeyHeader => 'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of Ubuntu will not be encrypted.';

  @override
  String get chooseSecurityKeyHint => 'Choose a security key';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirm the security key';

  @override
  String get chooseSecurityKeyRequired => 'A security key is required';

  @override
  String get chooseSecurityKeyMismatch => 'The security keys do not match';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Installation type';

  @override
  String installationTypeOSDetected(Object os) {
    return 'This computer currently has $os on it. What would you like to do?';
  }

  @override
  String get installationTypeNoOSDetected => 'This computer currently has no detected operating systems. What would you like to do?';

  @override
  String get installationTypeErase => 'Erase disk and install Ubuntu';

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Advanced Features...';

  @override
  String get installationTypeAdvancedTitle => 'Advanced features';

  @override
  String get installationTypeNone => 'None';

  @override
  String get installationTypeNoneSelected => 'None selected';

  @override
  String get installationTypeLVM => 'Use LVM with the new Ubuntu installation';

  @override
  String get installationTypeLVMSelected => 'LVM selected';

  @override
  String get installationTypeEncrypt => 'Encrypt the new Ubuntu installation for security';

  @override
  String get installationTypeEncryptInfo => 'You will choose a security key in the next step.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selected';

  @override
  String installationTypeReinstall(Object os) {
    return 'Erase $os and reinstall';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Warning:</font> This will delete all your $os programs, documents, photos, music, and any other files.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Install $product alongside $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Something else';

  @override
  String get installationTypeManualInfo => 'You can create or resize partitions yourself, or choose multiple partitions for Ubuntu';

  @override
  String get selectGuidedStoragePageTitle => 'Erase disk and install Ubuntu';

  @override
  String get selectGuidedStorageDropdownLabel => 'Select drive:';

  @override
  String get selectGuidedStorageInfoLabel => 'The entire disk will be used:';

  @override
  String get selectGuidedStorageInstallNow => 'Install Now';

  @override
  String get allocateDiskSpace => 'Allouer de l’espace disque';

  @override
  String get startInstallingButtonText => 'Commencer l’installation';

  @override
  String get diskHeadersDevice => 'Disque';

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
  String get freeDiskSpace => 'free space';

  @override
  String get newPartitionTable => 'New partition table';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => 'Edit partition';

  @override
  String get partitionSizeLabel => 'Size:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Type for the new partition:';

  @override
  String get partitionTypePrimary => 'Primary';

  @override
  String get partitionTypeLogical => 'Logical';

  @override
  String get partitionLocationLabel => 'Location for the new partition:';

  @override
  String get partitionLocationBeginning => 'Beginning of this space';

  @override
  String get partitionLocationEnd => 'End of this space';

  @override
  String get partitionFormatLabel => 'Used as:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Ext2 file system';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT file system';

  @override
  String get partitionFormatFat12 => 'FAT12 file system';

  @override
  String get partitionFormatFat16 => 'FAT16 file system';

  @override
  String get partitionFormatFat32 => 'FAT32 file system';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 file system';

  @override
  String get partitionFormatVfat => 'VFAT file system';

  @override
  String get partitionFormatNtfs => 'NTFS file system';

  @override
  String get partitionFormatReiserFS => 'ReiserFS file system';

  @override
  String get partitionFormatZfsroot => 'ZFS root file system';

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Mount point:';

  @override
  String get whoAreYouPageTitle => 'Who are you?';

  @override
  String get whoAreYouPageAutoLogin => 'Log in automatically';

  @override
  String get whoAreYouPageRequirePassword => 'Require my password to log in';

  @override
  String get whoAreYouPageRealNameLabel => 'Your name';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageComputerNameLabel => 'Your computer\'s name';

  @override
  String get whoAreYouPageComputerNameInfo => 'The name it uses when it talks to other computers.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A computer name is required';

  @override
  String get whoAreYouPageInvalidComputerName => 'The computer name is invalid';

  @override
  String get whoAreYouPageUsernameLabel => 'Pick a username';

  @override
  String get whoAreYouPageUsernameRequired => 'A username is required';

  @override
  String get whoAreYouPageInvalidUsername => 'The username is invalid';

  @override
  String get whoAreYouPagePasswordLabel => 'Choose a password';

  @override
  String get whoAreYouPagePasswordRequired => 'A password is required';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Confirm your password';

  @override
  String get whoAreYouPagePasswordMismatch => 'The passwords do not match';

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
    return 'partition #$disk${partition} as $format used for $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} as $format';
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
  String get installationCompleteTitle => 'Installation complete';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Shut Down';

  @override
  String get turnOffBitlockerTitle => 'Turn off BitLocker';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Restart Into Windows';
}
