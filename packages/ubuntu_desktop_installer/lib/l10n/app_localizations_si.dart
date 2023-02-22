import 'app_localizations.dart';

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appTitle => 'උබුන්ටු වැඩතල ස්ථාපකය';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE ස්ථාපනය';
  }

  @override
  String get cancelButtonText => 'අවලංගු';

  @override
  String get changeButtonText => 'වෙනස් කරන්න';

  @override
  String get okButtonText => 'හරි';

  @override
  String get noButtonText => 'නැහැ';

  @override
  String get restartButtonText => 'යළි අරඹන්න';

  @override
  String get revertButtonText => 'ප්‍රතිවර්තනය';

  @override
  String get yesButtonText => 'ඔව්';

  @override
  String get quitButtonText => 'ස්ථාපනයෙන් ඉවතට';

  @override
  String get welcome => 'ආයුබෝවන්';

  @override
  String get welcomeHeader => 'ඔබගේ භාෂාව තෝරන්න:';

  @override
  String get tryOrInstallPageTitle => 'බලන්න හෝ ස්ථාපනය කරන්න';

  @override
  String get repairInstallation => 'ස්ථාපනය අලුත්වැඩියාව';

  @override
  String get repairInstallationDescription => 'Repairing will reinstall all installed software without touching documents or settings.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE අත්හදා බලන්න';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'You can try $RELEASE without making any changes to your computer.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE ස්ථාපනය කරන්න';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Install $RELEASE alongside (or instead of) your current operating system. This shouldn\'t take too long.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'You may wish to read the <a href=\"$url\">release notes</a>.';
  }

  @override
  String get turnOffRST => 'RST අක්‍රිය කරන්න';

  @override
  String get turnOffRSTDescription => 'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'යතුරුපුවරුවේ පිරිසැලසුම';

  @override
  String get chooseYourKeyboardLayout => 'ඔබගේ යතුරුපුවරු පිරිසැලසුම තෝරන්න:';

  @override
  String get typeToTest => 'ඔබගේ යතුරුපුවරුව පරීක්‍ෂාවට මෙතැන ලියන්න';

  @override
  String get detectLayout => 'යතුරුපුවරුවේ පිරිසැලසුම අනාවරණය';

  @override
  String get pressOneKey => 'පහත යතුරු වලින් එකක් ඔබන්න:';

  @override
  String get isKeyPresent => 'පහත යතුර ඔබගේ යතුරුපුවරුවේ තිබේද?';

  @override
  String get configureSecureBootTitle => 'ආරක්‍ෂිත ඇරඹුම හැඩගසන්න';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'ආරක්‍ෂිත ඇරඹුම හැඩගසන්න';

  @override
  String get chooseSecurityKey => 'ආරක්‍ෂණ යතුරක් තෝරන්න';

  @override
  String get confirmSecurityKey => 'ආරක්‍ෂණ යතුර තහවුරු කරන්න';

  @override
  String get dontInstallDriverSoftwareNow => 'දැනට ධාවක මෘදුකාංගය ස්ථාපනය නොකරන්න';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'එය පසුව මෘදුකාංග හා යාවත්කාල හරහා ස්ථාපනය කිරීමට හැකිය.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'ආරක්‍ෂණ යතුර වුවමනාය';

  @override
  String get secureBootSecurityKeysDontMatch => 'ආරක්‍ෂණ යතුරු නොගැළපේ';

  @override
  String get showSecurityKey => 'ආරක්‍ෂණ යතුර පෙන්වන්න';

  @override
  String get connectToInternetPageTitle => 'අන්තර්ජාලයට සබඳින්න';

  @override
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'රැහැන් සම්බන්ධතාවය යොදාගන්න';

  @override
  String get noWiredConnection => 'රැහැන් සම්බන්ධතාවයක් අනාවරණය නොවිණි';

  @override
  String get wiredDisabled => 'රැහැන් සම්බන්ධතාවය අක්‍රියයි';

  @override
  String get wiredMustBeEnabled => 'To use ethernet on this computer, a wired connection must be enabled';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'වයි-ෆයි ජාලයකට සබඳින්න';

  @override
  String get hiddenWifiNetwork => 'සැඟවුණු වයි-ෆයි ජාලයකට සබඳින්න';

  @override
  String get hiddenWifiNetworkNameLabel => 'ජාලයේ නම';

  @override
  String get hiddenWifiNetworkNameRequired => 'ජාල නාමයක් වුවමනාය';

  @override
  String get noInternet => 'දැන් අන්තර්ජාලයට සම්බන්ධ වීමට අවශ්‍ය නැත';

  @override
  String get wirelessNetworkingDisabled => 'රැහැන් රහිත ජාලකරණය අබලයි';

  @override
  String get noWifiDevicesDetected => 'කිසිදු වයි-ෆයි උපාංගයක් අනාවරණය වී නැත';

  @override
  String get wifiMustBeEnabled => 'මෙම පරිගණකයේ වයි-ෆයි භාවිතයට, රැහැන් රහිත ජාලකරණය සබල කළ යුතුය';

  @override
  String get enableWifi => 'වයි-ෆයි සබල කරන්න';

  @override
  String get connectButtonText => 'සබඳින්න';

  @override
  String get updatesOtherSoftwarePageTitle => 'යාවත්කාල හා වෙනත් මෘදුකාංග';

  @override
  String get updatesOtherSoftwarePageDescription => 'What apps would you like to install to start with?';

  @override
  String get normalInstallationTitle => 'සාමාන්‍ය ස්ථාපනය';

  @override
  String get normalInstallationSubtitle => 'වියමන අතිරික්සුව, උපයෝග, කාර්යාල මෘදුකාංග, ක්‍රීඩා සහ මාධ්‍ය වාදක.';

  @override
  String get minimalInstallationTitle => 'අවම ස්ථාපනය';

  @override
  String get minimalInstallationSubtitle => 'වියමන අතිරික්සුව සහ මූලික උපයෝග.';

  @override
  String get otherOptions => 'වෙනත් විකල්ප';

  @override
  String get installThirdPartyTitle => 'Install third-party software for graphics and Wi-Fi hardware, as well as additional media formats';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String get installDriversTitle => 'Install third-party software for graphics and Wi-Fi hardware';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'Download and install support for additional media formats';

  @override
  String get installCodecsSubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'ආරක්‍ෂණ යතුරක් තෝරන්න';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of $RELEASE will not be encrypted.';
  }

  @override
  String get chooseSecurityKeyHint => 'ආරක්‍ෂණ යතුරක් තෝරන්න';

  @override
  String get chooseSecurityKeyConfirmHint => 'ආරක්‍ෂණ යතුර තහවුරු කරන්න';

  @override
  String get chooseSecurityKeyRequired => 'ආරක්‍ෂණ යතුරක් වුවමනාය';

  @override
  String get chooseSecurityKeyMismatch => 'ආරක්‍ෂණ යතුරු නොගැළපේ';

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
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

  @override
  String get installationTypeNoOSDetected => 'This computer currently has no detected operating systems. What would you like to do?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'තැටිය මකාදමා $DISTRO ස්ථාපනය කරන්න';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'වැඩිදුර විශේෂාංග...';

  @override
  String get installationTypeAdvancedTitle => 'වැඩිදුර විශේෂාංග';

  @override
  String get installationTypeNone => 'කිසිවක් නැත';

  @override
  String get installationTypeNoneSelected => 'තේරීමක් නැත';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Use LVM with the new $RELEASE installation';
  }

  @override
  String get installationTypeLVMSelected => 'LVM තෝරා ඇත';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM හා සංකේතනය තෝරා ඇත';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'ආරක්‍ෂාව උදෙසා නව $RELEASE ස්ථාපනය සංකේතනය කරන්න';
  }

  @override
  String get installationTypeEncryptInfo => 'ඔබ ඊළඟ පියවරේදී ආරක්‍ෂණ යතුරක් තෝරා ගනු ඇත.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS තෝරා ඇත';

  @override
  String installationTypeReinstall(Object os) {
    return '$os මකාදමා නැවත ස්ථාපනය කරන්න';
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
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Install $product alongside $os1 and $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Install $product alongside them';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Install $product alongside other partitions';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Something else';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'තැටිය මකාදමා $DISTRO ස්ථාපනය කරන්න';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'ධාවකය තෝරන්න:';

  @override
  String get selectGuidedStorageInfoLabel => 'සමස්ත තැටිය භාවිතා වනු ඇත:';

  @override
  String get selectGuidedStorageInstallNow => 'ස්ථාපනය කරන්න';

  @override
  String get installAlongsideSpaceDivider => 'Allocate drive space by dragging the divider below:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'ගොනු';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'ප්‍රමාණය:';

  @override
  String get installAlongsideAvailable => 'තිබේ:';

  @override
  String get allocateDiskSpace => 'Allocate disk space';

  @override
  String get startInstallingButtonText => 'ස්ථාපනය අරඹන්න';

  @override
  String get diskHeadersDevice => 'උපාංගය';

  @override
  String get diskHeadersType => 'වර්ගය';

  @override
  String get diskHeadersMountPoint => 'Mount point';

  @override
  String get diskHeadersSize => 'ප්‍රමාණය';

  @override
  String get diskHeadersUsed => 'භාවිතයි';

  @override
  String get diskHeadersSystem => 'පද්ධතිය';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'නිදහස් ඉඩ';

  @override
  String get newPartitionTable => 'New partition table';

  @override
  String get newPartitionTableConfirmationTitle => 'Create a new empty partition table on this device?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on it, all its current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'සීමාවට ළඟා විය';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => 'Edit partition';

  @override
  String get partitionSizeLabel => 'ප්‍රමාණය:';

  @override
  String get partitionUnitB => 'බ.';

  @override
  String get partitionUnitKB => 'කි.බ.';

  @override
  String get partitionUnitMB => 'මෙ.බ.';

  @override
  String get partitionUnitGB => 'ගි.බ.';

  @override
  String get partitionTypeLabel => 'Type for the new partition:';

  @override
  String get partitionTypePrimary => 'ප්‍රාථමික';

  @override
  String get partitionTypeLogical => 'තාර්කික';

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
  String get partitionFormatExt2 => 'Ext2 ගොනු පද්ධතිය';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat12 => 'FAT12 ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat16 => 'FAT16 ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat32 => 'FAT32 ගොනු පද්ධතිය';

  @override
  String get partitionFormatSwap => 'Swap area';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 ගොනු පද්ධතිය';

  @override
  String get partitionFormatVfat => 'VFAT ගොනු පද්ධතිය';

  @override
  String get partitionFormatNtfs => 'NTFS ගොනු පද්ධතිය';

  @override
  String get partitionFormatReiserFS => 'ReiserFS ගොනු පද්ධතිය';

  @override
  String get partitionFormatZfsroot => 'ZFS මූල ගොනු පද්ධතිය';

  @override
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String get partitionErase => 'Format the partition';

  @override
  String get partitionMountPointLabel => 'Mount point:';

  @override
  String get whoAreYouPageTitle => 'ඔබ කවුද?';

  @override
  String get whoAreYouPageAutoLogin => 'ස්වයංක්‍රීයව පිවිසෙන්න';

  @override
  String get whoAreYouPageRequirePassword => 'ප්‍රවේශය සඳහා මාගේ මුරපදය වුවමනාය';

  @override
  String get whoAreYouPageRealNameLabel => 'ඔබගේ නම';

  @override
  String get whoAreYouPageRealNameRequired => 'නමක් වුවමනාය';

  @override
  String get whoAreYouPageComputerNameLabel => 'ඔබගේ පරිගණකයේ නම';

  @override
  String get whoAreYouPageComputerNameInfo => 'වෙනත් පරිගණක වෙත අමතන විට නම භාවිතා වේ.';

  @override
  String get whoAreYouPageComputerNameRequired => 'පරිගණකයට නමක් වුවමනාය';

  @override
  String get whoAreYouPageInvalidComputerName => 'පරිගණකයේ නම වලංගු නොවේ';

  @override
  String get whoAreYouPageUsernameLabel => 'පරිශ්‍රීලක නාමයක් තෝරන්න';

  @override
  String get whoAreYouPageUsernameRequired => 'පරිශ්‍රීලක නාමයක් වුවමනාය';

  @override
  String get whoAreYouPageInvalidUsername => 'පරිශ්‍රීලක නාමය වලංගු නොවේ';

  @override
  String get whoAreYouPageUsernameInUse => 'එම පරිශ්‍රීලක නාමය දැනටමත් පවතී.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'එම නම පද්ධතියේ භාවිතයට වෙන් කර ඇත.';

  @override
  String get whoAreYouPageUsernameTooLong => 'නම ඉතා දිගයි.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'එම නමෙහි වලංගු නොවන අකුරු අඩංගු වේ.';

  @override
  String get whoAreYouPagePasswordLabel => 'මුරපදයක් තෝරන්න';

  @override
  String get whoAreYouPagePasswordRequired => 'මුරපදයක් වුවමනාය';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'මුරපදය තහවුරු කරන්න';

  @override
  String get whoAreYouPagePasswordMismatch => 'මුරපද නොගැළපේ';

  @override
  String get whoAreYouPagePasswordShow => 'Show';

  @override
  String get whoAreYouPagePasswordHide => 'Hide';

  @override
  String get writeChangesToDisk => 'වෙනස්කම් තැටියට ලියන්න';

  @override
  String get writeChangesFallbackSerial => 'තැටිය';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'The following partition changes are going to be applied:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition #$disk$partition resized from $oldsize to $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk$partition formatted as $format used for $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition #$disk$partition formatted as $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition #$disk$partition used for $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition #$disk$partition created';
  }

  @override
  String get chooseYourLookPageTitle => 'ඔබගේ පෙනුම තෝරන්න';

  @override
  String get chooseYourLookPageHeader => 'මෙය පසුව පෙනුම සැකසුම් හරහා වෙනස් කිරීමට හැකිය.';

  @override
  String get chooseYourLookPageDarkSetting => 'අඳුරු';

  @override
  String get chooseYourLookPageLightSetting => 'දීප්ත';

  @override
  String get installationCompleteTitle => 'ස්ථාපනය සම්පූර්ණයි';

  @override
  String readyToUse(Object system) {
    return '**$system** ස්ථාපිත බැවින් භාවිතයට සූදානම්.';
  }

  @override
  String restartInto(Object system) {
    return '$system වෙත යළි අරඹන්න';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'You can continue testing $RELEASE now, but until you restart the computer, any changes you make or documents you save will not be preserved.';
  }

  @override
  String get shutdown => 'වසා දමන්න';

  @override
  String get restartNow => 'යළි අරඹන්න';

  @override
  String get continueTesting => 'Continue Testing';

  @override
  String get turnOffBitlockerTitle => 'බිට්ලොකර් අක්‍රිය කරන්න';

  @override
  String get turnOffBitlockerDescription => 'මෙම පරිගණකය වින්ඩෝස් බිට්ලොකර් සංකේතනය භාවිතා කරයි.\nඋබුන්ටු ස්ථාපනයට පෙර ඔබ වින්ඩෝස් හි බිට්ලොකර් අක්‍රිය කළ යුතුය.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'උපදෙස් සඳහා, දුරකථනයක හෝ වෙනත් උපාංගයක මෙම පිටුව අරින්න: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'වින්ඩෝස් වෙත යළි අරඹන්න';

  @override
  String get whereAreYouPageTitle => 'ඔබ කොහිද?';

  @override
  String get whereAreYouLocationLabel => 'ස්ථානය';

  @override
  String get whereAreYouTimezoneLabel => 'වේලා කලාපය';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return '$RELEASE වෙත පිළිගනිමු';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Fast and full of new features, the latest version of $RELEASE makes computing easier than ever. Here are just a few cool new things to look out for...';
  }

  @override
  String get softwareSlideTitle => 'තවත් මෘදුකාංග සොයාගන්න';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Say goodbye to searching the web for new software. With access to the Snap Store and the $RELEASE software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.';
  }

  @override
  String get musicSlideTitle => 'Take your music with you';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
  }

  @override
  String get musicSlideRhythmbox => 'රිදම්බොක්ස් සංගීත වාදකය';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Have fun with your photos';

  @override
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Shotwell Photo Manager';

  @override
  String get photoSlideGimp => 'GIMP Image Editor';

  @override
  String get photoSlideShotcut => 'ෂොට්කට් දෘශ්‍යක සංස්කරකය';

  @override
  String get webSlideTitle => 'Make the most of the web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'ෆයර්ෆොක්ස් අතිරික්සුව';

  @override
  String get webSlideThunderbird => 'තන්ඩර්බර්ඩ්';

  @override
  String get webSlideChromium => 'ක්‍රෝමියම්';

  @override
  String get officeSlideTitle => 'Everything you need for the office';

  @override
  String get officeSlideDescription => 'LibreOffice is a libre office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need.';

  @override
  String get officeSlideWriter => 'ලිබ්රේඔෆිස් රයිටර්';

  @override
  String get officeSlideCalc => 'ලිබ්රේඔෆිස් කැල්ක්';

  @override
  String get officeSlideImpress => 'ලිබ්රේඔෆිස් ඉම්ප්‍රෙස්';

  @override
  String get accessSlideTitle => 'Access for everyone';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colors and text size, $RELEASE makes computing easy — whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'අභිරුචිකරණ විකල්ප';

  @override
  String get accessSlideAppearance => 'පෙනුම';

  @override
  String get accessSlideAssistiveTechnologies => 'Assistive technologies';

  @override
  String get accessSlideLanguageSupport => 'භාෂා සහාය';

  @override
  String get supportSlideTitle => 'උදව් හා සහාය';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common aspects of $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'අඩංගු මෘදුකාංග';

  @override
  String get availableSoftware => 'තිබෙන මෘදුකාංග';

  @override
  String get supportedSoftware => 'සහාය දක්වන මෘදුකාංග';

  @override
  String get copyingFiles => 'ගොනු පිටපත් වෙමින්…';

  @override
  String get installingSystem => 'පද්ධතිය ස්ථාපනය වෙමින්…';

  @override
  String get configuringSystem => 'පද්ධතිය පිහිටුවමින්…';

  @override
  String get installationFailed => 'ස්ථාපනයට අසමත් විය';

  @override
  String get notEnoughDiskSpaceTitle => 'කණගාටුයි';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'You need at least $SIZE disk space to install $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'This computer has only $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'The biggest disk on this computer is only $SIZE.';
  }
}
