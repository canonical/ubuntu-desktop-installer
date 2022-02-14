


import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Ubuntu 桌面版安装器';

  @override
  String windowTitle(Object RELEASE) {
    return '安装';
  }

  @override
  String get cancelButtonText => '取消';

  @override
  String get changeButtonText => '更改';

  @override
  String get okButtonText => '好';

  @override
  String get noButtonText => '不';

  @override
  String get restartButtonText => '重启';

  @override
  String get revertButtonText => '回滚';

  @override
  String get yesButtonText => '是';

  @override
  String get welcome => '欢迎';

  @override
  String get welcomeHeader => '选择您的语言：';

  @override
  String get tryOrInstallPageTitle => '尝试或安装';

  @override
  String get repairInstallation => '修复安装';

  @override
  String get repairInstallationDescription => '修复程序将在不接触文档或设置的情况下重新安装所有已安装的软件。';

  @override
  String tryUbuntu(Object RELEASE) {
    return '试试$RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return '您可以在不对电脑做任何改动的情况下试试$RELEASE。';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '安装 $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '将$RELEASE与当前操作系统一起安装（或代替当前操作系统）。这花不了多长时间。';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '你可能想阅读<a href=\"$url\">更新日志</a>。';
  }

  @override
  String get turnOffRST => '关闭RST';

  @override
  String get turnOffRSTDescription => '这台电脑使用了英特尔RST（快速存储技术）。在安装Ubuntu之前，你需要在Windows中关闭RST。';

  @override
  String instructionsForRST(Object url) {
    return '有关说明，请在手机或其他设备上打开此页面：<a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => '键盘布局';

  @override
  String get chooseYourKeyboardLayout => '选择你的键盘布局：';

  @override
  String get typeToTest => '这里输入测试键盘';

  @override
  String get detectLayout => '检测键盘布局';

  @override
  String get pressOneKey => '请按以下键任意一个键：';

  @override
  String get isKeyPresent => '你的键盘上是否有以下键？';

  @override
  String get configureSecureBootTitle => '配置安全引导';

  @override
  String get configureSecureBootDescription => '您已选择安装第三方驱动。这需要关闭安全引导。\n为此，您需要立即选择一个安全密钥，并在系统重新启动时输入。';

  @override
  String get configureSecureBootOption => '配置安全引导';

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
  String get connectToInternetPageTitle => '连接到互联网';

  @override
  String get connectToInternetDescription => '将这台电脑连接到互联网将有助于Ubuntu安装所需的任何额外软件，并有助于选择你的时区。\n\n通过以太网电缆连接，或选择Wi-Fi网络';

  @override
  String get useWiredConnection => '使用有线连接';

  @override
  String get noWiredConnection => '未检测到有线连接';

  @override
  String get wiredDisabled => '有线连接已关闭';

  @override
  String get wiredMustBeEnabled => '要在此电脑上使用以太网，必须启用有线连接';

  @override
  String get enableWired => '启用有线';

  @override
  String get selectWifiNetwork => '链接WiFi';

  @override
  String get hiddenWifiNetwork => '连接到隐藏的Wi-Fi网络';

  @override
  String get hiddenWifiNetworkNameLabel => '网络名称';

  @override
  String get hiddenWifiNetworkNameRequired => '需要一个网络名城';

  @override
  String get noInternet => '我不想现在联网';

  @override
  String get wirelessNetworkingDisabled => '无线网络已禁用';

  @override
  String get noWifiDevicesDetected => '找不到WiFi';

  @override
  String get wifiMustBeEnabled => '要在此电脑上使用Wi-Fi，必须启用无线网络';

  @override
  String get enableWifi => '启用WiFi';

  @override
  String get connectButtonText => '连接';

  @override
  String get updatesOtherSoftwarePageTitle => '更新其他软件';

  @override
  String get updatesOtherSoftwarePageDescription => '您想先安装哪些应用？';

  @override
  String get normalInstallationTitle => '正常安装';

  @override
  String get normalInstallationSubtitle => '浏览器';

  @override
  String get minimalInstallationTitle => '最小化安装';

  @override
  String get minimalInstallationSubtitle => '浏览器和基础实用程序。';

  @override
  String get otherOptions => '其他选择';

  @override
  String get installThirdPartyTitle => '为图形和Wi-Fi硬件以及其他媒体格式安装第三方软件';

  @override
  String get installThirdPartySubtitle => '本软件受其文档中包含的许可条款的约束中有些是专有的。';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">警告</font>：电脑未插入电源。';
  }

  @override
  String get chooseSecurityKeyTitle => '选择一个安全密钥';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return '磁盘加密在您丢失电脑的时候会保护您的文件。它要求您在每次计算机启动时输入一个安全密钥。\n\n${RELEASE}之外的任何文件都不会加密。';
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
    return '<font color=\"$color\">警告</font>：如果丢失此安全密钥，所有数据都将丢失。为了以防万一，你可以拿个小本儿本儿记着，并把它放在其他安全的地方。';
  }

  @override
  String get installationTypeTitle => '安装类型';

  @override
  String installationTypeOSDetected(Object os) {
    return '这台电脑上当前安装了$os。你想做什么？';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

  @override
  String get installationTypeNoOSDetected => '这台电脑目前没有检测到操作系统。你想做什么？';

  @override
  String installationTypeErase(Object DISTRO) {
    return '擦除磁盘并安装$DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">警告：</font>这将删除整个操作系统中的所有程序、文档、照片、音乐和任何其他文件。';
  }

  @override
  String get installationTypeAdvancedLabel => '高级功能...';

  @override
  String get installationTypeAdvancedTitle => '高级功能';

  @override
  String get installationTypeNone => '空';

  @override
  String get installationTypeNoneSelected => '未选择任何选项';

  @override
  String installationTypeLVM(Object RELEASE) {
    return '在新的$RELEASE安装中使用LVM';
  }

  @override
  String get installationTypeLVMSelected => 'LVM已选择';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return '为安全起见，对新的$RELEASE安装进行加密';
  }

  @override
  String get installationTypeEncryptInfo => '您将在下一步中选择一个安全密钥。';

  @override
  String get installationTypeZFS => '实验性功能：擦除磁盘并使用ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS 已选择';

  @override
  String installationTypeReinstall(Object os) {
    return '删除$os并重新安装';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">警告：</font>这将删除你的$os中的所有程序、文档、照片、音乐和任何其他文件。';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '在$os中安装$product';
  }

  @override
  String get installationTypeAlongsideInfo => '文件、音乐和其他个人文件将被保存。每次电脑启动时，您可以选择所需的操作系统。';

  @override
  String get installationTypeManual => '别的东西';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return '您可以自己创建或调整分区大小，或者为$DISTRO选择多个分区';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return '擦除磁盘并安装$DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => '选择驱动器：';

  @override
  String get selectGuidedStorageInfoLabel => '整个磁盘将被使用：';

  @override
  String get selectGuidedStorageInstallNow => '立即安装';

  @override
  String get allocateDiskSpace => '分配磁盘空间';

  @override
  String get startInstallingButtonText => '开始安装';

  @override
  String get diskHeadersDevice => '配备';

  @override
  String get diskHeadersType => '类型';

  @override
  String get diskHeadersMountPoint => '挂载点';

  @override
  String get diskHeadersSize => '尺寸';

  @override
  String get diskHeadersUsed => '已使用';

  @override
  String get diskHeadersSystem => '系统';

  @override
  String get diskHeadersFormat => '格式化';

  @override
  String get freeDiskSpace => '剩余空间';

  @override
  String get newPartitionTable => '新分区表';

  @override
  String get newPartitionTableConfirmationTitle => '是否在此设备上创建新的空白分区表？';

  @override
  String get newPartitionTableConfirmationMessage => '您已选择要分区的整个设备。如果继续在设备上创建新的分区表，那么所有当前分区都将被删除。\n\n请注意，如果您愿意，稍后可以撤消此操作。';

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
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => '输入新分区：';

  @override
  String get partitionTypePrimary => '主要的';

  @override
  String get partitionTypeLogical => '必然的';

  @override
  String get partitionLocationLabel => '新分区的位置：';

  @override
  String get partitionLocationBeginning => '这个空间的开始';

  @override
  String get partitionLocationEnd => '这个空间的结束';

  @override
  String get partitionFormatLabel => '用作：';

  @override
  String get partitionFormatExt4 => 'Ext4日志文件系统';

  @override
  String get partitionFormatExt3 => 'Ext3日志文件系统';

  @override
  String get partitionFormatExt2 => 'Ext2文件系统';

  @override
  String get partitionFormatBtrfs => 'btrfs日志文件系统';

  @override
  String get partitionFormatJfs => 'JFS日志文件系统';

  @override
  String get partitionFormatXfs => 'XFS日志文件系统';

  @override
  String get partitionFormatFat => 'FAT文件系统';

  @override
  String get partitionFormatFat12 => 'FAT12文件系统';

  @override
  String get partitionFormatFat16 => 'FAT16文件系统';

  @override
  String get partitionFormatFat32 => 'FAT32文件系统';

  @override
  String get partitionFormatSwap => '交换分区';

  @override
  String get partitionFormatIso9660 => 'ISO 9660文件系统';

  @override
  String get partitionFormatVfat => 'VFAT文件系统';

  @override
  String get partitionFormatNtfs => 'NTFS文件系统';

  @override
  String get partitionFormatReiserFS => 'ReiserFS文件系统';

  @override
  String get partitionFormatZfsroot => 'ZFS根文件系统';

  @override
  String get partitionErase => '格式化分区';

  @override
  String get partitionMountPointLabel => '挂载点：';

  @override
  String get whoAreYouPageTitle => '你是谁？';

  @override
  String get whoAreYouPageAutoLogin => '自动登录';

  @override
  String get whoAreYouPageRequirePassword => '需要我的密码才能登录';

  @override
  String get whoAreYouPageRealNameLabel => '您的姓名';

  @override
  String get whoAreYouPageRealNameRequired => '需要一个名字';

  @override
  String get whoAreYouPageComputerNameLabel => '您的电脑名称';

  @override
  String get whoAreYouPageComputerNameInfo => '这个名称用于与其他电脑进行通信时使用。';

  @override
  String get whoAreYouPageComputerNameRequired => '需要一个电脑名称';

  @override
  String get whoAreYouPageInvalidComputerName => '电脑名无效';

  @override
  String get whoAreYouPageUsernameLabel => '选择一个用户名';

  @override
  String get whoAreYouPageUsernameRequired => '需要用户名';

  @override
  String get whoAreYouPageInvalidUsername => '用户名无效';

  @override
  String get whoAreYouPagePasswordLabel => '选择一个密码';

  @override
  String get whoAreYouPagePasswordRequired => '需要密码';

  @override
  String get whoAreYouPageConfirmPasswordLabel => '确认您的密码';

  @override
  String get whoAreYouPagePasswordMismatch => '密码不匹配';

  @override
  String get whoAreYouPageShowPassword => 'Show password';

  @override
  String get writeChangesToDisk => '将更改写入磁盘';

  @override
  String get writeChangesFallbackSerial => '磁盘';

  @override
  String get writeChangesDescription => '如果继续，下面列出的更改将会写入磁盘。您可以手动进行进一步的更改。';

  @override
  String get writeChangesPartitionTablesHeader => '以下设备的分区表已更改：';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => '以下分区将被格式化：';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return '分区#$disk${partition}作为$format用于$mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return '分区#$disk${partition}作为$format';
  }

  @override
  String get chooseYourLookPageTitle => '选择您的形象';

  @override
  String get chooseYourLookPageHeader => '您可以稍后在“外观设置”中更改此设置。';

  @override
  String get chooseYourLookPageDarkSetting => '暗黑';

  @override
  String get chooseYourLookPageLightSetting => '浅色';

  @override
  String get chooseYourLookPageLightBodyText => '所有都是浅色和明亮的';

  @override
  String get chooseYourLookPageDarkBodyText => '暗黑系是我哥们儿';

  @override
  String get installationCompleteTitle => '安装完成';

  @override
  String readyToUse(Object system) {
    return '**$system**已安装完成可以开始使用。';
  }

  @override
  String restartInto(Object system) {
    return '重新进入$system';
  }

  @override
  String get shutdown => '关闭';

  @override
  String get turnOffBitlockerTitle => '关闭BitLocker';

  @override
  String get turnOffBitlockerDescription => '这台电脑使用了Windows BitLocker加密。\n在安装Ubuntu之前，你需要关闭Windows中的BitLocker。';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '有关说明，请在手机或其他设备上打开此页面：<a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => '重启进入Windows';

  @override
  String get whereAreYouPageTitle => '您在哪里？';

  @override
  String get whereAreYouLocationLabel => '位置';

  @override
  String get whereAreYouTimezoneLabel => '时区';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return '欢迎来到$RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return '最新版本的$RELEASE速度快，功能齐全，使计算变得比以往任何时候都简单。这里有一些很酷的新事物需要注意……';
  }

  @override
  String get softwareSlideTitle => '查找更多的软件';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return '告别在网上搜索新软件。通过访问Snap Store和$RELEASE软件存档，您可以轻松找到并安装新的应用程序。只需输入你想要的内容，或探索图形与摄影、游戏和生产力等类别，以及其他用户提供的有用评论。';
  }

  @override
  String get musicSlideTitle => '带上你的音乐';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox Music Player';

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
  String get photoSlideShotcut => 'Shotcut Video Editor';

  @override
  String get webSlideTitle => 'Make the most of the web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'Firefox web browser';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Everything you need for the office';

  @override
  String get officeSlideDescription => 'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Access for everyone';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, $RELEASE makes computing easy - whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Customization options';

  @override
  String get accessSlideAppearance => 'Appearance';

  @override
  String get accessSlideAssistiveTechnologies => 'Assistive technologies';

  @override
  String get accessSlideLanguageSupport => 'Language support';

  @override
  String get supportSlideTitle => 'Help and support';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Included software';

  @override
  String get availableSoftware => 'Available software';

  @override
  String get supportedSoftware => 'Supported software';
}
