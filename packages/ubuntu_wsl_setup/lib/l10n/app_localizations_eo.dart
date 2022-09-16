import 'app_localizations.dart';

/// The translations for Esperanto (`eo`).
class AppLocalizationsEo extends AppLocalizations {
  AppLocalizationsEo([String locale = 'eo']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Foriri';

  @override
  String get finishButton => 'Fini';

  @override
  String get saveButton => 'Konservi';

  @override
  String get setupButton => 'Agordi';

  @override
  String get selectLanguageTitle => 'Elektu vian lingvon';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'Agordi profilon';

  @override
  String get profileSetupHeader => 'Bonvolu krei implicitan Uniksan konton. Por pliaj informoj, vizitu la paĝon <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Via nomo';

  @override
  String get profileSetupRealnameRequired => 'Nomo bezoniĝas';

  @override
  String get profileSetupUsernameHint => 'Elektu salutnomon';

  @override
  String get profileSetupUsernameHelper => 'La salutnomo ne devas kongrui kun via salutnomo por Windows.';

  @override
  String get profileSetupPasswordHint => 'Elektu pasvorton';

  @override
  String get profileSetupConfirmPasswordHint => 'Konfirmu vian pasvorton';

  @override
  String get profileSetupShowAdvancedOptions => 'Montri altnivelajn opciojn sur la sekva paĝo';

  @override
  String get profileSetupPasswordMismatch => 'La pasvortoj ne kongruas';

  @override
  String get profileSetupUsernameRequired => 'Salutnomo bezoniĝas';

  @override
  String get profileSetupUsernameInvalid => 'La salutnomo ne validas';

  @override
  String get profileSetupUsernameInUse => 'Tiu salutnomo jam ekzistas.';

  @override
  String get profileSetupUsernameSystemReserved => 'Tiu salutnomo estas rezervita por sistema uzado.';

  @override
  String get profileSetupUsernameTooLong => 'Tiu salutnomo estas tro longa.';

  @override
  String get profileSetupUsernameInvalidChars => 'Tiu salutnomo enhavas nevalidajn signojn.';

  @override
  String get profileSetupPasswordRequired => 'Pasvorto bezoniĝas';

  @override
  String get advancedSetupTitle => 'Altnivela agordado';

  @override
  String get advancedSetupHeader => 'Per ĉi tiu paĝo, vi povas laŭbezone agordi Ubuntu sur Windows-Subsistemo por Linux.';

  @override
  String get advancedSetupMountLocationHint => 'Surmeta loko';

  @override
  String get advancedSetupMountLocationHelper => 'Loko de la aŭtomata surmeto';

  @override
  String get advancedSetupMountLocationInvalid => 'La loko ne validas';

  @override
  String get advancedSetupMountOptionHint => 'Opcioj pri surmetado';

  @override
  String get advancedSetupMountOptionHelper => 'Opcioj pri surmetado donotaj al la komando de aŭtomata surmetado';

  @override
  String get advancedSetupHostGenerationTitle => 'Aŭtomate faradi dosieron de gastigantoj';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Aŭtomate refari la dosieron /etc/hosts post ĉiu starto.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Aŭtomate faradi resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Aŭtomate refari la dosieron /etc/resolv.conf post ĉiu starto.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Integrado de grafika fasado';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Ĉi tiu opcio ebligas aŭtomatan agordadon de la medivariablo DISPLAY. Postulas triapartian X-servilon.';

  @override
  String get configurationUITitle => 'Agordado de Ubuntu sur Windows-Subsistemo por Linux – Opcioj por spertuloj';

  @override
  String get configurationUIInteroperabilityHeader => 'Kunfunkciado';

  @override
  String get configurationUIInteroperabilityTitle => 'Ŝaltita';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Ĉu ŝalti Kunfunkciadon.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Postmeti vojprefikson de Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Ĉu postglui la medivariablon «Path» de Windows al la medivariablo «PATH» de Windows-subsistemo por Linux';

  @override
  String get configurationUIAutoMountHeader => 'Aŭtomata Surmeto';

  @override
  String get configurationUIAutoMountTitle => 'Ŝaltita';

  @override
  String get configurationUIAutoMountSubtitle => 'Ĉu aŭtomate surmenti diskojn. Ĉi tiu funkcio ebligas surmetadon de Windows-disko por Windows-Subsistemo por Linux.';

  @override
  String get configurationUIMountFstabTitle => 'Surmeti /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Ĉu surmeti /etc/fstab. Ĉi tiu dosiero enhavas informojn pri la surmetotaj dosiersistemoj.';

  @override
  String get configurationUISystemdHeader => 'EKSPERIMENTA – systemd';

  @override
  String get configurationUISystemdTitle => 'Ŝaltita';

  @override
  String get configurationUISystemdSubtitle => 'Ĉu aktivigi systemd dum startigo de komputilo. AVERTO: Ĉi tio estas eksperimenta funkcio.';

  @override
  String get applyingChanges => 'Efektivigante ŝanĝojn…';

  @override
  String get applyingChangesDisclaimer => 'Tio eble daŭros kelkajn minutojn depende de via Interreta konekto.';

  @override
  String get setupCompleteTitle => 'Instalado finiĝis';

  @override
  String setupCompleteHeader(Object user) {
    return 'Saluton $user,\nVi sukcese finis la instaladon.';
  }

  @override
  String get setupCompleteUpdate => 'Ni konsilas vin ruli la jenan komandon por ĝisdatigi Ubuntu al la plej nova versio:';

  @override
  String get setupCompleteRestart => '* Ĉiuj agordoj estos efektivaj post restarto de Ubuntu.';

  @override
  String get installationSlidesWelcome => 'Bonvenon al Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Praŝargante…';

  @override
  String get installationSlidesUnpacking => 'Elpakante la mastruman sistemon';

  @override
  String get installationSlidesInstalling => 'Preskaŭ kompleta. La instalilo postulos vian atenton baldaŭ.';

  @override
  String get installationSlidesLaunching => 'Lanĉante mastruman sistemon…';

  @override
  String get installationSlidesErrorMsg => 'Io fuŝiĝis.';

  @override
  String get installationSlidesErrorTitle => 'Io fuŝiĝis';

  @override
  String get installationSlidesErrorSub => 'Bonvolu relanĉi WSL per la jena komando kaj reprovi:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nNeriparebla eraro okazis.\n\nBonvolu fermi ĉi tiun instalilon, lanĉi PowerShell aŭ la terminalon kaj ruli la jenajn komandojn:\n';

  @override
  String get installationSlidesDone => 'Ĉio pretas. Ĝuu Ubuntu sur WSL';

  @override
  String get installationSlidesExitTitle => 'Ĉu vi certe volas forlasi?';

  @override
  String get installationSlidesExitContents => 'Fermi ĉi tiun fenestron ne ĉesigos la instaladon en la fono.\n\nKrome, vi povas daŭre esplori tion, kion vi povos fari per Ubuntu WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'Preskaŭ kompleta';

  @override
  String get installationSlidesCustomExitContents => 'Nur kelkaj paŝoj restas en la instalila ĉeffenestro.\nĈu mi povas forlasi ĉi tiun kaj iri tien?';

  @override
  String get installationSlidesOk => 'Bone';

  @override
  String get installationSlidesLeave => 'Forlasi';

  @override
  String get installationSlidesCancel => 'Nuligi';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu sur WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'Plena medio de Ubuntu, profunde integrita kun Windows, por programado kaj rulado de programoj por Linux. Optimumigita por nubo, reto, datenscienco, Interreto de Aĵoj kaj amuzo!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL por\nReta programado';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Programu en WSL per programistaj medioj indiĝenaj sur Windows, inkluzive de VS Code kaj IntelliJ; ĝuu plenan subtenon de Node.js kaj Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL por Datenscienco';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'La Datenscienca Stako de Nvidia ebligas al vi maksimumigi la rendimenton de datensciencaj kaj maŝinlernadaj projektoj per zorgiloj de Nvidia indiĝenaj sur Windows.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL por\nGrafikaj programoj';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Programu kaj antaŭrigardu retajn kaj grafikajn programojn sur Linux uzante WSLg por plurplatforma programado.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL por Disvolvoperacioj';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Certigu kongruecon kun duktoj por kontinua integrado/liverado programante sur Ubuntu WSL loke antaŭ ol liveri al produkta medio sur Ubuntu';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL por Entreprenoj';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Povigu programistojn en entreprena\nekosistemo sur Windows per garantiita\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Eltrovu plu';

  @override
  String get installationSlidesFindOutMoreVisit => 'Vizitu ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' por eltrovi plu pri Ubuntu WSL kaj kiel Canonical subtenas programistojn kaj organizaĵojn.';
}
