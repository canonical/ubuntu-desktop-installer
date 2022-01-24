


import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Instalator Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Zainstaluj $RELEASE';
  }

  @override
  String get cancelButtonText => 'Anuluj';

  @override
  String get changeButtonText => 'Zmień';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Nie';

  @override
  String get restartButtonText => 'Uruchom ponownie';

  @override
  String get revertButtonText => 'Przywróć';

  @override
  String get yesButtonText => 'Tak';

  @override
  String get welcome => 'Witamy';

  @override
  String get tryOrInstallPageTitle => 'Wypróbuj lub zainstaluj';

  @override
  String get repairInstallation => 'Napraw instalację';

  @override
  String get repairInstallationDescription => 'Naprawa spowoduje ponowną instalację całego zainstalowanego oprogramowania bez naruszania dokumentów lub ustawień.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Wypróbuj $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Możesz wypróbować $RELEASE bez wprowadzania jakichkolwiek zmian na swoim komputerze.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Zainstaluj $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Zainstaluj $RELEASE obok (lub zamiast) obecnego systemu operacyjnego. Nie powinno to potrwać zbyt długo.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Możesz chcieć przeczytać <a href=\"$url\">informacje o wydaniu</a>.';
  }

  @override
  String get turnOffRST => 'Wyłącz RST';

  @override
  String get turnOffRSTDescription => 'Ten komputer wykorzystuje technologię Intel RST (Rapid Storage Technology). Musisz wyłączyć RST w systemie Windows przed instalacją Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Aby uzyskać instrukcje, otwórz tę stronę w telefonie lub innym urządzeniu: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Układ klawiatury';

  @override
  String get chooseYourKeyboardLayout => 'Wybierz układ klawiatury:';

  @override
  String get typeToTest => 'Tutaj można wpisywać znaki, aby przetestować klawiaturę';

  @override
  String get detectLayout => 'Wykryj układ klawiatury';

  @override
  String get pressOneKey => 'Proszę wcisnąć jeden z następujących klawiszy:';

  @override
  String get isKeyPresent => 'Czy ten klawisz występuje na klawiaturze?';

  @override
  String get configureSecureBootTitle => 'Skonfiguruj bezpieczny rozruch (Secure Boot)';

  @override
  String get configureSecureBootDescription => 'Wybrano instalację oprogramowania sterownika innego dostawcy. Wymaga to wyłączenia bezpiecznego rozruchu (Secure Boot).\nAby to zrobić, musisz teraz wybrać klucz bezpieczeństwa i podać go po ponownym uruchomieniu systemu.';

  @override
  String get configureSecureBootOption => 'Skonfiguruj bezpieczny rozruch (Secure Boot)';

  @override
  String get chooseSecurityKey => 'Wybierz klucz bezpieczeństwa';

  @override
  String get confirmSecurityKey => 'Potwierdź klucz bezpieczeństwa';

  @override
  String get dontInstallDriverSoftwareNow => 'Na razie nie instaluj oprogramowania sterownika';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Możesz zainstalować je później za pomocą aplikacji Oprogramowanie i aktualizacje.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Wymagany jest klucz bezpieczeństwa';

  @override
  String get secureBootSecurityKeysDontMatch => 'Klucze bezpieczeństwa nie są zgodne';

  @override
  String get connectToInternetPageTitle => 'Połącz się z Internetem';

  @override
  String get connectToInternetDescription => 'Podłączenie tego komputera do Internetu pomoże systemowi Ubuntu zainstalować dodatkowe potrzebne oprogramowanie i pomoże wybrać strefę czasową.\n\nPołącz się za pomocą kabla ethernetowego lub wybierz sieć Wi-Fi';

  @override
  String get useWiredConnection => 'Użyj połączenia przewodowego';

  @override
  String get noWiredConnection => 'Nie wykryto połączenia przewodowego';

  @override
  String get wiredDisabled => 'Połączenie przewodowe jest wyłączone';

  @override
  String get wiredMustBeEnabled => 'Aby korzystać z sieci Ethernet na tym komputerze, musi być włączone połączenie przewodowe';

  @override
  String get enableWired => 'Włącz przewodowe';

  @override
  String get selectWifiNetwork => 'Połącz się z siecią Wi-Fi';

  @override
  String get noInternet => 'Nie chcę teraz łączyć się z Internetem';

  @override
  String get wirelessNetworkingDisabled => 'Sieć bezprzewodowa wyłączona';

  @override
  String get noWifiDevicesDetected => 'Nie wykryto urządzeń Wi-Fi';

  @override
  String get wifiMustBeEnabled => 'Aby korzystać z sieci Wi-Fi na tym komputerze, musi być włączona sieć bezprzewodowa';

  @override
  String get enableWifi => 'Włącz Wi-Fi';

  @override
  String get connectButtonText => 'Połącz';

  @override
  String get updatesOtherSoftwarePageTitle => 'Aktualizacje i inne oprogramowanie';

  @override
  String get updatesOtherSoftwarePageDescription => 'Jakie programy chcesz zainstalować na początek?';

  @override
  String get normalInstallationTitle => 'Instalacja normalna';

  @override
  String get normalInstallationSubtitle => 'Przeglądarka internetowa, narzędzia, oprogramowanie biurowe, gry i odtwarzacze multimedialne.';

  @override
  String get minimalInstallationTitle => 'Instalacja minimalna';

  @override
  String get minimalInstallationSubtitle => 'Przeglądarka internetowa i podstawowe narzędzia.';

  @override
  String get otherOptions => 'Pozostałe opcje';

  @override
  String get installThirdPartyTitle => 'Zainstaluj oprogramowanie innych dostawców do obsługi sprzętu graficznego i Wi-Fi, a także dodatkowe formaty multimedialne';

  @override
  String get installThirdPartySubtitle => 'To oprogramowanie podlega warunkom licencyjnym dołączonym do jego dokumentacji. Niektóre z nich są własnościowe.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Ostrzeżenie</font>: komputer nie jest podłączony do źródła zasilania.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Wybierz klucz bezpieczeństwa';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Szyfrowanie dysku chroni pliki w przypadku utraty komputera. Wymaga ono podania klucza bezpieczeństwa przy każdym uruchomieniu komputera.\n\nWszelkie pliki spoza $RELEASE nie zostaną zaszyfrowane.';
  }

  @override
  String get chooseSecurityKeyHint => 'Wybierz klucz bezpieczeństwa';

  @override
  String get chooseSecurityKeyConfirmHint => 'Potwierdź klucz bezpieczeństwa';

  @override
  String get chooseSecurityKeyRequired => 'Wymagany jest klucz bezpieczeństwa';

  @override
  String get chooseSecurityKeyMismatch => 'Klucze bezpieczeństwa nie są zgodne';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Ostrzeżenie</font>: jeśli zgubisz ten klucz bezpieczeństwa, wszystkie dane zostaną utracone. Jeżeli potrzebujesz, zapisz swój klucz i przechowuj go w bezpiecznym miejscu gdzie indziej.';
  }

  @override
  String get installationTypeTitle => 'Typ instalacji';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Na tym komputerze jest obecnie zainstalowany $os. Co chcesz zrobić?';
  }

  @override
  String get installationTypeNoOSDetected => 'Na tym komputerze nie ma obecnie wykrytych systemów operacyjnych. Co chcesz zrobić?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Wymaż dysk i zainstaluj $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Ostrzeżenie:</font> spowoduje to usunięcie wszystkich programów, dokumentów, zdjęć, muzyki i wszelkich innych plików we wszystkich systemach operacyjnych.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Zaawansowane funkcje...';

  @override
  String get installationTypeAdvancedTitle => 'Zaawansowane funkcje';

  @override
  String get installationTypeNone => 'Brak';

  @override
  String get installationTypeNoneSelected => 'Nie wybrano';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Użyj LVM z nową instalacją $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'Wybrano LVM';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Zaszyfruj nową instalację $RELEASE dla bezpieczeństwa';
  }

  @override
  String get installationTypeEncryptInfo => 'Klucz bezpieczeństwa zostanie wybrany w następnym kroku.';

  @override
  String get installationTypeZFS => 'EKSPERYMENTALNE: wymaż dysk i użyj ZFS';

  @override
  String get installationTypeZFSSelected => 'Wybrano ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Wymaż $os i zainstaluj ponownie';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Ostrzeżenie:</font> spowoduje to usunięcie wszystkich programów $os, dokumentów, zdjęć, muzyki i wszelkich innych plików.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Zainstaluj $product obok $os';
  }

  @override
  String get installationTypeAlongsideInfo => 'Dokumenty, muzyka i inne pliki osobiste zostaną zachowane. Przy każdym uruchomieniu komputera można wybrać system operacyjny, który ma być używany.';

  @override
  String get installationTypeManual => 'Coś innego';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Możesz samodzielnie utworzyć lub zmienić rozmiar partycji lub wybrać wiele partycji dla $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Wymaż dysk i zainstaluj $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Wybierz napęd:';

  @override
  String get selectGuidedStorageInfoLabel => 'Zostanie użyta cała powierzchnia dysku:';

  @override
  String get selectGuidedStorageInstallNow => 'Zainstaluj teraz';

  @override
  String get allocateDiskSpace => 'Przydziel miejsce na dysku';

  @override
  String get startInstallingButtonText => 'Rozpocznij instalację';

  @override
  String get diskHeadersDevice => 'Urządzenie';

  @override
  String get diskHeadersType => 'Typ';

  @override
  String get diskHeadersMountPoint => 'Punkt montowania';

  @override
  String get diskHeadersSize => 'Rozmiar';

  @override
  String get diskHeadersUsed => 'Zajęte';

  @override
  String get diskHeadersSystem => 'System';

  @override
  String get diskHeadersFormat => 'Formatowanie';

  @override
  String get freeDiskSpace => 'dostępna przestrzeń';

  @override
  String get newPartitionTable => 'Nowa tablica partycji';

  @override
  String get newPartitionTableConfirmationTitle => 'Utworzyć nową pustą tablicę partycji na tym urządzeniu?';

  @override
  String get newPartitionTableConfirmationMessage => 'Wybrano całe urządzenie do podziału na partycje. Jeśli przejdziesz do tworzenia nowej tabeli partycji na urządzeniu, wszystkie bieżące partycje zostaną usunięte.\n\nPamiętaj, że możesz cofnąć tę operację później, jeśli zechcesz.';

  @override
  String get bootLoaderDevice => 'Urządzenie do instalacji programu rozruchowego';

  @override
  String get partitionCreateTitle => 'Utwórz partycję';

  @override
  String get partitionEditTitle => 'Modyfikowanie partycji';

  @override
  String get partitionSizeLabel => 'Rozmiar:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Typ nowej partycji:';

  @override
  String get partitionTypePrimary => 'Podstawowa';

  @override
  String get partitionTypeLogical => 'Logiczna';

  @override
  String get partitionLocationLabel => 'Położenie nowej partycji:';

  @override
  String get partitionLocationBeginning => 'Początek przestrzeni';

  @override
  String get partitionLocationEnd => 'Koniec przestrzeni';

  @override
  String get partitionFormatLabel => 'Używana jako:';

  @override
  String get partitionFormatExt4 => 'System plików z dziennikowaniem Ext4';

  @override
  String get partitionFormatExt3 => 'System plików z dziennikowaniem Ext3';

  @override
  String get partitionFormatExt2 => 'System plików Ext2';

  @override
  String get partitionFormatBtrfs => 'System plików z dziennikowaniem btrfs';

  @override
  String get partitionFormatJfs => 'System plików z dziennikowaniem JFS';

  @override
  String get partitionFormatXfs => 'System plików z dziennikowaniem XFS';

  @override
  String get partitionFormatFat => 'System plików FAT';

  @override
  String get partitionFormatFat12 => 'System plików FAT12';

  @override
  String get partitionFormatFat16 => 'System plików FAT16';

  @override
  String get partitionFormatFat32 => 'System plików FAT32';

  @override
  String get partitionFormatSwap => 'Obszar wymiany (swap)';

  @override
  String get partitionFormatIso9660 => 'System plików ISO 9660';

  @override
  String get partitionFormatVfat => 'System plików VFAT';

  @override
  String get partitionFormatNtfs => 'System plików NTFS';

  @override
  String get partitionFormatReiserFS => 'System plików ReiserFS';

  @override
  String get partitionFormatZfsroot => 'System plików root ZFS';

  @override
  String get partitionErase => 'Sformatuj partycję';

  @override
  String get partitionMountPointLabel => 'Punkt montowania:';

  @override
  String get whoAreYouPageTitle => 'Kim jesteś?';

  @override
  String get whoAreYouPageAutoLogin => 'Automatyczne logowanie';

  @override
  String get whoAreYouPageRequirePassword => 'Wymaganie hasła do zalogowania';

  @override
  String get whoAreYouPageRealNameLabel => 'Twoje imię i nazwisko';

  @override
  String get whoAreYouPageRealNameRequired => 'Wymagane jest podanie imienia i nazwiska';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nazwa tego komputera';

  @override
  String get whoAreYouPageComputerNameInfo => 'Określa nazwę komputera używaną podczas komunikacji z innymi komputerami.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Wymagane jest podanie nazwy komputera';

  @override
  String get whoAreYouPageInvalidComputerName => 'Nazwa komputera jest nieprawidłowa';

  @override
  String get whoAreYouPageUsernameLabel => 'Wybierz nazwę użytkownika';

  @override
  String get whoAreYouPageUsernameRequired => 'Wymagane jest podanie nazwy użytkownika';

  @override
  String get whoAreYouPageInvalidUsername => 'Nazwa użytkownika jest nieprawidłowa';

  @override
  String get whoAreYouPagePasswordLabel => 'Wybierz hasło';

  @override
  String get whoAreYouPagePasswordRequired => 'Wymagane jest podanie hasła';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Potwierdź swoje hasło';

  @override
  String get whoAreYouPagePasswordMismatch => 'Hasła nie są zgodne';

  @override
  String get writeChangesToDisk => 'Zapisz zmiany na dysku';

  @override
  String get writeChangesFallbackSerial => 'dysk';

  @override
  String get writeChangesDescription => 'Jeśli będziesz kontynuować, zmiany wymienione poniżej zostaną zapisane na dyskach. Będzie można wprowadzać dalsze zmiany ręcznie.';

  @override
  String get writeChangesPartitionTablesHeader => 'Zmieniane są tablice partycji następujących urządzeń:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Sformatowane zostaną następujące partycje:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partycja #$disk${partition} jako $format używana do $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partycja #$disk${partition} jako $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Wybierz swój wygląd';

  @override
  String get chooseYourLookPageHeader => 'Zawsze możesz zmienić to później w ustawieniach wyglądu.';

  @override
  String get chooseYourLookPageDarkSetting => 'Ciemny';

  @override
  String get chooseYourLookPageLightSetting => 'Jasny';

  @override
  String get chooseYourLookPageLightBodyText => 'Wszystko jest lekkie i jasne';

  @override
  String get chooseYourLookPageDarkBodyText => 'Witaj, ciemności, moja stara przyjaciółko';

  @override
  String get installationCompleteTitle => 'Instalacja zakończona';

  @override
  String readyToUse(Object system) {
    return '**$system** został zainstalowany i jest gotowy do użycia.';
  }

  @override
  String restartInto(Object system) {
    return 'Uruchom ponownie $system';
  }

  @override
  String get shutdown => 'Zamknij system';

  @override
  String get turnOffBitlockerTitle => 'Wyłącz funkcję BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Ten komputer używa szyfrowania Windows BitLocker.\nMusisz wyłączyć funkcję BitLocker w systemie Windows przed instalacją Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Aby uzyskać instrukcje, otwórz tę stronę w telefonie lub innym urządzeniu: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Uruchom ponownie Windows';
}
