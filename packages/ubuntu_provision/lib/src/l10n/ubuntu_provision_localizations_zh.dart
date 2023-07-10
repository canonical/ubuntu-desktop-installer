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
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class UbuntuProvisionLocalizationsZhTw extends UbuntuProvisionLocalizationsZh {
  UbuntuProvisionLocalizationsZhTw(): super('zh_TW');


}
