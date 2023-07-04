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
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class UbuntuProvisionLocalizationsZhTw extends UbuntuProvisionLocalizationsZh {
  UbuntuProvisionLocalizationsZhTw(): super('zh_TW');


}
