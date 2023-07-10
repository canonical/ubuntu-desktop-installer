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

  @override
  String get themePageTitle => 'テーマを選択してください。';

  @override
  String get themePageHeader => 'これは、外観設定でいつでも変更できます。';

  @override
  String get themeDark => '暗い';

  @override
  String get themeLight => '明るい';

  @override
  String localePageTitle(Object DISTRO) {
    return '$DISTROへ、ようこそ。';
  }

  @override
  String get localeHeader => '使用する言語を選択してください。';
}
