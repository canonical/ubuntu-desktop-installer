import 'ubuntu_provision_localizations.dart';

/// The translations for Polish (`pl`).
class UbuntuProvisionLocalizationsPl extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get timezonePageTitle => 'Wybierz swoją strefę czasową';

  @override
  String get timezoneLocationLabel => 'Lokalizacja';

  @override
  String get timezoneTimezoneLabel => 'Strefa czasowa';

  @override
  String get keyboardTitle => 'Układ klawiatury';

  @override
  String get keyboardHeader => 'Wybierz układ klawiatury:';

  @override
  String get keyboardTestHint => 'Tutaj można wpisywać znaki, aby przetestować klawiaturę';

  @override
  String get keyboardDetectTitle => 'Wykryj układ klawiatury';

  @override
  String get keyboardDetectButton => 'Wykryj';

  @override
  String get keyboardVariantLabel => 'Wariant klawiatury:';

  @override
  String get keyboardPressKeyLabel => 'Proszę wcisnąć jeden z następujących klawiszy:';

  @override
  String get keyboardKeyPresentLabel => 'Czy ten klawisz występuje na klawiaturze?';
}
