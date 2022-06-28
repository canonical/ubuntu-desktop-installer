


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
  String get configurationUIInteroperabilitySubtitle => 'Engedélyezve van-e az átjárhatóság.';

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
