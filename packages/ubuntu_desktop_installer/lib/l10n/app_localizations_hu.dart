


import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Ubuntu asztali telepítő';

  @override
  String windowTitle(Object RELEASE) {
    return 'Telepítés $RELEASE';
  }

  @override
  String get cancelButtonText => 'Mégse';

  @override
  String get changeButtonText => 'Csere';

  @override
  String get okButtonText => 'Ok';

  @override
  String get noButtonText => 'Nem';

  @override
  String get restartButtonText => 'Újraindítás';

  @override
  String get revertButtonText => 'Vissza';

  @override
  String get yesButtonText => 'Igen';

  @override
  String get welcome => 'Üdvözöljük';

  @override
  String get welcomeHeader => 'Válassza ki a nyelvet:';

  @override
  String get tryOrInstallPageTitle => 'Próbálja ki vagy telepítse';

  @override
  String get repairInstallation => 'Javító telepítés';

  @override
  String get repairInstallationDescription => 'A javítás újratelepíti az összes telepített szoftvert anélkül, hogy a dokumentumokat vagy beállításokat érintené.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Próbálja ki $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Kipróbálhatja a $RELEASE-t anélkül, hogy bármilyen változtatást végezne a számítógépén.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Telepítés $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Telepítse $RELEASE a jelenlegi operációs rendszere mellé (vagy helyett). Ez nem fog túl sokáig tartani.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Érdemes elolvasni a <a href=\"$url\">kiadási jegyzeteket</a>.';
  }

  @override
  String get turnOffRST => 'RST kikapcsolása';

  @override
  String get turnOffRSTDescription => 'Ez a számítógép Intel RST (Rapid Storage Technology) technológiát használ. Az RST-t ki kell kapcsolnia a Windowsban az Ubuntu telepítése előtt.';

  @override
  String instructionsForRST(Object url) {
    return 'Az utasításokért nyissa meg ezt az oldalt telefonon vagy más eszközön: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Billentyűzetkiosztás';

  @override
  String get chooseYourKeyboardLayout => 'Válassza ki a billentyűzetkiosztást:';

  @override
  String get typeToTest => 'Írja be ide a billentyűzet teszteléséhez';

  @override
  String get detectLayout => 'Billentyűzetkiosztás észlelése';

  @override
  String get pressOneKey => 'Kérjük, nyomja meg az alábbi billentyűk egyikét:';

  @override
  String get isKeyPresent => 'A következő billentyű jelen van a billentyűzeten?';

  @override
  String get configureSecureBootTitle => 'Biztonságos rendszerindítás konfigurálása';

  @override
  String get configureSecureBootDescription => 'Ön úgy döntött, hogy harmadik féltől származó illesztőprogramot telepít. Ehhez ki kell kapcsolni a Secure Boot funkciót.\nEhhez most ki kell választania egy biztonsági kulcsot, és azt a rendszer újraindításakor meg kell adnia.';

  @override
  String get configureSecureBootOption => 'Secure Boot konfigurálása';

  @override
  String get chooseSecurityKey => 'Biztonsági kulcs kiválasztása';

  @override
  String get confirmSecurityKey => 'Erősítse meg a biztonsági kulcsot';

  @override
  String get dontInstallDriverSoftwareNow => 'Egyelőre ne telepítse az illesztőprogramot';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Később telepítheti a Szoftver & Frissítések menüpontból.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Biztonsági kulcs szükséges';

  @override
  String get secureBootSecurityKeysDontMatch => 'A biztonsági kulcsok nem egyeznek';

  @override
  String get connectToInternetPageTitle => 'Csatlakozás az internethez';

  @override
  String get connectToInternetDescription => 'Ha csatlakoztatja a számítógépet az internethez, az Ubuntu telepít minden szükséges extra szoftvert, és segít kiválasztani az időzónát.\n\nCsatlakozás ethernet-kábellel, vagy válasszon Wi-Fi hálózatot';

  @override
  String get useWiredConnection => 'Vezetékes kapcsolat használata';

  @override
  String get noWiredConnection => 'Nincs vezetékes kapcsolat észlelve';

  @override
  String get wiredDisabled => 'A vezetékes kapcsolat ki van kapcsolva';

  @override
  String get wiredMustBeEnabled => 'Az ethernet használatához ezen a számítógépen engedélyezni kell a vezetékes kapcsolatot';

  @override
  String get enableWired => 'Vezetékes engedélyezése';

  @override
  String get selectWifiNetwork => 'Csatlakozás Wi-Fi hálózathoz';

  @override
  String get hiddenWifiNetwork => 'Csatlakozás rejtett Wi-Fi hálózathoz';

  @override
  String get hiddenWifiNetworkNameLabel => 'Hálózat neve';

  @override
  String get hiddenWifiNetworkNameRequired => 'Hálózati név szükséges';

  @override
  String get noInternet => 'Most nem akarok csatlakozni az internethez';

  @override
  String get wirelessNetworkingDisabled => 'Vezeték nélküli hálózat letiltva';

  @override
  String get noWifiDevicesDetected => 'Nincs észlelt Wi-Fi eszköz';

  @override
  String get wifiMustBeEnabled => 'A Wi-Fi használatához ezen a számítógépen engedélyezni kell a vezeték nélküli hálózatot';

  @override
  String get enableWifi => 'Wi-Fi engedélyezése';

  @override
  String get connectButtonText => 'Csatlakozás';

  @override
  String get updatesOtherSoftwarePageTitle => 'Frissítések és egyéb szoftverek';

  @override
  String get updatesOtherSoftwarePageDescription => 'Milyen alkalmazásokat szeretne telepíteni a kezdéshez?';

  @override
  String get normalInstallationTitle => 'Normál telepítés';

  @override
  String get normalInstallationSubtitle => 'Webböngésző, segédprogramok, irodai szoftverek, játékok és médialejátszók.';

  @override
  String get minimalInstallationTitle => 'Minimális telepítés';

  @override
  String get minimalInstallationSubtitle => 'Webböngésző és alapvető segédprogramok.';

  @override
  String get otherOptions => 'Egyéb lehetőségek';

  @override
  String get installThirdPartyTitle => 'Harmadik féltől származó szoftverek telepítése grafikus és Wi-Fi hardverekhez, valamint további médiaformátumokhoz';

  @override
  String get installThirdPartySubtitle => 'A szoftverre a dokumentációban szereplő licencfeltételek vonatkoznak. Egyesek védettek.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Figyelmeztetés</font>: A számítógép nincs csatlakoztatva áramforráshoz.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Biztonsági kulcs kiválasztása';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'A lemez titkosítása megvédi fájljait, ha elveszíti a számítógépét. A számítógép minden egyes indításakor meg kell adnia egy biztonsági kulcsot.\n\nA $RELEASE-n kívüli fájlok nem lesznek titkosítva.';
  }

  @override
  String get chooseSecurityKeyHint => 'Biztonsági kulcs kiválasztása';

  @override
  String get chooseSecurityKeyConfirmHint => 'Erősítse meg a biztonsági kulcsot';

  @override
  String get chooseSecurityKeyRequired => 'Biztonsági kulcs szükséges';

  @override
  String get chooseSecurityKeyMismatch => 'A biztonsági kulcsok nem egyeznek';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Figyelmeztetés</font>: Ha elveszíti ezt a biztonsági kulcsot, minden adat elveszik. Szükség esetén írja le a kulcsot, és tartsa máshol, biztonságos helyen.';
  }

  @override
  String get installationTypeTitle => 'Telepítés típusa';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Ezen a számítógépen jelenleg $os van. Mit szeretne tenni?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Ezen a számítógépen jelenleg $os1 és $os2 van. Mit szeretne tenni?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Ezen a számítógépen jelenleg több operációs rendszer van. Mit szeretne tenni?';

  @override
  String get installationTypeNoOSDetected => 'Ezen a számítógépen jelenleg nincs észlelt operációs rendszer. Mit szeretne tenni?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Lemez törlése és $DISTRO telepítése';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Figyelmeztetés:</font> Ez minden operációs rendszerben törli az összes programot, dokumentumot, fényképet, zenét és minden más fájlt.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Speciális funkciók...';

  @override
  String get installationTypeAdvancedTitle => 'Speciális funkciók';

  @override
  String get installationTypeNone => 'Nincs';

  @override
  String get installationTypeNoneSelected => 'Nincs kiválasztva';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'LVM használata az új $RELEASE telepítéssel';
  }

  @override
  String get installationTypeLVMSelected => 'LVM kiválasztva';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Az új $RELEASE telepítés titkosítása a biztonság érdekében';
  }

  @override
  String get installationTypeEncryptInfo => 'A biztonsági kulcsot a következő lépésben fogja kiválasztani.';

  @override
  String get installationTypeZFS => 'KÍSÉRLETI: Lemez törlése és ZFS használata';

  @override
  String get installationTypeZFSSelected => 'ZFS kiválasztva';

  @override
  String installationTypeReinstall(Object os) {
    return 'Törölje a $os és telepítse újra';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Figyelmeztetés:</font> Ez az összes $os programot, dokumentumot, fényképet, zenét és minden más fájlt törölni fog.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product telepítése a $os mellett';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Install $product alongside $os1 and $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Install $product alongside them';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Install $product alongside other partitions';
  }

  @override
  String get installationTypeAlongsideInfo => 'A dokumentumok, zenék és egyéb személyes fájlok megőrzésre kerülnek. A számítógép minden egyes indításakor kiválaszthatja, hogy melyik operációs rendszert szeretné használni.';

  @override
  String get installationTypeManual => 'Valami más';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'A partíciókat létrehozhatja vagy átméretezheti saját maga, vagy több partíciót is választhat $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Lemez törlése és $DISTRO telepítése';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Válassza ki a meghajtót:';

  @override
  String get selectGuidedStorageInfoLabel => 'A teljes lemez felhasználásra kerül:';

  @override
  String get selectGuidedStorageInstallNow => 'Telepítés most';

  @override
  String get installAlongsideSpaceDivider => 'Allocate drive space by dragging the divider below:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'Files';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Size:';

  @override
  String get installAlongsideAvailable => 'Available:';

  @override
  String get allocateDiskSpace => 'Lemezterület kiosztása';

  @override
  String get startInstallingButtonText => 'Telepítés megkezdése';

  @override
  String get diskHeadersDevice => 'Eszköz';

  @override
  String get diskHeadersType => 'Típus';

  @override
  String get diskHeadersMountPoint => 'Csatlakoztatási pont';

  @override
  String get diskHeadersSize => 'Méret';

  @override
  String get diskHeadersUsed => 'Használt';

  @override
  String get diskHeadersSystem => 'Rendszer';

  @override
  String get diskHeadersFormat => 'Formátum';

  @override
  String get freeDiskSpace => 'szabad hely';

  @override
  String get newPartitionTable => 'Új partíciós tábla';

  @override
  String get newPartitionTableConfirmationTitle => 'Új üres partíciós tábla létrehozása ezen az eszközön?';

  @override
  String get newPartitionTableConfirmationMessage => 'Egy teljes eszközt választott ki a particionáláshoz. Ha új partíciós táblát hoz létre az eszközön, akkor az összes jelenlegi partíciót eltávolítja.\n\nVegye figyelembe, hogy ezt a műveletet később vissza tudja vonni, ha szeretné.';

  @override
  String get bootLoaderDevice => 'Eszköz a rendszertöltő telepítéséhez';

  @override
  String get partitionCreateTitle => 'Partíció létrehozása';

  @override
  String get partitionEditTitle => 'Partíció szerkesztése';

  @override
  String get partitionSizeLabel => 'Méret:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Az új partíció típusa:';

  @override
  String get partitionTypePrimary => 'Elsődleges';

  @override
  String get partitionTypeLogical => 'Logikai';

  @override
  String get partitionLocationLabel => 'Az új partíció helye:';

  @override
  String get partitionLocationBeginning => 'A hely kezdete';

  @override
  String get partitionLocationEnd => 'A hely vége';

  @override
  String get partitionFormatLabel => 'Használt mint:';

  @override
  String get partitionFormatExt4 => 'Ext4 naplózó fájlrendszer';

  @override
  String get partitionFormatExt3 => 'Ext3 naplózó fájlrendszer';

  @override
  String get partitionFormatExt2 => 'Ext2 fájlrendszer';

  @override
  String get partitionFormatBtrfs => 'btrfs naplózó fájlrendszer';

  @override
  String get partitionFormatJfs => 'JFS naplózó fájlrendszer';

  @override
  String get partitionFormatXfs => 'XFS naplózó fájlrendszer';

  @override
  String get partitionFormatFat => 'FAT fájlrendszer';

  @override
  String get partitionFormatFat12 => 'FAT12 fájlrendszer';

  @override
  String get partitionFormatFat16 => 'FAT16 fájlrendszer';

  @override
  String get partitionFormatFat32 => 'FAT32 fájlrendszer';

  @override
  String get partitionFormatSwap => 'Swap terület';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 fájlrendszer';

  @override
  String get partitionFormatVfat => 'VFAT fájlrendszer';

  @override
  String get partitionFormatNtfs => 'NTFS fájlrendszer';

  @override
  String get partitionFormatReiserFS => 'ReiserFS fájlrendszer';

  @override
  String get partitionFormatZfsroot => 'ZFS gyökér fájlrendszer';

  @override
  String get partitionErase => 'A partíció formázása';

  @override
  String get partitionMountPointLabel => 'Csatlakoztatási pont:';

  @override
  String get whoAreYouPageTitle => 'Ki vagy te?';

  @override
  String get whoAreYouPageAutoLogin => 'Automatikus bejelentkezés';

  @override
  String get whoAreYouPageRequirePassword => 'Jelszavam kérése a bejelentkezéshez';

  @override
  String get whoAreYouPageRealNameLabel => 'Az Ön neve';

  @override
  String get whoAreYouPageRealNameRequired => 'Név megadása kötelező';

  @override
  String get whoAreYouPageComputerNameLabel => 'Az Ön számítógépének neve';

  @override
  String get whoAreYouPageComputerNameInfo => 'A név, amelyet akkor használ, amikor más számítógépekkel beszél.';

  @override
  String get whoAreYouPageComputerNameRequired => 'A számítógép neve kötelező';

  @override
  String get whoAreYouPageInvalidComputerName => 'A számítógép neve érvénytelen';

  @override
  String get whoAreYouPageUsernameLabel => 'Válasszon egy felhasználónevet';

  @override
  String get whoAreYouPageUsernameRequired => 'Felhasználónév megadása kötelező';

  @override
  String get whoAreYouPageInvalidUsername => 'A felhasználónév érvénytelen';

  @override
  String get whoAreYouPageUsernameInUse => 'Ez a felhasználónév már létezik.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Ez a név a rendszer használatára van fenntartva.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Ez a név túl hosszú.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Ez a név érvénytelen karaktereket tartalmaz.';

  @override
  String get whoAreYouPagePasswordLabel => 'Jelszó kiválasztása';

  @override
  String get whoAreYouPagePasswordRequired => 'Jelszó kötelező';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Jelszó megerősítése';

  @override
  String get whoAreYouPagePasswordMismatch => 'A jelszavak nem egyeznek';

  @override
  String get whoAreYouPageShowPassword => 'Jelszó megjelenítése';

  @override
  String get writeChangesToDisk => 'Változások írása a lemezre';

  @override
  String get writeChangesFallbackSerial => 'lemez';

  @override
  String get writeChangesDescription => 'Ha folytatja, az alább felsorolt módosítások íródnak a lemezekre. A további módosításokat kézzel végezheti el.';

  @override
  String get writeChangesPartitionTablesHeader => 'A következő eszközök partíciós táblái módosulnak:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'A következő partíciókat fogjuk formázni:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return '#$disk${partition} partíció, mint $format a $mount esetében';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partíció #<$disk${partition} mint $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Válassza ki a megjelenést';

  @override
  String get chooseYourLookPageHeader => 'Ezt később bármikor megváltoztathatja a megjelenési beállításoknál.';

  @override
  String get chooseYourLookPageDarkSetting => 'Sötét';

  @override
  String get chooseYourLookPageLightSetting => 'Világos';

  @override
  String get chooseYourLookPageLightBodyText => 'Minden könnyű és világos';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hello sötétség öreg barátom';

  @override
  String get installationCompleteTitle => 'A telepítés befejeződött';

  @override
  String readyToUse(Object system) {
    return '**<$system** telepítve van és használatra kész.';
  }

  @override
  String restartInto(Object system) {
    return 'Indítsa újra $system';
  }

  @override
  String get shutdown => 'Leállítás';

  @override
  String get turnOffBitlockerTitle => 'Kapcsolja ki a BitLockert';

  @override
  String get turnOffBitlockerDescription => 'Ez a számítógép Windows BitLocker titkosítást használ.\nAz Ubuntu telepítése előtt ki kell kapcsolnia a BitLockert a Windowsban.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Az utasításokért nyissa meg ezt az oldalt telefonon vagy más eszközön: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Indítsa újra a Windows-t';

  @override
  String get whereAreYouPageTitle => 'Hol vagy?';

  @override
  String get whereAreYouLocationLabel => 'Pozíció';

  @override
  String get whereAreYouTimezoneLabel => 'Időzóna';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Üdvözöljük $RELEASE oldalon.';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'A gyors és új funkciókkal teli $RELEASE legújabb verziója minden eddiginél könnyebbé teszi a számítástechnikát. Íme néhány újdonság, amire érdemes odafigyelni...';
  }

  @override
  String get softwareSlideTitle => 'Keressen még több szoftvert';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Búcsúzzon el az új szoftverek keresgélésétől a világhálón. A Snap Store és a $RELEASE szoftverarchívum elérésével könnyedén megtalálhatja és telepítheti az új alkalmazásokat. Csak írja be, hogy mit keres, vagy fedezze fel az olyan kategóriákat, mint a Grafika és fényképezés, Játékok és Termelékenység, más felhasználók hasznos véleményei mellett.';
  }

  @override
  String get musicSlideTitle => 'Vigye magával a zenét';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE a csodálatos Rhythmbox zenelejátszóval érkezik. A fejlett lejátszási lehetőségekkel egyszerűen sorbarendezheti a tökéletes dalokat. És nagyszerűen működik CD-kkel és hordozható zenelejátszókkal, így bárhol élvezheti a zenét.';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox zenelejátszó';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Jó szórakozást a fotóihoz';

  @override
  String get photoSlideDescription => 'A Shotwell egy praktikus fotókezelő, amely készen áll a kütyükre. Csatlakoztasson egy fényképezőgépet vagy egy telefont a fényképek átviteléhez, majd könnyen megoszthatja és biztonságban tarthatja őket. Ha pedig kreatívnak érzi magát, az Ubuntu szoftverek között számos más fotóalkalmazást is találhat.';

  @override
  String get photoSlideShotwell => 'Shotwell fotókezelő';

  @override
  String get photoSlideGimp => 'GIMP képszerkesztő';

  @override
  String get photoSlideShotcut => 'Shotcut videószerkesztő';

  @override
  String get webSlideTitle => 'Használja ki a webet a lehető legjobban';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE tartalmazza a Firefoxot, a világszerte emberek milliói által használt webböngészőt. A gyakran használt webes alkalmazásokat (például a Facebookot vagy a Gmailt) pedig a gyorsabb elérés érdekében az asztalra teheti, akárcsak a számítógépen lévő alkalmazásokat.';
  }

  @override
  String get webSlideFirefox => 'Firefox webböngésző';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Minden, amire az irodában szüksége van';

  @override
  String get officeSlideDescription => 'A LibreOffice egy ingyenes irodai programcsomag, amely mindent tartalmaz, ami dokumentumok, táblázatok és prezentációk készítéséhez szükséges. Kompatibilis a Microsoft Office fájlformátumokkal, így az összes szükséges funkciót biztosítja, fizetés nélkül.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Hozzáférés mindenkinek';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'A $RELEASE filozófia középpontjában az a meggyőződés áll, hogy a számítástechnika mindenkié. A fejlett akadálymentesítési eszközökkel és a nyelv, a színséma és a szövegméret megváltoztatásának lehetőségeivel a $RELEASE megkönnyíti a számítástechnikát - bárki és bárhol is legyen.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Testreszabási lehetőségek';

  @override
  String get accessSlideAppearance => 'Megjelenés';

  @override
  String get accessSlideAssistiveTechnologies => 'Támogató technológiák';

  @override
  String get accessSlideLanguageSupport => 'Nyelvi támogatás';

  @override
  String get supportSlideTitle => 'Segítség és támogatás';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'A hivatalos dokumentáció számos, a $RELEASE-val kapcsolatos leggyakoribb területet lefed. Elérhető mind <a href=\"https://help.ubuntu.com\">online</a>, mind a dokkolóban található Súgó ikonon keresztül.';
  }

  @override
  String get supportSlideQuestions => 'A <a href=\"https://askubuntu.com\">Ask Ubuntu</a> oldalon kérdéseket tehet fel, és a már megválaszolt kérdések lenyűgöző gyűjteményében kereshet. A saját nyelvén a <a href=\"https://loco.ubuntu.com/teams\">Lokális közösségi csapat</a> nyújt támogatást.';

  @override
  String get supportSlideResources => 'Egyéb hasznos forrásokra mutató hivatkozásokért látogasson el a <a href=\"https://www.ubuntu.com/support/community-support\">Közösségi támogatás</a> vagy a <a href=\"https://www.ubuntu.com/support\">Kereskedelmi támogatás</a> oldalra.';

  @override
  String get includedSoftware => 'Mellékelt szoftver';

  @override
  String get availableSoftware => 'Elérhető szoftver';

  @override
  String get supportedSoftware => 'Támogatott szoftver';

  @override
  String get copyingFiles => 'Fájlok másolása...';

  @override
  String get installationFailed => 'A telepítés sikertelen';
}
