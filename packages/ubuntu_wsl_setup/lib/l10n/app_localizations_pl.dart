import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Wyjdź';

  @override
  String get finishButton => 'Zakończ';

  @override
  String get saveButton => 'Zapisz';

  @override
  String get setupButton => 'Konfiguracja';

  @override
  String get selectLanguageTitle => 'Wybierz swój język';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'Konfiguracja profilu';

  @override
  String get profileSetupHeader => 'Utwórz domyślne konto użytkownika systemu UNIX. Aby uzyskać więcej informacji, odwiedź: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Twoje imię i nazwisko';

  @override
  String get profileSetupRealnameRequired => 'Wymagane jest podanie imienia i nazwiska';

  @override
  String get profileSetupUsernameHint => 'Wybierz nazwę użytkownika';

  @override
  String get profileSetupUsernameHelper => 'Nazwa użytkownika nie musi być zgodna z nazwą użytkownika systemu Windows.';

  @override
  String get profileSetupPasswordHint => 'Wybierz hasło';

  @override
  String get profileSetupConfirmPasswordHint => 'Potwierdź swoje hasło';

  @override
  String get profileSetupShowAdvancedOptions => 'Pokaż opcje zaawansowane na następnej stronie';

  @override
  String get profileSetupPasswordMismatch => 'Hasła nie są zgodne';

  @override
  String get profileSetupUsernameRequired => 'Wymagane jest podanie nazwy użytkownika';

  @override
  String get profileSetupUsernameInvalid => 'Nazwa użytkownika jest nieprawidłowa';

  @override
  String get profileSetupUsernameInUse => 'Ta nazwa użytkownika już istnieje.';

  @override
  String get profileSetupUsernameSystemReserved => 'Ta nazwa jest zarezerwowana na użytek systemu.';

  @override
  String get profileSetupUsernameTooLong => 'Ta nazwa jest za długa.';

  @override
  String get profileSetupUsernameInvalidChars => 'Ta nazwa zawiera nieprawidłowe znaki.';

  @override
  String get profileSetupPasswordRequired => 'Wymagane jest podanie hasła';

  @override
  String get advancedSetupTitle => 'Konfiguracja zaawansowana';

  @override
  String get advancedSetupHeader => 'Na tej stronie możesz dostosować Ubuntu WSL do swoich potrzeb.';

  @override
  String get advancedSetupMountLocationHint => 'Położenie montowania';

  @override
  String get advancedSetupMountLocationHelper => 'Położenie automatycznego montowania';

  @override
  String get advancedSetupMountLocationInvalid => 'Położenie jest nieprawidłowe';

  @override
  String get advancedSetupMountOptionHint => 'Opcja montowania';

  @override
  String get advancedSetupMountOptionHelper => 'Opcja montowania przekazana automatycznemu montowaniu';

  @override
  String get advancedSetupHostGenerationTitle => 'Włącz generowanie pliku hosts';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Wybór włącza ponowne generowanie /etc/hosts przy każdym uruchomieniu.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Włącz generowanie pliku resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Wybór włącza ponowne generowanie /etc/resolv.conf przy każdym uruchomieniu.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Integracja interfejsu graficznego';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Wybór włącza automatyczną konfigurację środowiska DISPLAY. Wymagany jest serwer X innego dostawcy.';

  @override
  String get configurationUITitle => 'Konfiguracja Ubuntu WSL – Opcje zaawansowane';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperacyjność';

  @override
  String get configurationUIInteroperabilityTitle => 'Włączona';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Określa, czy interoperacyjność jest włączona.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Dołącz ścieżkę systemu Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Określa, czy ścieżka systemu Windows zostanie dołączona do zmiennej środowiskowej PATH w WSL';

  @override
  String get configurationUIAutoMountHeader => 'Automatyczne montowanie';

  @override
  String get configurationUIAutoMountTitle => 'Włączone';

  @override
  String get configurationUIAutoMountSubtitle => 'Określa, czy funkcja automatycznego montowania jest włączona. Ta funkcja umożliwia montowanie napędu Windows w WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Montuj /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Określa, czy /etc/fstab będzie montowany. Ten plik zawiera informacje o systemach plików do zamontowania przez system.';

  @override
  String get configurationUISystemdHeader => 'EKSPERYMENTALNA – Systemd';

  @override
  String get configurationUISystemdTitle => 'Włączony';

  @override
  String get configurationUISystemdSubtitle => 'Określa, czy systemd powinien być uruchamiany podczas rozruchu. UWAGA: jest to funkcja eksperymentalna.';

  @override
  String get applyingChanges => 'Stosowanie zmian…';

  @override
  String get applyingChangesDisclaimer => 'Może to potrwać kilka minut w zależności od połączenia internetowego.';

  @override
  String get setupCompleteTitle => 'Konfiguracja zakończona';

  @override
  String setupCompleteHeader(Object user) {
    return 'Cześć, $user!\nPomyślnie zakończono konfigurację.';
  }

  @override
  String get setupCompleteUpdate => 'Sugerowane jest uruchomienie następującego polecenia, aby zaktualizować system Ubuntu do najnowszej wersji:';

  @override
  String get setupCompleteRestart => '* Wszystkie ustawienia zaczną obowiązywać po ponownym uruchomieniu systemu Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Witamy w Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Inicjowanie...';

  @override
  String get installationSlidesUnpacking => 'Rozpakowywanie dystrybucji';

  @override
  String get installationSlidesInstalling => 'Prawie skończone. Instalator wkrótce będzie wymagał Twojej uwagi.';

  @override
  String get installationSlidesLaunching => 'Uruchamianie dystrybucji...';

  @override
  String get installationSlidesErrorMsg => 'Coś poszło nie tak.';

  @override
  String get installationSlidesErrorTitle => 'Coś poszło nie tak';

  @override
  String get installationSlidesErrorSub => 'Uruchom ponownie WSL za pomocą następującego polecenia i spróbuj ponownie:\n\twsl --shutdown\n\twsl --unregister NAZWA_DYSTRYBUCJI';

  @override
  String get installationSlidesErrorText => '\nWystąpił nieodwracalny błąd.\n\nZamknij tę aplikację, otwórz PowerShell lub wiersz poleceń i wydaj następujące polecenia:\n';

  @override
  String get installationSlidesDone => 'Wszystko gotowe. Ciesz się używaniem Ubuntu na WSL';

  @override
  String get installationSlidesExitTitle => 'Czy na pewno chcesz wyjść?';

  @override
  String get installationSlidesExitContents => 'Zamknięcie tego okna nie przeszkodzi w kontynuowaniu instalacji w tle.\n\nPoza tym możesz kontynuować eksplorację tego, co można zrobić z Ubuntu na WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Prawie skończyliśmy';

  @override
  String get installationSlidesCustomExitContents => 'Jeszcze tylko kilka kroków do wykonania w głównym oknie instalatora.\nCzy możemy zrezygnować z tego i przejść tam?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Opuść';

  @override
  String get installationSlidesCancel => 'Anuluj';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu na WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Pełne środowisko Ubuntu, głęboko zintegrowane z systemem Windows, do tworzenia i wykonywania aplikacji linuksowych. Zoptymalizowane pod kątem chmury, Internetu, nauki o danych, IOT i zabawy!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL do\ntworzenia stron internetowych';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Twórz w WSL przy użyciu natywnych środowisk IDE systemu Windows, w tym VS Code i IntelliJ, oraz korzystaj z pełnej obsługi NodeJS i Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL do nauki o danych';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack pozwala zmaksymalizować wydajność projektów Data Science i Machine Learning dzięki natywnym sterownikom NVIDIA dla systemu Windows.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL do\naplikacji graficznych';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Rozwijaj i przeglądaj aplikacje internetowe i graficzne na Linuksie przy użyciu WSLg do rozwoju wieloplatformowego.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL do DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Zapewnij zgodność potoku CI/CD, tworząc lokalnie na Ubuntu WSL przed opublikowaniem w środowisku produkcyjnym Ubuntu';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL dla przedsiębiorstw';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Wzmocnij programistów w ekosystemie\nkorporacyjnym Windows dzięki\ncertyfikowanemu Ubuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Dowiedz się więcej';

  @override
  String get installationSlidesFindOutMoreVisit => 'Odwiedź ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl,';

  @override
  String get installationSlidesFindOutMoreText => ' aby dowiedzieć się więcej o Ubuntu na WSL oraz o tym, jak Canonical wspiera programistów i organizacje.';
}
