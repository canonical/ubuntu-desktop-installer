


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
