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

  @override
  String get themePageTitle => 'Wybierz swój motyw';

  @override
  String get themePageHeader => 'Zawsze możesz zmienić to później w ustawieniach wyglądu.';

  @override
  String get themeDark => 'Ciemny';

  @override
  String get themeLight => 'Jasny';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Witaj w $DISTRO';
  }

  @override
  String get localeHeader => 'Wybierz swój język:';

  @override
  String get identityPageTitle => 'Skonfiguruj swoje konto';

  @override
  String get identityAutoLogin => 'Automatyczne logowanie';

  @override
  String get identityRequirePassword => 'Wymaganie hasła do zalogowania';

  @override
  String get identityRealNameLabel => 'Twoje imię i nazwisko';

  @override
  String get identityRealNameRequired => 'Wymagane jest podanie imienia i nazwiska';

  @override
  String get identityRealNameTooLong => 'To imię i nazwisko jest za długie.';

  @override
  String get identityHostnameLabel => 'Nazwa tego komputera';

  @override
  String get identityHostnameInfo => 'Określa nazwę komputera używaną podczas komunikacji z innymi komputerami.';

  @override
  String get identityHostnameRequired => 'Wymagane jest podanie nazwy komputera';

  @override
  String get identityHostnameTooLong => 'Ta nazwa komputera jest za długa.';

  @override
  String get identityInvalidHostname => 'Nazwa komputera jest nieprawidłowa';

  @override
  String get identityUsernameLabel => 'Wybierz nazwę użytkownika';

  @override
  String get identityUsernameRequired => 'Wymagane jest podanie nazwy użytkownika';

  @override
  String get identityInvalidUsername => 'Nazwa użytkownika jest nieprawidłowa';

  @override
  String get identityUsernameInUse => 'Ta nazwa użytkownika już istnieje.';

  @override
  String get identityUsernameSystemReserved => 'Ta nazwa jest zarezerwowana na użytek systemu.';

  @override
  String get identityUsernameTooLong => 'Ta nazwa jest za długa.';

  @override
  String get identityUsernameInvalidChars => 'Ta nazwa zawiera nieprawidłowe znaki.';

  @override
  String get identityPasswordLabel => 'Wybierz hasło';

  @override
  String get identityPasswordRequired => 'Wymagane jest podanie hasła';

  @override
  String get identityConfirmPasswordLabel => 'Potwierdź swoje hasło';

  @override
  String get identityPasswordMismatch => 'Hasła nie są zgodne';

  @override
  String get identityPasswordShow => 'Pokaż';

  @override
  String get identityPasswordHide => 'Ukryj';

  @override
  String get identityActiveDirectoryOption => 'Użyj Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'W kolejnym kroku podasz domenę i inne szczegóły.';
}
