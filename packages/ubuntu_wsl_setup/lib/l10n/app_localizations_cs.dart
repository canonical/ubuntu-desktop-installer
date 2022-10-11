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
    return 'Nainstalovat balíčky pro lepší podporu jazyka $lang';
  }

  @override
  String get installLangPacksSubtitle => 'Nedoporučováno pro pomalá připojení.';

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
    return 'Zdravíme $user,\ndokončili jste nastavení.';
  }

  @override
  String get setupCompleteUpdate => 'Doporučujeme spustit následující příkaz a zaktualizovat tak Ubuntu na nejnovější verzi:';

  @override
  String get setupCompleteRestart => '* Veškerá nastavení se projeví až po restartu Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Vítejte v Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Inicializace…';

  @override
  String get installationSlidesUnpacking => 'Rozbalování distribuce';

  @override
  String get installationSlidesInstalling => 'Téměř hotovo. Instalátor bude brzy vyžadovat vaši pozornost.';

  @override
  String get installationSlidesLaunching => 'Spouštění distribuce…';

  @override
  String get installationSlidesErrorMsg => 'Něco se pokazilo.';

  @override
  String get installationSlidesErrorTitle => 'Něco se pokazilo';

  @override
  String get installationSlidesErrorSub => 'Restartujte WSL pomocí následujících příkazů a zkuste to znovu:\n\twsl --shutdown\n\twsl --unregister NAZEV_DISTRIBUCE';

  @override
  String get installationSlidesErrorText => '\nDošlo k chybě, ze které se nelze zotavit.\n\nZavřete tuto aplikaci, otevřete Powershell nebo příkazový řádek a zadejte následující příkazy:\n';

  @override
  String get installationSlidesDone => 'Vše nastaveno. Užijte si používání Ubuntu na WSL';

  @override
  String get installationSlidesExitTitle => 'Opravdu chcete odejít?';

  @override
  String get installationSlidesExitContents => 'Zavření tohoto okna nebude bránit pokračování instalace na pozadí.\n\nKromě toho můžete pokračovat ve zkoumání možností Ubuntu na WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Jsme téměř hotovi';

  @override
  String get installationSlidesCustomExitContents => 'Už jen pár kroků k dokončení v hlavním okně instalátoru.\nMůžeme toto zavřít a přejít tam?';

  @override
  String get installationSlidesOk => 'OK';

  @override
  String get installationSlidesLeave => 'Odejít';

  @override
  String get installationSlidesCancel => 'Storno';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu na WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Úplné prostředí Ubuntu, dobře napojené na Windows, pro vývoj a spouštění linuxových aplikací. Optimalizováno pro cloud, web, datové vědy, IoT a zábavu!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL pro\nvývoj pro web';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Vyvíjejte ve WSL pomocí nativních vývojářských prostředí (IDE) pro Windows, včetně VS Code a InteliJ a mějte prospěch z úplné podpory NodeJS a Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL pro datové vědy';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack umožňuje maximalizovat výkon projektů pro datové vědy a strojové učení nad nativními NVIDIA ovladači pro Windows.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL pro\ngrafické aplikace';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Vyvíjejte a zobrazujte si náhledy webových a grafických aplikací na Linuxu pomocí WSLg pro multiplatformní vývoj.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL pro DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Zajistěte kompatibilitu CI/CD procedur vyvíjením na Ubuntu WSL lokálně ještě před publikováním na produkční Ubuntu prostředí';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL pro podniky';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Podpořte vývojáře v podnikovém\nekosystému Windows pomocí\ncertifikovaného Ubuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Zjistit víc';

  @override
  String get installationSlidesFindOutMoreVisit => 'Navštivte ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' a zjistěte víc o Ubuntu na WSL a o tom, jak Canonical podporuje vývojáře a organizace.';
}
