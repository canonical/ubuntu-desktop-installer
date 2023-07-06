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
}
