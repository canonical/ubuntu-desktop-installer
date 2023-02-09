import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Ubuntu 桌面安装程序';

  @override
  String windowTitle(Object RELEASE) {
    return '安装 $RELEASE';
  }

  @override
  String get cancelButtonText => '取消';

  @override
  String get changeButtonText => '更改';

  @override
  String get okButtonText => '好';

  @override
  String get noButtonText => '否';

  @override
  String get restartButtonText => '重启';

  @override
  String get revertButtonText => '回滚';

  @override
  String get yesButtonText => '是';

  @override
  String get quitButtonText => '退出安装';

  @override
  String get welcome => '欢迎';

  @override
  String get welcomeHeader => '选择您的语言：';

  @override
  String get tryOrInstallPageTitle => '试用或安装';

  @override
  String get repairInstallation => '修复安装';

  @override
  String get repairInstallationDescription => '修复选项将在保留个人数据和设置的情况下重新安装所有已安装的软件。';

  @override
  String tryUbuntu(Object RELEASE) {
    return '试用 $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return '您可以在不对电脑做任何改动的情况下试用 $RELEASE。';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '安装 $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '让$RELEASE与当前操作系统共存（或代替当前操作系统）。这花不了多长时间。';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '您可能想阅读<a href=\"$url\"> 发行注记</a>。';
  }

  @override
  String get turnOffRST => '关闭 RST';

  @override
  String get turnOffRSTDescription => '这台电脑使用了英特尔RST（快速存储技术）。在安装Ubuntu之前，您需要在Windows中关闭RST。';

  @override
  String instructionsForRST(Object url) {
    return '有关说明，请在手机或其他设备上打开此页面：<a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => '键盘布局';

  @override
  String get chooseYourKeyboardLayout => '选择您的键盘布局：';

  @override
  String get typeToTest => '在此键入以测试您的键盘';

  @override
  String get detectLayout => '检测键盘布局';

  @override
  String get pressOneKey => '请按下以下按键中的任意一个：';

  @override
  String get isKeyPresent => '您的键盘上是否有以下键？';

  @override
  String get configureSecureBootTitle => '配置安全启动';

  @override
  String get configureSecureBootDescription => '您已选择安装第三方驱动。这需要关闭安全启动。\n为此，您需要立即选择一个安全密钥，并在系统重新启动时输入。';

  @override
  String get configureSecureBootOption => '配置安全启动';

  @override
  String get chooseSecurityKey => '选择一个安全密钥';

  @override
  String get confirmSecurityKey => '确认安全密钥';

  @override
  String get dontInstallDriverSoftwareNow => '暂时不安装驱动程序';

  @override
  String get dontInstallDriverSoftwareNowDescription => '您可以稍后从「软件和更新」中安装它。';

  @override
  String get configureSecureBootSecurityKeyRequired => '需要安全密钥';

  @override
  String get secureBootSecurityKeysDontMatch => '安全密钥不匹配';

  @override
  String get showSecurityKey => '显示安全密钥';

  @override
  String get connectToInternetPageTitle => '连接到互联网';

  @override
  String get connectToInternetDescription => '将这台电脑连接到互联网有助于 Ubuntu 安装所需的任何额外软件并选择您的时区。\n\n通过以太网电缆连接，或选择 Wi-Fi 网络';

  @override
  String get useWiredConnection => '使用有线连接';

  @override
  String get noWiredConnection => '未检测到有线连接';

  @override
  String get wiredDisabled => '有线连接已关闭';

  @override
  String get wiredMustBeEnabled => '要在此电脑上使用网络，必须启用有线连接';

  @override
  String get enableWired => '启用有线连接';

  @override
  String get selectWifiNetwork => '连接到 Wi-Fi 网络';

  @override
  String get hiddenWifiNetwork => '连接到隐藏的 Wi-Fi 网络';

  @override
  String get hiddenWifiNetworkNameLabel => '网络名称';

  @override
  String get hiddenWifiNetworkNameRequired => '需要网络名称';

  @override
  String get noInternet => '暂不连接到互联网';

  @override
  String get wirelessNetworkingDisabled => '无线网络已禁用';

  @override
  String get noWifiDevicesDetected => '找不到 Wi-Fi 设备';

  @override
  String get wifiMustBeEnabled => '要在此电脑上使用Wi-Fi，必须启用无线网络';

  @override
  String get enableWifi => '启用 Wi-Fi';

  @override
  String get connectButtonText => '连接';

  @override
  String get updatesOtherSoftwarePageTitle => '更新和其他软件';

  @override
  String get updatesOtherSoftwarePageDescription => '您想先安装哪些应用？';

  @override
  String get normalInstallationTitle => '正常安装';

  @override
  String get normalInstallationSubtitle => 'Web 浏览器、实用程序、办公软件、游戏和媒体播放器。';

  @override
  String get minimalInstallationTitle => '最小安装';

  @override
  String get minimalInstallationSubtitle => '浏览器和基础实用程序。';

  @override
  String get otherOptions => '其他选项';

  @override
  String get installThirdPartyTitle => '为图形和 Wi-Fi 硬件以及其他媒体格式安装第三方软件';

  @override
  String get installThirdPartySubtitle => '这些软件受其文档中包含的许可条款约束。其中部分软件是专有软件。';

  @override
  String get installDriversTitle => '为图形和 Wi-Fi 硬件安装第三方软件';

  @override
  String get installDriversSubtitle => '这些驱动受它们文档中的许可条款约束。它们是专有软件。';

  @override
  String get installCodecsTitle => '为其他媒体格式提供支持';

  @override
  String get installCodecsSubtitle => '这些软件受其文档中包含的许可条款约束。其中部分软件是专有软件。';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">警告</font>：电脑未接入电源适配器。';
  }

  @override
  String get chooseSecurityKeyTitle => '选择一个安全密钥';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return '磁盘加密会保护磁盘上的文件，以免因电脑丢失而蒙受损失。但是，每次在计算机启动时，它会要求您输入一个安全密钥。\n\n$RELEASE之外的任何文件都不会加密。';
  }

  @override
  String get chooseSecurityKeyHint => '选择一个安全密钥';

  @override
  String get chooseSecurityKeyConfirmHint => '确认安全密钥';

  @override
  String get chooseSecurityKeyRequired => '需要一个安全密钥';

  @override
  String get chooseSecurityKeyMismatch => '安全密钥不匹配';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">警告</font>：如果丢失此安全密钥，所有数据都将丢失。以防万一，您可以记下您的安全密钥并保存到安全的地方。';
  }

  @override
  String get installationTypeTitle => '安装类型';

  @override
  String installationTypeOSDetected(Object os) {
    return '这台电脑上当前安装了$os。您准备怎么做？';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return '这台计算机已安装有$os1与$os2了。您准备怎么做？';
  }

  @override
  String get installationTypeMultiOSDetected => '这台计算机已经安装了多个操作系统。您准备怎么做？';

  @override
  String get installationTypeNoOSDetected => '这台电脑目前没有检测到操作系统。您准备怎么做？';

  @override
  String installationTypeErase(Object DISTRO) {
    return '擦除磁盘并安装$DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">警告：</font>这将删除所有操作系统中的所有程序、文档、照片、音乐和任何其他文件。';
  }

  @override
  String get installationTypeAdvancedLabel => '高级功能...';

  @override
  String get installationTypeAdvancedTitle => '高级功能';

  @override
  String get installationTypeNone => '空';

  @override
  String get installationTypeNoneSelected => '尚未选择任何安装选项';

  @override
  String installationTypeLVM(Object RELEASE) {
    return '在新的 $RELEASE 安装中使用 LVM';
  }

  @override
  String get installationTypeLVMSelected => '已选择配置 LVM';

  @override
  String get installationTypeLVMEncryptionSelected => '已选择配置加密的 LVM';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return '为安全起见，对新的$RELEASE安装进行加密';
  }

  @override
  String get installationTypeEncryptInfo => '您将在下一步中选择一个安全密钥。';

  @override
  String get installationTypeZFS => '实验性功能：擦除磁盘并使用ZFS';

  @override
  String get installationTypeZFSSelected => '已选择 ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return '擦除 $os 并重新安装';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">警告：</font>这将删除您的 $os 中的所有程序、文档、照片、音乐和任何其他文件。';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '在 $os 中安装 $product';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return '安装 $product 并与 $os1 和 $os2 共存';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return '安装 $product 并与它们共存';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return '安装 $product 并与其它分区共存';
  }

  @override
  String get installationTypeAlongsideInfo => '将保存文件、音乐和其他个人文件。每次启动时，您可以选择所需的操作系统。';

  @override
  String get installationTypeManual => '其他选项';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return '您可以创建分区或调整分区大小，或者为$DISTRO选择多个分区';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return '擦除磁盘并安装 $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => '选择磁盘：';

  @override
  String get selectGuidedStorageInfoLabel => '将使用整块磁盘：';

  @override
  String get selectGuidedStorageInstallNow => '立即安装';

  @override
  String get installAlongsideSpaceDivider => '拖曳下面的分隔符分配磁盘空间：';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '有 $num 个小分区被隐藏 , 请使用 <a href=\"$url\">高级分区工具</a> 获得更多功能';
  }

  @override
  String get installAlongsideResizePartition => '调整分区大小';

  @override
  String get installAlongsideAllocateSpace => '分配空间';

  @override
  String get installAlongsideFiles => '文件';

  @override
  String get installAlongsidePartition => '分区：';

  @override
  String get installAlongsideSize => '大小：';

  @override
  String get installAlongsideAvailable => '可用：';

  @override
  String get allocateDiskSpace => '分配磁盘空间';

  @override
  String get startInstallingButtonText => '开始安装';

  @override
  String get diskHeadersDevice => '设备';

  @override
  String get diskHeadersType => '类型';

  @override
  String get diskHeadersMountPoint => '挂载点';

  @override
  String get diskHeadersSize => '大小';

  @override
  String get diskHeadersUsed => '已使用';

  @override
  String get diskHeadersSystem => '系统';

  @override
  String get diskHeadersFormat => '格式化';

  @override
  String get freeDiskSpace => '剩余空间';

  @override
  String get newPartitionTable => '新建分区表';

  @override
  String get newPartitionTableConfirmationTitle => '是否在此设备上创建新的空白分区表？';

  @override
  String get newPartitionTableConfirmationMessage => '您已选择要分区的整个设备。如果继续在该设备上创建新的分区表，那么其上的所有当前分区都将被删除。\n\n请注意，如果您愿意，稍后可以撤消此操作。';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'limit reached';

  @override
  String get bootLoaderDevice => '用于安装引导程序的设备';

  @override
  String get partitionCreateTitle => '创建分区';

  @override
  String get partitionEditTitle => '编辑分区';

  @override
  String get partitionSizeLabel => '大小：';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => '指定新分区的类型：';

  @override
  String get partitionTypePrimary => '主分区';

  @override
  String get partitionTypeLogical => '逻辑分区';

  @override
  String get partitionLocationLabel => '新分区的位置：';

  @override
  String get partitionLocationBeginning => '空间起始位置';

  @override
  String get partitionLocationEnd => '空间结束位置';

  @override
  String get partitionFormatLabel => '用于：';

  @override
  String get partitionFormatExt4 => 'Ext4 日志文件系统';

  @override
  String get partitionFormatExt3 => 'Ext3 日志文件系统';

  @override
  String get partitionFormatExt2 => 'Ext2 文件系统';

  @override
  String get partitionFormatBtrfs => 'btrfs 日志文件系统';

  @override
  String get partitionFormatJfs => 'JFS 日志文件系统';

  @override
  String get partitionFormatXfs => 'XFS 日志文件系统';

  @override
  String get partitionFormatFat => 'FAT 文件系统';

  @override
  String get partitionFormatFat12 => 'FAT12 文件系统';

  @override
  String get partitionFormatFat16 => 'FAT16 文件系统';

  @override
  String get partitionFormatFat32 => 'FAT32 文件系统';

  @override
  String get partitionFormatSwap => '交换空间';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 文件系统';

  @override
  String get partitionFormatVfat => 'VFAT 文件系统';

  @override
  String get partitionFormatNtfs => 'NTFS 文件系统';

  @override
  String get partitionFormatReiserFS => 'ReiserFS 文件系统';

  @override
  String get partitionFormatZfsroot => 'ZFS 根文件系统';

  @override
  String get partitionErase => '格式化分区';

  @override
  String get partitionMountPointLabel => '挂载点：';

  @override
  String get whoAreYouPageTitle => '您是谁？';

  @override
  String get whoAreYouPageAutoLogin => '自动登录';

  @override
  String get whoAreYouPageRequirePassword => '登录时需要密码';

  @override
  String get whoAreYouPageRealNameLabel => '您的姓名';

  @override
  String get whoAreYouPageRealNameRequired => '需要名字';

  @override
  String get whoAreYouPageComputerNameLabel => '您的电脑主机名';

  @override
  String get whoAreYouPageComputerNameInfo => '与其他计算机联络时使用的名称。';

  @override
  String get whoAreYouPageComputerNameRequired => '需要计算机名称';

  @override
  String get whoAreYouPageInvalidComputerName => '电脑主机名无效';

  @override
  String get whoAreYouPageUsernameLabel => '键入一个用户名';

  @override
  String get whoAreYouPageUsernameRequired => '需要用户名';

  @override
  String get whoAreYouPageInvalidUsername => '用户名无效';

  @override
  String get whoAreYouPageUsernameInUse => '这个用户名已经存在。';

  @override
  String get whoAreYouPageUsernameSystemReserved => '这个名称保留给系统使用。';

  @override
  String get whoAreYouPageUsernameTooLong => '名字过长.';

  @override
  String get whoAreYouPageUsernameInvalidChars => '这个名称包含无效字符。';

  @override
  String get whoAreYouPagePasswordLabel => '选择一个密码';

  @override
  String get whoAreYouPagePasswordRequired => '需要密码';

  @override
  String get whoAreYouPageConfirmPasswordLabel => '确认您的密码';

  @override
  String get whoAreYouPagePasswordMismatch => '密码不匹配';

  @override
  String get whoAreYouPageShowPassword => '显示密码';

  @override
  String get writeChangesToDisk => '将更改写入磁盘';

  @override
  String get writeChangesFallbackSerial => '磁盘';

  @override
  String get writeChangesDescription => '如果继续，下面列出的更改将会写入磁盘。您可以手动进行进一步的更改。';

  @override
  String get writeChangesPartitionTablesHeader => '已更改以下设备的分区表：';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => '将应用以下分区更改：';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return '分区 #$disk$partition 从 $oldsize 调整大小到 $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return '分区 #$disk$partition 格式化为 $format 并挂载到 $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return '分区 #$disk$partition 格式化为 $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return '分区 #$disk$partition 挂载到 $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return '分区 #$disk$partition 已创建';
  }

  @override
  String get chooseYourLookPageTitle => '选择您的外观';

  @override
  String get chooseYourLookPageHeader => '稍后您可以在“外观设置”中进行更改。';

  @override
  String get chooseYourLookPageDarkSetting => '深色';

  @override
  String get chooseYourLookPageLightSetting => '浅色';

  @override
  String get installationCompleteTitle => '安装完成';

  @override
  String readyToUse(Object system) {
    return '**$system** 安装完毕并且可以使用。';
  }

  @override
  String restartInto(Object system) {
    return '重启进入 $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'You can continue testing $RELEASE now, but until you restart the computer, any changes you make or documents you save will not be preserved.';
  }

  @override
  String get shutdown => '关机';

  @override
  String get restartNow => 'Restart Now';

  @override
  String get continueTesting => 'Continue Testing';

  @override
  String get turnOffBitlockerTitle => '关闭 BitLocker';

  @override
  String get turnOffBitlockerDescription => '这台电脑使用了 Windows BitLocker 进行加密。\n在安装 Ubuntu 之前，您需要关闭 Windows 的 BitLocker 功能。';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '有关说明，请在手机或其他设备上打开此页面：<a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => '重启进入 Windows';

  @override
  String get whereAreYouPageTitle => '您在什么地方？';

  @override
  String get whereAreYouLocationLabel => '位置';

  @override
  String get whereAreYouTimezoneLabel => '时区';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return '欢迎使用 $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return '最新版本的 $RELEASE 不仅快，功能也多，您从此使用电脑更加方便了！我们将介绍一些非常酷炫的新东西......';
  }

  @override
  String get softwareSlideTitle => '千万软件，一站搞定';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return '无需在网上搜索新软件。通过访问Snap Store和$RELEASE软件存档，只需输入你想要的内容，或探索图形与摄影、游戏和生产力等类别，您就可以轻松找到并安装新的应用程序，以及其他用户提供的有用评论。';
  }

  @override
  String get musicSlideTitle => '随时畅听，随地畅享';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE 带有令人惊叹的 Rhythmbox 音乐播放器。通过高级播放选项，您可以轻松的为这些完美的歌曲排序。它与 CD 和便携式音乐播放器配合得很好，因此您可以随时随地欣赏所有音乐。';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox 音乐播放器';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => '记录瞬间，珍藏回忆';

  @override
  String get photoSlideDescription => 'Shotwell 是一个精妙的照片管理器。 可通过连接相机或手机来传输图片， 以便于分享和安全地存储。 如果您想发挥更多的创造力， 您可以在 Ubuntu Software 中找到更多照片应用。';

  @override
  String get photoSlideShotwell => 'Shotwell 图片管理器';

  @override
  String get photoSlideGimp => 'GIMP 图像处理程序';

  @override
  String get photoSlideShotcut => 'Shotcut 视频编辑器';

  @override
  String get webSlideTitle => '网络之旅，一路顺畅';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE 包括了在世界上有数百万人使用的网络浏览器 Firefox 。为了便利访问，您可以像添加您本机上的应用程序一样，添加一些您经常使用的网站（例如 Facebook 或 Gmail）到您的桌面上。';
  }

  @override
  String get webSlideFirefox => 'Firefox 浏览器';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium 浏览器';

  @override
  String get officeSlideTitle => '便捷工作，效率翻倍';

  @override
  String get officeSlideDescription => 'LibreOffice 是一个自由的办公套件，包含了创建文档、表格以及幻灯片所需的工具，并完全兼容 Microsoft Office 的文件格式。';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => '轻松使用，体验无界';

  @override
  String accessSlideDescription(Object RELEASE) {
    return '$RELEASE 哲学的核心是“计算为每个人服务”。无论您是谁，抑或是身在何处，$RELEASE 都可凭先进的无障碍工具和更改语言、色彩、字体大小的选项，为您随时随地地轻松访问计算服务。';
  }

  @override
  String get accessSlideCustomizationOptions => '个性化选项';

  @override
  String get accessSlideAppearance => '外观';

  @override
  String get accessSlideAssistiveTechnologies => '协助技术';

  @override
  String get accessSlideLanguageSupport => '语言支持';

  @override
  String get supportSlideTitle => '获取支持，提供帮助';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return '官方文档覆盖了 $RELEASE 的常用问题，可通过 <a href=\"https://help.ubuntu.com\">官方网站</a> 和应用坞（dock）上的帮助图标访问。';
  }

  @override
  String get supportSlideQuestions => '在<a href=\"https://askubuntu.com\">Ask Ubuntu</a>网站，您可以提问，或者查看已获答复的精选问题。您的<a href=\"https://loco.ubuntu.com/teams\">本地社区团队</a>可能会使用您使用的语言为您提供帮助。';

  @override
  String get supportSlideResources => '要获取其它有用的信息，请访问 <a href=\"https://www.ubuntu.com/support/community-support\">社区支持</a> 或 <a href=\"https://www.ubuntu.com/support\">商业支持</a>.';

  @override
  String get includedSoftware => '包含软件';

  @override
  String get availableSoftware => '可选软件';

  @override
  String get supportedSoftware => '支持的软件';

  @override
  String get copyingFiles => '正在复制文件……';

  @override
  String get installingSystem => '正在安装系统……';

  @override
  String get configuringSystem => '正在设置系统……';

  @override
  String get installationFailed => '安装失败';

  @override
  String get notEnoughDiskSpaceTitle => '抱歉';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return '你至少需要 $SIZE 的磁盘空间来安装 $RELEASE。';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return '本机只有 $SIZE 空间。';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return '本机上最大的硬盘只有 $SIZE 空间。';
  }
}
