


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
  String get profileSetupUsernameInUse => 'That username already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

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
  String get configurationUIMountFstabSubtitle => 'Az /etc/fstab állomány fel lesz csatolva. Az /etc/fstab konfigurációs fájl tartalmazza????';

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
}
