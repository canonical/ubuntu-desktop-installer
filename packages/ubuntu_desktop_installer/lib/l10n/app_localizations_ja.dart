


import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Ubuntuデスクトップインストーラー';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE をインストール';
  }

  @override
  String get cancelButtonText => 'キャンセル';

  @override
  String get changeButtonText => '変更';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'No';

  @override
  String get restartButtonText => '再起動';

  @override
  String get revertButtonText => '元に戻す';

  @override
  String get yesButtonText => 'はい';

  @override
  String get welcome => 'ようこそ';

  @override
  String get welcomeHeader => '言語の選択:';

  @override
  String get tryOrInstallPageTitle => '試すまたはインストール';

  @override
  String get repairInstallation => 'インストールの修復';

  @override
  String get repairInstallationDescription => '修復は設定や文書はそのままにしてすべてのソフトウェアを再インストールします。';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE を試す';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'このPCには何の変変更も加えずに $RELEASE を試します。';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE をインストール';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '現在のOSと並行して（または代わりに） $RELEASE をインストールします。多少時間がかかります。';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'お望みならば <a href=\"$url\">リリースノート</a>をご覧ください。';
  }

  @override
  String get turnOffRST => 'RSTを無効にする';

  @override
  String get turnOffRSTDescription => 'このコンピューターはIntel RST（ラピッド・ストレージ・テクノロジー）を使用しています。Ubuntuをインストールする前にWindowsでRSTを無効にする必要があります。';

  @override
  String instructionsForRST(Object url) {
    return '<a href=\"https://$url\">$url</a> をスマートフォンや他のデバイスで開いて操作方法を確認してください';
  }

  @override
  String get keyboardLayoutPageTitle => 'キーボードレイアウト';

  @override
  String get chooseYourKeyboardLayout => 'キーボードレイアウトの選択:';

  @override
  String get typeToTest => 'キーボード入力をここで試してください';

  @override
  String get detectLayout => 'キーボードレイアウトを検出';

  @override
  String get pressOneKey => '以下のキーのうち1つを押してください:';

  @override
  String get isKeyPresent => '以下のキーはこのキーボードにありますか？';

  @override
  String get configureSecureBootTitle => 'セキュアブートを設定';

  @override
  String get configureSecureBootDescription => 'サードパーティのドライバーソフトウェアのインストールを選択しました。セキュアブートの無効化が必要です。\nここでセキュリティキーを設定した上で、システム再起動時にそのキーを入力してください。';

  @override
  String get configureSecureBootOption => 'セキュアブートを設定';

  @override
  String get chooseSecurityKey => 'セキュリティキーを選択';

  @override
  String get confirmSecurityKey => 'セキュリティキーを確認';

  @override
  String get dontInstallDriverSoftwareNow => '今はドライバーソフトウェアをインストールしない';

  @override
  String get dontInstallDriverSoftwareNowDescription => '「ソフトウェアとアップデート」を使用し、あとからインストーロできます。';

  @override
  String get configureSecureBootSecurityKeyRequired => 'セキュリティキーが必要です';

  @override
  String get secureBootSecurityKeysDontMatch => 'セキュリティキーが一致しません';

  @override
  String get connectToInternetPageTitle => 'インターネットに接続';

  @override
  String get connectToInternetDescription => 'このコンピューターをインターネットに接続すると、必要な追加ソフトウェアのインストールとタイムゾーン選択の手助けになります。\n\nイーサネットケーブルを接続するか、Wi-Fiネットワークを選択してください';

  @override
  String get useWiredConnection => '有線接続を使用';

  @override
  String get noWiredConnection => '有線接続されていません';

  @override
  String get wiredDisabled => '有線接続がオフになっています';

  @override
  String get wiredMustBeEnabled => 'このコンピューターでイーサネットを使用するには、有線接続を有効にする必要があります';

  @override
  String get enableWired => '有線接続有効';

  @override
  String get selectWifiNetwork => 'Wi-Fiネットワークに接続';

  @override
  String get hiddenWifiNetwork => '隠しWi-Fiネットワークに接続';

  @override
  String get hiddenWifiNetworkNameLabel => 'ネットワーク名';

  @override
  String get hiddenWifiNetworkNameRequired => 'ネットワーク名が必要です';

  @override
  String get noInternet => '今すぐにはインターネットに接続しない';

  @override
  String get wirelessNetworkingDisabled => '無線ネットワークが無効';

  @override
  String get noWifiDevicesDetected => 'Wi-Fiデバイスが見つかりません';

  @override
  String get wifiMustBeEnabled => 'このコンピューターでWi-Fiを使用するには。無線ネットワークを有効にする必要があります';

  @override
  String get enableWifi => 'Wi-Fiが有効';

  @override
  String get connectButtonText => '接続';

  @override
  String get updatesOtherSoftwarePageTitle => 'アップデートと追加のソフトウェア';

  @override
  String get updatesOtherSoftwarePageDescription => 'どのアプリを開始時に使用しますか？';

  @override
  String get normalInstallationTitle => '通常のインストール';

  @override
  String get normalInstallationSubtitle => 'Webブラウザー、ユーティリティ、オフィスソフトウェア、ゲームとメディアプレイヤー。';

  @override
  String get minimalInstallationTitle => '最小インストール';

  @override
  String get minimalInstallationSubtitle => 'Webブラウザーと基本のユーティリティ。';

  @override
  String get otherOptions => 'その他のオプション';

  @override
  String get installThirdPartyTitle => 'グラフィックスとWi-Fiハードウェアと追加メディアフォーマットのサードパーティ製ソフトウェアをインストールする';

  @override
  String get installThirdPartySubtitle => 'このソフトウェアはそのドキュメントに含まれるライセンス規約に基づきます。いくつかはプロプライエタリです。';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">警告</font> このコンピューターは電源に接続されていません。';
  }

  @override
  String get chooseSecurityKeyTitle => 'セキュリティキーを選択';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'ディスク暗号化はあなたがコンピュータを紛失した際、あなたのファイルを守ります。コンピュータを起動するたびにセキュリティキーを入力する必要があります。\n\n${RELEASE} 以外のファイルはどれも暗号化されません。';
  }

  @override
  String get chooseSecurityKeyHint => 'セキュリティキーを選択';

  @override
  String get chooseSecurityKeyConfirmHint => 'セキュリティキーを確認';

  @override
  String get chooseSecurityKeyRequired => 'セキュリティキーが必要です';

  @override
  String get chooseSecurityKeyMismatch => 'セキュリティキーが一致しません';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">警告</font> このセキュリティキーを紛失するとすべてのデータが失われます。必要に応じてキーを書き留めておき、他の安全な場所で保管してください。';
  }

  @override
  String get installationTypeTitle => 'インストールの種類';

  @override
  String installationTypeOSDetected(Object os) {
    return 'コンピューターには $os がインストールされています。どのようにしますか？';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'コンピューターには $os1 と $os2 がインストールされています。どのようにしますか？';
  }

  @override
  String get installationTypeMultiOSDetected => 'コンピューターには複数のOSがインストールされています。どのようにしますか？';

  @override
  String get installationTypeNoOSDetected => 'コンピューターにインストールされたOSは見つかりませんでした。どのようにしますか？';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'ディスクを削除して$DISTROをインストール';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">警告</font> これにより、すべてのOS上にあるプログラム、ドキュメント、写真、音楽、その他のファイルはすべて削除されます。';
  }

  @override
  String get installationTypeAdvancedLabel => '高度な機能...';

  @override
  String get installationTypeAdvancedTitle => '高度な機能';

  @override
  String get installationTypeNone => 'なし';

  @override
  String get installationTypeNoneSelected => '何も選択していません';

  @override
  String installationTypeLVM(Object RELEASE) {
    return '新しい $RELEASE のインストールにLVMを使用する';
  }

  @override
  String get installationTypeLVMSelected => 'LVMを選択しました';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return '安全のため新しい$RELEASEのインストールを暗号化する';
  }

  @override
  String get installationTypeEncryptInfo => 'セキュリティキーは次のステップで選択します。';

  @override
  String get installationTypeZFS => '実験的: ディスクを消去してZFSを使用する';

  @override
  String get installationTypeZFSSelected => 'ZFSを選択しました';

  @override
  String installationTypeReinstall(Object os) {
    return '$os を削除して再インストール';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">警告</font> これにより、$os 上にあるプログラム、ドキュメント、写真、音楽、その他のファイルはすべて削除されます。';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product を $os とは別にインストール';
  }

  @override
  String get installationTypeAlongsideInfo => 'ドキュメント、音楽、その他の個人ファイルは残されます。コンピュータを起動する際に、どのOSで起動するか選択できます。';

  @override
  String get installationTypeManual => 'それ以外';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return '$DISTRO 向けに、自分でパーティションの作成やサイズ変更を行ったり、複数のパーティションを選択することもできます';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'ディスクを削除して$DISTROをインストール';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'ドライブの選択:';

  @override
  String get selectGuidedStorageInfoLabel => 'ディスク全体を使用する:';

  @override
  String get selectGuidedStorageInstallNow => 'インストール';

  @override
  String get allocateDiskSpace => 'ディスク領域を割り当て';

  @override
  String get startInstallingButtonText => 'インストールの開始';

  @override
  String get diskHeadersDevice => 'デバイス';

  @override
  String get diskHeadersType => 'タイプ';

  @override
  String get diskHeadersMountPoint => 'マウントポイント';

  @override
  String get diskHeadersSize => 'サイズ';

  @override
  String get diskHeadersUsed => '使用済み';

  @override
  String get diskHeadersSystem => 'システム';

  @override
  String get diskHeadersFormat => 'フォーマット';

  @override
  String get freeDiskSpace => '空き領域';

  @override
  String get newPartitionTable => '新しいパーティションテーブル';

  @override
  String get newPartitionTableConfirmationTitle => 'このデバイスに新しい空のパーティションテーブルを作成しますか？';

  @override
  String get newPartitionTableConfirmationMessage => 'ドライブ全部のパーティションを選択しています。このデバイスに新しいパーティションテーブルを作成することになり、現在のパーティションはすべて削除されます。\n\nこの操作はあとからやり直すことはできません。';

  @override
  String get bootLoaderDevice => 'ブートローダーをインストールするデバイス';

  @override
  String get partitionCreateTitle => 'パーティションを作成';

  @override
  String get partitionEditTitle => 'パーティションを編集';

  @override
  String get partitionSizeLabel => 'サイズ:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => '新しいパーティションのタイプ:';

  @override
  String get partitionTypePrimary => '基本パーティション';

  @override
  String get partitionTypeLogical => '論理パーティション';

  @override
  String get partitionLocationLabel => '新しいパーティションの場所:';

  @override
  String get partitionLocationBeginning => 'この領域の始点';

  @override
  String get partitionLocationEnd => 'この領域の終点';

  @override
  String get partitionFormatLabel => '次を使用:';

  @override
  String get partitionFormatExt4 => 'Ext4 ジャーナリングファイルシステム';

  @override
  String get partitionFormatExt3 => 'Ext3 ジャーナリングファイルシステム';

  @override
  String get partitionFormatExt2 => 'Ext2 ファイルシステム';

  @override
  String get partitionFormatBtrfs => 'btrfs ジャーナリングファイルシステム';

  @override
  String get partitionFormatJfs => 'JFS ジャーナリングファイルシステム';

  @override
  String get partitionFormatXfs => 'XFS ジャーナリングファイルシステム';

  @override
  String get partitionFormatFat => 'FAT ファイルシステム';

  @override
  String get partitionFormatFat12 => 'FAT12 ファイルシステム';

  @override
  String get partitionFormatFat16 => 'FAT16 ファイルシステム';

  @override
  String get partitionFormatFat32 => 'FAT32 ファイルシステム';

  @override
  String get partitionFormatSwap => 'スワップ領域';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 ファイルシステム';

  @override
  String get partitionFormatVfat => 'VFAT ファイルシステム';

  @override
  String get partitionFormatNtfs => 'NTFS ファイルシステム';

  @override
  String get partitionFormatReiserFS => 'ReiserFS ファイルシステム';

  @override
  String get partitionFormatZfsroot => 'ZFS ルートファイルシステム';

  @override
  String get partitionErase => 'パーティションをフォーマット';

  @override
  String get partitionMountPointLabel => 'マウントポイント:';

  @override
  String get whoAreYouPageTitle => 'あなたの情報を入力してください';

  @override
  String get whoAreYouPageAutoLogin => '自動的にログインする';

  @override
  String get whoAreYouPageRequirePassword => 'ログイン時にパスワードを要求する';

  @override
  String get whoAreYouPageRealNameLabel => 'あなたの名前';

  @override
  String get whoAreYouPageRealNameRequired => '名前を入力してください';

  @override
  String get whoAreYouPageComputerNameLabel => 'コンピューターの名前';

  @override
  String get whoAreYouPageComputerNameInfo => '他のコンピューターと通信するときに使用する名前です。';

  @override
  String get whoAreYouPageComputerNameRequired => 'コンピューターの名前を入力してください';

  @override
  String get whoAreYouPageInvalidComputerName => 'このコンピューターの名前は使用できません';

  @override
  String get whoAreYouPageUsernameLabel => 'ユーザー名を入力';

  @override
  String get whoAreYouPageUsernameRequired => 'ユーザー名を入力してください';

  @override
  String get whoAreYouPageInvalidUsername => 'このユーザー名は使用できません';

  @override
  String get whoAreYouPagePasswordLabel => 'パスワードを入力';

  @override
  String get whoAreYouPagePasswordRequired => 'パスワードを入力してください';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'パスワードを確認';

  @override
  String get whoAreYouPagePasswordMismatch => 'パスワードが一致しません';

  @override
  String get whoAreYouPageShowPassword => 'パスワードを表示';

  @override
  String get writeChangesToDisk => 'ディスクに変更を書き込む';

  @override
  String get writeChangesFallbackSerial => 'ディスク';

  @override
  String get writeChangesDescription => '続けると下記の変更をディスクに書き込みます。追加の変更も手動で行なえます。';

  @override
  String get writeChangesPartitionTablesHeader => '次のデバイスのパーティションテーブルを変更:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => '次のパーティションをフォーマット:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'パーティション: #$disk${partition}, 種類: $format, 使用: $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'パーティション: #$disk${partition}, 種類: $format';
  }

  @override
  String get chooseYourLookPageTitle => '見た目を変更';

  @override
  String get chooseYourLookPageHeader => 'あとからでも外観の設定で変更できます。';

  @override
  String get chooseYourLookPageDarkSetting => '暗い';

  @override
  String get chooseYourLookPageLightSetting => '明るい';

  @override
  String get chooseYourLookPageLightBodyText => 'すべてが明るい';

  @override
  String get chooseYourLookPageDarkBodyText => '暗闇よこんにちは';

  @override
  String get installationCompleteTitle => 'インストールが完了しました';

  @override
  String readyToUse(Object system) {
    return '**$system** のインストールは完了し、使用する準備が整いました。';
  }

  @override
  String restartInto(Object system) {
    return '再起動して $system を使用';
  }

  @override
  String get shutdown => 'シャットダウン';

  @override
  String get turnOffBitlockerTitle => 'BitLockerをオフ';

  @override
  String get turnOffBitlockerDescription => 'このコンピューターはWindows BitLocker暗号化を使用しています。\nUbuntuをインストールする前にWindowsでBitLockerを無効にしてください。';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '<a href=\"https://$url\">$url</a> をスマートフォンや他のデバイスで開いて操作方法を確認してください';
  }

  @override
  String get restartIntoWindows => '再起動してWindowsを使用';

  @override
  String get whereAreYouPageTitle => 'どこに住んでいますか？';

  @override
  String get whereAreYouLocationLabel => '現在地';

  @override
  String get whereAreYouTimezoneLabel => 'タイムゾーン';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'ようこそ $RELEASE へ';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return '高速で新機能が満載されている $RELEASE の最新バージョンでは、これまで以上に簡単にコンピューターが使用できます。今から紹介するのは気の利いた新機能のほんの一部です...';
  }

  @override
  String get softwareSlideTitle => '追加のソフトウェアを見つけましょう';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return '新しいソフトウェアをWebで探すのにさよならしましょう。Snap Storeや $RELEASE ソフトウェアアーカイブにアクセスすることで簡単に新しいアプリを見つけてインストールすることができます。探したいものをタイプするだけ、あるいは、グラフィックと写真、ゲームと生産性向上アプリといったカテゴリを探すだけで、他のユーザーの便利なレビューも見られます。';
  }

  @override
  String get musicSlideTitle => '音楽を持ち歩こう';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE に素晴らしいRhythmboxミュージックプレイヤーがやってきました。進化した再生オプションは、簡単に理想的な音楽を追加することができます。そしてCDやポータブルミュージックプレイヤーと連携し、あなたがどこにいてもすべての音楽を楽しむことができます。';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmboxミュージックプレイヤー';

  @override
  String get musicSlideSpotify => '';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => '写真を楽しもう';

  @override
  String get photoSlideDescription => 'Shotwellはあなたのガジェット向けに用意されたお手軽な写真管理ソフトウェアです。カメラや携帯電話を接続して写真を転送すれば、簡単に写真を共有したり安全に安全に保管したりできます。クリエイティブな気分な方は、その他多くの写真アプリをUbuntu Softwareで見つけることができます。';

  @override
  String get photoSlideShotwell => 'Shotwell写真管理ツール';

  @override
  String get photoSlideGimp => 'GIMP画像エディター';

  @override
  String get photoSlideShotcut => 'Shotcutビデオエディター';

  @override
  String get webSlideTitle => 'ウェブを最大限に活用';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE には、世界中の多くの人々に使われているウェブブラウザーであるFirefoxが含まれています。また、頻繁に使用するウェブアプリケーション(例えばFacebookやGmailのような)は、ちょうどコンピューター上のアプリケーションのように、より素早くアクセスするためにデスクトップに留めておくことができます。';
  }

  @override
  String get webSlideFirefox => 'Firefoxウェブブラウザー';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'オフィスに必要なものをすべてあなたに';

  @override
  String get officeSlideDescription => 'LibreOfficeはフリーのオフィススイートで、ドキュメント、表計算、プレゼンテーションの作成に必要なものをすべて備えています。Microsoft Officeのファイル形式と互換性を持ち、必要な機能をすべて無料で使用できます。';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'すべての人へ';

  @override
  String accessSlideDescription(Object RELEASE) {
    return '$RELEASE の哲学の中心となっているのは、「あらゆる人のためのコンピューター」という信念です。高度なアクセシビリティツールや、言語・カラースキーム・テキストサイズの変更といったオプションにより、$RELEASE はあらゆる人に寄り添います。あなたが誰であっても、どこにいようとも。';
  }

  @override
  String get accessSlideCustomizationOptions => 'カスタマイズの選択肢';

  @override
  String get accessSlideAppearance => '外観';

  @override
  String get accessSlideAssistiveTechnologies => '支援技術';

  @override
  String get accessSlideLanguageSupport => '言語サポート';

  @override
  String get supportSlideTitle => 'ヘルプとサポート';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return '公式のドキュメントには $RELEASE に関する多くの情報が記載されています。<a href=\"https://help.ubuntu.com\">インターネット</a>とDock上のヘルプアイコンの両方から閲覧可能です。';
  }

  @override
  String get supportSlideQuestions => '<a href=\"https://askubuntu.com\">Ask Ubuntu</a>では、あなたが質問をしたり、回答済みの素晴らしいコレクションを検索できます。あなた自身の言語によるサポートは、<a href=\"https://loco.ubuntu.com/teams\">ローカルコミュニティチーム</a>によって提供されているでしょう。';

  @override
  String get supportSlideResources => 'その他の便利なリソースへのポインターは<a href=\"https://www.ubuntu.com/support/community-support\">コミュニティサポート</a>や<a href=\"https://www.ubuntu.com/support\">商用サポート</a>を訪れてください。';

  @override
  String get includedSoftware => '含まれるソフトウェア';

  @override
  String get availableSoftware => '利用可能なソフトウェア';

  @override
  String get supportedSoftware => 'サポートされるソフトウェア';

  @override
  String get ubuntuProPageTitle => 'Enable Ubuntu Pro';

  @override
  String get ubuntuProPageDescription => 'Ubuntu Pro subscription gives you access to multiple security & compliance features such as Kernel Livepatch and security updates for over 30,000 deb packages, <strong>free for personal use on up to 3 machines</strong>.';

  @override
  String get ubuntuProPageMoreInformation => 'More information on <a href=\"https://ubuntu.com/pro\">ubuntu.com/pro</a>';

  @override
  String get ubuntuProInstructions => 'To enable Ubuntu Pro, add your token or skip this step.';

  @override
  String get ubuntuProEnable => 'Enable Ubuntu Pro';

  @override
  String get ubuntuProTokenHint => 'Your token';

  @override
  String get ubuntuProTokenRequired => 'A token is required';

  @override
  String get ubuntuProTokenValid => 'Valid token';

  @override
  String get ubuntuProTokenInvalid => 'Invalid token';

  @override
  String get ubuntuProTokenVerifying => 'Verifying token';

  @override
  String get ubuntuProTokenLabel => 'You can go to ubuntu.com/pro to retrieve your token or register a new one.';

  @override
  String get ubuntuProSkip => 'Skip Ubuntu Pro setup for now';

  @override
  String get ubuntuProSkipLabel => 'You can always enable Ubuntu Pro later via Settings or the `ua attach` command.';

  @override
  String get ubuntuProAttach => 'Attach';
}
