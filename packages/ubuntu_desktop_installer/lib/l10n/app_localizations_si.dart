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
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'ඔබගේ භාෂාව තෝරන්න:';

  @override
  String get tryOrInstallPageTitle => 'බලන්න හෝ ස්ථාපනය කරන්න';

  @override
  String get repairInstallation => 'ස්ථාපනය අලුත්වැඩියාව';

  @override
  String get repairInstallationDescription => 'ලේඛන හෝ සැකසුම් ස්පර්ශ නොකර ස්ථාපිත සියළුම මෘදුකාංග යළි ස්ථාපනය අළුත්වැඩියාව මගින් සිදුවේ.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE අත්හදා බලන්න';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'ඔබගේ පරිගණකයට කිසිදු වෙනසක් නොකර $RELEASE බැලීමට හැකිය.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE ස්ථාපනය කරන්න';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'ඔබගේ වත්මන් මෙහෙයුම් පද්ධතිය සමඟ (හෝ ඒ වෙනුවට) $RELEASE ස්ථාපනය කරන්න. මෙයට එතරම් කාලයක් ගත නොවේ.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'මෙතැනින් <a href=\"$url\">නිකුතු සටහන්</a> කියවීමට හැකිය.';
  }

  @override
  String get turnOffRST => 'RST අක්‍රිය කරන්න';

  @override
  String get turnOffRSTDescription => 'මෙම පරිගණකය ඉන්ටෙල් RST (ශ්‍රීඝ්‍ර ආචයන තාක්‍ෂණය) භාවිතා කරයි. උබුන්ටු ස්ථාපනයට පෙර වින්ඩෝස් හි RST අක්‍රිය කළ යුතුය.';

  @override
  String instructionsForRST(Object url) {
    return 'උපදෙස් සඳහා, දුරකථනයක හෝ වෙනත් උපාංගයක මෙම පිටුව අරින්න: <a href=\"https://$url\">$url</a>';
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
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'පහත යතුරු වලින් එකක් ඔබන්න:';

  @override
  String get isKeyPresent => 'පහත යතුර ඔබගේ යතුරුපුවරුවේ තිබේද?';

  @override
  String get configureSecureBootTitle => 'ආරක්‍ෂිත ඇරඹුම හැඩගසන්න';

  @override
  String get configureSecureBootDescription => 'ඔබ තෙවන පාර්ශ්ව ධාවක මෘදුකාංග ස්ථාපනයට තෝරාගෙන ඇත. මේ සඳහා ආරක්‍ෂිත ඇරඹුම අක්‍රිය කළ යුතුය.\nමෙය සිදු කිරීම සඳහා, ඔබ දැන් ආරක්‍ෂණ යතුරක් තෝරාගෙන පද්ධතිය යළි ආරම්භ වන විට එය ඇතුල් කරන්න.';

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
  String get connectToInternetDescription => 'මෙම පරිගණකය අන්තර්ජාලයට සම්බන්ධ කිරීමෙන් උබුන්ටු සඳහා අවශ්‍ය ඕනෑම අමතර මෘදුකාංගයක් ස්ථාපනයට මෙන්ම ඔබගේ වේලා කලාපය තෝරා ගැනීමට හැකිය.\n\nඊතර්නෙට් රැහැන සම්බන්ධ කරන්න හෝ වයි-ෆයි ජාලයක් තෝරන්න';

  @override
  String get useWiredConnection => 'රැහැන් සම්බන්ධතාවය යොදාගන්න';

  @override
  String get noWiredConnection => 'රැහැන් සම්බන්ධතාවයක් අනාවරණය නොවිණි';

  @override
  String get wiredDisabled => 'රැහැන් සම්බන්ධතාවය අක්‍රියයි';

  @override
  String get wiredMustBeEnabled => 'මෙම පරිගණකයේ ඊතර්නෙට් භාවිතයට, රැහැන්ගත සම්බන්ධතාවයක් සබල කළ යුතුය';

  @override
  String get enableWired => 'රැහැන්ගත සබල කරන්න';

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
  String get updatesOtherSoftwarePageDescription => 'ස්ථාපනයට කැමති යෙදුම් මොනවාද?';

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
  String get installThirdPartyTitle => 'චිත්‍රක හා වයි-ෆයි දෘඪාංග සඳහා තෙවන පාර්ශ්ව මෘදුකාංග මෙන්ම අතිරේක මාධ්‍ය ආකෘති ස්ථාපනය කරන්න';

  @override
  String get installThirdPartySubtitle => 'මෙම මෘදුකාංගය එහි ප්‍රලේඛනයෙහි ඇතුළත් බලපත්‍ර නියම වලට යටත් වේ. ඇතැම් දෑ ස්වාම්‍යයි.';

  @override
  String get installDriversTitle => 'චිත්‍රක හා වයි-ෆයි දෘඪාංග සඳහා තෙවන පාර්ශ්ව මෘදුකාංග ස්ථාපනය කරන්න';

  @override
  String get installDriversSubtitle => 'මෙම ධාවක එහි ප්‍රලේඛනයෙහි ඇතුළත් බලපත්‍ර නියම වලට යටත් වේ. ඒවා ස්වාම්‍යයි.';

  @override
  String get installCodecsTitle => 'අතිරේක මාධ්‍ය ආකෘති සඳහා සහාය බාගෙන ස්ථාපනය කරන්න';

  @override
  String get installCodecsSubtitle => 'මෙම මෘදුකාංගය එහි ප්‍රලේඛනයෙහි ඇතුළත් බලපත්‍ර නියම වලට යටත් වේ. ඇතැම් දෑ ස්වාම්‍යයි.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">අවවාදයයි</font>: පරිගණකය බල ප්‍රභවයකට පේනුගත කර නැත.';
  }

  @override
  String get offlineWarning => 'ඔබ දැනට මාර්ගඅපගතයි';

  @override
  String get chooseSecurityKeyTitle => 'ආරක්‍ෂණ යතුරක් තෝරන්න';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'ඔබගේ පරිගණකය නැති වුවහොත් තැටි සංකේතනය මඟින් ඔබගේ ගොනු රැකදෙයි. පරිගණකය අරඹන සැමවිට ආරක්‍ෂණ යතුරක් ඇතුල් කිරීමට සිදුවනු ඇත.\n\n$RELEASE න් පිටත කිසිදු ගොනුවක් සංකේතනය නොකෙරේ.';
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
    return '<font color=\"$color\">අවවාදයයි</font>: මෙම ආරක්‍ෂණ යතුර නැති වුවහොත්, සියළුම දත්ත නැති වනු ඇත. ඔබට අවශ්‍ය නම්, ඔබගේ යතුර වෙනත් තැනක ලියා ආරක්‍ෂිතව තබන්න.';
  }

  @override
  String get installationTypeTitle => 'ස්ථාපන වර්ගය';

  @override
  String installationTypeOSDetected(Object os) {
    return 'මෙම පරිගණකයෙහි දැනට $os තිබේ. ඔබ කිරීමට කැමති කුමක්ද?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'මෙම පරිගණකයෙහි දැනට $os1 හා $os2 තිබේ. ඔබ කිරීමට කැමති කුමක්ද?';
  }

  @override
  String get installationTypeMultiOSDetected => 'මෙම පරිගණකයෙහි දැනට මෙහෙයුම් පද්ධති කිහිපයක් තිබේ. ඔබ කිරීමට කැමති කුමක්ද?';

  @override
  String get installationTypeNoOSDetected => 'මෙම පරිගණකයෙහි කිසිදු මෙහෙයුම් පද්ධතියක් අනාවරණය වී නැත. ඔබ කිරීමට කැමති කුමක්ද?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'තැටිය මකාදමා $DISTRO ස්ථාපනය කරන්න';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">අවවාදයයි:</font> මෙය ඔබගේ සියළුම වැඩසටහන්, ලේඛන, ඡායාරූප, ගීත සහ මෙහෙයුම් පද්ධතිවල තිබෙන වෙනත් ගොනු සියල්ල මකා දමයි.';
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
    return 'නව $RELEASE ස්ථාපනය සමඟ LVM භාවිතා කරන්න';
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
  String get installationTypeZFS => 'පරීක්‍ෂාත්මක: තැටිය මකාදමා ZFS භාවිතා කරන්න';

  @override
  String get installationTypeZFSSelected => 'ZFS තෝරා ඇත';

  @override
  String installationTypeReinstall(Object os) {
    return '$os මකාදමා නැවත ස්ථාපනය කරන්න';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">අවවාදයයි:</font> මෙය ඔබගේ සියළුම $os වැඩසටහන්, ලේඛන, ඡායාරූප, ගීත සහ අනෙකුත් ගොනු මකා දමයි.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$os සමඟ $product ස්ථාපනය කරන්න';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return '$os1 සහ $os2 සමඟ $product ස්ථාපනය කරන්න';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'ඒවා සමඟ $product ස්ථාපනය කරන්න';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'අන් පංගුවලට පසකින් $product ස්ථාපනය කරන්න';
  }

  @override
  String get installationTypeAlongsideInfo => 'ලේඛන, ගීත සහ අනෙකුත් පෞද්. ගොනු රඳවා ගැනෙයි. පරිගණකය ආරම්භ වන සැමවිට අවශ්‍ය මෙහෙයුම් පද්ධතිය තේරීමට හැකිය.';

  @override
  String get installationTypeManual => 'වෙන යමක්';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'ඔබටම පංගු සෑදීමට හෝ යළි ප්‍රමාණනයට, හෝ $DISTRO සඳහා පංගු කිහිපයක් තේරීමට හැකිය';
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
  String get installAlongsideSpaceDivider => 'පහත වෙන්කුරුව ඇදීමෙන් ධාවකයේ ඉඩ වෙන් කරන්න:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return 'කුඩා පංගු $num ක් සඟවා ඇත, තවත් පාලනයට <a href=\"$url\">සංකීර්ණ පංගුකරණ මෙවලම</a> යොදා ගන්න';
  }

  @override
  String get installAlongsideResizePartition => 'පංගුව යළි ප්‍රමාණනය';

  @override
  String get installAlongsideAllocateSpace => 'ඉඩ වෙන් කරන්න';

  @override
  String get installAlongsideFiles => 'ගොනු';

  @override
  String get installAlongsidePartition => 'පංගුව:';

  @override
  String get installAlongsideSize => 'ප්‍රමාණය:';

  @override
  String get installAlongsideAvailable => 'තිබේ:';

  @override
  String get allocateDiskSpace => 'තැටියේ ඉඩ වෙන් කරන්න';

  @override
  String get startInstallingButtonText => 'ස්ථාපනය අරඹන්න';

  @override
  String get diskHeadersDevice => 'උපාංගය';

  @override
  String get diskHeadersType => 'වර්ගය';

  @override
  String get diskHeadersMountPoint => 'සවිවන ස්ථානය';

  @override
  String get diskHeadersSize => 'ප්‍රමාණය';

  @override
  String get diskHeadersUsed => 'භාවිතයි';

  @override
  String get diskHeadersSystem => 'පද්ධතිය';

  @override
  String get diskHeadersFormat => 'පවිත්‍ර';

  @override
  String get freeDiskSpace => 'නිදහස් ඉඩ';

  @override
  String get newPartitionTable => 'නව පංගු වගුවක්';

  @override
  String get newPartitionTableConfirmationTitle => 'මෙම උපාංගයෙහි නව හිස් පංගු වගුවක් සාදන්නද?';

  @override
  String get newPartitionTableConfirmationMessage => 'ඔබ පංගුකරණයට සමස්ත උපාංගයක් තෝරාගෙන ඇත. ඔබ එහි නව පංගු වගුවක් සෑදීමට ගියහොත්, පවතින සියළුම පංගු ඉවත් කෙරෙනු ඇත.\n\nඔබට අවශ්‍ය නම් මෙම මෙහෙයුම පසුව අහෝසි කිරීමට හැකිය.';

  @override
  String get tooManyPrimaryPartitions => 'ප්‍රාථමික පංගු බොහෝය';

  @override
  String get partitionLimitReached => 'සීමාවට ළඟා විය';

  @override
  String get bootLoaderDevice => 'ඇරඹුම්කාරකය ස්ථාපනයට උපාංගය';

  @override
  String get partitionCreateTitle => 'පංගුව සාදන්න';

  @override
  String get partitionEditTitle => 'පංගුව සංස්කරණය';

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
  String get partitionTypeLabel => 'නව පංගුව සඳහා වර්ගය:';

  @override
  String get partitionTypePrimary => 'ප්‍රාථමික';

  @override
  String get partitionTypeLogical => 'තාර්කික';

  @override
  String get partitionLocationLabel => 'නව පංගුව සඳහා ස්ථානය:';

  @override
  String get partitionLocationBeginning => 'මෙම ඉඩෙහි ආරම්භය';

  @override
  String get partitionLocationEnd => 'මෙම ඉඩෙහි අවසානය';

  @override
  String get partitionFormatLabel => 'භාවිතය:';

  @override
  String get partitionFormatExt4 => 'Ext4 සගනු ගොනු පද්ධතිය';

  @override
  String get partitionFormatExt3 => 'Ext3 සගනු ගොනු පද්ධතිය';

  @override
  String get partitionFormatExt2 => 'Ext2 ගොනු පද්ධතිය';

  @override
  String get partitionFormatBtrfs => 'btrfs සගනු ගොනු පද්ධතිය';

  @override
  String get partitionFormatJfs => 'JFS සගනු ගොනු පද්ධතිය';

  @override
  String get partitionFormatXfs => 'XFS සගනු ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat => 'FAT ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat12 => 'FAT12 ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat16 => 'FAT16 ගොනු පද්ධතිය';

  @override
  String get partitionFormatFat32 => 'FAT32 ගොනු පද්ධතිය';

  @override
  String get partitionFormatSwap => 'හුවමාරු පෙදෙස';

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
  String get partitionFormatNone => 'පවිත්‍ර නොකර තබන්න';

  @override
  String get partitionErase => 'පංගුව පවිත්‍ර කරන්න';

  @override
  String get partitionMountPointLabel => 'සවිවන ස්ථානය:';

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
  String get whoAreYouPageRealNameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'ඔබගේ පරිගණකයේ නම';

  @override
  String get whoAreYouPageComputerNameInfo => 'වෙනත් පරිගණක වෙත අමතන විට නම භාවිතා වේ.';

  @override
  String get whoAreYouPageComputerNameRequired => 'පරිගණකයට නමක් වුවමනාය';

  @override
  String get whoAreYouPageComputerNameTooLong => 'That computer name is too long.';

  @override
  String get whoAreYouPageInvalidComputerName => 'පරිගණකයේ නම වැරදිය';

  @override
  String get whoAreYouPageUsernameLabel => 'පරිශ්‍රීලක නාමයක් තෝරන්න';

  @override
  String get whoAreYouPageUsernameRequired => 'පරිශ්‍රීලක නාමයක් වුවමනාය';

  @override
  String get whoAreYouPageInvalidUsername => 'පරිශ්‍රීලක නාමය වැරදිය';

  @override
  String get whoAreYouPageUsernameInUse => 'පරිශ්‍රීලක නාමය දැනටමත් පවතී.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'එම නම පද්ධතියේ භාවිතයට වෙන් කර ඇත.';

  @override
  String get whoAreYouPageUsernameTooLong => 'නම ඉතා දිගයි.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'නමෙහි වලංගු නොවන අකුරු අඩංගුය.';

  @override
  String get whoAreYouPagePasswordLabel => 'මුරපදයක් තෝරන්න';

  @override
  String get whoAreYouPagePasswordRequired => 'මුරපදයක් වුවමනාය';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'මුරපදය තහවුරු කරන්න';

  @override
  String get whoAreYouPagePasswordMismatch => 'මුරපද නොගැළපේ';

  @override
  String get whoAreYouPagePasswordShow => 'පෙන්වන්න';

  @override
  String get whoAreYouPagePasswordHide => 'සඟවන්න';

  @override
  String get writeChangesToDisk => 'වෙනස්කම් තැටියට ලියන්න';

  @override
  String get writeChangesFallbackSerial => 'තැටිය';

  @override
  String get writeChangesDescription => 'ඔබ ඉදිරියට ගියහොත්, පහත ලැයිස්තුගත වෙනස්කම් තැටියට ලියනු ඇත. ඔබට අතින් තවත් වෙනස්කම් සිදු කිරීමට හැකි වනු ඇත.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'පහත උපාංගවල පංගු වගු වෙනස් වේ:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'පහත පංගු වෙනස්කම් යෙදෙනු ඇත:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return '#$disk$partition පංගුව $oldsize සිට $newsize දක්වා ප්‍රමාණනය කෙරිණි';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return '#$disk$partition පංගුව $mount සඳහා භාවිතයට $format ලෙස පවිත්‍රව ඇත';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return '#$disk$partition පංගුව $format ලෙස පවිත්‍රව ඇත';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return '#$disk$partition පංගුව $mount සඳහා භාවිතා වේ';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return '#$disk$partition පංගුව සෑදිණි';
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
    return 'ඔබට දැන් දිගටම $RELEASE අත්හදා බැලීමට හැකිය, නමුත් පරිගණකය යළි ආරම්භ කරන තුරු ඔබ සුරකින ලේඛන හෝ සිදුකරන වෙනස්කම් රැඳෙන්නේ නැත.';
  }

  @override
  String get shutdown => 'වසා දමන්න';

  @override
  String get restartNow => 'යළි අරඹන්න';

  @override
  String get continueTesting => 'අත්හදා බැලීම දිගටම';

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
    return 'වේගවත් සහ නව විශේෂාංග වලින් පිරුණු $RELEASE හි නවතම අනුවාදය අන් කවරදාටත් වඩා පරිගණනය පහසු කරයි. මෙන්න බලන්න අළුත් දේවල් ටිකක්...';
  }

  @override
  String get softwareSlideTitle => 'තවත් මෘදුකාංග සොයාගන්න';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'නව මෘදුකාංග සඳහා අන්තර්ජාලයේ සෙවීමට සමුදෙන්න. ස්නැප් ස්ටෝර් සහ $RELEASE මෘදුකාංග සංරක්‍ෂිතය වෙත ප්‍රවේශයෙන් ඔබට පහසුවෙන් නව යෙදුම් සොයා ගැනීමට මෙන්ම ස්ථාපනයට හැකිය. ඔබ සොයන දේ ලියන්න, හෝ චිත්‍රක හා ඡායාරූපකරණය, ක්‍රීඩා හා ඵලදායිතාව වැනි ප්‍රවර්ග ගවේෂණය කරන්න. තවද, අනෙක් පරිශ්‍රීලකයින්ගේ ප්‍රයෝජනවත් සමාලෝචන ද ඇත.';
  }

  @override
  String get musicSlideTitle => 'ගීත ඔබ සමඟ ගෙන යන්න';

  @override
  String musicSlideDescription(Object RELEASE) {
    return 'විස්මිත රිදම්බොක්ස් සංගීත වාදකය සමඟ $RELEASE පැමිණේ. සංකීර්ණ පිළිවැයීමේ විකල්ප මගින් ශ්‍රේෂ්ඨ ගීත පෝලිමට තැබීම සරලයි. තවද එය සුසංහිත තැටි සහ සුවහ සංගීත වාදක සමඟ හොඳින් වැඩ කරයි, එබැවින් ඔබ යන ඕනෑම තැනක දී ඔබගේ සියළුම ගීත රස විඳීමට හැකිය.';
  }

  @override
  String get musicSlideRhythmbox => 'රිදම්බොක්ස් සංගීත වාදකය';

  @override
  String get musicSlideSpotify => 'ස්පොටිෆයි';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'ඡායාරූප සමඟ විනෝද වන්න';

  @override
  String get photoSlideDescription => 'ෂොට්වෙල් යනු ඔබගේ කුඩා උපාංග සඳහා උචිත පහසු ඡායාරූප කළමනාකරුවෙකි. ඔබගේ ඡායාරූප මාරු කිරීමට රූගතයක් හෝ දුරකථනයක් සම්බන්ධ කරන්න. ඉන්පසු ඒවා බෙදා ගැනීමට සහ ඒවා ආරක්‍ෂිතව තැබීමට පහසු වේ. ඔබට නිර්මාණශ්‍රීලී බවක් හැඟෙයි නම්, උබුන්ටු මෘදුකාංගය හරහා තවත් බොහෝ ඡායාරූප යෙදුම් සොයා ගැනීමට හැකිය.';

  @override
  String get photoSlideShotwell => 'ෂොට්වෙල් ඡායාරූප කළමනාකරු';

  @override
  String get photoSlideGimp => 'ගිම්ප් සළරූ සංස්කරකය';

  @override
  String get photoSlideShotcut => 'ෂොට්කට් දෘශ්‍යක සංස්කරකය';

  @override
  String get webSlideTitle => 'වියමනෙන් උපරිම ප්‍රයෝජනට';

  @override
  String webSlideDescription(Object RELEASE) {
    return 'ලොව පුරා දශ ලක්‍ෂ ගණනක් භාවිතා කරන ෆයර්ෆොක්ස් අතිරික්සුව $RELEASE හි ඇතුළත් වේ. තවද, ඔබ නිතර භාවිතා කරන යෙදුම් (ෆේස්බුක් හෝ ජීමේල් ආදී) වෙත ඉක්මනින් ප්‍රවේශය සඳහා ඔබගේ වැඩතලයට ඇමිණීමට හැකිය.';
  }

  @override
  String get webSlideFirefox => 'ෆයර්ෆොක්ස් අතිරික්සුව';

  @override
  String get webSlideThunderbird => 'තන්ඩර්බර්ඩ්';

  @override
  String get webSlideChromium => 'ක්‍රෝමියම්';

  @override
  String get officeSlideTitle => 'කාර්යාලයට අවශ්‍ය සියළු දෑ';

  @override
  String get officeSlideDescription => 'ලිබ්රේඔෆිස් යනු ඔබට ලේඛන, පැතුරුම්පත් සහ සමර්පණ සෑදීමට අවශ්‍ය සියල්ල අසුරා තිබෙන නිදහස් කාර්යාල කට්ටලයකි. මයික්‍රොසොෆ්ට් ඔෆිස් ගොනු ආකෘති සඳහා අනුකූල වන අතර එය ඔබට අවශ්‍ය සියළුම විශේෂාංග ලබා දෙයි.';

  @override
  String get officeSlideWriter => 'ලිබ්රේඔෆිස් රයිටර්';

  @override
  String get officeSlideCalc => 'ලිබ්රේඔෆිස් කැල්ක්';

  @override
  String get officeSlideImpress => 'ලිබ්රේඔෆිස් ඉම්ප්‍රෙස්';

  @override
  String get accessSlideTitle => 'සැමට ප්‍රවේශය';

  @override
  String accessSlideDescription(Object RELEASE) {
    return '$RELEASE දැක්මෙහි හරය පරිගණනය සැමට යන විශ්වාසයයි. සංකීර්ණ ප්‍රවේශ්‍යතා මෙවලම් සහ භාෂාව, වර්ණ මෙන්ම පෙළ ප්‍රමාණය සැකසීමට විකල්ප සමඟින් කවුරුන් හෝ කොතැනක සිටියත් — $RELEASE පරිගණනය පහසු කරයි.';
  }

  @override
  String get accessSlideCustomizationOptions => 'අභිරුචිකරණ විකල්ප';

  @override
  String get accessSlideAppearance => 'පෙනුම';

  @override
  String get accessSlideAssistiveTechnologies => 'උපකාරක තාක්‍ෂණ';

  @override
  String get accessSlideLanguageSupport => 'භාෂා සහාය';

  @override
  String get supportSlideTitle => 'උදව් හා සහාය';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return '$RELEASE හි වඩාත් සුලබ අංග බොහොමයක් නිල ප්‍රලේඛනය මගින් ආවරණය කෙරේ. එය <a href=\"https://help.ubuntu.com\">මාර්ගගතව</a> සහ තටාකයේ උදව් නිරූපකය හරහා කියවීමට හැකිය.';
  }

  @override
  String get supportSlideQuestions => '<a href=\"https://askubuntu.com\">Ask Ubuntu</a> හි ඔබට ප්‍රශ්න ඇසීමට සහ දැනටමත් උත්තර දී ඇති ප්‍රශ්න සෙවීමට හැකිය. වඩාත් පහසුවෙන් ගැටළු සාකච්ඡා කිරීමට මෙන්ම ආකර්ෂණීය පැණ විසඳුම් එකතුවක් කියවීමට ඔබගේ භාෂාවෙන් සහාය ලබාදෙන <a href=\"https://loco.ubuntu.com/teams\">ප්‍රාදේශීය ප්‍රජා කණ්ඩායම</a> වෙත යන්න.';

  @override
  String get supportSlideResources => 'වෙනත් ප්‍රයෝජනවත් සම්පත් වෙත යොමු සඳහා, කරුණාකර <a href=\"https://www.ubuntu.com/support/community-support\">ප්‍රජා සහාය</a> හෝ <a href=\"https://www.ubuntu.com/support\">වාණිජ සහාය</a> වෙත ගොඩවදින්න.';

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
    return '$RELEASE ස්ථාපනයට අවම වශයෙන් $SIZE තැටි ඉඩක් අවශ්‍යයි.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'මෙම පරිගණකය සතුව $SIZE පමණක් ඇත.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'මෙම පරිගණකයේ විශාලම තැටිය $SIZE පමණි.';
  }

  @override
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test domain connectivity';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domain not found';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';

  @override
  String get activeDirectoryErrorTitle => 'Error configuring connection to Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';
}
