


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
  String get welcome => 'Welcome to Ubuntu WSL';

  @override
  String get initializing => 'Initializing...';

  @override
  String get unpacking => 'Unpacking the distro';

  @override
  String get installing => 'Almost done. The installer will require your attention soon.';

  @override
  String get launching => 'Launching distro...';

  @override
  String get errorMsg => 'Something went wrong.';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get errorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get done => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get exitTitle => 'Are you sure you want to leave?';

  @override
  String get exitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get customExitTitle => 'We are almost done';

  @override
  String get customExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Leave';

  @override
  String get cancel => 'Cancel';

  @override
  String get ubuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get ubuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get ubuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get ubuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get ubuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get findOutMore => 'Find out more';

  @override
  String get findOutMoreVisit => 'Visit ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
