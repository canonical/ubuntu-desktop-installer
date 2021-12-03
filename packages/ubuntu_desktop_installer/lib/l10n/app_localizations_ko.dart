


import 'app_localizations.dart';

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '우분투 데스크톱 인스톨러';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE 설치';
  }

  @override
  String get cancelButtonText => '취소';

  @override
  String get changeButtonText => '바꾸기';

  @override
  String get okButtonText => '확인';

  @override
  String get noButtonText => '아니오';

  @override
  String get restartButtonText => '다시 시작';

  @override
  String get revertButtonText => '되돌리기';

  @override
  String get yesButtonText => '예';

  @override
  String get welcome => '환영합니다';

  @override
  String get tryOrInstallPageTitle => '체험해 보거나 설치하기';

  @override
  String get repairInstallation => '설치 복구';

  @override
  String get repairInstallationDescription => '복구하면 문서나 설정을 건드리지 않고 설치된 모든 소프트웨어가 다시 설치됩니다.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE 체험하기';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return '컴퓨터에서 변경사항을 만들지 않고 $RELEASE를 체험하실 수 있습니다.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE 설치하기';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '$RELEASE를 현재 운영체제와 함께 (또는 대신) 설치합니다. 오래 걸리지 않습니다.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '<a href=\"$url\">릴리즈 노트</a>를 읽어보십시오.';
  }

  @override
  String get turnOffRST => 'RST 끄기';

  @override
  String get turnOffRSTDescription => '이 컴퓨터는 Intel RST (Rapid Storage Technology)를 사용합니다. 우분투를 설치하기 전 Windows 에서 꺼야 합니다.';

  @override
  String instructionsForRST(Object url) {
    return '절차를 알아보려면, 휴대전화나 다른 기기에서 이 페이지를 방문하십시오: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => '키보드 레이아웃';

  @override
  String get chooseYourKeyboardLayout => '키보드 레이아웃을 선택하십시오:';

  @override
  String get typeToTest => '키보드를 테스트해보려면 이 곳을 사용하십시오';

  @override
  String get detectLayout => '키보드 레이아웃 감지';

  @override
  String get pressOneKey => '다음 키 중 하나를 누르십시오:';

  @override
  String get isKeyPresent => '다음 키가 키보드에 존재합니까?';

  @override
  String get configureSecureBootTitle => 'Secure Boot 구성';

  @override
  String get configureSecureBootDescription => 'You\'ve chosen to install third-party driver software. This requires turning off Secure Boot.\nTo do this, you need to choose a security key now, and enter it when the system restarts.';

  @override
  String get configureSecureBootOption => 'Secure Boot 구성';

  @override
  String get chooseSecurityKey => 'Choose a security key';

  @override
  String get confirmSecurityKey => 'Confirm the security key';

  @override
  String get dontInstallDriverSoftwareNow => '지금은 드라이버 소프트웨어 설치하지 않기';

  @override
  String get dontInstallDriverSoftwareNowDescription => '소프트웨어 & 업데이트 에서 나중에 설치하실 수 있습니다.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Security key is required';

  @override
  String get secureBootSecurityKeysDontMatch => 'Security keys do not match';

  @override
  String get connectToInternetPageTitle => 'Connect to internet';

  @override
  String get connectToInternetDescription => 'Connecting this computer to the internet will help Ubuntu install any extra software needed and help choose your time zone.\n\nConnect by ethernet cable, or choose a Wi-Fi network';

  @override
  String get useWiredConnection => 'Use wired connection';

  @override
  String get noWiredConnection => 'No wired connection detected';

  @override
  String get wiredDisabled => 'Wired connection is turned off';

  @override
  String get wiredMustBeEnabled => 'To use ethernet on this computer, a wired connection must be enabled';

  @override
  String get enableWired => 'Enable wired';

  @override
  String get selectWifiNetwork => 'Connect to a Wi-Fi network';

  @override
  String get noInternet => 'I don\'t want to connect to the internet just now';

  @override
  String get wirelessNetworkingDisabled => 'Wireless networking disabled';

  @override
  String get noWifiDevicesDetected => 'No Wi-Fi devices detected';

  @override
  String get wifiMustBeEnabled => 'To use Wi-Fi on this computer, wireless networking must be enabled';

  @override
  String get enableWifi => 'Enable Wi-Fi';

  @override
  String get connectButtonText => 'Connect';

  @override
  String get updatesOtherSoftwarePageTitle => '업데이트 및 다른 소프트웨어';

  @override
  String get updatesOtherSoftwarePageDescription => 'What apps would you like to install to start with?';

  @override
  String get normalInstallationTitle => '일반 설치';

  @override
  String get normalInstallationSubtitle => '웹 브라우저, 유틸리티, 오피스 소프트웨어, 게임 및 미디어 플레이어.';

  @override
  String get minimalInstallationTitle => '최소 설치';

  @override
  String get minimalInstallationSubtitle => '웹 브라우저와 기본 유틸리티.';

  @override
  String get otherOptions => 'Other options';

  @override
  String get installThirdPartyTitle => '그래픽 및 Wi-Fi 하드웨어를 위한 서드파티 소프트웨어와, 부가적인 미디어 포맷 설치';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String get chooseSecurityKeyTitle => 'Choose a security key';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk encryption protects your files in case you lose your computer. It requires you to enter a security key each time the computer starts up.\n\nAny files outside of $RELEASE will not be encrypted.';
  }

  @override
  String get chooseSecurityKeyHint => 'Choose a security key';

  @override
  String get chooseSecurityKeyConfirmHint => 'Confirm the security key';

  @override
  String get chooseSecurityKeyRequired => 'A security key is required';

  @override
  String get chooseSecurityKeyMismatch => 'The security keys do not match';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Installation type';

  @override
  String installationTypeOSDetected(Object os) {
    return '현재 컴퓨터에 $os(이)가 설치되어 있습니다. 어떻게 하시겠습니까?';
  }

  @override
  String get installationTypeNoOSDetected => '현재 이 컴퓨터에서 발견된 운영체제가 없습니다. 어떻게 하시겠습니까?';

  @override
  String installationTypeErase(Object DISTRO) {
    return '디스크 지우고 $DISTRO 설치';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">경고:</font> 모든 프로그램, 문서, 사진, 음악 및 모든 운영체제에 있는 다른 파일까지 모두 삭제됩니다.';
  }

  @override
  String get installationTypeAdvancedLabel => '고급 기능...';

  @override
  String get installationTypeAdvancedTitle => '고급 기능';

  @override
  String get installationTypeNone => 'None';

  @override
  String get installationTypeNoneSelected => 'None selected';

  @override
  String installationTypeLVM(Object RELEASE) {
    return '새 우분투 설치에 LVM 사용';
  }

  @override
  String get installationTypeLVMSelected => 'LVM 선택됨';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return '보안을 위해 새 $RELEASE 설치 암호화';
  }

  @override
  String get installationTypeEncryptInfo => 'You will choose a security key in the next step.';

  @override
  String get installationTypeZFS => 'EXPERIMENTAL: Erase disk and use ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS selected';

  @override
  String installationTypeReinstall(Object os) {
    return 'Erase $os and reinstall';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Warning:</font> This will delete all your $os programs, documents, photos, music, and any other files.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Install $product alongside $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Something else';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Erase disk and install $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Select drive:';

  @override
  String get selectGuidedStorageInfoLabel => '디스크 전체가 사용됩니다:';

  @override
  String get selectGuidedStorageInstallNow => '지금 설치';

  @override
  String get allocateDiskSpace => '디스크 공간 할당';

  @override
  String get startInstallingButtonText => 'Start Installing';

  @override
  String get diskHeadersDevice => 'Device';

  @override
  String get diskHeadersType => 'Type';

  @override
  String get diskHeadersMountPoint => 'Mount point';

  @override
  String get diskHeadersSize => 'Size';

  @override
  String get diskHeadersUsed => 'Used';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'free space';

  @override
  String get newPartitionTable => '새 파티션 테이블';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Create partition';

  @override
  String get partitionEditTitle => '파티션 편집';

  @override
  String get partitionSizeLabel => 'Size:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => '새 파티션 유형:';

  @override
  String get partitionTypePrimary => 'Primary';

  @override
  String get partitionTypeLogical => 'Logical';

  @override
  String get partitionLocationLabel => 'Location for the new partition:';

  @override
  String get partitionLocationBeginning => 'Beginning of this space';

  @override
  String get partitionLocationEnd => 'End of this space';

  @override
  String get partitionFormatLabel => 'Used as:';

  @override
  String get partitionFormatExt4 => 'Ext4 저널링 파일 시스템';

  @override
  String get partitionFormatExt3 => 'Ext3 저널링 파일 시스템';

  @override
  String get partitionFormatExt2 => 'Ext2 파일 시스템';

  @override
  String get partitionFormatBtrfs => 'btrfs 저널링 파일 시스템';

  @override
  String get partitionFormatJfs => 'JFS 저널링 파일 시스템';

  @override
  String get partitionFormatXfs => 'XFS 저널링 파일 시스템';

  @override
  String get partitionFormatFat => 'FAT 파일 시스템';

  @override
  String get partitionFormatFat12 => 'FAT12 파일 시스템';

  @override
  String get partitionFormatFat16 => 'FAT16 파일 시스템';

  @override
  String get partitionFormatFat32 => 'FAT32 파일 시스템';

  @override
  String get partitionFormatSwap => '스왑 영역';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 파일 시스템';

  @override
  String get partitionFormatVfat => 'VFAT 파일 시스템';

  @override
  String get partitionFormatNtfs => 'NTFS 파일 시스템';

  @override
  String get partitionFormatReiserFS => 'ReiserFS 파일 시스템';

  @override
  String get partitionFormatZfsroot => 'ZFS 루트 파일 시스템';

  @override
  String get partitionErase => '파티션 포맷';

  @override
  String get partitionMountPointLabel => 'Mount point:';

  @override
  String get whoAreYouPageTitle => '당신은 누구십니까?';

  @override
  String get whoAreYouPageAutoLogin => '자동으로 로그인';

  @override
  String get whoAreYouPageRequirePassword => '로그인 할 때 암호 요구';

  @override
  String get whoAreYouPageRealNameLabel => '이름';

  @override
  String get whoAreYouPageRealNameRequired => 'A name is required';

  @override
  String get whoAreYouPageComputerNameLabel => '컴퓨터 이름';

  @override
  String get whoAreYouPageComputerNameInfo => '다른 컴퓨터와 통신할 때 사용하는 이름 입니다.';

  @override
  String get whoAreYouPageComputerNameRequired => '컴퓨터 이름이 필요합니다';

  @override
  String get whoAreYouPageInvalidComputerName => '올바르지 않은 컴퓨터 이름 입니다';

  @override
  String get whoAreYouPageUsernameLabel => '사용자 이름 선택';

  @override
  String get whoAreYouPageUsernameRequired => '사용자 이름이 필요합니다';

  @override
  String get whoAreYouPageInvalidUsername => '올바르지 않은 사용자 이름 입니다';

  @override
  String get whoAreYouPagePasswordLabel => '암호 선택';

  @override
  String get whoAreYouPagePasswordRequired => '암호가 필요합니다';

  @override
  String get whoAreYouPageConfirmPasswordLabel => '암호 확인';

  @override
  String get whoAreYouPagePasswordMismatch => '암호가 일치하지 않습니다';

  @override
  String get writeChangesToDisk => '디스크에 변경사항 쓰기';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesPartitionTablesHeader => '다음과 같은 장치의 파티션 테이블이 변경되었습니다:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => '다음과 같은 파티션이 포맷됩니다:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} as $format used for $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} as $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Choose your look';

  @override
  String get chooseYourLookPageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get chooseYourLookPageDarkSetting => 'Dark';

  @override
  String get chooseYourLookPageLightSetting => 'Light';

  @override
  String get chooseYourLookPageLightBodyText => 'Everything is light and bright';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello darkness my old friend';

  @override
  String get installationCompleteTitle => 'Installation complete';

  @override
  String readyToUse(Object system) {
    return '**$system** is installed and ready to use.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Shut Down';

  @override
  String get turnOffBitlockerTitle => 'BitLocker 끄기';

  @override
  String get turnOffBitlockerDescription => '이 컴퓨터는 Windows BitLocker 암호화를 사용합니다.\n우분투를 설치하기 전 Windows 에서 BitLocker를 꺼야 합니다.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return '절차를 확인하려면, 이 페이지를 휴대전화나 다른 기기에서 열으십시오: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Windows로 다시 시작';
}
