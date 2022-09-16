import 'app_localizations.dart';

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Ukončit';

  @override
  String get finishButton => 'Dokončit';

  @override
  String get saveButton => 'Uložit';

  @override
  String get setupButton => 'Nastavení';

  @override
  String get selectLanguageTitle => 'Vyberte svůj jazyk';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'Nastavení profilu';

  @override
  String get profileSetupHeader => 'Vytvořte výchozí UNIXový uživatelský účet. Podrobnosti naleznete na: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Vaše jméno';

  @override
  String get profileSetupRealnameRequired => 'Jméno je třeba vyplnit';

  @override
  String get profileSetupUsernameHint => 'Zvolte si uživatelské jméno';

  @override
  String get profileSetupUsernameHelper => 'Uživatelské jméno může být jiné než to, které máte v systému Windows.';

  @override
  String get profileSetupPasswordHint => 'Zvolte si heslo';

  @override
  String get profileSetupConfirmPasswordHint => 'Zopakujte zadání hesla (prevence překlepu)';

  @override
  String get profileSetupShowAdvancedOptions => 'Na následující stránce zobrazit pokročilé možnosti';

  @override
  String get profileSetupPasswordMismatch => 'Do každé z kolonek pro heslo jste napsali něco jiného';

  @override
  String get profileSetupUsernameRequired => 'Je třeba vyplnit uživatelské jméno';

  @override
  String get profileSetupUsernameInvalid => 'Dané uživatelské jméno nelze použít (nepovolené znaky)';

  @override
  String get profileSetupUsernameInUse => 'Takové uživatelské jméno už existuje.';

  @override
  String get profileSetupUsernameSystemReserved => 'Takové jméno je rezervováno pro využití systémem.';

  @override
  String get profileSetupUsernameTooLong => 'Takové jméno je příliš dlouhé.';

  @override
  String get profileSetupUsernameInvalidChars => 'Takové jméno obsahuje neplatné znaky.';

  @override
  String get profileSetupPasswordRequired => 'Je zapotřebí vyplnit heslo';

  @override
  String get advancedSetupTitle => 'Pokročilé nastavení';

  @override
  String get advancedSetupHeader => 'Na této stránce je možné přizpůsobit si Ubuntu WLS pro své potřeby.';

  @override
  String get advancedSetupMountLocationHint => 'Kam připojit (mount)';

  @override
  String get advancedSetupMountLocationHelper => 'Umístění pro automatické připojování (automount)';

  @override
  String get advancedSetupMountLocationInvalid => 'Dané umístění není platné';

  @override
  String get advancedSetupMountOptionHint => 'Parametry pro připojení';

  @override
  String get advancedSetupMountOptionHelper => 'Parametry pro připojení, předávané automatickému připojování';

  @override
  String get advancedSetupHostGenerationTitle => 'Vytvářet záznam s hostitelem';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Zaškrtnutí zapíná znovuvytváření /etc/hosts při každém spuštění.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Zapnout vytváření záznamů pro resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Zaškrtnutí zapíná znovuvytváření /etc/resolv.conf při každém spuštění.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Napojení na grafické uživatelské rozhraní';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Zaškrtnutí zapíná automatické nastavení proměnné prostředí DISPLAY. Pro využití je dále zapotřebí grafického X serveru třetí strany.';

  @override
  String get configurationUITitle => 'Nastavování Ubuntu WSL – pokročilé volby';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperabilita';

  @override
  String get configurationUIInteroperabilityTitle => 'Zapnuto';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Zda je zapnuta interoperabilita.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Připojit Windows popis umístění';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Zda bude připojen Windows popis umístění do proměnné prostředí PATH ve WSL';

  @override
  String get configurationUIAutoMountHeader => 'Automatické připojování';

  @override
  String get configurationUIAutoMountTitle => 'Zapnuto';

  @override
  String get configurationUIAutoMountSubtitle => 'Zda zapnout funkci automatického připojování. Ta umožňuje do WSL připojit disk z Windows.';

  @override
  String get configurationUIMountFstabTitle => 'Připojit podle /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Zda bude připojeno podle /etc/fstab. Tento soubor obsahuje informace o souborových systémech, které operační systém připojuje.';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTÁLNÍ – Systemd';

  @override
  String get configurationUISystemdTitle => 'Zapnuto';

  @override
  String get configurationUISystemdSubtitle => 'Zda má být systemd spouštěn při startu systému. VÝSTRAHA: Toto je experimentální funkce.';

  @override
  String get applyingChanges => 'Uplatňování změn…';

  @override
  String get applyingChangesDisclaimer => 'Toto může několik minut trvat, v závislosti na rychlosti vašeho připojení k Internetu.';

  @override
  String get setupCompleteTitle => 'Nastavení dokončena';

  @override
  String setupCompleteHeader(Object user) {
    return 'Zdravíme $user,\nÚspěšně jste dokončili nastavení.';
  }

  @override
  String get setupCompleteUpdate => 'Doporučujeme spustit následující příkaz a zaktualizovat tak Ubuntu na nejnovější verzi:';

  @override
  String get setupCompleteRestart => '* Veškerá nastavení se projeví až po restartu Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Launching distro...';

  @override
  String get installationSlidesErrorMsg => 'Something went wrong.';

  @override
  String get installationSlidesErrorTitle => 'Something went wrong';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'Ok';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'Cancel';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
