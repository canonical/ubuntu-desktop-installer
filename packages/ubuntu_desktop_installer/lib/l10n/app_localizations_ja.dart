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
  String get changeButtonText => '変更';

  @override
  String get restartButtonText => '再起動';

  @override
  String get revertButtonText => '元に戻す';

  @override
  String get quitButtonText => 'インストールを終了';

  @override
  String welcomePageTitle(Object DISTRO) {
    return '$DISTROへ、ようこそ。';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return '$DISTROを準備しています…';
  }

  @override
  String get welcomeHeader => '使用する言語を選択してください。';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return '$DISTROを試してみるか、インストールします';
  }

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
  String get turnOffRST => 'RSTが有効になっています。';

  @override
  String get turnOffRSTTitle => '続行するにはRSTをオフにしてください。';

  @override
  String get turnOffRSTDescription => 'このコンピューターは Intel RST (Rapid Storage Technology) を使用しています。Ubuntu をインストールする前に Windows で RST を無効にする必要があります。';

  @override
  String instructionsForRST(Object url) {
    return '手順は、別のデバイスでQRコードをスキャンするか、<a href=\"https://$url\">$url</a>をご確認ください。';
  }

  @override
  String get keyboardLayoutPageTitle => 'キーボードレイアウト';

  @override
  String get chooseYourKeyboardLayout => 'キーボードレイアウトを選択してください。';

  @override
  String get typeToTest => 'ここに入力して、キーボードをテストできます';

  @override
  String get detectLayout => 'キーボードレイアウトを検出する';

  @override
  String get detectButtonText => '検出';

  @override
  String get keyboardVariant => 'キーボードバリアント：';

  @override
  String get pressOneKey => '以下のキーのうち 1 つを押してください。';

  @override
  String get isKeyPresent => '以下のキーはこのキーボードにありますか？';

  @override
  String get configureSecureBootTitle => 'セキュアブートの設定';

  @override
  String get configureSecureBootDescription => 'サードパーティのドライバーソフトウェアのインストールを選択しました。セキュアブートの無効化が必要です。\nここでセキュリティキーを設定し、システム再起動時にそのキーを入力してください。';

  @override
  String get configureSecureBootOption => 'セキュアブートを設定';

  @override
  String get chooseSecurityKey => 'セキュリティキーを決めてください。';

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
  String get connectToInternetPageTitle => 'ネットワークに接続';

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
  String get updatesOtherSoftwarePageTitle => 'アプリケーションとアップデート';

  @override
  String get updatesOtherSoftwarePageDescription => 'あらかじめいくつかのアプリケーションをインストールします。選択してください。';

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
  String get installCodecsTitle => '追加のメディアフォーマット用のサポートをダウンロードしてインストールする';

  @override
  String get installCodecsSubtitle => 'このソフトウェアはそのドキュメントに含まれるライセンス条項に従います。いくつかはプロプライエタリです。';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">警告</font> このコンピューターは電源に接続されていません。';
  }

  @override
  String get offlineWarning => '現在オフラインです';

  @override
  String get chooseSecurityKeyTitle => 'セキュリティキー';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'ディスク暗号化はあなたがコンピュータを紛失した際、あなたのファイルを守ります。コンピュータを起動するたびにセキュリティキーを入力する必要があります。\n\n$RELEASE 以外のファイルはどれも暗号化されません。';
  }

  @override
  String get chooseSecurityKeyHint => 'セキュリティキーを決めてください。';

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
  String get installationTypeAdvancedLabel => '高度な機能…';

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
  String get installationTypeZFS => '試験的： ディスクを消去して ZFS を使用する';

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
  String get installationTypeManual => '手動パーティショニング';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return '自分で $DISTRO をインストールするパーティションの作成やサイズ変更を行ったり、インストールに複数のパーティションを選択することもできます';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'ディスクを削除して $DISTRO をインストール';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'ドライブを選択してください。';

  @override
  String get selectGuidedStorageInfoLabel => 'ディスク全体が使用されます。';

  @override
  String get selectGuidedStorageInstallNow => 'インストール';

  @override
  String get installAlongsideSpaceDivider => '境界をドラッグしてディスク領域を割り当てます。';

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
  String get installAlongsidePartition => 'パーティション：';

  @override
  String get installAlongsideSize => 'サイズ：';

  @override
  String get installAlongsideAvailable => '利用可能：';

  @override
  String get allocateDiskSpace => '手動パーティショニング';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Mount points must start with \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Mount points cannot contain spaces';

  @override
  String get startInstallingButtonText => 'インストール';

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
  String get newPartitionTableConfirmationTitle => '新しい空のパーティション';

  @override
  String get newPartitionTableConfirmationMessage => 'デバイスに対して新しいパーティションを作成すると、現在のパーティションがすべて削除されます。この操作は必要に応じて戻すことができます。';

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
  String get partitionSizeLabel => 'サイズ：';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => '新しいパーティションの種類を選択してください。';

  @override
  String get partitionTypePrimary => '基本パーティション';

  @override
  String get partitionTypeLogical => '論理パーティション';

  @override
  String get partitionLocationLabel => '新しいパーティションの場所を選択してください。';

  @override
  String get partitionLocationBeginning => 'この領域の始点';

  @override
  String get partitionLocationEnd => 'この領域の終点';

  @override
  String get partitionFormatLabel => '使用方法：';

  @override
  String get partitionFormatNone => 'フォーマットしない';

  @override
  String get partitionErase => 'パーティションをフォーマット';

  @override
  String get partitionMountPointLabel => 'マウントポイント：';

  @override
  String get whoAreYouPageTitle => 'アカウントの設定';

  @override
  String get whoAreYouPageAutoLogin => '自動的にログインする';

  @override
  String get whoAreYouPageRequirePassword => 'ログイン時にパスワードを要求する';

  @override
  String get whoAreYouPageRealNameLabel => 'あなたの名前';

  @override
  String get whoAreYouPageRealNameRequired => '名前を入力してください';

  @override
  String get whoAreYouPageRealNameTooLong => 'その名前は長すぎます。';

  @override
  String get whoAreYouPageComputerNameLabel => 'コンピューターの名前';

  @override
  String get whoAreYouPageComputerNameInfo => '他のコンピューターと通信するときに使用する名前です。';

  @override
  String get whoAreYouPageComputerNameRequired => 'コンピューターの名前を入力してください';

  @override
  String get whoAreYouPageComputerNameTooLong => 'その名前は長すぎます。';

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
  String get whoAreYouPagePasswordLabel => 'パスワードを決めてください。';

  @override
  String get whoAreYouPagePasswordRequired => 'パスワードを入力してください';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'パスワードをもう一度入力';

  @override
  String get whoAreYouPagePasswordMismatch => 'パスワードが一致しません';

  @override
  String get whoAreYouPagePasswordShow => '表示';

  @override
  String get whoAreYouPagePasswordHide => '非表示';

  @override
  String get writeChangesToDisk => 'インストールの準備完了';

  @override
  String get writeChangesFallbackSerial => 'ディスク';

  @override
  String get writeChangesDescription => '続行すると、以下の変更がディスクに書き込まれます。さらに手動で変更を加えることもできます。';

  @override
  String get writeChangesDevicesTitle => 'デバイス';

  @override
  String get writeChangesPartitionsTitle => 'パーティション';

  @override
  String get writeChangesPartitionTablesHeader => '以下のデバイスのパーティションテーブルが変更されます。';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => '以下のパーティション変更が適用されます：';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'パーティション<b>$disk$partition</b>のサイズが<b>$oldsize</b>から<b>$newsize</b>に変更されます。';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'パーティション<b>$disk$partition</b>は<b>$format</b>としてフォーマットされ、<b>$mount</b>として使用されます。';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'パーティション<b>$disk$partition</b>は<b>$format</b>としてフォーマットされます。';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'パーティション<b>$disk$partition</b>は<b>$mount</b>として使用されます。';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'パーティション<b>$disk$partition</b>が作成されました。';
  }

  @override
  String get chooseYourLookPageTitle => 'テーマを選択してください。';

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
    return '**$system** のインストールは完了し、使い始める準備が整いました';
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
  String get turnOffBitlockerTitle => 'BitLockerが有効になっています。';

  @override
  String get turnOffBitlockerHeadline => '続行するにはBitLockerをオフにしてください。';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'このコンピューターはWindows BitLockerで暗号化されています。\nWindowsを使って空き領域を作るか、\'$option\'を選択してください。';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '手順については、別のデバイスでこのQRコードを読み取るか、次のURLへアクセスしてください：<a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => '再起動して Windows を使用';

  @override
  String get restartIntoWindowsTitle => 'Windowsに再起動しますか？';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return '本当にコンピュータを再起動しますか？ $DISTROのインストールを完了するためには、後で再起動する必要があります。';
  }

  @override
  String get whereAreYouPageTitle => 'タイムゾーンを選択してください。';

  @override
  String get whereAreYouLocationLabel => '現在地';

  @override
  String get whereAreYouTimezoneLabel => 'タイムゾーン';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return '$RELEASEへようこそ';
  }

  @override
  String get installationSlidesAvailable => 'インストール可能：';

  @override
  String get installationSlidesIncluded => '含まれるソフト：';

  @override
  String get installationSlidesWelcomeTitle => '高速で無料で、新機能が満載';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return '最新版の$DISTROでは、これまで以上にコンピューティングが容易になります。';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return '開発者・クリエーター・ゲーマー・管理者のいずれであっても、$RELEASEでは生産性を向上し、より良い体験を得られる新しいツールを見つけることができます。';
  }

  @override
  String get installationSlidesSoftwareTitle => '必要なアプリケーションを網羅';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Ubuntu Softwareを使えば、Snap Storeと$DISTROリポジトリの両方から、数多のアプリケーションをインストール・管理・更新できます。';
  }

  @override
  String get installationSlidesDevelopmentTitle => '最高のオープンソースを活用して開発';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTROはDevOpsや運用だけでなく、アプリケーションやウェブの開発、データサイエンス、AI/MLにも最適なワークステーションです。$DISTROのリリースごとに、最新のツールチェインやすべての主要なIDEが含まれています。';
  }

  @override
  String get installationSlidesCreativityTitle => '創造性の向上';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'アニメーター、デザイナー、動画クリエーターやゲーム開発者であれば、必要なワークフローを、オープンソースであり業界標準のソフトウェアやアプリケーションをサポートしている$DISTROに簡単に導入できます。';
  }

  @override
  String get installationSlidesGamingTitle => 'ゲームに最適';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTROは最新のNVIDIAはMesaのドライバーをサポートし、パフォーマンスや互換性が向上しています。Steamのようなアプリケーションを利用することで、数多くのWindowsゲームを$DISTRO上で特別な設定なくプレイできます。';
  }

  @override
  String get installationSlidesSecurityTitle => 'プライバシーと安全性';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTROはプライベートで安全なオンライン環境を維持するために必要なすべてのツールを提供します。ファイアウォールやVPNをサポートし、プライバシーを重視したアプリケーションによって、データを完全に管理できます。';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'すべての$DISTRO LTSリリースは、5年間のセキュリティパッチが含まれており、Ubuntu Proサブスクリプションによって10年に延長できます。';
  }

  @override
  String get installationSlidesProductivityTitle => '生産性の向上';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return 'デスクトップ版の$DISTROには、Microsoft Office互換なオープンソースのドキュメント、表計算、プレゼンテーションのアプリケーションセットであるLibreOfficeが同梱されています。人気のコラボレーションツールも利用可能です。';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'すべての人へ';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return '$DISTROの哲学の中心となっているのは、「あらゆる人のためのコンピューター」という信念です。高度なアクセシビリティツールや、言語・カラー・テキストサイズの変更といったオプションにより、$DISTROはあらゆる人に寄り添います。あなたが誰であっても、どこにいようとも。';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orcaスクリーンリーダー';

  @override
  String get installationSlidesAccessibilityLanguages => '言語サポート';

  @override
  String get installationSlidesSupportTitle => 'ヘルプとサポート';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return '$DISTROの公式ドキュメントは、オンラインおよびDock上のヘルプアイコンの両方から閲覧できます。';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntuでは様々な質問と回答をカバーし、Ubuntu Discourseは新規ユーザーと経験豊富なユーザーのためのガイドと議論の場を提供します。';

  @override
  String get installationSlidesSupportEnterprise => 'Canonicalは、企業ユーザー向けに職場でUbuntuを安全に導入・管理するための商用サポートを提供しています。';

  @override
  String get installationSlidesSupportResources => '役に立つ情報：';

  @override
  String get installationSlidesSupportDocumentation => '公式ドキュメント';

  @override
  String get installationSlidesSupportUbuntuPro => 'Ubuntu Proで24時間365日サポート';

  @override
  String get copyingFiles => 'ファイルをコピーしています…';

  @override
  String get installingSystem => 'システムをインストールしています…';

  @override
  String get configuringSystem => 'システムを設定しています…';

  @override
  String get installationFailed => 'インストールに失敗しました';

  @override
  String get notEnoughDiskSpaceTitle => '空き容量が足りません';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return '$DISTROをインストールするのに十分なストレージ容量がありません';
  }

  @override
  String get notEnoughDiskSpaceAvailable => '利用可能：';

  @override
  String get notEnoughDiskSpaceRequired => '必要：';

  @override
  String get activeDirectoryOption => 'アクティブディレクトリを使用する';

  @override
  String get activeDirectoryInfo => '次のステップでドメインやその他の詳細を入力します。';

  @override
  String get activeDirectoryTitle => 'アクティブディレクトリの設定';

  @override
  String get activeDirectoryTestConnection => 'ドメイン接続テスト';

  @override
  String get activeDirectoryDomainLabel => 'ドメイン';

  @override
  String get activeDirectoryDomainEmpty => '必須';

  @override
  String get activeDirectoryDomainTooLong => '長すぎます';

  @override
  String get activeDirectoryDomainInvalidChars => '無効な文字が含まれています。';

  @override
  String get activeDirectoryDomainStartDot => 'ピリオド「.」で始まります。';

  @override
  String get activeDirectoryDomainEndDot => 'ピリオド「.」で終わります。';

  @override
  String get activeDirectoryDomainStartHyphen => 'ハイフン「-」で始まります。';

  @override
  String get activeDirectoryDomainEndHyphen => 'ハイフン「-」で終わります。';

  @override
  String get activeDirectoryDomainMultipleDots => '二つのピリオド「..」を含んでいます。';

  @override
  String get activeDirectoryDomainNotFound => 'ドメインが見つかりません';

  @override
  String get activeDirectoryAdminLabel => 'ドメイン接続用のユーザー名';

  @override
  String get activeDirectoryAdminEmpty => '必須';

  @override
  String get activeDirectoryAdminInvalidChars => '無効な文字が含まれています。';

  @override
  String get activeDirectoryPasswordLabel => 'パスワード';

  @override
  String get activeDirectoryPasswordEmpty => '必須';

  @override
  String get activeDirectoryErrorTitle => 'アクティブディレクトリへの接続設定エラー';

  @override
  String get activeDirectoryErrorMessage => '申し訳ありませんが、Active Directoryは現在セットアップできません。システムが稼働したら、<a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> にアクセスしてサポートを受けてください。';
}
