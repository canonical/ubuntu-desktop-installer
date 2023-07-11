import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Ubuntu asztali telepítő';

  @override
  String windowTitle(Object RELEASE) {
    return 'A(z) $RELEASE telepítése';
  }

  @override
  String get changeButtonText => 'Változtatás';

  @override
  String get restartButtonText => 'Újraindítás';

  @override
  String get revertButtonText => 'Visszaállítás';

  @override
  String get quitButtonText => 'Kilépés a telepítésből';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Üdvözli a(z) $DISTRO!';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'A(z) $DISTRO előkészítése…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'A(z) $DISTRO kipróbálása vagy telepítése';
  }

  @override
  String get welcomeRepairOption => 'Telepítés javítása';

  @override
  String get welcomeRepairDescription => 'A javítás újratelepíti az összes telepített szoftvert, anélkül hogy a dokumentumokat vagy a beállításokat érintené.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'A(z) $RELEASE kipróbálása';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'A(z) $RELEASE kipróbálható anélkül, hogy bármilyen változtatást végezne a számítógépén.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'A(z) $RELEASE telepítése';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'A(z) $RELEASE telepítése a jelenlegi operációs rendszere mellé (vagy helyett). Ez nem fog túl sokáig tartani.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Érdemes lehet elolvasni a <a href=\"$url\">kiadási megjegyzéseket</a>.';
  }

  @override
  String get rstTitle => 'Az RST engedélyezve van';

  @override
  String get rstHeader => 'Az RST kikapcsolása a folytatáshoz';

  @override
  String get rstDescription => 'Ez a számítógép Intel RST (Rapid Storage Technology) technológiát használ. Az RST-t ki kell kapcsolnia a Windowsban az Ubuntu telepítése előtt.';

  @override
  String rstInstructions(Object url) {
    return 'Az utasításokért olvassa le a QR-kódot egy másik eszközön vagy látogassa meg ezt az oldalt: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get configureSecureBootTitle => 'Biztonságos rendszerindítás beállítása';

  @override
  String get configureSecureBootDescription => 'Úgy döntött, hogy harmadik féltől származó illesztőprogramot telepít. Ez a biztonságos rendszerindítás kikapcsolását igényli.\nEhhez most választania kell egy biztonsági kulcsot, és a rendszer újraindításakor meg kell adnia azt.';

  @override
  String get configureSecureBootOption => 'Biztonságos rendszerindítás beállítása';

  @override
  String get chooseSecurityKey => 'Biztonsági kulcs választása';

  @override
  String get confirmSecurityKey => 'A biztonsági kulcs megerősítése';

  @override
  String get dontInstallDriverSoftwareNow => 'Egyelőre ne telepítse az illesztőprogramot';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Később a Szoftver és frissítések menüpontból telepítheti.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Biztonsági kulcs szükséges';

  @override
  String get secureBootSecurityKeysDontMatch => 'A biztonsági kulcsok nem egyeznek';

  @override
  String get showSecurityKey => 'Biztonsági kulcs megjelenítése';

  @override
  String get connectToInternetPageTitle => 'Kapcsolódás hálózathoz';

  @override
  String get connectToInternetDescription => 'A számítógép internethez való kapcsolódása segít az Ubuntunak telepíteni a szükséges további szoftvereket, és segít kiválasztani az időzónát.\n\nKapcsolódás Ethernet-kábellel vagy Wi-Fi-hálózat kiválasztása';

  @override
  String get useWiredConnection => 'Vezetékes kapcsolat használata';

  @override
  String get noWiredConnection => 'Nincs vezetékes kapcsolat felismerve';

  @override
  String get wiredDisabled => 'A vezetékes kapcsolat ki van kapcsolva';

  @override
  String get wiredMustBeEnabled => 'Az ezen a számítógépen történő Ethernet használatához egy vezetékes kapcsolatnak engedélyezve kell lennie';

  @override
  String get enableWired => 'Vezetékes engedélyezése';

  @override
  String get selectWifiNetwork => 'Kapcsolódás Wi-Fi-hálózathoz';

  @override
  String get hiddenWifiNetwork => 'Kapcsolódás rejtett Wi-Fi-hálózathoz';

  @override
  String get hiddenWifiNetworkNameLabel => 'Hálózat neve';

  @override
  String get hiddenWifiNetworkNameRequired => 'A hálózat neve szükséges';

  @override
  String get noInternet => 'Most nem szeretnék kapcsolódni az internethez';

  @override
  String get wirelessNetworkingDisabled => 'A vezeték nélküli hálózatkezelés letiltva';

  @override
  String get noWifiDevicesDetected => 'Nincsenek felismert Wi-Fi-eszközök';

  @override
  String get wifiMustBeEnabled => 'Az ezen a számítógépen történő Wi-Fi használatához a vezeték nélküli hálózatkezelésnek engedélyezve kell lennie';

  @override
  String get enableWifi => 'Wi-Fi engedélyezése';

  @override
  String get connectButtonText => 'Kapcsolódás';

  @override
  String get updatesOtherSoftwarePageTitle => 'Alkalmazások és frissítések';

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
  String get installThirdPartyTitle => 'Harmadik féltől származó szoftverek grafikus és Wi-Fi-hardverekhez, valamint további médiaformátumok telepítése';

  @override
  String get installThirdPartySubtitle => 'Erre a szoftverre a dokumentációjában szereplő licencfeltételek vonatkoznak. Néhányuk kereskedelmi forgalomban kapható tulajdonosi szoftver.';

  @override
  String get installDriversTitle => 'Harmadik féltől származó szoftverek telepítése grafikus és Wi-Fi-hardverekhez';

  @override
  String get installDriversSubtitle => 'Ezekre az illesztőprogramokra a dokumentációjukban szereplő licencfeltételek vonatkoznak. Kereskedelmi forgalomban kapható tulajdonosi szoftverek.';

  @override
  String get installCodecsTitle => 'További médiaformátumok támogatásának letöltése és telepítése';

  @override
  String get installCodecsSubtitle => 'Erre a szoftverre a dokumentációjában szereplő licencfeltételek vonatkoznak. Néhányuk kereskedelmi forgalomban kapható tulajdonosi szoftver.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Figyelmeztetés:</font> a számítógép nincs csatlakoztatva az áramforráshoz.';
  }

  @override
  String get offlineWarning => 'Jelenleg kapcsolat nélkül van';

  @override
  String get chooseSecurityKeyTitle => 'Biztonsági kulcs';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'A lemez titkosítása megvédi fájljait, ha elveszíti a számítógépét. A számítógép minden egyes indításakor meg kell adnia egy biztonsági kulcsot.\n\nA(z) $RELEASE kezelésén kívüli fájlok nem lesznek titkosítva.';
  }

  @override
  String get chooseSecurityKeyHint => 'Biztonsági kulcs választása';

  @override
  String get chooseSecurityKeyConfirmHint => 'A biztonsági kulcs megerősítése';

  @override
  String get chooseSecurityKeyRequired => 'Biztonsági kulcs szükséges';

  @override
  String get chooseSecurityKeyMismatch => 'A biztonsági kulcsok nem egyeznek';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Figyelmeztetés:</font> ha elveszíti ezt a biztonsági kulcsot, akkor az összes adat elvész. Ha szükséges, írja le a kulcsot, és tartsa valahol máshol egy biztonságos helyen.';
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
  String get installationTypeNoOSDetected => 'Ezen a számítógépen jelenleg nincs felismert operációs rendszer. Mit szeretne tenni?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Lemez törlése és a(z) $DISTRO telepítése';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Figyelmeztetés:</font> ez törölni fogja az összes programot, dokumentumot, fényképet, zenét és minden más fájlt az összes operációs rendszeren.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Speciális funkciók…';

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
  String get installationTypeLVMEncryptionSelected => 'LVM és titkosítás kiválasztva';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Az új $RELEASE telepítés titkosítása a biztonság érdekében';
  }

  @override
  String get installationTypeEncryptInfo => 'Biztonsági kulcsot a következő lépésben fog választani.';

  @override
  String get installationTypeZFS => 'KÍSÉRLETI: lemez törlése és ZFS használata';

  @override
  String get installationTypeZFSSelected => 'ZFS kiválasztva';

  @override
  String installationTypeReinstall(Object os) {
    return 'A(z) $os törlése és újratelepítés';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Figyelmeztetés:</font> ez törölni fogja az összes $os programot, dokumentumot, fényképet, zenét és minden más fájlt.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'A(z) $product telepítése a(z) $os mellé';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'A(z) $product telepítése a(z) $os1 és $os2 mellé';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'A(z) $product telepítése melléjük';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'A(z) $product telepítése más partíciók mellé';
  }

  @override
  String get installationTypeAlongsideInfo => 'A dokumentumok, zenék és egyéb személyes fájlok megőrzésre kerülnek. A számítógép minden egyes indításakor kiválaszthatja, hogy melyik operációs rendszert szeretné használni.';

  @override
  String get installationTypeManual => 'Kézi particionálás';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Létrehozhat vagy átméretezhet partíciókat saját maga, vagy több partíciót is választhat a(z) $DISTRO telepítéséhez';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Lemez törlése és a(z) $DISTRO telepítése';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Meghajtó kiválasztása:';

  @override
  String get selectGuidedStorageInfoLabel => 'A teljes lemez felhasználásra kerül:';

  @override
  String get selectGuidedStorageInstallNow => 'Telepítés most';

  @override
  String get installAlongsideSpaceDivider => 'Meghajtóterület lefoglalása az alábbi osztóvonal húzásával:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num a kisebb partíció el van rejtve, használja a <a href=\"$url\">speciális particionáló eszközt</a> a jobb szabályozáshoz';
  }

  @override
  String get installAlongsideResizePartition => 'Partíció átméretezése';

  @override
  String get installAlongsideAllocateSpace => 'Hely lefoglalása';

  @override
  String get installAlongsideFiles => 'Fájlok';

  @override
  String get installAlongsidePartition => 'Partíció:';

  @override
  String get installAlongsideSize => 'Méret:';

  @override
  String get installAlongsideAvailable => 'Elérhető:';

  @override
  String get allocateDiskSpace => 'Kézi particionálás';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'A csatolási pontoknak „/” karakterrel kell kezdődniük';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'A csatolási pontok nem tartalmazhatnak szóközöket';

  @override
  String get diskHeadersDevice => 'Eszköz';

  @override
  String get diskHeadersType => 'Típus';

  @override
  String get diskHeadersMountPoint => 'Csatolási pont';

  @override
  String get diskHeadersSize => 'Méret';

  @override
  String get diskHeadersUsed => 'Használva';

  @override
  String get diskHeadersSystem => 'Rendszer';

  @override
  String get diskHeadersFormat => 'Formátum';

  @override
  String get freeDiskSpace => 'Szabad hely';

  @override
  String get newPartitionTable => 'Új partíciós tábla';

  @override
  String get newPartitionTableConfirmationTitle => 'Új üres partíció';

  @override
  String get newPartitionTableConfirmationMessage => 'Egy új partíciós tábla létrehozása egy teljes eszközön eltávolítja az összes jelenlegi partíciót. Ez a művelet visszavonható, ha szükséges.';

  @override
  String get tooManyPrimaryPartitions => 'Túl sok elsődleges partíció';

  @override
  String get partitionLimitReached => 'Korlát elérve';

  @override
  String get bootLoaderDevice => 'Eszköz a rendszertöltő telepítéséhez';

  @override
  String get partitionCreateTitle => 'Partíció létrehozása';

  @override
  String get partitionEditTitle => 'Partíció szerkesztése';

  @override
  String get partitionSizeLabel => 'Méret:';

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
  String get partitionFormatLabel => 'Használva mint:';

  @override
  String get partitionFormatNone => 'Formázatlanul hagyás';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'A partíció formázása';

  @override
  String get partitionMountPointLabel => 'Csatolási pont:';

  @override
  String get confirmPageTitle => 'Telepítésre kész';

  @override
  String get confirmHeader => 'Ha folytatja, akkor az alább felsorolt változtatások a lemezekre lesznek írva. A további változtatásokat kézzel végezheti el.';

  @override
  String get confirmDevicesTitle => 'Eszközök';

  @override
  String get confirmPartitionsTitle => 'Partíciók';

  @override
  String get confirmPartitionTables => 'A következő eszközök partíciós táblái változnak meg:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'A következő partícióváltoztatások kerülnek alkalmazásra:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return '<b>$sysname</b> partíció átméretezve <b>$oldsize</b> méretről <b>$newsize</b> méretre';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return '<b>$sysname</b> partíció <b>$format</b> formátumra formázva, <b>$mount</b> helyre csatolva';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return '<b>$sysname</b> partíció <b>$format</b> formátumra formázva';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return '<b>$sysname</b> partíció <b>$mount</b> helyre csatolva';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return '<b>$sysname</b> partíció létrehozva';
  }

  @override
  String get confirmInstallButton => 'Telepítés';

  @override
  String get installationCompleteTitle => 'A telepítés befejeződött';

  @override
  String readyToUse(Object system) {
    return 'A(z) **$system** telepítve van és használatra kész';
  }

  @override
  String restartInto(Object system) {
    return 'Újraindítás és $system használata';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Most folytathatja a(z) $RELEASE kipróbálását, de amíg nem indítja újra a számítógépet, addig semmilyen elvégzett változtatás vagy elmentett dokumentum nem lesz megtartva.';
  }

  @override
  String get shutdown => 'Leállítás';

  @override
  String get restartNow => 'Újraindítás most';

  @override
  String get continueTesting => 'Kipróbálás folytatása';

  @override
  String get bitlockerTitle => 'A BitLocker engedélyezve van';

  @override
  String get bitlockerHeader => 'A BitLocker kikapcsolása a folytatáshoz';

  @override
  String bitlockerDescription(Object option) {
    return 'Ez a számítógép Windows BitLocker titkosítást használ.\nWindowst kell használnia a szabad terület létrehozásához, vagy a(z) „$option” választása szükséges a folytatáshoz.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Az utasításokért olvassa le a QR-kódot egy másik eszközön vagy látogassa meg ezt az oldalt: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Újraindítás és Windows használata';

  @override
  String get restartIntoWindowsTitle => 'Újraindítja a számítógépet Windows használatával?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Biztosan újra szeretné indítani a számítógépet? Később újra kell majd indítania a(z) $DISTRO telepítését a(z) $DISTRO telepítésének befejezéséhez.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Üdvözli a(z) $RELEASE!';
  }

  @override
  String get installationSlidesAvailable => 'Elérhető:';

  @override
  String get installationSlidesIncluded => 'Tartalmazott:';

  @override
  String get installationSlidesWelcomeTitle => 'Gyors, ingyenes és tele új funkciókkal';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'A(z) $DISTRO legújabb verziója minden eddiginél könnyebbé teszi a számítástechnikát.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Legyen akár fejlesztő, alkotó, játékos vagy rendszergazda, a(z) $RELEASE új eszközöket nyújt Önnek a termelékenység és a felhasználói élmény javításához.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Minden alkalmazás, amire szüksége van';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Telepítse, kezelje és frissítse az Ubuntu szoftverben található összes alkalmazást, beleértve a Snap alkalmazásboltból és a(z) $DISTRO archívumából származó több ezer alkalmazást is.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Fejlesszen a nyílt forráskód legjobbjaival';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return 'A(z) $DISTRO ideális munkaállomás az alkalmazás- vagy webfejlesztéshez, az adattudományhoz és a mesterséges intelligenciához vagy gépi tanuláshoz, valamint a fejlesztésekhez és az adminisztrációhoz. Minden $DISTRO kiadás a legújabb eszközláncokat tartalmazza, és támogatja az összes főbb integrált fejlesztőkörnyezetet.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Növelje a kreativitását';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Ha Ön animátor, tervező, videókészítő vagy játékfejlesztő, akkor könnyedén áthozhatja a munkafolyamatait a nyílt forráskódú és az iparági szabványokat használó szoftverek és alkalmazások támogatásával rendelkező $DISTRO rendszerbe.';
  }

  @override
  String get installationSlidesGamingTitle => 'Nagyszerű a játékokhoz';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return 'A(z) $DISTRO támogatja a legújabb NVIDIA és Mesa illesztőprogramokat a teljesítmény és a kompatibilitás javítása érdekében. A(z) $DISTRO további beállítások nélkül is remekül futtatja a Windowsra írt játékok ezreit az olyan alkalmazásokon keresztül, mint például a Steam.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Személyes és biztonságos';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return 'A(z) $DISTRO minden olyan eszközt biztosít, amelyre szüksége van ahhoz, hogy tiszteletben tartsák a magánéletét és biztonságban legyen az interneten. Beépített tűzfallal és VPN-támogatással, valamint az adatvédelemre összpontosító rengeteg alkalmazással érkezik annak biztosításához, hogy az adatai felett teljes ellenőrzést gyakorolhasson.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Az összes $DISTRO LTS kiadás öt évre szóló biztonsági javítást tartalmaz, ami Ubuntu Pro előfizetéssel tíz évre növelhető.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Növelje a termelékenységét';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return 'A(z) $DISTRO asztali változatában megtalálható a LibreOffice, a Microsoft Office-szal kompatibilis, nyílt forráskódú alkalmazáscsomag dokumentumokhoz, táblázatokhoz és prezentációkhoz. Népszerű együttműködési eszközök is rendelkezésre állnak.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Hozzáférés mindenkinek';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'A(z) $DISTRO filozófiájának középpontjában az a meggyőződés áll, hogy a számítástechnika mindenkié. A fejlett akadálymentesítési eszközökkel, valamint a nyelv, a színek és a szövegméret megváltoztatásának lehetőségeivel a(z) $DISTRO egyszerűvé teszi a számítástechnikát – bárki és bárhol is legyen.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca képernyőolvasó';

  @override
  String get installationSlidesAccessibilityLanguages => 'Nyelvi támogatás';

  @override
  String get installationSlidesSupportTitle => 'Súgó és támogatás';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'A hivatalos $DISTRO dokumentáció az interneten és az alkalmazásindítóban lévő Súgó ikonon keresztül is elérhető.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Az Ask Ubuntu a kérdések és válaszok széles skáláját lefedi, az Ubuntu Discourse pedig útmutatókat és beszélgetési lehetőségeket nyújt új és tapasztalt felhasználók számára.';

  @override
  String get installationSlidesSupportEnterprise => 'Vállalati felhasználóknak a Canonical kereskedelmi támogatást nyújt, hogy megkönnyítse az Ubuntu bevezetését és biztonságos kezelését a munkahelyen.';

  @override
  String get installationSlidesSupportResources => 'Hasznos erőforrások:';

  @override
  String get installationSlidesSupportDocumentation => 'Hivatalos dokumentáció';

  @override
  String get installationSlidesSupportUbuntuPro => 'Vállalati szintű 24/7 támogatás Ubuntu Pro előfizetéssel';

  @override
  String get copyingFiles => 'Fájlok másolása…';

  @override
  String get installingSystem => 'A rendszer telepítése…';

  @override
  String get configuringSystem => 'A rendszer beállítása…';

  @override
  String get installationFailed => 'A telepítés sikertelen';

  @override
  String get notEnoughDiskSpaceTitle => 'Nincs elegendő hely';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Nincs elegendő lemezterület a(z) $DISTRO telepítéséhez';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Elérhető:';

  @override
  String get notEnoughDiskSpaceRequired => 'Szükséges:';
}
