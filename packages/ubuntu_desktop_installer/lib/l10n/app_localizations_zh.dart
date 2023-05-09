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
  String get revertButtonText => '撤销';

  @override
  String get yesButtonText => '是';

  @override
  String get quitButtonText => '退出安装';

  @override
  String welcomePageTitle(Object DISTRO) {
    return '欢迎来到 $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return '正在准备 $DISTRO...';
  }

  @override
  String get welcomeHeader => '选择您的语言：';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return '试用或安装$DISTRO';
  }

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
    return '安装 $RELEASE，并可选择保留或替换您当前的操作系统。这个过程应该不会花费太长时间。';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '您可能想阅读<a href=\"$url\"> 发行注记</a>。';
  }

  @override
  String get turnOffRST => 'RST 已启用';

  @override
  String get turnOffRSTTitle => '关闭 RST 以继续';

  @override
  String get turnOffRSTDescription => '这台电脑使用了英特尔RST（快速存储技术）。在安装Ubuntu之前，您需要在Windows中关闭RST。';

  @override
  String instructionsForRST(Object url) {
    return '有关说明，请在另一台设备上扫描QR码或访问：<a href=\"https://$url\">$url</a>';
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
  String get detectButtonText => '检测';

  @override
  String get keyboardVariant => '键盘变体：';

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
  String get noInternet => '我现在不想连接到互联网';

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
  String get updatesOtherSoftwarePageTitle => '应用程序和更新';

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
  String get chooseSecurityKeyTitle => '安全密钥';

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
    return '为安全起见，对新的 $RELEASE 安装进行加密';
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
  String get installationTypeManual => '手动分区';

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
  String get allocateDiskSpace => '手动分区';

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
  String get newPartitionTableConfirmationTitle => '新建空分区';

  @override
  String get newPartitionTableConfirmationMessage => '在整个设备上创建一个新的分区表，将删除其当前所有的分区。如果需要的话，这个操作可以被撤销。';

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
  String get partitionFormatNone => '保持未格式化';

  @override
  String get partitionErase => '格式化分区';

  @override
  String get partitionMountPointLabel => '挂载点：';

  @override
  String get whoAreYouPageTitle => '设置您的帐户';

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
  String get whoAreYouPageInvalidComputerName => '计算机主机名无效';

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
  String get writeChangesToDisk => '准备安装';

  @override
  String get writeChangesFallbackSerial => '磁盘';

  @override
  String get writeChangesDescription => '如果继续，下面列出的更改将会写入磁盘。您可以手动进行进一步的更改。';

  @override
  String get writeChangesDevicesTitle => '设备';

  @override
  String get writeChangesPartitionsTitle => '分区';

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
    return '分区<b>$disk$partition</b> 从<b>$oldsize</b> 调整为<b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return '分区<b>$disk$partition</b> 格式化为<b>$format</b> 并挂载到<b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return '分区<b>$disk$partition</b> 格式化为<b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return '分区 <b>$disk$partition</b> 挂载到 <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return '分区 <b>$disk$partition</b> 已创建';
  }

  @override
  String get chooseYourLookPageTitle => '选择您的主题';

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
    return '**$system** 已经安装并准备好使用了';
  }

  @override
  String restartInto(Object system) {
    return '重启进入 $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return '您现在可以继续测试 $RELEASE，但在重新启动计算机之前，您所做的任何更改或保存的文档都不会被保留。';
  }

  @override
  String get shutdown => '关机';

  @override
  String get restartNow => '立即重启';

  @override
  String get continueTesting => '继续试用';

  @override
  String get turnOffBitlockerTitle => '已启用 BitLocker';

  @override
  String get turnOffBitlockerHeadline => '关闭 BitLocker 以继续';

  @override
  String turnOffBitlockerDescription(Object option) {
    return '这台电脑使用了 Windows BitLocker 进行加密。\n在安装 Ubuntu 之前，您需要关闭 Windows 的 BitLocker 功能。';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '有关说明，请在另一台设备上扫描QR码或访问该网址：<a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => '重启进入 Windows';

  @override
  String get restartIntoWindowsTitle => '重启到 Windows？';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return '您确定要重新启动计算机吗？您需要稍后重新启动 $DISTRO 安装程序才能完成安装 $DISTRO。';
  }

  @override
  String get whereAreYouPageTitle => '选择您的时区';

  @override
  String get whereAreYouLocationLabel => '位置';

  @override
  String get whereAreYouTimezoneLabel => '时区';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return '欢迎使用 $RELEASE';
  }

  @override
  String get installationSlidesAvailable => '可用：';

  @override
  String get installationSlidesIncluded => '包含：';

  @override
  String get installationSlidesWelcomeTitle => '快捷、自由、功能新颖，让人爱不释手';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return '$DISTRO 最新版本的推出，让计算机的使用变得前所未有的容易。';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return '不论你是开发者、创作者、游戏玩家还是管理员，你都能在 $RELEASE 中找到新的工具，以提高生产力并增强使用体验。';
  }

  @override
  String get installationSlidesSoftwareTitle => '您需要的所有应用程序';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return '在 Ubuntu 软件中心安装、管理和更新所有应用程序，包括来自 Snap Store 和 $DISTRO 存档的成千上万应用程序。';
  }

  @override
  String get installationSlidesDevelopmentTitle => '利用最好的开源进行开发';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO 是应用程序或 Web 开发、数据科学和 AI/ML 以及 DevOps 和管理的理想工作站。每个 $DISTRO 版本都包含最新的工具链，并支持所有主要的 IDE。';
  }

  @override
  String get installationSlidesCreativityTitle => '激发你的创造力';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return '如果您是动画师、设计师、视频创作者或游戏开发人员，$DISTRO 的开源和行业标准软件和应用程序的支持，让你能够轻松地将你的工作流程引入其中。';
  }

  @override
  String get installationSlidesGamingTitle => '非常适合游戏';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO 支持最新的 NVIDIA 和 Mesa 驱动程序以提高性能和兼容性。数以千计的 Windows 游戏可通过 Steam 等应用程序在 $DISTRO 上畅玩，无需额外配置。';
  }

  @override
  String get installationSlidesSecurityTitle => '私密且安全';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO 提供了保持在线隐私和安全所需的所有工具。内置防火墙和 VPN 支持以及大量以隐私为中心的应用程序，可确保您完全控制自己的数据。';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return '所有 $DISTRO LTS 版本都包含五年的安全补丁，如果有 Ubuntu Pro 订阅，则可以延长至十年。';
  }

  @override
  String get installationSlidesProductivityTitle => '激发您的生产力，让你事半功倍';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO 桌面包含 LibreOffice，这是一套与 Microsoft Office 兼容的开源应用程序，用于文档，电子表格和演示文稿。流行的协作工具也可以使用。';
  }

  @override
  String get installationSlidesAccessibilityTitle => '每个人都可轻松使用';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return '$DISTRO 哲学核心是计算机是为每个人而存在的信仰。通过先进的辅助工具和更改语言、颜色和文本大小的选项，$DISTRO 让计算机使用变得简单 - 无论你是谁，身在何处。';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca屏幕阅读器';

  @override
  String get installationSlidesAccessibilityLanguages => '语言支持';

  @override
  String get installationSlidesSupportTitle => '帮助与支持';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return '$DISTRO 的官方文档可以通过在线方式或者在Dock中的帮助图标获取。';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu 覆盖了各种问题和回答，而 Ubuntu Discourse 为新手和有经验的用户提供指南和讨论。';

  @override
  String get installationSlidesSupportEnterprise => '对于企业用户，Canonical 提供商业支持，以便在工作场所轻松安全地使用和管理 Ubuntu。';

  @override
  String get installationSlidesSupportResources => '有用的资源：';

  @override
  String get installationSlidesSupportDocumentation => '官方文档';

  @override
  String get installationSlidesSupportUbuntuPro => '使用 Ubuntu Pro 可享受企业级 7*24 支持服务';

  @override
  String get copyingFiles => '正在复制文件……';

  @override
  String get installingSystem => '正在安装系统……';

  @override
  String get configuringSystem => '正在设置系统……';

  @override
  String get installationFailed => '安装失败';

  @override
  String get notEnoughDiskSpaceTitle => '空间不足';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return '磁盘空间不足，无法安装 $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => '可用：';

  @override
  String get notEnoughDiskSpaceRequired => '必填：';

  @override
  String get activeDirectoryOption => '使用活动目录';

  @override
  String get activeDirectoryInfo => '您将在下一步中输入域和其他详细信息。';

  @override
  String get activeDirectoryTitle => '配置活动目录';

  @override
  String get activeDirectoryTestConnection => '测试域连接';

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

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw(): super('zh_TW');

  @override
  String get appTitle => 'Traditional Chinese';
}
