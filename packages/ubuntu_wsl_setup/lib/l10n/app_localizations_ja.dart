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
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

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
  String get profileSetupUsernameInUse => 'そのユーザー名は既に存在します。';

  @override
  String get profileSetupUsernameSystemReserved => 'その名前はシステムに予約されています。';

  @override
  String get profileSetupUsernameTooLong => 'その名前は長すぎます。';

  @override
  String get profileSetupUsernameInvalidChars => 'その名前は使用不可能な文字が含まれています。';

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
  String get configurationUIMountFstabSubtitle => '/etc/fstab をマウントするかどうか。このファイルにはファイルシステムのマウントに関する情報が含まれています。';

  @override
  String get configurationUISystemdHeader => '試験的 - Systemd';

  @override
  String get configurationUISystemdTitle => '有効';

  @override
  String get configurationUISystemdSubtitle => 'systemd を起動時にアクティブ化する必要があるかどうか。注意: これは試験的な機能です。';

  @override
  String get applyingChanges => '変更を適用しています…';

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

  @override
  String get installationSlidesWelcome => 'Ubuntu WSLへようこそ';

  @override
  String get installationSlidesInitializing => '初期化中…';

  @override
  String get installationSlidesUnpacking => 'ディストロを解凍しています';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'ディストロを実行しています…';

  @override
  String get installationSlidesErrorMsg => '何かの問題が発生しました。';

  @override
  String get installationSlidesErrorTitle => '何かの問題が発生しました';

  @override
  String get installationSlidesErrorSub => 'これらのコマンドでWSLを再起動させてからもう一度試してください：\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\n回復不可能なエラーが発生しました。\n\nアプリケーションを閉じて、パワーシェルかコマンドプロンプトでこれらのコマンドを実行してください：\n';

  @override
  String get installationSlidesDone => '全て終わりました。Ubuntu WSLをご使用いただけます';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'もうすぐ終わります';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'キャンセル';

  @override
  String get installationSlidesUbuntuOnWsl => 'WSLにUbuntu';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'ウェブ開発に\nUbuntu WLS';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'データサイエンスにUbuntu WSL';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
