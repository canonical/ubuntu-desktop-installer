import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Kilépés';

  @override
  String get finishButton => 'Befejezés';

  @override
  String get saveButton => 'Mentés';

  @override
  String get setupButton => 'Beállítás';

  @override
  String get selectLanguageTitle => 'Válassza ki a nyelvet';

  @override
  String installLangPacksTitle(String lang) {
    return 'Telepítsen csomagokat a jobb $lang nyelvi támogatáshoz';
  }

  @override
  String get installLangPacksSubtitle => 'Lassú kapcsolatok esetén nem ajánlott.';

  @override
  String get profileSetupTitle => 'Profil beállítása';

  @override
  String get profileSetupHeader => 'Kérjük, hozzon létre egy alapértelmezett UNIX felhasználói fiókot. További információért látogasson el a következő weboldalra: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Az Ön neve';

  @override
  String get profileSetupRealnameRequired => 'Név megadása kötelező';

  @override
  String get profileSetupUsernameHint => 'Válasszon egy felhasználónevet';

  @override
  String get profileSetupUsernameHelper => 'A felhasználónévnek nem kell megegyeznie a Windows felhasználónévvel.';

  @override
  String get profileSetupPasswordHint => 'Válasszon jelszót';

  @override
  String get profileSetupConfirmPasswordHint => 'Jelszó megerősítése';

  @override
  String get profileSetupShowAdvancedOptions => 'Speciális beállítások megjelenítése következő oldalon';

  @override
  String get profileSetupPasswordMismatch => 'A jelszavak nem egyeznek';

  @override
  String get profileSetupUsernameRequired => 'Felhasználónév megadása kötelező';

  @override
  String get profileSetupUsernameInvalid => 'A felhasználónév érvénytelen';

  @override
  String get profileSetupUsernameInUse => 'Ez a felhasználónév már létezik.';

  @override
  String get profileSetupUsernameSystemReserved => 'Ez a név a rendszer használatára van fenntartva.';

  @override
  String get profileSetupUsernameTooLong => 'Ez a név túl hosszú.';

  @override
  String get profileSetupUsernameInvalidChars => 'Ez a név érvénytelen karaktereket tartalmaz.';

  @override
  String get profileSetupPasswordRequired => 'Jelszó szükséges';

  @override
  String get advancedSetupTitle => 'Speciális beállítás';

  @override
  String get advancedSetupHeader => 'Ezen az oldalon az Ubuntu WSL-t a saját igényeihez igazíthatja.';

  @override
  String get advancedSetupMountLocationHint => 'Csatlakoztatás helye';

  @override
  String get advancedSetupMountLocationHelper => 'Automatikus csatlakoztatás helye';

  @override
  String get advancedSetupMountLocationInvalid => 'A hely érvénytelen';

  @override
  String get advancedSetupMountOptionHint => 'Csatlakoztatási lehetőség';

  @override
  String get advancedSetupMountOptionHelper => 'Automatikus csatlakozáshoz átadott csatlakoztatási lehetőség';

  @override
  String get advancedSetupHostGenerationTitle => 'Host generálás engedélyezése';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Ha ezt választja, az /etc/hosts állományt minden indításkor újragenerálja.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'A resolv.conf generálás engedélyezése';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Ha ezt választja, az /etc/resolv.conf állományt minden indításkor újragenerálja.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI integráció';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'A kiválasztás lehetővé teszi a DISPLAY környezet automatikus beállítását. Harmadik féltől származó X-kiszolgáló szükséges.';

  @override
  String get configurationUITitle => 'Ubuntu WSL konfiguráció - Speciális beállítások';

  @override
  String get configurationUIInteroperabilityHeader => 'Átjárhatóság';

  @override
  String get configurationUIInteroperabilityTitle => 'Engedélyezve';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Az átjárhatóság engedélyezve van-e.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Windows elérési útvonal hozzáadása';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'A Windows elérési útvonal hozzá lesz-e csatolva a WSL PATH környezeti változójához';

  @override
  String get configurationUIAutoMountHeader => 'Automatikus csatlakoztatás';

  @override
  String get configurationUIAutoMountTitle => 'Engedélyezve';

  @override
  String get configurationUIAutoMountSubtitle => 'Az automatikus rögzítés funkció engedélyezve van-e. Ez a funkció lehetővé teszi a Windows-meghajtó csatlakoztatását a WSL-ben.';

  @override
  String get configurationUIMountFstabTitle => 'Csatlakoztatás /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Az /etc/fstab állomány fel lesz csatolva. Az /etc/fstab konfigurációs fájl tartalmazza.';

  @override
  String get configurationUISystemdHeader => 'KÍSÉRLETI - Systemd';

  @override
  String get configurationUISystemdTitle => 'Engedélyezve';

  @override
  String get configurationUISystemdSubtitle => 'A systemd aktiválódjon-e a rendszerindításkor. FIGYELEM: Ez egy kísérleti funkció.';

  @override
  String get applyingChanges => 'Módosítások alkalmazása…';

  @override
  String get applyingChangesDisclaimer => 'Ez az internetkapcsolattól függően több percet is igénybe vehet.';

  @override
  String get setupCompleteTitle => 'Beállítás befejezve';

  @override
  String setupCompleteHeader(Object user) {
    return 'Üdv $user,\nSikeresen elvégezte a beállítást.';
  }

  @override
  String get setupCompleteUpdate => 'Javasoljuk, hogy az Ubuntu legújabb verzióra való frissítéséhez futtassa a következő parancsot:';

  @override
  String get setupCompleteRestart => '* Minden beállítás az Ubuntu újraindítása után lép hatályba.';

  @override
  String get installationSlidesWelcome => 'Üdvözli az Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Inicializálás...';

  @override
  String get installationSlidesUnpacking => 'A disztró kicsomagolása';

  @override
  String get installationSlidesInstalling => 'Majdnem kész. A telepítő hamarosan igényelni fogja a figyelmét.';

  @override
  String get installationSlidesLaunching => 'A disztribúció elindítása...';

  @override
  String get installationSlidesErrorMsg => 'Valami rosszul sült el.';

  @override
  String get installationSlidesErrorTitle => 'Valami rosszul sült el';

  @override
  String get installationSlidesErrorSub => 'Kérjük, indítsa újra a WSL-t a következő paranccsal, és próbálja meg újra:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nVisszafordíthatatlan hiba történt.\n\nKérjük, zárja be ezt az alkalmazást, nyissa meg a Powershellt vagy a parancssort, és adja ki a következő parancsokat:\n';

  @override
  String get installationSlidesDone => 'Minden készen áll. Élvezze az Ubuntu használatát a WSL-en';

  @override
  String get installationSlidesExitTitle => 'Biztos, hogy el akarsz menni?';

  @override
  String get installationSlidesExitContents => 'Az ablak bezárása nem akadályozza meg, hogy a telepítés a háttérben folytatódjon.\n\nEmellett folytathatja a WSL-en az Ubuntuval kapcsolatos lehetőségek felfedezését.';

  @override
  String get installationSlidesCustomExitTitle => 'Már majdnem készen vagyunk';

  @override
  String get installationSlidesCustomExitContents => 'Csak néhány lépést kell elvégezni a fő telepítőablakban.\nKiléphetünk ebből, és mehetünk oda?';

  @override
  String get installationSlidesOk => 'Oké';

  @override
  String get installationSlidesLeave => 'Elhagy';

  @override
  String get installationSlidesCancel => 'Mégsem';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu a WSL-en';

  @override
  String get installationSlidesUbuntuOnWslText => 'Teljes Ubuntu környezet, amely mélyen integrálódik a Windowshoz, Linux alkalmazások fejlesztéséhez és futtatásához. Felhőre, webre, adattudományra, IOT-ra és szórakozásra optimalizálva!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL\nWebfejlesztés';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Fejlesszen WSL-ben natív Windows IDE-kkel, köztük a VS Code és az IntelliJ segítségével, és élvezze a teljes NodeJS és Ruby támogatás előnyeit.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL az adattudomány számára';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'Az NVIDIA Data Science Stack lehetővé teszi az adattudományi és gépi tanulási projektek teljesítményének maximalizálását a natív Windows NVIDIA illesztőprogramok mellett.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL\nGrafikus alkalmazások';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Webes és grafikus alkalmazások fejlesztése és előnézete Linuxon a WSLg segítségével a többplatformos fejlesztéshez.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL a DevOps számára';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'A CI/CD folyamatok kompatibilitásának biztosítása az Ubuntu WSL-en történő helyi fejlesztéssel az Ubuntu termelési környezetbe történő közzététel előtt';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL vállalatoknak';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'A fejlesztők felhatalmazása a Windows\nvállalati ökoszisztémában egy tanúsított\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Tudjon meg többet';

  @override
  String get installationSlidesFindOutMoreVisit => 'Látogasson el az oldalra. ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' hogy többet megtudjon az Ubuntu WSL-ről és arról, hogyan támogatja a Canonical a fejlesztőket és a szervezeteket.';
}
