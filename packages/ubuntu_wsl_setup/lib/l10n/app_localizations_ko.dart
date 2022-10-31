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
  String installLangPacksTitle(String lang) {
    return '더 나은 $lang 언어 지원을 위한 패키지 설치';
  }

  @override
  String get installLangPacksSubtitle => '느린 연결에서 권장하지 않음.';

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
  String get configurationUIInteropAppendWindowsPathSubtitle => 'WSL 에서 PATH 환경 변수의 뒤에 Windows 경로를 붙일지 여부';

  @override
  String get configurationUIAutoMountHeader => '자동 마운트';

  @override
  String get configurationUIAutoMountTitle => '활성화됨';

  @override
  String get configurationUIAutoMountSubtitle => '자동 마운트 활성화 여부. 이 기능은 Windows 드라이브를 WSL에 마운트 할 수 있도록 해줍니다.';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab 마운트';

  @override
  String get configurationUIMountFstabSubtitle => '/etc/fstab 마운트 여부. 이 파일은 시스템이 마운트 할 파일시스템에 관한 정보를 담고 있습니다.';

  @override
  String get configurationUISystemdHeader => '실험용 기능 - Systemd';

  @override
  String get configurationUISystemdTitle => '활성화됨';

  @override
  String get configurationUISystemdSubtitle => '부팅할 때 systemd를 활성화 해야 하는지 여부. 주의: 실험적 기능입니다.';

  @override
  String get applyingChanges => '변경사항 적용…';

  @override
  String get applyingChangesDisclaimer => '인터넷 연결 상태에 따라 몇 분 정도 걸릴 수 있습니다.';

  @override
  String get setupCompleteTitle => '설치 완료';

  @override
  String setupCompleteHeader(Object user) {
    return '$user님 안녕하세요,\n설치가 완료되었습니다.';
  }

  @override
  String get setupCompleteUpdate => '아래 명령을 실행하여 우분투를 최신 버전으로 업데이트 하는 것을 제안 드립니다:';

  @override
  String get setupCompleteRestart => '* 모든 설정은 우분투를 다시 시작 후 적용됩니다.';

  @override
  String get installationSlidesWelcome => '우분투 WSL에 오신것을 환영합니다';

  @override
  String get installationSlidesInitializing => '초기화 중...';

  @override
  String get installationSlidesUnpacking => '배포판 푸는 중';

  @override
  String get installationSlidesInstalling => '거의 다 되었습니다. 곧 설치 마법사에 주의가 필요할 것입니다.';

  @override
  String get installationSlidesLaunching => '배포판 실행 중...';

  @override
  String get installationSlidesErrorMsg => '무엇인가 잘못되었습니다.';

  @override
  String get installationSlidesErrorTitle => '무엇인가 잘못되었습니다';

  @override
  String get installationSlidesErrorSub => '아래 명령으로 WSL 다시 시작하고 다시 시도 해 주십시오:\n\twsl --shutdown\n\twsl --unregister 배포판_이름';

  @override
  String get installationSlidesErrorText => '\n복구 불가능한 오류가 발생했습니다.\n\n이 애플리케이션을 닫고, Powershell이나 명령 프롬프트를 열어 아래 명령을 실행하십히오:\n';

  @override
  String get installationSlidesDone => '모두 설정되었습니다. 우분투 WSL 사용을 즐겨주세요';

  @override
  String get installationSlidesExitTitle => '정말로 떠나시겠습니까?';

  @override
  String get installationSlidesExitContents => '이 창을 닫아도 설치는 백그라운드에서 계속 진행됩니다.\n\n또한 우분투 WSl로 할 수 있는 작업을 계속 탐색해 보실 수 있습니다.';

  @override
  String get installationSlidesCustomExitTitle => '거의 다 되었습니다';

  @override
  String get installationSlidesCustomExitContents => '주 설치 프로그램 창에서 완료할 몇 가지 단계가 있습니다.\n이 창을 닫고 이동하시겠습니까?';

  @override
  String get installationSlidesOk => '예';

  @override
  String get installationSlidesLeave => '떠나기';

  @override
  String get installationSlidesCancel => '취소';

  @override
  String get installationSlidesUbuntuOnWsl => '우분투 WSL';

  @override
  String get installationSlidesUbuntuOnWslText => '리눅스 애플리케이션 개발 및 실행을 위해 Windows와 긴밀하게 통합된 완전한 우분투 환경. 클라우드, 웹, 데이터 과학, IOT 및 재미에 최적화 되었습니다!';

  @override
  String get installationSlidesUbuntuWslWebDev => '웹 개발을 위한\n우분투 WSL';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'VS Code와 IntelliJ 를 포함한 네이티브 Windows IDE를 사용하여 WSL에서 개발하고 완전한 NodeJS 및 Ruby 지원의 이점을 누리십시오.';

  @override
  String get installationSlidesUbuntuWslDataScience => '데이터 과학을 위한 우분투 WSL';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack은 네이티브 Windows NVIDIA 드라이버를 기반으로 데이터 과학과 기계 학습 프로젝트 성능을 극대화 할 수 있도록 해 줍니다.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'GUI 앱을 위한\n우분투 WSl';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => '다중 플랫폼 개발을 위해 WSLg를 사용하여 Linux에서 웹 및 GUI 애플리케이션을 개발하고 미리 봅니다.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'DevOps를 위한 우분투 WSL';

  @override
  String get installationSlidesUbuntuWslDevOpsText => '우분투 프로덕션 환경에 게시하기 전에 우분투 WSL로 로컬에서 개발하여 CI/CD 파이프라인 호환성을 확실히 합니다';

  @override
  String get installationSlidesUbuntuWslEnterprises => '기업용 우분투 WSL';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => '인증된 우분투 LTS로\n기업용 Windows 생태계\n개발자들에게 힘을 실어주십시오.';

  @override
  String get installationSlidesFindOutMore => '더 알아보기';

  @override
  String get installationSlidesFindOutMoreVisit => '웹사이트 ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' 을 방문하여 우분투 WSL과 캐노니컬에서 어떻게 개발자와 조직을 지원하는지 알아 보십시오.';
}
