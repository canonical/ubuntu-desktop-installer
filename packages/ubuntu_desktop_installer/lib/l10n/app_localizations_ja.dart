import 'app_localizations.dart';

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Ubuntu デスクトップインストーラー';

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
  String get noButtonText => 'いいえ';

  @override
  String get restartButtonText => '再起動';

  @override
  String get revertButtonText => '元に戻す';

  @override
  String get yesButtonText => 'はい';

  @override
  String get quitButtonText => 'インストールを終了';

  @override
  String get welcome => 'ようこそ';

  @override
  String get welcomeHeader => '使用する言語を選択してください:';

  @override
  String get tryOrInstallPageTitle => '試してみるか、インストールします';

  @override
  String get repairInstallation => '修復インストール';

  @override
  String get repairInstallationDescription => '修復すると、ドキュメントや設定はそのままにして、インストールされているすべてのソフトウェアを再インストールします。';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE を試してみる';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'コンピュータに何の変更も加えることなく、$RELEASE を試すことができます。';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE をインストール';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '現在の OS と一緒に (または代わりに) $RELEASE をインストールします。これはあまり時間がかからないはずです。';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '<a href=\"$url\">リリースノート</a> もご覧いただくとよいかもしれません。';
  }

  @override
  String get turnOffRST => 'RST をオフにして下さい';

  @override
  String get turnOffRSTDescription => 'このコンピューターは Intel RST (Rapid Storage Technology) を使用しています。Ubuntu をインストールする前に Windows で RST を無効にする必要があります。';

  @override
  String instructionsForRST(Object url) {
    return '手順は、スマートフォンなどで <a href=\"https://$url\">$url</a> をご確認ください。';
  }

  @override
  String get keyboardLayoutPageTitle => 'キーボードレイアウト';

  @override
  String get chooseYourKeyboardLayout => 'キーボードレイアウトを選択してください:';

  @override
  String get typeToTest => 'ここに入力して、キーボードをテストできます';

  @override
  String get detectLayout => 'キーボードレイアウトを検出する';

  @override
  String get pressOneKey => '以下のキーのうち 1 つを押してください:';

  @override
  String get isKeyPresent => '以下のキーはこのキーボードにありますか？';

  @override
  String get configureSecureBootTitle => 'セキュアブートの設定';

  @override
  String get configureSecureBootDescription => 'サードパーティのドライバーソフトウェアのインストールを選択しました。セキュアブートの無効化が必要です。\nここでセキュリティキーを設定し、システム再起動時にそのキーを入力してください。';

  @override
  String get configureSecureBootOption => 'セキュアブートを設定';

  @override
  String get chooseSecurityKey => 'セキュリティキーを決めて下さい';

  @override
  String get confirmSecurityKey => 'セキュリティキーをもう一度入力';

  @override
  String get dontInstallDriverSoftwareNow => '今はドライバーソフトウェアをインストールしない';

  @override
  String get dontInstallDriverSoftwareNowDescription => '「ソフトウェアとアップデート」で後でインストールできます。';

  @override
  String get configureSecureBootSecurityKeyRequired => 'セキュリティキーが必要です';

  @override
  String get secureBootSecurityKeysDontMatch => 'セキュリティキーが一致しません';

  @override
  String get showSecurityKey => 'セキュリティキーを表示します';

  @override
  String get connectToInternetPageTitle => 'インターネットに接続';

  @override
  String get connectToInternetDescription => 'このコンピューターをインターネットに接続すると、必要な追加ソフトウェアのインストールし、タイムゾーンを選択するのを手助けします。\n\nイーサネットケーブルを接続するか、Wi-Fi ネットワークを選択してください';

  @override
  String get useWiredConnection => '有線接続を使用';

  @override
  String get noWiredConnection => '有線接続が見つかりません';

  @override
  String get wiredDisabled => '有線接続がオフになっています';

  @override
  String get wiredMustBeEnabled => 'このコンピューターでイーサネットを使用するには、有線接続を有効にする必要があります';

  @override
  String get enableWired => '有線接続を有効にする';

  @override
  String get selectWifiNetwork => 'Wi-Fi ネットワークに接続する';

  @override
  String get hiddenWifiNetwork => '非表示の Wi-Fi ネットワークに接続する';

  @override
  String get hiddenWifiNetworkNameLabel => 'ネットワーク名';

  @override
  String get hiddenWifiNetworkNameRequired => 'ネットワーク名が必要です';

  @override
  String get noInternet => '今はインターネットに接続しない';

  @override
  String get wirelessNetworkingDisabled => '無線ネットワークが無効になっています';

  @override
  String get noWifiDevicesDetected => 'Wi-Fi デバイスが見つかりません';

  @override
  String get wifiMustBeEnabled => 'このコンピューターで Wi-Fi を使用するには。無線ネットワークを有効にする必要があります';

  @override
  String get enableWifi => 'Wi-Fi を有効にする';

  @override
  String get connectButtonText => '接続';

  @override
  String get updatesOtherSoftwarePageTitle => 'アップデートとその他のソフトウェア';

  @override
  String get updatesOtherSoftwarePageDescription => 'あらかじめいくつかのアプリケーションをインストールします。選択してください:';

  @override
  String get normalInstallationTitle => 'おすすめのアプリもインストールする';

  @override
  String get normalInstallationSubtitle => 'Webブラウザ、ユーティリティ、オフィスソフトウェア、ゲーム、メディアプレイヤー。';

  @override
  String get minimalInstallationTitle => '最小限のアプリだけをインストールする';

  @override
  String get minimalInstallationSubtitle => 'Webブラウザと基本的なユーティリティ。';

  @override
  String get otherOptions => 'その他のオプション';

  @override
  String get installThirdPartyTitle => 'グラフィックスや Wi-Fi 機器のためのサードパーティ製ソフトウェア、および追加メディアフォーマットをインストールする';

  @override
  String get installThirdPartySubtitle => 'このソフトウェアの使用には、それぞれのドキュメントに記載されているライセンス規約が適用されます。一部のソフトウェアはプロプライエタリです。';

  @override
  String get installDriversTitle => 'グラフィックスとWi-Fi 機器用のサードパーティ製ソフトウェアをインストールする';

  @override
  String get installDriversSubtitle => 'これらのドライバーは自身のドキュメントに含まれるライセンス条項に従い、プロプライエタリです。';

  @override
  String get installCodecsTitle => '追加のメディアフォーマット用のサポートをインストールする';

  @override
  String get installCodecsSubtitle => 'このソフトウェアはそのドキュメントに含まれるライセンス条項に従います。いくつかはプロプライエタリです。';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">警告</font>: このコンピューターは電源に接続されていません。';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'セキュリティキーを決めて下さい';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'ディスク暗号化はあなたがコンピュータを紛失した際、あなたのファイルを守ります。コンピュータを起動するたびにセキュリティキーを入力する必要があります。\n\n$RELEASE 以外のファイルはどれも暗号化されません。';
  }

  @override
  String get chooseSecurityKeyHint => 'セキュリティキーを決めて下さい';

  @override
  String get chooseSecurityKeyConfirmHint => 'セキュリティキーをもう一度入力';

  @override
  String get chooseSecurityKeyRequired => 'セキュリティキーが必要です';

  @override
  String get chooseSecurityKeyMismatch => 'セキュリティキーが一致しません';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">注意</font> このセキュリティキーを紛失すると、すべてのデータが失われます。必要に応じて、キーを書き留めておき、他の安全な場所に保管してください。';
  }

  @override
  String get installationTypeTitle => 'インストール方法を選択';

  @override
  String installationTypeOSDetected(Object os) {
    return 'コンピューターには $os がインストールされています。インストール方法を選択してください。';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'コンピューターには $os1 と $os2 がインストールされています。インストール方法を選択してください。';
  }

  @override
  String get installationTypeMultiOSDetected => 'コンピューターには複数の OS がインストールされています。インストール方法を選択してください。';

  @override
  String get installationTypeNoOSDetected => 'コンピューターにインストールされた OS は見つかりませんでした。インストール方法を選択してください。';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'ディスクを削除して $DISTRO をインストールする';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">警告</font> これにより、すべての OS 上にある、プログラム、ドキュメント、写真、音楽、およびその他のファイルはすべて削除されます。';
  }

  @override
  String get installationTypeAdvancedLabel => '高度な機能...';

  @override
  String get installationTypeAdvancedTitle => '高度な機能';

  @override
  String get installationTypeNone => 'なし';

  @override
  String get installationTypeNoneSelected => '何も選択されていません';

  @override
  String installationTypeLVM(Object RELEASE) {
    return '新しい $RELEASE のインストールに LVM を使用する';
  }

  @override
  String get installationTypeLVMSelected => 'LVM を選択しました';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVMと暗号化を選択しました';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'セキュリティのためディスクを暗号化し、 $RELEASE をインストールする';
  }

  @override
  String get installationTypeEncryptInfo => 'セキュリティキーは次のステップで選択します。';

  @override
  String get installationTypeZFS => '試験的: ディスクを消去して ZFS を使用する';

  @override
  String get installationTypeZFSSelected => 'ZFS を選択しました';

  @override
  String installationTypeReinstall(Object os) {
    return '$os を削除して再インストール';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">警告</font> これにより、$os 上にあるプログラム、ドキュメント、写真、音楽、およびその他のファイルはすべて削除されます。';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product を $os と共存させる';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return '$os1と$os2と並んで$productをインストールする';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'それと並んで$productをインストールする';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return '$productを他のパーティションと並べてインストールする';
  }

  @override
  String get installationTypeAlongsideInfo => 'ファイルは削除されません。コンピュータを起動する際に、どのOSで起動するか選択できます。';

  @override
  String get installationTypeManual => 'それ以外';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return '自分で $DISTRO をインストールするパーティションの作成やサイズ変更を行ったり、インストールに複数のパーティションを選択することもできます';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'ディスクを削除して $DISTRO をインストール';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'ドライブを選択してください:';

  @override
  String get selectGuidedStorageInfoLabel => 'ディスク全体が使用されます:';

  @override
  String get selectGuidedStorageInstallNow => 'インストール';

  @override
  String get installAlongsideSpaceDivider => '境界をドラッグしてディスク領域を割り当てます:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$numの小さなパーティションは非表示になっています、<a href=\"$url\">高度なパーティションツール</a>で更に多くの機能を使ってください';
  }

  @override
  String get installAlongsideResizePartition => 'パーティションのサイズを変更する';

  @override
  String get installAlongsideAllocateSpace => 'ディスク領域の割り当て';

  @override
  String get installAlongsideFiles => 'ファイル';

  @override
  String get installAlongsidePartition => 'パーティション:';

  @override
  String get installAlongsideSize => 'サイズ:';

  @override
  String get installAlongsideAvailable => '利用可能:';

  @override
  String get allocateDiskSpace => 'ディスク領域の割り当て';

  @override
  String get startInstallingButtonText => 'インストールを開始する';

  @override
  String get diskHeadersDevice => 'デバイス';

  @override
  String get diskHeadersType => '種類';

  @override
  String get diskHeadersMountPoint => 'マウントポイント';

  @override
  String get diskHeadersSize => 'サイズ';

  @override
  String get diskHeadersUsed => '使用中';

  @override
  String get diskHeadersSystem => 'システム';

  @override
  String get diskHeadersFormat => 'フォーマット';

  @override
  String get freeDiskSpace => '空き領域';

  @override
  String get newPartitionTable => '新しいパーティションテーブルを作成する';

  @override
  String get newPartitionTableConfirmationTitle => 'このデバイスに新しい空のパーティションテーブルを作成しますか？';

  @override
  String get newPartitionTableConfirmationMessage => 'デバイス全体を新しいパーティションに使用するよう選択しました。デバイスで新しいパーティションテーブルの作成を続行すると、現在のすべてのパーティションが削除されます。\n\nなお、この操作は後で取り消すことができます。';

  @override
  String get tooManyPrimaryPartitions => '基本パーティションが多すぎます';

  @override
  String get partitionLimitReached => '制限に達しました';

  @override
  String get bootLoaderDevice => 'ブートローダーをインストールするデバイスを選択してください';

  @override
  String get partitionCreateTitle => 'パーティションを作成する';

  @override
  String get partitionEditTitle => 'パーティションを編集する';

  @override
  String get partitionSizeLabel => 'サイズ:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => '新しいパーティションの種類を選択してください:';

  @override
  String get partitionTypePrimary => '基本パーティション';

  @override
  String get partitionTypeLogical => '論理パーティション';

  @override
  String get partitionLocationLabel => '新しいパーティションの場所を選択してください:';

  @override
  String get partitionLocationBeginning => 'この領域の始点';

  @override
  String get partitionLocationEnd => 'この領域の終点';

  @override
  String get partitionFormatLabel => '使用方法:';

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
  String get partitionFormatNone => 'Leave unformatted';

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
  String get whoAreYouPageUsernameInUse => 'そのユーザー名は既に存在します。';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'その名前はシステムが使用するため、予約されています。';

  @override
  String get whoAreYouPageUsernameTooLong => 'その名前は長すぎます。';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'その名前には無効な文字が含まれています。';

  @override
  String get whoAreYouPagePasswordLabel => 'パスワードを決めて下さい';

  @override
  String get whoAreYouPagePasswordRequired => 'パスワードを入力してください';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'パスワードをもう一度入力';

  @override
  String get whoAreYouPagePasswordMismatch => 'パスワードが一致しません';

  @override
  String get whoAreYouPageShowPassword => 'パスワードを表示';

  @override
  String get writeChangesToDisk => 'ディスクに変更を書き込む';

  @override
  String get writeChangesFallbackSerial => 'ディスク';

  @override
  String get writeChangesDescription => '続行すると、以下の変更がディスクに書き込まれます。さらに手動で変更を加えることもできます。';

  @override
  String get writeChangesPartitionTablesHeader => '以下のデバイスのパーティションテーブルが変更されます:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => '以下のパーティション変更が適用されます:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'パーティション #$disk$partition のサイズが$oldsizeから$newsizeに変更されます。';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'パーティション #$disk$partition は $format としてフォーマットされ、$mount として使用されます。';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'パーティション #$disk$partition は $format としてフォーマットされます。';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'パーティション #$disk$partition は $mount として使用されます。';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'パーティション #$disk$partition が作成されました。';
  }

  @override
  String get chooseYourLookPageTitle => '外観の選択';

  @override
  String get chooseYourLookPageHeader => 'これは、外観設定でいつでも変更できます。';

  @override
  String get chooseYourLookPageDarkSetting => '暗い';

  @override
  String get chooseYourLookPageLightSetting => '明るい';

  @override
  String get installationCompleteTitle => 'インストールが完了しました';

  @override
  String readyToUse(Object system) {
    return '**$system** のインストールは完了し、使い始める準備が整いました。';
  }

  @override
  String restartInto(Object system) {
    return '再起動して $system を使い始める';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'このまま $RELEASE の試用を続けることもできますが、コンピューターを再起動するまでは、なにか変更を行ったり文書を保存してもデータは残りません。';
  }

  @override
  String get shutdown => 'シャットダウン';

  @override
  String get restartNow => '今すぐ再起動する';

  @override
  String get continueTesting => '試用を続ける';

  @override
  String get turnOffBitlockerTitle => 'BitLocker をオフにしてください';

  @override
  String get turnOffBitlockerDescription => 'このコンピューターは Windows BitLocker で暗号化されています。\nUbuntu をインストールする前に Windows で BitLocker をオフにしてください。';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '手順は、スマートフォンなどで <a href=\"https://$url\">$url</a> をご確認ください';
  }

  @override
  String get restartIntoWindows => '再起動して Windows を使用';

  @override
  String get whereAreYouPageTitle => 'あなたの大まかな現在地を選択してください';

  @override
  String get whereAreYouLocationLabel => '現在地';

  @override
  String get whereAreYouTimezoneLabel => 'タイムゾーン';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return '$RELEASEへ、ようこそ。';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return '高速で、新機能満載の最新版 $RELEASE では、これまで以上に簡単、使いやすくなりました。ここで紹介するのは、気の利いた新機能のほんの一部です…';
  }

  @override
  String get softwareSlideTitle => 'お気に入りのソフトウェアを見つけましょう';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return '新しいソフトウェアを Web で探すのにさよならしましょう。Snap Store や $RELEASE ソフトウェアアーカイブにアクセスすることで、簡単に、新しいアプリを見つけてインストールすることができます。探しているものを入力するだけ、あるいは、「グラフィックと写真」、「ゲーム」、「生産性向上アプリ」といったカテゴリを探すだけ。他のユーザーの便利なレビューも見られます。';
  }

  @override
  String get musicSlideTitle => '音楽を持ち歩こう';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE には Rhythmbox という素晴らしいミュージックプレーヤーが付属しています。進化した再生オプションでは、簡単に大好きな音楽を追加することができます。そしてCDやポータブルミュージックプレイヤーと連携し、あなたがどこにいてもお気に入りの音楽を楽しむことができます。';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox ミュージックプレイヤー';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => '写真を楽しもう';

  @override
  String get photoSlideDescription => 'Shotwell をご紹介しましょう。Shotwell は、便利な写真管理ツールです。カメラや携帯電話を接続して写真を転送すれば、簡単に写真を共有したり安全に保管したりできます。クリエイティブな気分なら、その他にも多くの写真アプリを Ubuntu Software で見つけることができます。';

  @override
  String get photoSlideShotwell => 'Shotwell 写真管理ツール';

  @override
  String get photoSlideGimp => 'GIMP 画像エディター';

  @override
  String get photoSlideShotcut => 'Shotcut ビデオエディター';

  @override
  String get webSlideTitle => 'ウェブを最大限に活用しよう';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE には、世界中の多くの人々に使われているウェブ ブラウザである、Firefox が付属しています。また、Facebook や Gmail のような頻繁に使用するウェブアプリケーションは、デスクトップにピン留めして、パソコン上のアプリケーションと同じように素早くアクセスすることができます。';
  }

  @override
  String get webSlideFirefox => 'Firefox ウェブ ブラウザー';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'オフィスに必要なもの、すべてあなたに';

  @override
  String get officeSlideDescription => 'LibreOffice は、ドキュメント、表計算、プレゼンテーションの作成に必要なもの、すべてを備えた自由ソフトのオフィススイートです。Microsoft Office のファイル形式と互換性を持ち、必要な機能をすべて使用できます。';

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
    return '$RELEASE の哲学の中心となっているのは、「あらゆる人のためのコンピューター」という信念です。高度なアクセシビリティツールや、言語・カラー・テキストサイズの変更といったオプションにより、$RELEASE はあらゆる人に寄り添います。あなたが誰であっても、どこにいようとも。';
  }

  @override
  String get accessSlideCustomizationOptions => 'カスタマイズオプション';

  @override
  String get accessSlideAppearance => '外観';

  @override
  String get accessSlideAssistiveTechnologies => '補助技術';

  @override
  String get accessSlideLanguageSupport => '言語サポート';

  @override
  String get supportSlideTitle => 'ヘルプとサポート';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return '公式ドキュメントには $RELEASE に多くの一般的な情報がされています。<a href=\"https://help.ubuntu.com\">インターネット</a>と Dock 上の「？(ヘルプアイコン)」の両方から閲覧できます。';
  }

  @override
  String get supportSlideQuestions => '<a href=\"https://askubuntu.com\">Ask Ubuntu</a> では、あなたが質問をしたり、回答済みの素晴らしい質問と答えを検索できます。\n日本語でのサポートは、<a href=\"http://www.ubuntulinux.jp/\">Ubuntu 日本 チーム</a> で提供されており、他の言語でのサポートは、<a href=\"https://loco.ubuntu.com/teams\">ローカルコミュニティチーム一覧</a> をご覧ください。';

  @override
  String get supportSlideResources => 'その他の役立つリソースへのポインタについては、<a href=\"https://www.ubuntu.com/support/community-support\">コミュニティサポート</a> や <a href=\"https://www.ubuntu.com/support\">商用サポート</a> をご覧ください。';

  @override
  String get includedSoftware => '含まれるソフトウェア';

  @override
  String get availableSoftware => '利用可能なソフトウェア';

  @override
  String get supportedSoftware => 'サポートされているソフトウェア';

  @override
  String get copyingFiles => 'ファイルをコピーしています…';

  @override
  String get installingSystem => 'システムをインストールしています…';

  @override
  String get configuringSystem => 'システムを設定しています…';

  @override
  String get installationFailed => 'インストールに失敗しました';

  @override
  String get notEnoughDiskSpaceTitle => '申し訳ありません';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return '$RELEASE をインストールするには、最低でも$SIZEのディスク容量が必要です。';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'このコンピュータは$SIZEしかありません。';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'このコンピューターに搭載されているディスクの中で、一番容量が大きいものは$SIZEです。';
  }
}
