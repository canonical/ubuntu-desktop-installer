import 'ubuntu_provision_localizations.dart';

/// The translations for Korean (`ko`).
class UbuntuProvisionLocalizationsKo extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get timezonePageTitle => '시간대를 선택하십시오';

  @override
  String get timezoneLocationLabel => '위치';

  @override
  String get timezoneTimezoneLabel => '시간대';

  @override
  String get keyboardTitle => '키보드 레이아웃';

  @override
  String get keyboardHeader => '키보드 레이아웃을 선택하십시오:';

  @override
  String get keyboardTestHint => '키보드를 테스트 해보려면 이 곳을 사용하십시오';

  @override
  String get keyboardDetectTitle => '키보드 레이아웃 감지';

  @override
  String get keyboardDetectButton => '감지';

  @override
  String get keyboardVariantLabel => '키보드 유형:';

  @override
  String get keyboardPressKeyLabel => '다음 키 중 하나를 누르십시오:';

  @override
  String get keyboardKeyPresentLabel => '다음 키가 키보드에 존재합니까?';

  @override
  String get themePageTitle => '테마를 선택하십시오';

  @override
  String get themePageHeader => '모양 설정에서 언제든 변경하실 수 있습니다.';

  @override
  String get themeDark => '어두움';

  @override
  String get themeLight => '밝음';

  @override
  String localePageTitle(Object DISTRO) {
    return '$DISTRO사용을 환영합니다';
  }

  @override
  String get localeHeader => '언어를 선택하십시오:';

  @override
  String get identityPageTitle => '계정을 설정하십시오';

  @override
  String get identityAutoLogin => '자동으로 로그인';

  @override
  String get identityRequirePassword => '로그인 할 때 암호 요구';

  @override
  String get identityRealNameLabel => '이름';

  @override
  String get identityRealNameRequired => '이름이 필요합니다';

  @override
  String get identityRealNameTooLong => '너무 긴 이름입니다.';

  @override
  String get identityHostnameLabel => '컴퓨터 이름';

  @override
  String get identityHostnameInfo => '다른 컴퓨터와 통신할 때 사용하는 이름 입니다.';

  @override
  String get identityHostnameRequired => '컴퓨터 이름이 필요합니다';

  @override
  String get identityHostnameTooLong => '너무 긴 컴퓨터 이름입니다.';

  @override
  String get identityInvalidHostname => '올바르지 않은 컴퓨터 이름 입니다';

  @override
  String get identityUsernameLabel => '사용자 이름 선택';

  @override
  String get identityUsernameRequired => '사용자 이름이 필요합니다';

  @override
  String get identityInvalidUsername => '올바르지 않은 사용자 이름 입니다';

  @override
  String get identityUsernameInUse => '해당 사용자 이름이 이미 존재합니다.';

  @override
  String get identityUsernameSystemReserved => '시스템 사용을 위해 예약된 사용자 이름입니다.';

  @override
  String get identityUsernameTooLong => '사용자 이름이 너무 깁니다.';

  @override
  String get identityUsernameInvalidChars => '사용자 이름에 허용되지 않은 문자가 포함되어 있습니다.';

  @override
  String get identityPasswordLabel => '암호 선택';

  @override
  String get identityPasswordRequired => '암호가 필요합니다';

  @override
  String get identityConfirmPasswordLabel => '암호 확인';

  @override
  String get identityPasswordMismatch => '암호가 일치하지 않습니다';

  @override
  String get identityPasswordShow => '표시';

  @override
  String get identityPasswordHide => '숨기기';

  @override
  String get identityActiveDirectoryOption => '액티브 디렉토리 사용';

  @override
  String get identityActiveDirectoryInfo => '다음 단계에서 도메인 및 기타 세부 사항을 입력합니다.';

  @override
  String get activeDirectoryTitle => '액티브 디렉토리 구성';

  @override
  String get activeDirectoryTestConnection => '도메인 연결 테스트';

  @override
  String get activeDirectoryDomainLabel => '도메인';

  @override
  String get activeDirectoryDomainEmpty => '필수';

  @override
  String get activeDirectoryDomainTooLong => '너무 깁니다';

  @override
  String get activeDirectoryDomainInvalidChars => '유효하지 않은 문자';

  @override
  String get activeDirectoryDomainStartDot => '점 (.)으로 시작';

  @override
  String get activeDirectoryDomainEndDot => '점 (.)으로 끝';

  @override
  String get activeDirectoryDomainStartHyphen => '하이픈 (-)으로 시작';

  @override
  String get activeDirectoryDomainEndHyphen => '하이픈 (-)으로 끝';

  @override
  String get activeDirectoryDomainMultipleDots => '연속된 여러 점(..) 포함';

  @override
  String get activeDirectoryDomainNotFound => '도메인을 찾을 수 없습니다';

  @override
  String get activeDirectoryAdminLabel => '도메인 사용자 연결';

  @override
  String get activeDirectoryAdminEmpty => '필수';

  @override
  String get activeDirectoryAdminInvalidChars => '유효하지 않은 문자';

  @override
  String get activeDirectoryPasswordLabel => '비밀 번호';

  @override
  String get activeDirectoryPasswordEmpty => '필수';

  @override
  String get activeDirectoryErrorTitle => 'Active Directory 연결 구성 오류';

  @override
  String get activeDirectoryErrorMessage => '죄송합니다, 현재 Active Directory를 설정할 수 없습니다. 시스템이 준비되면, <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>에 방문하셔서 도움을 받으시기 바랍니다.';

  @override
  String get networkPageTitle => '네트워크에 연결하기';

  @override
  String get networkPageHeader => '이 컴퓨터를 인터넷에 연결하면 우분투에 필요한 추가 소프트웨어 설치나 시간대 선택에 도움이 됩니다.\n\n이더넷 케이블이나, Wi-Fi 네트워크를 선택하여 연결하십시오';

  @override
  String get networkWiredOption => '유선 연결 사용';

  @override
  String get networkWiredNone => '유선 연결 감지 안됨';

  @override
  String get networkWiredOff => '유선 연결이 꺼져 있음';

  @override
  String get networkWiredDisabled => '이 컴퓨터에서 이더넷 연결을 사용하려면, 유선 연결이 반드시 활성화 되어야 합니다';

  @override
  String get networkWiredEnable => '유선 연결 활성화';

  @override
  String get networkWifiOption => 'Wi-Fi 네트워크에 연결';

  @override
  String get networkWifiOff => '무선 네트워킹 비활성화됨';

  @override
  String get networkWifiNone => '감지된 Wi-Fi 장치가 없음';

  @override
  String get networkWifiDisabled => '이 컴퓨터에서 Wi-Fi를 사용하려면, 무선 네트워킹이 반드시 활성화 되어야 합니다';

  @override
  String get networkWifiEnable => 'Wi-Fi 활성화';

  @override
  String get networkHiddenWifiOption => '숨겨진 Wi-Fi 네트워크에 연결';

  @override
  String get networkHiddenWifiNameLabel => '네트워크 이름';

  @override
  String get networkHiddenWifiNameRequired => '네트워크 이름이 필요합니다';

  @override
  String get networkNoneOption => '지금은 인터넷에 연결하지 않기';
}
