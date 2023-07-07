import 'ubuntu_provision_localizations.dart';

/// The translations for Japanese (`ja`).
class UbuntuProvisionLocalizationsJa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get timezonePageTitle => 'タイムゾーンを選択してください。';

  @override
  String get timezoneLocationLabel => '現在地';

  @override
  String get timezoneTimezoneLabel => 'タイムゾーン';

  @override
  String get keyboardTitle => 'キーボードレイアウト';

  @override
  String get keyboardHeader => 'キーボードレイアウトを選択してください。';

  @override
  String get keyboardTestHint => 'ここに入力して、キーボードをテストできます';

  @override
  String get keyboardDetectTitle => 'キーボードレイアウトを検出する';

  @override
  String get keyboardDetectButton => '検出';

  @override
  String get keyboardVariantLabel => 'キーボードバリアント：';

  @override
  String get keyboardPressKeyLabel => '以下のキーのうち 1 つを押してください。';

  @override
  String get keyboardKeyPresentLabel => '以下のキーはこのキーボードにありますか？';
}
