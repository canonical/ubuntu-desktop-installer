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
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

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
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

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
  String get installCodecsTitle => '下载并安装对其他媒体格式的支持';

  @override
  String get installCodecsSubtitle => '这些软件受其文档中包含的许可条款约束。其中部分软件是专有软件。';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">警告</font>：电脑未接入电源适配器。';
  }

  @override
  String get offlineWarning => '您当前处于离线状态';

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
  String get startInstallingButtonText => '安装';

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
  String get tooManyPrimaryPartitions => '主分区过多';

  @override
  String get partitionLimitReached => '已达上限';

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
  String get partitionFormatNone => '保持未格式化';

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
  String get whoAreYouPageRealNameTooLong => '名字过长。';

  @override
  String get whoAreYouPageComputerNameLabel => '您的电脑主机名';

  @override
  String get whoAreYouPageComputerNameInfo => '与其他计算机联络时使用的名称。';

  @override
  String get whoAreYouPageComputerNameRequired => '需要计算机名称';

  @override
  String get whoAreYouPageComputerNameTooLong => '电脑名称太长了。';

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
  String get whoAreYouPagePasswordShow => '显示';

  @override
  String get whoAreYouPagePasswordHide => '隐藏';

  @override
  String get writeChangesToDisk => '将更改写入磁盘';

  @override
  String get writeChangesFallbackSerial => '磁盘';

  @override
  String get writeChangesDescription => '如果继续，下面列出的更改将会写入磁盘。您可以手动进行进一步的更改。';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

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
    return '**$system** 安装完毕并且可以使用';
  }

  @override
  String restartInto(Object system) {
    return '重启进入 $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return '你现在可以继续试用$RELEASE ，但在你重新启动计算机之前，你所做的任何修改或保存的文件都不会被保留。';
  }

  @override
  String get shutdown => '关机';

  @override
  String get restartNow => '立即重启';

  @override
  String get continueTesting => '继续试用';

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

  @override
  String get activeDirectoryOption => '使用活动目录';

  @override
  String get activeDirectoryInfo => '您将在下一步中输入域和其他详细信息。';

  @override
  String get activeDirectoryTitle => '配置活动目录';

  @override
  String get activeDirectoryTestConnection => '测试连接';

  @override
  String get activeDirectoryDomainLabel => '域';

  @override
  String get activeDirectoryDomainEmpty => '必填';

  @override
  String get activeDirectoryDomainTooLong => '太长了';

  @override
  String get activeDirectoryDomainInvalidChars => '无效字符';

  @override
  String get activeDirectoryDomainStartDot => '以点（.）开头';

  @override
  String get activeDirectoryDomainEndDot => '以点（.）结尾';

  @override
  String get activeDirectoryDomainStartHyphen => '以连字符 （-） 开头';

  @override
  String get activeDirectoryDomainEndHyphen => '以连字符 （-） 结尾';

  @override
  String get activeDirectoryDomainMultipleDots => '包含多个有序点 (..)';

  @override
  String get activeDirectoryDomainNotFound => '未找到域';

  @override
  String get activeDirectoryAdminLabel => '域管理员';

  @override
  String get activeDirectoryAdminEmpty => '必填';

  @override
  String get activeDirectoryAdminInvalidChars => '无效字符';

  @override
  String get activeDirectoryPasswordLabel => '密码';

  @override
  String get activeDirectoryPasswordEmpty => '必填';

  @override
  String get activeDirectoryErrorTitle => '配置活动目录时出错';

  @override
  String get activeDirectoryErrorMessage => '抱歉，活动目录目前无法设置。系统启动并运行后，请访问 <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> 寻求帮助。';
}
