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
  String get quitButtonText => 'Zakończ instalację';

  @override
  String get welcome => 'Witamy';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Przygotowywanie $DISTRO…';
  }

  @override
  String get welcomeHeader => 'Wybierz swój język:';

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
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

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
  String get showSecurityKey => 'Pokaż klucz bezpieczeństwa';

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
  String get hiddenWifiNetwork => 'Połącz się z ukrytą siecią Wi-Fi';

  @override
  String get hiddenWifiNetworkNameLabel => 'Nazwa sieci';

  @override
  String get hiddenWifiNetworkNameRequired => 'Wymagana jest nazwa sieci';

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
  String get installThirdPartySubtitle => 'Oprogramowanie to podlega warunkom licencyjnym dołączonym do jego dokumentacji. Niektóre z nich są własnościowe.';

  @override
  String get installDriversTitle => 'Zainstaluj oprogramowanie innego dostawcy do sprzętu graficznego i Wi-Fi';

  @override
  String get installDriversSubtitle => 'Sterowniki te podlegają warunkom licencyjnym dołączonym do ich dokumentacji. Są one własnościowe.';

  @override
  String get installCodecsTitle => 'Pobierz i zainstaluj obsługę dodatkowych formatów multimediów';

  @override
  String get installCodecsSubtitle => 'Oprogramowanie to podlega warunkom licencyjnym dołączonym do jego dokumentacji. Niektóre jest własnościowe.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Ostrzeżenie:</font> komputer nie jest podłączony do źródła zasilania.';
  }

  @override
  String get offlineWarning => 'Jesteś obecnie offline';

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
    return '<font color=\"$color\">Ostrzeżenie:</font> jeśli zgubisz ten klucz bezpieczeństwa, wszystkie dane zostaną utracone. Jeżeli potrzebujesz, zapisz swój klucz i przechowuj go w bezpiecznym miejscu gdzie indziej.';
  }

  @override
  String get installationTypeTitle => 'Typ instalacji';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Na tym komputerze jest obecnie zainstalowany $os. Co chcesz zrobić?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Na tym komputerze są obecnie zainstalowane systemy $os1 i $os2. Co chcesz zrobić?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Na tym komputerze jest obecnie zainstalowanych wiele systemów operacyjnych. Co chcesz zrobić?';

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
  String get installationTypeAdvancedLabel => 'Zaawansowane funkcje…';

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
  String get installationTypeLVMEncryptionSelected => 'Wybrano LVM i szyfrowanie';

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
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Zainstaluj $product obok $os1 i $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Zainstaluj $product obok nich';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Zainstaluj $product obok innych partycji';
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
  String get installAlongsideSpaceDivider => 'Przydziel przestrzeń dyskową, przesuwając poniższą podziałkę:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num mniejsze partycje są ukryte, użyj <a href=\"$url\">zaawansowanego narzędzia do partycjonowania</a>, aby uzyskać większą kontrolę';
  }

  @override
  String get installAlongsideResizePartition => 'Zmień rozmiar partycji';

  @override
  String get installAlongsideAllocateSpace => 'Przydziel przestrzeń';

  @override
  String get installAlongsideFiles => 'Pliki';

  @override
  String get installAlongsidePartition => 'Partycja:';

  @override
  String get installAlongsideSize => 'Rozmiar:';

  @override
  String get installAlongsideAvailable => 'Dostępne:';

  @override
  String get allocateDiskSpace => 'Przydziel przestrzeń dyskową';

  @override
  String get startInstallingButtonText => 'Instaluj';

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
  String get freeDiskSpace => 'Wolna przestrzeń';

  @override
  String get newPartitionTable => 'Nowa tablica partycji';

  @override
  String get newPartitionTableConfirmationTitle => 'Utworzyć nową pustą tablicę partycji na tym urządzeniu?';

  @override
  String get newPartitionTableConfirmationMessage => 'Wybrano całe urządzenie do podziału na partycje. Jeśli przejdziesz do tworzenia na nim nowej tabeli partycji, wszystkie jego bieżące partycje zostaną usunięte.\n\nPamiętaj, że możesz cofnąć tę operację później, jeśli zechcesz.';

  @override
  String get tooManyPrimaryPartitions => 'Zbyt wiele partycji podstawowych';

  @override
  String get partitionLimitReached => 'Osiągnięto limit';

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
  String get partitionUnitKB => 'kB';

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
  String get partitionFormatNone => 'Pozostaw niesformatowaną';

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
  String get whoAreYouPageRealNameTooLong => 'To imię i nazwisko jest za długie.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nazwa tego komputera';

  @override
  String get whoAreYouPageComputerNameInfo => 'Określa nazwę komputera używaną podczas komunikacji z innymi komputerami.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Wymagane jest podanie nazwy komputera';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Ta nazwa komputera jest za długa.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Nazwa komputera jest nieprawidłowa';

  @override
  String get whoAreYouPageUsernameLabel => 'Wybierz nazwę użytkownika';

  @override
  String get whoAreYouPageUsernameRequired => 'Wymagane jest podanie nazwy użytkownika';

  @override
  String get whoAreYouPageInvalidUsername => 'Nazwa użytkownika jest nieprawidłowa';

  @override
  String get whoAreYouPageUsernameInUse => 'Ta nazwa użytkownika już istnieje.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Ta nazwa jest zarezerwowana na użytek systemu.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Ta nazwa jest za długa.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Ta nazwa zawiera nieprawidłowe znaki.';

  @override
  String get whoAreYouPagePasswordLabel => 'Wybierz hasło';

  @override
  String get whoAreYouPagePasswordRequired => 'Wymagane jest podanie hasła';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Potwierdź swoje hasło';

  @override
  String get whoAreYouPagePasswordMismatch => 'Hasła nie są zgodne';

  @override
  String get whoAreYouPagePasswordShow => 'Pokaż';

  @override
  String get whoAreYouPagePasswordHide => 'Ukryj';

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
  String get writeChangesPartitionsHeader => 'Zostaną zastosowane następujące zmiany partycji:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partycja #$disk$partition zmieniła rozmiar z $oldsize na $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partycja #$disk$partition sformatowana jako $format używana do $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partycja #$disk$partition sformatowana jako $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partycja #$disk$partition używana do $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'utworzona partycja #$disk$partition';
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
  String get installationCompleteTitle => 'Instalacja zakończona';

  @override
  String readyToUse(Object system) {
    return '**$system** został zainstalowany i jest gotowy do użycia';
  }

  @override
  String restartInto(Object system) {
    return 'Uruchom ponownie do $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Możesz teraz kontynuować testowanie wersji $RELEASE, ale dopóki nie uruchomisz ponownie komputera, wszelkie wprowadzone zmiany lub zapisane dokumenty nie zostaną zachowane.';
  }

  @override
  String get shutdown => 'Zamknij system';

  @override
  String get restartNow => 'Uruchom ponownie teraz';

  @override
  String get continueTesting => 'Kontynuuj testowanie';

  @override
  String get turnOffBitlockerTitle => 'Wyłącz funkcję BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Ten komputer używa szyfrowania Windows BitLocker.\nMusisz wyłączyć funkcję BitLocker w systemie Windows przed instalacją Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Aby uzyskać instrukcje, otwórz tę stronę w telefonie lub innym urządzeniu: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Uruchom ponownie do Windows';

  @override
  String get whereAreYouPageTitle => 'Gdzie jesteś?';

  @override
  String get whereAreYouLocationLabel => 'Lokalizacja';

  @override
  String get whereAreYouTimezoneLabel => 'Strefa czasowa';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Available:';

  @override
  String get installationSlidesIncluded => 'Included:';

  @override
  String get installationSlidesWelcomeTitle => 'Fast, free and full of new features';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'The latest version of $DISTRO makes computing easier than ever.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'All the applications you need';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and $DISTRO archive.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Develop with the best of open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Enhance your creativity';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'Great for gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Private and secure';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'All $DISTRO LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Power up your productivity';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Access for everyone';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Screen Reader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Language support';

  @override
  String get installationSlidesSupportTitle => 'Help & Support';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'The official $DISTRO documentation is available both online and via the Help icon in the dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'Helpful resources:';

  @override
  String get installationSlidesSupportDocumentation => 'Official documentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Enterprise-grade 24/7 support with Ubuntu Pro';

  @override
  String get copyingFiles => 'Kopiowanie plików…';

  @override
  String get installingSystem => 'Instalowanie systemu…';

  @override
  String get configuringSystem => 'Konfigurowanie systemu…';

  @override
  String get installationFailed => 'Instalacja nieudana';

  @override
  String get notEnoughDiskSpaceTitle => 'Przepraszamy';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Potrzebujesz co najmniej $SIZE przestrzeni dyskowej, aby zainstalować $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Ten komputer ma tylko $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'Największy dysk na tym komputerze ma tylko $SIZE.';
  }

  @override
  String get activeDirectoryOption => 'Użyj Active Directory';

  @override
  String get activeDirectoryInfo => 'W kolejnym kroku podasz domenę i inne szczegóły.';

  @override
  String get activeDirectoryTitle => 'Konfigurowanie Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Przetestuj łączność domeny';

  @override
  String get activeDirectoryDomainLabel => 'Domena';

  @override
  String get activeDirectoryDomainEmpty => 'Wymagana';

  @override
  String get activeDirectoryDomainTooLong => 'Zbyt długa';

  @override
  String get activeDirectoryDomainInvalidChars => 'Nieprawidłowe znaki';

  @override
  String get activeDirectoryDomainStartDot => 'Zaczyna się od kropki (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Kończy się kropką (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Zaczyna się od łącznika (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Kończy się łącznikiem (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Zawiera wiele sekwencyjnych kropek (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Nie znaleziono domeny';

  @override
  String get activeDirectoryAdminLabel => 'Użytkownik dołączający do domeny';

  @override
  String get activeDirectoryAdminEmpty => 'Wymagany';

  @override
  String get activeDirectoryAdminInvalidChars => 'Nieprawidłowe znaki';

  @override
  String get activeDirectoryPasswordLabel => 'Hasło';

  @override
  String get activeDirectoryPasswordEmpty => 'Wymagane';

  @override
  String get activeDirectoryErrorTitle => 'Błąd podczas konfigurowania połączenia z Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Przepraszamy, w tej chwili nie można skonfigurować usługi Active Directory. Gdy system będzie gotowy do pracy, odwiedź <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, aby uzyskać pomoc.';
}
