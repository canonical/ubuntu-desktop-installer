


import 'app_localizations.dart';

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Desktop Installer';

  @override
  String get windowTitle => 'Install Ubuntu';

  @override
  String get cancelButtonText => 'Cancel';

  @override
  String get changeButtonText => 'Change';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'No';

  @override
  String get restartButtonText => 'Restart';

  @override
  String get revertButtonText => 'Revert';

  @override
  String get yesButtonText => 'Yes';

  @override
  String get welcome => 'Welcome';

  @override
  String get tryOrInstallPageTitle => 'Try or install';

  @override
  String get repairInstallation => 'Repair installation';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String get tryUbuntu => 'Try Ubuntu';

  @override
  String get tryUbuntuDescription => 'You can try Ubuntu without making any changes to your computer.';

  @override
  String get installUbuntu => 'Install Ubuntu';

  @override
  String get installUbuntuDescription => 'Install Ubuntu alongside (or instead of) your current operating system. This shouldn\'t take too long.';

  @override
  String releaseNotesLabel(Object url) {
    return 'You may wish to read the <a href=\"$url\">release notes</a>.';
  }

  @override
  String get turnOffRST => 'Turn off RST';

  @override
  String get turnOffRSTDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Keyboard layout';

  @override
  String get chooseYourKeyboardLayout => 'Choose your keyboard layout:';

  @override
  String get typeToTest => 'Type here to test your keyboard';

  @override
  String get detectLayout => 'Detect Keyboard Layout';

  @override
  String get pressOneKey => 'Please press one of the following keys:';

  @override
  String get isKeyPresent => 'Is the following key present on your keyboard?';

  @override
  String get configureSecureBootTitle => 'Configure secure boot';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Turn off secure boot';

  @override
  String get chooseSecurityKey => 'Choose a security key';

  @override
  String get confirmSecurityKey => 'Confirm security key';

  @override
  String get dontInstallDriverSoftwareNow => 'Don\'t install the driver software for now';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'You can install it later from Software & Updates Settings.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Security key is required';

  @override
  String get secureBootSecurityKeysDontMatch => 'Security keys do not match';

  @override
  String get updatesOtherSoftwarePageTitle => 'Updates and other software';

  @override
  String get updatesOtherSoftwarePageDescription => 'What apps would you like to install to start with?';

  @override
  String get normalInstallationTitle => 'Normal installation';

  @override
  String get normalInstallationSubtitle => 'Web browser, utilities, office software, games and media players.';

  @override
  String get minimalInstallationTitle => 'Minimal installation';

  @override
  String get minimalInstallationSubtitle => 'Web browser and basic utilities.';

  @override
  String get otherOptions => 'Other options';

  @override
  String get installThirdPartyTitle => 'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'Start Installing';

  @override
  String get diskHeadersDevice => 'Device';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Mount point';

  @override
  String get diskHeadersSize => 'Size';

  @override
  String get diskHeadersUsed => 'Used';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Format';

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
  String get partitionFormatFat16 => 'FAT16 file system';

  @override
  String get partitionFormatFat32 => 'FAT32 file system';

  @override
  String get partitionFormatSwap => 'swap area';

  @override
  String get partitionFormatBios => 'Reserved BIOS boot area';

  @override
  String get partitionFormatEfi => 'EFI System Partition';

  @override
  String get partitionFormatPhysical => 'physical volume for encryption';

  @override
  String get partitionFormatNone => 'do not use the partition';

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
  String get writeChangesToDisk => 'Write changes to disk';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'The following partitions are going to be formatted:';

  @override
  String writeChangesPartitionEntryPrimaryFull(Object partitionNumber, Object diskSerial, Object diskPath, Object fstype, Object mountPath) {
    return 'partition #$partitionNumber of $diskSerial ($diskPath) as $fstype used for $mountPath';
  }

  @override
  String writeChangesPartitionEntryPrimary(Object partitionNumber, Object diskSerial, Object diskPath) {
    return 'partition #$partitionNumber of $diskSerial ($diskPath) as';
  }

  @override
  String writeChangesPartitionEntrySecondary(Object fstype, Object mountPath) {
    return '        partition # as $fstype used for $mountPath';
  }

  @override
  String get chooseYourLookPageTitle => 'Choose your look';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Dark';

  @override
  String get chooseYourLookPageLightSetting => 'Light';

  @override
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

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

/// The translations for Italian, as used in Italy (`it_IT`).
class AppLocalizationsItIt extends AppLocalizationsIt {
  AppLocalizationsItIt(): super('it_IT');

  @override
  String get appTitle => 'Installer di Ubuntu Desktop';

  @override
  String get windowTitle => 'Installa Ubuntu';

  @override
  String get restartButtonText => 'Riavvia';

  @override
  String get welcome => 'Benvenuto';

  @override
  String get tryOrInstallPageTitle => 'Prova o installa';

  @override
  String get repairInstallation => 'Ripara installazione';

  @override
  String get repairInstallationDescription => 'La riparazione reinstallerá tutti i programmi senza toccare alcun documento o impostazione.';

  @override
  String get tryUbuntu => 'Prova Ubuntu';

  @override
  String get tryUbuntuDescription => 'Puoi provare Ubuntu senza apportare alcuna modifica al tuo computer.';

  @override
  String get installUbuntu => 'Installa Ubuntu';

  @override
  String get installUbuntuDescription => 'Installa Ubuntu accanto (o al posto di) al tuo sistema operativo attuale. Questo non dovrebbe durare molto.';

  @override
  String releaseNotesLabel(Object url) {
    return 'Forse vorresti leggere le <a href=\"$url\">informazioni di rilascio</a>.';
  }

  @override
  String get turnOffRST => 'Disattiva RST';

  @override
  String get turnOffRSTDescription => 'Questo computer usa Intel RST (Rapid Storage Technology). Devi disattivare RST da Windows prima di poter installare Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Per istruzioni, apri questa pagina da un telefono o un altro dispositivo: <a href=\"https://$url\">$url</a>';
  }
}
