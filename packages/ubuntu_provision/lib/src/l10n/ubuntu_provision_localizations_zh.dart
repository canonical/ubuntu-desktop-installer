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
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class UbuntuProvisionLocalizationsZhTw extends UbuntuProvisionLocalizationsZh {
  UbuntuProvisionLocalizationsZhTw(): super('zh_TW');


}
