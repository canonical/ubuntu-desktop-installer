


import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => '終了';

  @override
  String get finishButton => '完了';

  @override
  String get saveButton => '保存';

  @override
  String get setupButton => 'セットアップ';

  @override
  String get selectLanguageTitle => 'あなたが使う言語を選んでください';

  @override
  String get profileSetupTitle => 'プロファイルの設定';

  @override
  String get profileSetupHeader => 'デフォルトの UNIX ユーザーアカウントを作成してください。詳細は、<a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a> をご覧ください';

  @override
  String get profileSetupRealnameLabel => 'あなたの名前';

  @override
  String get profileSetupRealnameRequired => '名前が必要です';

  @override
  String get profileSetupUsernameHint => 'ユーザー名を決めてください';

  @override
  String get profileSetupUsernameHelper => 'ユーザー名は、Windows のユーザー名と同じである必要はありません。';

  @override
  String get profileSetupPasswordHint => 'パスワードを決めて下さい';

  @override
  String get profileSetupConfirmPasswordHint => 'パスワードをもう一度入力';

  @override
  String get profileSetupShowAdvancedOptions => '次のページに詳細設定を表示';

  @override
  String get profileSetupPasswordMismatch => 'パスワードが一致しません';

  @override
  String get profileSetupUsernameRequired => 'ユーザー名が必要です';

  @override
  String get profileSetupUsernameInvalid => 'ユーザー名が無効です';

  @override
  String get profileSetupUsernameInUse => 'That user name already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'パスワードが必要です';

  @override
  String get advancedSetupTitle => '詳細設定';

  @override
  String get advancedSetupHeader => 'このページでは、Ubuntu WSL を必要に応じて細かく設定できます。';

  @override
  String get advancedSetupMountLocationHint => 'マウントする場所';

  @override
  String get advancedSetupMountLocationHelper => '自動マウントの場所';

  @override
  String get advancedSetupMountLocationInvalid => '場所が無効です';

  @override
  String get advancedSetupMountOptionHint => 'マウントオプション';

  @override
  String get advancedSetupMountOptionHelper => '自動マウントする際のマウントオプション';

  @override
  String get advancedSetupHostGenerationTitle => 'ホスト生成を有効にする';

  @override
  String get advancedSetupHostGenerationSubtitle => '有効にすると、起動するたびに /etc/hosts が再生成されます。';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'resolv.conf の生成を有効にする';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => '有効にすると、起動するたびに /etc/resolv.conf が再生成されます。';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI 統合';

  @override
  String get advancedSetupGUIIntegrationSubtitle => '有効にすると、自動的に DISPLAY 変数環境をセットアップします。サードパーティの X サーバーが必要です。';

  @override
  String get configurationUITitle => 'Ubuntu WSL の設定 - 詳細設定';

  @override
  String get configurationUIInteroperabilityHeader => '相互運用性';

  @override
  String get configurationUIInteroperabilityTitle => '有効';

  @override
  String get configurationUIInteroperabilitySubtitle => '相互運用性が有効になっているかどうか。';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Windows パスを追加';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Windows パスを WSL の PATH 環境変数に追加するかどうか';

  @override
  String get configurationUIAutoMountHeader => '自動マウント';

  @override
  String get configurationUIAutoMountTitle => '有効';

  @override
  String get configurationUIAutoMountSubtitle => '自動マウント機能が有効になっているかどうか。この機能により、Windows ドライブを WSL にマウントできます。';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab をマウント';

  @override
  String get configurationUIMountFstabSubtitle => '/et/fstab をマウントするかどうか。構成ファイル、/etc/fstab には ??? が含まれています';

  @override
  String get configurationUISystemdHeader => '試験的 - Systemd';

  @override
  String get configurationUISystemdTitle => '有効';

  @override
  String get configurationUISystemdSubtitle => 'systemd を起動時にアクティブ化する必要があるかどうか。注意: これは試験的な機能です。';

  @override
  String get applyingChanges => '変更を適用しています...';

  @override
  String get applyingChangesDisclaimer => 'インターネットの接続状態によっては、数分かかる場合があります。';

  @override
  String get setupCompleteTitle => 'セットアップが完了しました';

  @override
  String setupCompleteHeader(Object user) {
    return 'こんにちは、$userさん。\nセットアップは正常に完了しました。';
  }

  @override
  String get setupCompleteUpdate => '次のコマンドを実行して、Ubuntu を最新バージョンに更新することをお勧めします。';

  @override
  String get setupCompleteRestart => '* すべての設定は Ubuntu を再起動した後に有効になります。';
}
