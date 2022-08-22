


import 'app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => '退出';

  @override
  String get finishButton => '结束';

  @override
  String get saveButton => '保存';

  @override
  String get setupButton => '设置';

  @override
  String get selectLanguageTitle => '选择您的语言';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => '配置文件设置';

  @override
  String get profileSetupHeader => '请创建默认的UNIX用户帐户。有关更多信息，请访问：<a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => '您的名字';

  @override
  String get profileSetupRealnameRequired => '名字是必须的';

  @override
  String get profileSetupUsernameHint => '起一个用户名';

  @override
  String get profileSetupUsernameHelper => '这个用户名不一定需要和您Windows的用户名匹配。';

  @override
  String get profileSetupPasswordHint => '挑选一个密码';

  @override
  String get profileSetupConfirmPasswordHint => '确认您的密码';

  @override
  String get profileSetupShowAdvancedOptions => '在下一页显示高级选项';

  @override
  String get profileSetupPasswordMismatch => '密码不一致';

  @override
  String get profileSetupUsernameRequired => '用户名是必须的';

  @override
  String get profileSetupUsernameInvalid => '这个用户名是无效的';

  @override
  String get profileSetupUsernameInUse => '用户名已存在。';

  @override
  String get profileSetupUsernameSystemReserved => '该名称供系统使用。';

  @override
  String get profileSetupUsernameTooLong => '用户名过长。';

  @override
  String get profileSetupUsernameInvalidChars => '用户名包含无效字符。';

  @override
  String get profileSetupPasswordRequired => '密码是必须的';

  @override
  String get advancedSetupTitle => '进阶设置';

  @override
  String get advancedSetupHeader => '在这个页面，您可以根据您的需要调整Ubuntu WSL。';

  @override
  String get advancedSetupMountLocationHint => '挂载位置';

  @override
  String get advancedSetupMountLocationHelper => '自动安装的位置';

  @override
  String get advancedSetupMountLocationInvalid => '该位置无效';

  @override
  String get advancedSetupMountOptionHint => '挂载选项';

  @override
  String get advancedSetupMountOptionHelper => '为自动挂载传递了挂载选项';

  @override
  String get advancedSetupHostGenerationTitle => '启用主机生成';

  @override
  String get advancedSetupHostGenerationSubtitle => '选择可在每次启动时启用/etc/hosts重新生成。';

  @override
  String get advancedSetupResolvConfGenerationTitle => '开启resolv.conf生成';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => '选择启用 /etc/resolv.conf 在每次启动时重新生成。';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI集成';

  @override
  String get advancedSetupGUIIntegrationSubtitle => '选择可启用自动显示环境设置。需要第三方X服务器。';

  @override
  String get configurationUITitle => 'Ubuntu WSL配置-高级选项';

  @override
  String get configurationUIInteroperabilityHeader => '互操作性';

  @override
  String get configurationUIInteroperabilityTitle => '开启';

  @override
  String get configurationUIInteroperabilitySubtitle => '是否启用互操作性。';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => '附加Windows路径';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => '是否将Windows路径附加到WSL中的Path环境变量中';

  @override
  String get configurationUIAutoMountHeader => '自动挂载';

  @override
  String get configurationUIAutoMountTitle => '开启';

  @override
  String get configurationUIAutoMountSubtitle => '是否启用自动挂载功能。此功能允许您在WSL中挂载Windows drive。';

  @override
  String get configurationUIMountFstabTitle => '挂载/etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => '是否将挂载 /etc/fstab。 该文件包含有关系统将挂载的文件系统的信息。';

  @override
  String get configurationUISystemdHeader => '实验性 - 系统化';

  @override
  String get configurationUISystemdTitle => '开启';

  @override
  String get configurationUISystemdSubtitle => '是否应在引导时激活systemd。注意：这是一个实验特性。';

  @override
  String get applyingChanges => '正在应用更改…';

  @override
  String get applyingChangesDisclaimer => '这可能需要几分钟的时间，具体取决于您的Internet连接。';

  @override
  String get setupCompleteTitle => '成功完成安装';

  @override
  String setupCompleteHeader(Object user) {
    return '您好，$user，\n您已经成功完成安装。';
  }

  @override
  String get setupCompleteUpdate => '建议运行以下命令来更新Ubuntu到最新版本:';

  @override
  String get setupCompleteRestart => '所有设置将在Ubuntu重新启动后生效。';

  @override
  String get installationSlidesWelcome => '欢迎来到Ubuntu WSL';

  @override
  String get installationSlidesInitializing => '初始化…';

  @override
  String get installationSlidesUnpacking => '解包发行版';

  @override
  String get installationSlidesInstalling => '即将就绪。需要留意安装器。';

  @override
  String get installationSlidesLaunching => '启动发行版…';

  @override
  String get installationSlidesErrorMsg => '有哪里出了问题。';

  @override
  String get installationSlidesErrorTitle => '有哪里出了问题';

  @override
  String get installationSlidesErrorSub => '请选择命令重试并重启WSL：\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\n一个不可恢复的错误发生了。\n\n请关闭这个程序，打开 Powershell 或者命令提示符运行以下命令：\n';

  @override
  String get installationSlidesDone => '完成。在WSL享受Ubuntu';

  @override
  String get installationSlidesExitTitle => '你确定要离开？';

  @override
  String get installationSlidesExitContents => '关闭这个窗口不会停止在后台运行的安装程序。\n\n同时，您可以继续探索您能在 Ubuntu on WSL 里做什么。';

  @override
  String get installationSlidesCustomExitTitle => '即将完成';

  @override
  String get installationSlidesCustomExitContents => '主安装器窗口只剩几步就可以完成。\n我们可以退出这个窗口然后转到那里吗？';

  @override
  String get installationSlidesOk => '确定';

  @override
  String get installationSlidesLeave => '离开';

  @override
  String get installationSlidesCancel => '取消';

  @override
  String get installationSlidesUbuntuOnWsl => 'WSL上的Ubuntu';

  @override
  String get installationSlidesUbuntuOnWslText => '为 Linux 应用开发和运行设计的完整 Ubuntu 环境，深度融入 Windows，针对云、网站、数据科学和物联网进行了优化。更重要的是，玩得愉快！';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL\n网络开发用';

  @override
  String get installationSlidesUbuntuWslWebDevText => '在 WSL 中使用 VS Code和IntelliJ等原生 Windows IDE进行开发并从全特性 NodeJS 和 Ruby 支持中获益。';

  @override
  String get installationSlidesUbuntuWslDataScience => '数据科学用 Ubuntu WSL';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDA Data Science Stack 让你得以利用原生 Windows NVIDIA 驱动最大化数据科学和机器学习项目的性能。';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL\n图形程序用';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => '在 Linux 上使用 WSLg 开发和预览多平台支持的网站和图形应用程序。';

  @override
  String get installationSlidesUbuntuWslDevOps => 'DevOps 用 Ubuntu WSL';

  @override
  String get installationSlidesUbuntuWslDevOpsText => '在本地的 Ubuntu WSL 上开发，以确保 CI/CD 管线在 Ubuntu 生产环境中的兼容性';

  @override
  String get installationSlidesUbuntuWslEnterprises => '企业用 Ubuntu WSL';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => '经过认证的 Ubuntu LTS\n在 Windows 企业生态中\n助力开发者。';

  @override
  String get installationSlidesFindOutMore => '探索更多';

  @override
  String get installationSlidesFindOutMoreVisit => '访问 ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' 探索更多关于 WSL 上的 Ubuntu 以及 Canonical 如何支持开发者和组织。';
}
