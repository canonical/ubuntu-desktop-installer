


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
  String get profileSetupUsernameInUse => 'That user name already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

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
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Enable resolv.conf Generation';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Configuration - Advanced options';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'Enabled';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Mount /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the necessary information to automate the process of mouting partitions.';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes...';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Setup complete';

  @override
  String setupCompleteHeader(Object user) {
    return 'Hi $user,\nYou have successfully completed the setup.';
  }

  @override
  String get setupCompleteUpdate => 'It is suggested to run the following command to update Ubuntu to the latest version:';

  @override
  String get setupCompleteRestart => '* All settings will take effect after restarting Ubuntu.';
}
