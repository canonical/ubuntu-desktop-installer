import 'ubuntu_provision_localizations.dart';

/// The translations for Thai (`th`).
class UbuntuProvisionLocalizationsTh extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'ผังแป้นพิมพ์';

  @override
  String get keyboardHeader => 'เลือกผังแป้นพิมพ์ของคุณ:';

  @override
  String get keyboardTestHint => 'พิมพ์ที่นี่ เพื่อทดสอบแป้นพิมพ์ของคุณ (กด Alt+Shift เพื่อสลับภาษา)';

  @override
  String get keyboardDetectTitle => 'ตรวจหาผังแป้นพิมพ์';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'โปรดกดปุ่มใดปุ่มหนึ่งในรายการนี้:';

  @override
  String get keyboardKeyPresentLabel => 'ปุ่มดังกล่าวมีอยู่บนแป้นพิมพ์หรือไม่?';

  @override
  String get themePageTitle => 'Choose your theme';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';
}
