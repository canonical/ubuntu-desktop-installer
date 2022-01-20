


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
  String get tryOrInstallPageTitle => '체험 또는 설치';

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
  String get turnOffRSTDescription => '이 컴퓨터는 Intel RST (Rapid Storage Technology)를 사용합니다. 우분투를 설치하기 전에 Windows 에서 종료해야 합니다.';

  @override
  String instructionsForRST(Object url) {
    return '절차를 알아보려면, 휴대전화나 다른 기기에서 이 페이지를 방문하십시오: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => '키보드 레이아웃';

  @override
  String get chooseYourKeyboardLayout => '키보드 레이아웃을 선택하십시오:';

  @override
  String get typeToTest => '키보드를 테스트 해보려면 이 곳을 사용하십시오';

  @override
  String get detectLayout => '키보드 레이아웃 감지';

  @override
  String get pressOneKey => '다음 키 중 하나를 누르십시오:';

  @override
  String get isKeyPresent => '다음 키가 키보드에 존재합니까?';

  @override
  String get configureSecureBootTitle => 'Secure Boot 구성';

  @override
  String get configureSecureBootDescription => '서드파티 드라이버 소프트웨어 설치를 선택 하시려면, Secure Boot를 꺼야 합니다.\n이를 위해 지금 보안 키를 지정하고, 시스템 다시 시작 시 입력해야 합니다.';

  @override
  String get configureSecureBootOption => 'Secure Boot 구성';

  @override
  String get chooseSecurityKey => '보안 키 선택';

  @override
  String get confirmSecurityKey => '보안 키 확인';

  @override
  String get dontInstallDriverSoftwareNow => '지금은 드라이버 소프트웨어 설치하지 않기';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Software & Updates 에서 나중에 설치하실 수 있습니다.';

  @override
  String get configureSecureBootSecurityKeyRequired => '보안 키가 필요합니다';

  @override
  String get secureBootSecurityKeysDontMatch => '보안 키가 일치하지 않습니다';

  @override
  String get connectToInternetPageTitle => '인터넷에 연결하기';

  @override
  String get connectToInternetDescription => '이 컴퓨터를 인터넷에 연결하면 우분투에 필요한 추가 소프트웨어 설치나 시간대 선택에 도움이 됩니다.\n\n이더넷 케이블을 연결하거나, Wi-Fi 네트워크를 선택하십시오';

  @override
  String get useWiredConnection => '유선 연결 사용';

  @override
  String get noWiredConnection => '유선 연결 감지 안됨';

  @override
  String get wiredDisabled => '유선 연결이 꺼져 있음';

  @override
  String get wiredMustBeEnabled => '이 컴퓨터에서 이더넷 연결을 사용하려면, 유선 연결이 반드시 활성화 되어야 합니다';

  @override
  String get enableWired => '유선 연결 활성화';

  @override
  String get selectWifiNetwork => 'Wi-Fi 네트워크에 연결';

  @override
  String get noInternet => '지금은 인터넷에 연결하지 않기';

  @override
  String get wirelessNetworkingDisabled => '무선 네트워킹 비활성화됨';

  @override
  String get noWifiDevicesDetected => '감지된 Wi-Fi 장치가 없음';

  @override
  String get wifiMustBeEnabled => '이 컴퓨터에서 Wi-Fi를 사용하려면, 무선 네트워킹이 반드시 활성화 되어야 합니다';

  @override
  String get enableWifi => 'Wi-Fi 활성화';

  @override
  String get connectButtonText => '연결하기';

  @override
  String get updatesOtherSoftwarePageTitle => '업데이트 및 다른 소프트웨어';

  @override
  String get updatesOtherSoftwarePageDescription => '어떤 앱을 설치하고 시작하시겠습니까?';

  @override
  String get normalInstallationTitle => '일반 설치';

  @override
  String get normalInstallationSubtitle => '웹 브라우저, 유틸리티, 오피스 소프트웨어, 게임 및 미디어 플레이어.';

  @override
  String get minimalInstallationTitle => '최소 설치';

  @override
  String get minimalInstallationSubtitle => '웹 브라우저와 기본 유틸리티.';

  @override
  String get otherOptions => '기타 설정';

  @override
  String get installThirdPartyTitle => '그래픽 및 Wi-Fi 하드웨어를 위한 서드파티 소프트웨어와, 부가적인 미디어 포맷 설치';

  @override
  String get installThirdPartySubtitle => '이 소프트웨어는 문서에 포함된 라이선스 조건의 적용을 받습니다. 일부는 독점입니다.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => '보안 키 선택';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return '디스크 암호화는 컴퓨터를 잃어버렸을 때 파일을 보호할 수 있습니다. 하지만 컴퓨터를 시작할 때 매번 보안 키를 입력해야 합니다.\n\n${RELEASE} 밖의 파일은 암호화 되지 않습니다.';
  }

  @override
  String get chooseSecurityKeyHint => '보안 키 선택';

  @override
  String get chooseSecurityKeyConfirmHint => '보안 키 확인';

  @override
  String get chooseSecurityKeyRequired => '보안 키가 필요합니다';

  @override
  String get chooseSecurityKeyMismatch => '보안 키가 일치하지 않습니다';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">경고</font>: 보안 키를 분실하면, 모든 데이터를 잃게 됩니다. 필요한 경우, 보안 키를 적어서 안전한 곳에 보관하십시오.';
  }

  @override
  String get installationTypeTitle => '설치 형식';

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
  String get installationTypeNone => '선택 안 함';

  @override
  String get installationTypeNoneSelected => '선택 안 함';

  @override
  String installationTypeLVM(Object RELEASE) {
    return '새 $RELEASE 설치에 LVM 사용';
  }

  @override
  String get installationTypeLVMSelected => 'LVM 선택됨';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return '보안을 위해 새 $RELEASE 설치 암호화';
  }

  @override
  String get installationTypeEncryptInfo => '다음 단계에서 보안 키를 선택합니다.';

  @override
  String get installationTypeZFS => '실험적 기능: 디스크 지우고 ZFS 사용';

  @override
  String get installationTypeZFSSelected => 'ZFS 선택됨';

  @override
  String installationTypeReinstall(Object os) {
    return '$os 지우고 다시 설치';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">경고:</font> $os에 있는 모든 프로그램, 문서, 사진, 음악 및 다른 파일을 삭제합니다.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product을(를) $os와 나란히 설치';
  }

  @override
  String get installationTypeAlongsideInfo => '문서, 음악, 및 다른 개인 파일이 그대로 유지됩니다. 컴퓨터를 시작할 때 마다 원하는 운영체제를 선택하실 수 있습니다.';

  @override
  String get installationTypeManual => '다른 방법';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return '파티션을 직접 만들고 크기를 조절 하거나, $DISTRO에 대해 여러 파티션을 선택할 수 있습니다';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return '디스크 지우고 $DISTRO 설치';
  }

  @override
  String get selectGuidedStorageDropdownLabel => '드라이브 선택:';

  @override
  String get selectGuidedStorageInfoLabel => '디스크 전체가 사용됩니다:';

  @override
  String get selectGuidedStorageInstallNow => '지금 설치';

  @override
  String get allocateDiskSpace => '디스크 공간 할당';

  @override
  String get startInstallingButtonText => '설치 시작하기';

  @override
  String get diskHeadersDevice => '장치';

  @override
  String get diskHeadersType => '형식';

  @override
  String get diskHeadersMountPoint => '마운트 위치';

  @override
  String get diskHeadersSize => '크기';

  @override
  String get diskHeadersUsed => '사용됨';

  @override
  String get diskHeadersSystem => '시스템';

  @override
  String get diskHeadersFormat => '포맷';

  @override
  String get freeDiskSpace => '남은 공간';

  @override
  String get newPartitionTable => '새 파티션 테이블';

  @override
  String get newPartitionTableConfirmationTitle => '이 장치에 빈 파티션을 새로 생성하시겠습니까?';

  @override
  String get newPartitionTableConfirmationMessage => '장치 전체를 파티션으로 지정하셨습니다. 계속해서 장치에 새 파티션을 생성하시면, 기존 파티션은 모두 삭제됩니다.\n\n원하시는 경우 추후 이 작업을 되돌리실 수 있습니다.';

  @override
  String get bootLoaderDevice => '부트 로더 설치에 사용할 장치';

  @override
  String get partitionCreateTitle => '파티션 만들기';

  @override
  String get partitionEditTitle => '파티션 편집';

  @override
  String get partitionSizeLabel => '크기:';

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
  String get partitionTypePrimary => '주';

  @override
  String get partitionTypeLogical => '논리';

  @override
  String get partitionLocationLabel => '새 파티션 위치:';

  @override
  String get partitionLocationBeginning => '이 공간이 시작하는 지점';

  @override
  String get partitionLocationEnd => '이 공간이 끝나는 지점';

  @override
  String get partitionFormatLabel => '용도:';

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
  String get partitionMountPointLabel => '마운트 위치:';

  @override
  String get whoAreYouPageTitle => '당신은 누구십니까?';

  @override
  String get whoAreYouPageAutoLogin => '자동으로 로그인';

  @override
  String get whoAreYouPageRequirePassword => '로그인 할 때 암호 요구';

  @override
  String get whoAreYouPageRealNameLabel => '이름';

  @override
  String get whoAreYouPageRealNameRequired => '이름이 필요합니다';

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
  String get writeChangesFallbackSerial => '디스크';

  @override
  String get writeChangesDescription => '계속 하시면 아래 나열된 변경사항을 디스크에 기록됩니다. 수동으로 추가적인 변경사항을 만드실 수 있습니다.';

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
    return '$mount 로 사용되는 $format 포맷의 #$disk${partition} 파티션';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return '#$disk${partition} 파티션을 $format 로 포맷';
  }

  @override
  String get chooseYourLookPageTitle => '모양을 선택하십시오';

  @override
  String get chooseYourLookPageHeader => '모양 설정에서 언제든 변경하실 수 있습니다.';

  @override
  String get chooseYourLookPageDarkSetting => '어두움';

  @override
  String get chooseYourLookPageLightSetting => '밝음';

  @override
  String get chooseYourLookPageLightBodyText => '모든 것이 밝고 선명해요';

  @override
  String get chooseYourLookPageDarkBodyText => '안녕 내 오랜 친구 어둠이여';

  @override
  String get installationCompleteTitle => '설치 완료';

  @override
  String readyToUse(Object system) {
    return '**$system** 설치가 완료 되었으며 사용할 준비가 되었습니다.';
  }

  @override
  String restartInto(Object system) {
    return '$system 으(로) 다시 시작';
  }

  @override
  String get shutdown => '시스템 종료';

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
