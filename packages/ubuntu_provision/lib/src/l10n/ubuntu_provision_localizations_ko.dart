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
}
