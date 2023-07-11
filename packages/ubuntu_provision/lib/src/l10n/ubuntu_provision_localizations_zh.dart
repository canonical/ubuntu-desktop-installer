import 'ubuntu_provision_localizations.dart';

/// The translations for Chinese (`zh`).
class UbuntuProvisionLocalizationsZh extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get timezonePageTitle => '选择您的时区';

  @override
  String get timezoneLocationLabel => '位置';

  @override
  String get timezoneTimezoneLabel => '时区';

  @override
  String get keyboardTitle => '键盘布局';

  @override
  String get keyboardHeader => '选择您的键盘布局：';

  @override
  String get keyboardTestHint => '在此键入以测试您的键盘';

  @override
  String get keyboardDetectTitle => '检测键盘布局';

  @override
  String get keyboardDetectButton => '检测';

  @override
  String get keyboardVariantLabel => '键盘变体：';

  @override
  String get keyboardPressKeyLabel => '请按下以下按键中的任意一个：';

  @override
  String get keyboardKeyPresentLabel => '您的键盘上是否有以下键？';

  @override
  String get themePageTitle => '选择您的主题';

  @override
  String get themePageHeader => '稍后您可以在“外观设置”中进行更改。';

  @override
  String get themeDark => '深色';

  @override
  String get themeLight => '浅色';

  @override
  String localePageTitle(Object DISTRO) {
    return '欢迎来到 $DISTRO';
  }

  @override
  String get localeHeader => '选择您的语言：';

  @override
  String get identityPageTitle => '设置您的帐户';

  @override
  String get identityAutoLogin => '自动登录';

  @override
  String get identityRequirePassword => '登录时需要密码';

  @override
  String get identityRealNameLabel => '您的姓名';

  @override
  String get identityRealNameRequired => '需要名字';

  @override
  String get identityRealNameTooLong => '名字过长。';

  @override
  String get identityHostnameLabel => '您的电脑主机名';

  @override
  String get identityHostnameInfo => '与其他计算机联络时使用的名称。';

  @override
  String get identityHostnameRequired => '需要计算机名称';

  @override
  String get identityHostnameTooLong => '电脑名称太长了。';

  @override
  String get identityInvalidHostname => '计算机主机名无效';

  @override
  String get identityUsernameLabel => '键入一个用户名';

  @override
  String get identityUsernameRequired => '需要用户名';

  @override
  String get identityInvalidUsername => '用户名无效';

  @override
  String get identityUsernameInUse => '这个用户名已经存在。';

  @override
  String get identityUsernameSystemReserved => '这个名称保留给系统使用。';

  @override
  String get identityUsernameTooLong => '名字过长.';

  @override
  String get identityUsernameInvalidChars => '这个名称包含无效字符。';

  @override
  String get identityPasswordLabel => '选择一个密码';

  @override
  String get identityPasswordRequired => '需要密码';

  @override
  String get identityConfirmPasswordLabel => '确认您的密码';

  @override
  String get identityPasswordMismatch => '密码不匹配';

  @override
  String get identityPasswordShow => '显示';

  @override
  String get identityPasswordHide => '隐藏';

  @override
  String get identityActiveDirectoryOption => '使用活动目录';

  @override
  String get identityActiveDirectoryInfo => '您将在下一步中输入域和其他详细信息。';

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

  @override
  String get networkPageTitle => '连接到互联网';

  @override
  String get networkPageHeader => '将这台电脑连接到互联网有助于 Ubuntu 安装所需的任何额外软件并选择您的时区。\n\n通过以太网电缆连接，或选择 Wi-Fi 网络';

  @override
  String get networkWiredOption => '使用有线连接';

  @override
  String get networkWiredNone => '未检测到有线连接';

  @override
  String get networkWiredOff => '有线连接已关闭';

  @override
  String get networkWiredDisabled => '要在此电脑上使用网络，必须启用有线连接';

  @override
  String get networkWiredEnable => '启用有线连接';

  @override
  String get networkWifiOption => '连接到 Wi-Fi 网络';

  @override
  String get networkWifiOff => '无线网络已禁用';

  @override
  String get networkWifiNone => '找不到 Wi-Fi 设备';

  @override
  String get networkWifiDisabled => '要在此电脑上使用Wi-Fi，必须启用无线网络';

  @override
  String get networkWifiEnable => '启用 Wi-Fi';

  @override
  String get networkHiddenWifiOption => '连接到隐藏的 Wi-Fi 网络';

  @override
  String get networkHiddenWifiNameLabel => '网络名称';

  @override
  String get networkHiddenWifiNameRequired => '需要网络名称';

  @override
  String get networkNoneOption => '我现在不想连接到互联网';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class UbuntuProvisionLocalizationsZhTw extends UbuntuProvisionLocalizationsZh {
  UbuntuProvisionLocalizationsZhTw(): super('zh_TW');


}
