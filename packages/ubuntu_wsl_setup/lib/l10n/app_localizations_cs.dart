


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
  String get profileSetupUsernameInUse => 'That user name already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

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
  String get configurationUIMountFstabSubtitle => 'Zda bude připojeno podle /etc/fstab. Soubor s nastaveními /etc/fstab obsahuje???';

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
}
