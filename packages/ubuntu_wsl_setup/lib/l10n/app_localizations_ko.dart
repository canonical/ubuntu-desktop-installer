


import 'app_localizations.dart';

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '우분투 WSL';

  @override
  String get windowTitle => '우분투 WSL';

  @override
  String get exitButton => '나가기';

  @override
  String get finishButton => '완료';

  @override
  String get saveButton => '저장';

  @override
  String get setupButton => '설치';

  @override
  String get selectLanguageTitle => '언어를 선택하십시오';

  @override
  String get profileSetupTitle => '프로필 구성';

  @override
  String get profileSetupHeader => '기본 유닉스 사용자 계정을 생성해 주십시오. 자세한 정보는 <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>를 방문하십시오';

  @override
  String get profileSetupRealnameLabel => '이름';

  @override
  String get profileSetupRealnameRequired => '이름이 필요합니다';

  @override
  String get profileSetupUsernameHint => '사용자 이름 선택';

  @override
  String get profileSetupUsernameHelper => '사용자 이름은 Windows 사용자 이름과 일치하지 않아도 됩니다.';

  @override
  String get profileSetupPasswordHint => '암호 선택';

  @override
  String get profileSetupConfirmPasswordHint => '암호 확인';

  @override
  String get profileSetupShowAdvancedOptions => '다음 페이지에서 고급 옵션 보기';

  @override
  String get profileSetupPasswordMismatch => '암호가 일치하지 않습니다';

  @override
  String get profileSetupUsernameRequired => '사용자 이름이 필요합니다';

  @override
  String get profileSetupUsernameInvalid => '올바른 사용자 이름이 아닙니다';

  @override
  String get profileSetupUsernameInUse => '사용자 이름이 이미 존재합니다.';

  @override
  String get profileSetupUsernameSystemReserved => '시스템 사용을 위해 예약된 사용자 이름입니다.';

  @override
  String get profileSetupUsernameTooLong => '사용자 이름이 너무 깁니다.';

  @override
  String get profileSetupUsernameInvalidChars => '사용자 이름에 허용되지 않은 문자가 포함되어 있습니다.';

  @override
  String get profileSetupPasswordRequired => '암호가 필요합니다';

  @override
  String get advancedSetupTitle => '고급 설치';

  @override
  String get advancedSetupHeader => '이 페이지에서는, 우분투 WSL을 필요에 따라 트윅할 수 있습니다.';

  @override
  String get advancedSetupMountLocationHint => '마운트 위치';

  @override
  String get advancedSetupMountLocationHelper => 'automount 설정할 위치';

  @override
  String get advancedSetupMountLocationInvalid => '올바른 위치가 아닙니다';

  @override
  String get advancedSetupMountOptionHint => '마운트 옵션';

  @override
  String get advancedSetupMountOptionHelper => 'automount 설정에 전달할 마운트 옵션';

  @override
  String get advancedSetupHostGenerationTitle => 'Host 생성 활성화';

  @override
  String get advancedSetupHostGenerationSubtitle => '선택하면 시작할 때 마다 /etc/hosts 를 다시 생성합니다.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'resolv.conf 생성 활성화';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => '선택하면 시작할 때 마다 /etc/resolv.conf 를 다시 생성합니다.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI 통합';

  @override
  String get advancedSetupGUIIntegrationSubtitle => '선택하면 DISPLAY 환경변수 자동 설정을 활성화 합니다. 서드파티 X 서버를 요구합니다.';

  @override
  String get configurationUITitle => '우분투 WSL 구성 UI - 고급 옵션';

  @override
  String get configurationUIInteroperabilityHeader => '상호운용성';

  @override
  String get configurationUIInteroperabilityTitle => '활성화됨';

  @override
  String get configurationUIInteroperabilitySubtitle => '상호운용성 활성화 여부.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Windows 경로 붙이기';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'WSL 에서 PAT 환경 변수의 뒤에 Windows 경로를 붙일지 여부';

  @override
  String get configurationUIAutoMountHeader => '자동 마운트';

  @override
  String get configurationUIAutoMountTitle => '활성화됨';

  @override
  String get configurationUIAutoMountSubtitle => '자동 마운트 활성화 여부. 이 기능은 Windows 드라이브를 WSL에 마운트 할 수 있도록 해줍니다.';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab 마운트';

  @override
  String get configurationUIMountFstabSubtitle => '/etc/fstab 마운트 여부. /etc/fstab 설정 파일에 포함되었습니까???';

  @override
  String get configurationUISystemdHeader => '실험적 기능 - Systemd';

  @override
  String get configurationUISystemdTitle => '활성화됨';

  @override
  String get configurationUISystemdSubtitle => '부팅할 때 systemd를 활성화 해야 하는지 여부. 주의: 실험적 기능입니다.';

  @override
  String get applyingChanges => '변경사항 적용...';

  @override
  String get applyingChangesDisclaimer => '인터넷 연결 상태에 따라 몇 분 정도 걸릴 수 있습니다.';

  @override
  String get setupCompleteTitle => '설치 완료';

  @override
  String setupCompleteHeader(Object user) {
    return '$user님 안녕하세요,\n설치가 성공적으로 완료되었습니다.';
  }

  @override
  String get setupCompleteUpdate => '아래 명령을 실행하여 우분투를 최신 버전으로 업데이트 하는 것을 제안 드립니다:';

  @override
  String get setupCompleteRestart => '* 모든 설정은 우분투를 다시 시작 후 적용됩니다.';
}
