import 'app_localizations.dart';

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Penginstal Desktop Ubuntu';

  @override
  String windowTitle(Object RELEASE) {
    return 'Pasang $RELEASE';
  }

  @override
  String get cancelButtonText => 'Batal';

  @override
  String get changeButtonText => 'Ubah';

  @override
  String get okButtonText => 'Ok';

  @override
  String get noButtonText => 'Tidak';

  @override
  String get restartButtonText => 'Jalankan Ulang';

  @override
  String get revertButtonText => 'Kembalikan';

  @override
  String get yesButtonText => 'Ya';

  @override
  String get quitButtonText => 'Quit Installation';

  @override
  String get welcome => 'Selamat Datang';

  @override
  String get welcomeHeader => 'Pilih bahasa Anda:';

  @override
  String get tryOrInstallPageTitle => 'Coba atau pasang';

  @override
  String get repairInstallation => 'Perbaiki instalasi';

  @override
  String get repairInstallationDescription => 'Perbaikan akan memasang ulang semua perangkat lunak yang dipasang tanpa menyentuh dokumen atau pengaturan.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Coba $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Anda dapat mencoba $RELEASE tanpa membuat perubahan apa pun pada komputer Anda.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Pasang $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Pasang $RELEASE bersama (atau sebagai pengganti) sistem operasi Anda saat ini. Ini seharusnya tidak memakan waktu terlalu lama.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Anda mungkin ingin membaca <a href=\"$url\">catatan rilis</a>.';
  }

  @override
  String get turnOffRST => 'Matikan RST';

  @override
  String get turnOffRSTDescription => 'Komputer ini menggunakan Intel RST (Rapid Storage Technology). Anda harus mematikan RST di Windows sebelum memasang Ubuntu.';

  @override
  String instructionsForRST(Object url) {
    return 'Untuk petunjuk, buka halaman ini di ponsel atau perangkat lain: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Tata letak papan ketik';

  @override
  String get chooseYourKeyboardLayout => 'Pilih tata letak papan ketik Anda:';

  @override
  String get typeToTest => 'Ketik di sini untuk menguji papan ketik Anda';

  @override
  String get detectLayout => 'Deteksi Tata Letak Papan Ketik';

  @override
  String get pressOneKey => 'Silakan tekan salah satu tombol berikut:';

  @override
  String get isKeyPresent => 'Apakah tombol berikut ada di papan ketik Anda?';

  @override
  String get configureSecureBootTitle => 'Konfigurasikan Boot Aman';

  @override
  String get configureSecureBootDescription => 'Anda telah memilih untuk memasang perangkat lunak driver pihak ketiga. Ini membutuhkan mematikan Boot Aman.\nUntuk melakukan ini, Anda harus memilih kunci keamanan sekarang, dan memasukkannya saat sistem dimulai ulang.';

  @override
  String get configureSecureBootOption => 'Konfigurasikan Boot Aman';

  @override
  String get chooseSecurityKey => 'Pilih kunci keamanan';

  @override
  String get confirmSecurityKey => 'Konfirmasi kunci keamanan';

  @override
  String get dontInstallDriverSoftwareNow => 'Jangan pasang perangkat lunak driver untuk saat ini';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Anda dapat memasangnya nanti dari Perangkat Lunak & Pembaruan.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Kunci keamanan diperlukan';

  @override
  String get secureBootSecurityKeysDontMatch => 'Kunci keamanan tidak cocok';

  @override
  String get showSecurityKey => 'Show security key';

  @override
  String get connectToInternetPageTitle => 'Menyambung ke internet';

  @override
  String get connectToInternetDescription => 'Menyambungkan komputer ini ke internet akan membantu Ubuntu memasang perangkat lunak tambahan yang diperlukan dan membantu memilih zona waktu Anda.\n\nSambungkan memakai kabel ethernet, atau pilih suatu jaringan Wi-Fi';

  @override
  String get useWiredConnection => 'Gunakan sambungan kabel';

  @override
  String get noWiredConnection => 'Tidak ada sambungan kabel yang terdeteksi';

  @override
  String get wiredDisabled => 'Koneksi lewat kabel dimatikan';

  @override
  String get wiredMustBeEnabled => 'Untuk memakai ethernet pada komputer ini, suatu koneksi lewat kabel mesti difungsikan';

  @override
  String get enableWired => 'Fungsikan lewat kabel';

  @override
  String get selectWifiNetwork => 'Menyambung ke suatu jaringan Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Connect to a hidden Wi-Fi network';

  @override
  String get hiddenWifiNetworkNameLabel => 'Network name';

  @override
  String get hiddenWifiNetworkNameRequired => 'A network name is required';

  @override
  String get noInternet => 'Saya tidak ingin tersambung ke internet saat ini';

  @override
  String get wirelessNetworkingDisabled => 'Jaringan nirkabel dinonaktifkan';

  @override
  String get noWifiDevicesDetected => 'Tidak ada peranti Wi-Fi yang terdeteksi';

  @override
  String get wifiMustBeEnabled => 'Untuk memakai Wi-Fi pada komputer ini, jaringan nirkabel mesti difungsikan';

  @override
  String get enableWifi => 'Fungsikan Wi-Fi';

  @override
  String get connectButtonText => 'Sambungkan';

  @override
  String get updatesOtherSoftwarePageTitle => 'Pembaruan dan perangkat lunak lainnya';

  @override
  String get updatesOtherSoftwarePageDescription => 'Aplikasi apa yang ingin Anda pasang untuk memulai?';

  @override
  String get normalInstallationTitle => 'Instalasi normal';

  @override
  String get normalInstallationSubtitle => 'Peramban web, utilitas, perangkat lunak perkantoran, permainan, dan pemutar media.';

  @override
  String get minimalInstallationTitle => 'Instalasi minimal';

  @override
  String get minimalInstallationSubtitle => 'Peramban web dan utilitas dasar.';

  @override
  String get otherOptions => 'Opsi lain';

  @override
  String get installThirdPartyTitle => 'Pasang perangkat lunak pihak ketiga untuk perangkat keras Wi-Fi dan grafis, serta format media tambahan';

  @override
  String get installThirdPartySubtitle => 'Perangkat lunak ini tunduk pada persyaratan lisensi disertakan dengan dokumentasinya. Beberapa adalah proprietary.';

  @override
  String get installDriversTitle => 'Install third-party software for graphics and Wi-Fi hardware';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'Download and install support for additional media formats';

  @override
  String get installCodecsSubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Peringatan</font>: Komputer tidak tertancam ke suatu sumber listrik.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'Pilih kunci keamanan';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Enkripsi disk melindungi berkas-berkas Anda jika Anda kehilangan komputer. Ini mengharuskan Anda memasukkan kunci keamanan setiap kali komputer dinyalakan.\n\nBerkas apa pun di luar $RELEASE tidak akan dienkripsi.';
  }

  @override
  String get chooseSecurityKeyHint => 'Pilih kunci keamanan';

  @override
  String get chooseSecurityKeyConfirmHint => 'Konfirmasi kunci keamanan';

  @override
  String get chooseSecurityKeyRequired => 'Diperlukan kunci keamanan';

  @override
  String get chooseSecurityKeyMismatch => 'Kunci keamanan tidak cocok';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Peringatan</font>: Jika Anda kehilangan kunci keamanan ini, semua data akan hilang. Jika perlu, tuliskan kunci Anda dan simpan di tempat lain yang aman.';
  }

  @override
  String get installationTypeTitle => 'Tipe instalasi';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Komputer ini saat ini memiliki $os di dalamnya. Apa yang ingin Anda lakukan?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

  @override
  String get installationTypeNoOSDetected => 'Komputer ini saat ini tidak memiliki sistem operasi yang terdeteksi. Apa yang ingin Anda lakukan?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Hapus disk dan pasang $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Peringatan:</font> Ini akan menghapus semua program, dokumen, foto, musik, dan berkas lain Anda di semua sistem operasi.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Fitur Tingkat Lanjut...';

  @override
  String get installationTypeAdvancedTitle => 'Fitur-fitur tingkat lanjut';

  @override
  String get installationTypeNone => 'Nihil';

  @override
  String get installationTypeNoneSelected => 'Tidak ada yang dipilih';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Gunakan LVM dengan instalasi $RELEASE baru';
  }

  @override
  String get installationTypeLVMSelected => 'LVM dipilih';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Enkripsi instalasi $RELEASE baru untuk keamanan';
  }

  @override
  String get installationTypeEncryptInfo => 'Anda akan memilih kunci keamanan di langkah berikutnya.';

  @override
  String get installationTypeZFS => 'EKSPERIMENTAL: Hapus disk dan gunakan ZFS';

  @override
  String get installationTypeZFSSelected => 'ZFS dipilih';

  @override
  String installationTypeReinstall(Object os) {
    return 'Hapus $os dan pasang ulang';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Peringatan:</font> Ini akan menghapus semua program $os, dokumen, foto, musik, dan sebarang berkas lain.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Pasang $product bersama $os';
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
  String get installationTypeAlongsideInfo => 'Dokumen, musik, dan berkas-berkas pribadi lain akan disimpan. Anda dapat memilih sistem operasi yang Anda inginkan setiap kali komputer dinyalakan.';

  @override
  String get installationTypeManual => 'Sesuatu yang lain';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Anda dapat membuat atau mengubah ukuran partisi sendiri, atau memilih beberapa partisi untuk $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Hapus disk dan pasang $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Pilih drive:';

  @override
  String get selectGuidedStorageInfoLabel => 'Seluruh disk akan digunakan:';

  @override
  String get selectGuidedStorageInstallNow => 'Pasang Sekarang';

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
  String get allocateDiskSpace => 'Alokasikan ruang disk';

  @override
  String get startInstallingButtonText => 'Mulai Memasang';

  @override
  String get diskHeadersDevice => 'Perangkat';

  @override
  String get diskHeadersType => 'Tipe';

  @override
  String get diskHeadersMountPoint => 'Titik kait';

  @override
  String get diskHeadersSize => 'Ukuran';

  @override
  String get diskHeadersUsed => 'Dipakai';

  @override
  String get diskHeadersSystem => 'Sistem';

  @override
  String get diskHeadersFormat => 'Format';

  @override
  String get freeDiskSpace => 'ruang bebas';

  @override
  String get newPartitionTable => 'Tabel partisi baru';

  @override
  String get newPartitionTableConfirmationTitle => 'Buat suatu tabel partisi baru yang kosong pada peranti ini?';

  @override
  String get newPartitionTableConfirmationMessage => 'Anda telah memilih seluruh peranti untuk dipartisi. Bila Anda melanjutkan membuat suatu tabel partisi baru pada peranti ini, maka semua partisi saat ini akan dihapus.\n\nPerhatikan bahwa Anda akan dapat membatalkan operasi ini nanti bila Anda mau.';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'limit reached';

  @override
  String get bootLoaderDevice => 'Perangkat untuk instalasi boot loader';

  @override
  String get partitionCreateTitle => 'Buat partisi';

  @override
  String get partitionEditTitle => 'Sunting partisi';

  @override
  String get partitionSizeLabel => 'Ukuran:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Tipe partisi baru:';

  @override
  String get partitionTypePrimary => 'Primer';

  @override
  String get partitionTypeLogical => 'Logis';

  @override
  String get partitionLocationLabel => 'Lokasi untuk partisi baru:';

  @override
  String get partitionLocationBeginning => 'Awal dari ruang ini';

  @override
  String get partitionLocationEnd => 'Akhir dari ruang ini';

  @override
  String get partitionFormatLabel => 'Dipakai sebagai:';

  @override
  String get partitionFormatExt4 => 'Sistem berkas penjurnalan Ext4';

  @override
  String get partitionFormatExt3 => 'Sistem berkas penjurnalan Ext3';

  @override
  String get partitionFormatExt2 => 'Sistem berkas Ext2';

  @override
  String get partitionFormatBtrfs => 'Sistem berkas penjurnalan btrfs';

  @override
  String get partitionFormatJfs => 'Sistem berkas penjurnalan JFS';

  @override
  String get partitionFormatXfs => 'Sistem berkas penjurnalan XFS';

  @override
  String get partitionFormatFat => 'Sistem berkas FAT';

  @override
  String get partitionFormatFat12 => 'Sistem berkas FAT12';

  @override
  String get partitionFormatFat16 => 'Sistem berkas FAT16';

  @override
  String get partitionFormatFat32 => 'Sistem berkas FAT32';

  @override
  String get partitionFormatSwap => 'Area swap';

  @override
  String get partitionFormatIso9660 => 'Sistem berkas ISO 9660';

  @override
  String get partitionFormatVfat => 'Sistem berkas VFAT';

  @override
  String get partitionFormatNtfs => 'Sistem berkas NTFS';

  @override
  String get partitionFormatReiserFS => 'Sistem berkas ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Sistem berkas root ZFS';

  @override
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String get partitionErase => 'Format partisi';

  @override
  String get partitionMountPointLabel => 'Titik kait:';

  @override
  String get whoAreYouPageTitle => 'Siapa kamu?';

  @override
  String get whoAreYouPageAutoLogin => 'Masuk secara otomatis';

  @override
  String get whoAreYouPageRequirePassword => 'Perlu kata sandi saya untuk masuk';

  @override
  String get whoAreYouPageRealNameLabel => 'Namamu';

  @override
  String get whoAreYouPageRealNameRequired => 'Sebuah nama diperlukan';

  @override
  String get whoAreYouPageComputerNameLabel => 'Nama komputer Anda';

  @override
  String get whoAreYouPageComputerNameInfo => 'Nama yang digunakannya saat berbicara dengan komputer lain.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Sebuah nama komputer diperlukan';

  @override
  String get whoAreYouPageInvalidComputerName => 'Nama komputer tidak valid';

  @override
  String get whoAreYouPageUsernameLabel => 'Pilih nama pengguna';

  @override
  String get whoAreYouPageUsernameRequired => 'Nama pengguna diperlukan';

  @override
  String get whoAreYouPageInvalidUsername => 'Nama pengguna tidak valid';

  @override
  String get whoAreYouPageUsernameInUse => 'That user name already exists.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get whoAreYouPageUsernameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get whoAreYouPagePasswordLabel => 'Pilih sebuah kata sandi';

  @override
  String get whoAreYouPagePasswordRequired => 'Kata sandi diperlukan';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Konfirmasikan kata sandi Anda';

  @override
  String get whoAreYouPagePasswordMismatch => 'Kata sandi tidak cocok';

  @override
  String get whoAreYouPagePasswordShow => 'Show';

  @override
  String get whoAreYouPagePasswordHide => 'Hide';

  @override
  String get writeChangesToDisk => 'Tulis perubahan ke disk';

  @override
  String get writeChangesFallbackSerial => 'diska';

  @override
  String get writeChangesDescription => 'Jika Anda melanjutkan, perubahan yang tercantum di bawah ini akan ditulis ke disk. Anda akan dapat membuat perubahan lebih lanjut secara manual.';

  @override
  String get writeChangesPartitionTablesHeader => 'Tabel partisi perangkat berikut diubah:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Partisi berikut akan diformat:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'partition #$disk$partition resized from $oldsize to $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk$partition formatted as $format used for $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'partition #$disk$partition formatted as $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'partition #$disk$partition used for $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'partition #$disk$partition created';
  }

  @override
  String get chooseYourLookPageTitle => 'Pilih penampilan Anda';

  @override
  String get chooseYourLookPageHeader => 'Anda selalu dapat mengubahnya nanti di pengaturan tampilan.';

  @override
  String get chooseYourLookPageDarkSetting => 'Gelap';

  @override
  String get chooseYourLookPageLightSetting => 'Terang';

  @override
  String get installationCompleteTitle => 'Instalasi selesai';

  @override
  String readyToUse(Object system) {
    return '**$system** telah terpasang dan siap digunakan.';
  }

  @override
  String restartInto(Object system) {
    return 'Mulai ulang ke $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'You can continue testing $RELEASE now, but until you restart the computer, any changes you make or documents you save will not be preserved.';
  }

  @override
  String get shutdown => 'Matikan';

  @override
  String get restartNow => 'Restart Now';

  @override
  String get continueTesting => 'Continue Testing';

  @override
  String get turnOffBitlockerTitle => 'Matikan BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Komputer ini menggunakan enkripsi Windows BitLocker.\nAnda perlu mematikan BitLocker di Windows sebelum memasang Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Untuk petunjuk, buka halaman ini di ponsel atau perangkat lain: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Mulai Ulang Ke Windows';

  @override
  String get whereAreYouPageTitle => 'Di manakah Anda?';

  @override
  String get whereAreYouLocationLabel => 'Lokasi';

  @override
  String get whereAreYouTimezoneLabel => 'Zona waktu';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Selamat Datang ke $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Cepat dan penuh dengan fitur baru, versi terakhir $RELEASE membuat komputasi menjadi semakin mudah. Berikut adalah beberapa hal keren baru yang dapat diperhatikan...';
  }

  @override
  String get softwareSlideTitle => 'Temukan lebih banyak lagi perangkat lunak';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Say goodbye to searching the web for new software. With access to the Snap Store and the $RELEASE software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.';
  }

  @override
  String get musicSlideTitle => 'Take your music with you';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox Music Player';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Have fun with your photos';

  @override
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Shotwell Photo Manager';

  @override
  String get photoSlideGimp => 'GIMP Image Editor';

  @override
  String get photoSlideShotcut => 'Shotcut Video Editor';

  @override
  String get webSlideTitle => 'Make the most of the web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'Firefox web browser';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Everything you need for the office';

  @override
  String get officeSlideDescription => 'LibreOffice is a libre office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Access for everyone';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colors and text size, $RELEASE makes computing easy — whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Customization options';

  @override
  String get accessSlideAppearance => 'Appearance';

  @override
  String get accessSlideAssistiveTechnologies => 'Assistive technologies';

  @override
  String get accessSlideLanguageSupport => 'Language support';

  @override
  String get supportSlideTitle => 'Help and support';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common aspects of $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
  }

  @override
  String get supportSlideQuestions => 'At <a href=\"https://askubuntu.com\">Ask Ubuntu</a> you can ask questions and search an impressive collection of already answered questions. Support in your own language may be provided at your <a href=\"https://loco.ubuntu.com/teams\">Local Community Team</a>.';

  @override
  String get supportSlideResources => 'For pointers to other useful resources, please visit <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> or <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Included software';

  @override
  String get availableSoftware => 'Available software';

  @override
  String get supportedSoftware => 'Supported software';

  @override
  String get copyingFiles => 'Copying files…';

  @override
  String get installingSystem => 'Installing the system…';

  @override
  String get configuringSystem => 'Setting up the system…';

  @override
  String get installationFailed => 'Installation failed';

  @override
  String get notEnoughDiskSpaceTitle => 'Sorry';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'You need at least $SIZE disk space to install $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'This computer has only $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'The biggest disk on this computer is only $SIZE.';
  }
}
