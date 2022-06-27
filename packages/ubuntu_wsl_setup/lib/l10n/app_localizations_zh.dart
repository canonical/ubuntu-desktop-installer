


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
}
