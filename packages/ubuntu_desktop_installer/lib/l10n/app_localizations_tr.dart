


import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Masaüstü Yükleyicisi';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE Kur';
  }

  @override
  String get cancelButtonText => 'İptal Et';

  @override
  String get changeButtonText => 'Değiştir';

  @override
  String get okButtonText => 'Tamam';

  @override
  String get noButtonText => 'Hayır';

  @override
  String get restartButtonText => 'Yeniden Başlat';

  @override
  String get revertButtonText => 'Geri Al';

  @override
  String get yesButtonText => 'Evet';

  @override
  String get welcome => 'Hoş Geldiniz';

  @override
  String get welcomeHeader => 'Dil seçin:';

  @override
  String get tryOrInstallPageTitle => 'Dene veya kur';

  @override
  String get repairInstallation => 'Kurulumu Tamir Et';

  @override
  String get repairInstallationDescription => 'Tamir etme seçeneği, tüm yazılımlarınızı tekrardan yükleyecek ve belgeleriniz ile ayarlarınıza dokunmayacaktır.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE Dene';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Bilgisayarınızda hiç bir değişiklik yapmadan $RELEASE\'ü/u deneyebilirsiniz.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE\'ü/u Kur';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '$RELEASE\'ü/u halihazırda kullandığınız işletim sisteminizin yanına (ya da yerine) kur. Çok uzun sürmeyecektir.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '<a href=\"$url\">Sürüm notlarını</a> okumak isteyebilirsiniz.';
  }

  @override
  String get turnOffRST => 'RST\'yi kapat';

  @override
  String get turnOffRSTDescription => 'Bu bilgisayar Intel RST (Rapid Storage Technology) kullanmaktadır. Ubuntu\'yu yüklemeden önce Windows\'tan RST\'yi kapatmalısınız.';

  @override
  String instructionsForRST(Object url) {
    return 'Talimatlar için şu adresi bir telefondan veya başka bir cihazdan açın: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Klavye düzeni';

  @override
  String get chooseYourKeyboardLayout => 'Klavye düzeninizi seçin:';

  @override
  String get typeToTest => 'Klavyenizi test etmek için buraya yazın';

  @override
  String get detectLayout => 'Klavye Düzenini Tespit Et';

  @override
  String get pressOneKey => 'Lütfen aşağıdaki tuşlardan birine basın:';

  @override
  String get isKeyPresent => 'Aşağıdaki tuş klavyenizde bulunuyor mu?';

  @override
  String get configureSecureBootTitle => 'Güvenli Önyüklemeyi Ayarlayın';

  @override
  String get configureSecureBootDescription => 'Üçüncü parti sürücüleri yüklemeyi seçtiniz. Bu, Güvenli Önyüklemeyi kapatmanızı gerektirir. \nBunu yapabilmek için, şimdi bir güvenlik anahtarı seçmeli ve sistem yeniden başlatıldığında bu anahtarı girmelisiniz.';

  @override
  String get configureSecureBootOption => 'Güvenli Önyüklemeyi Ayarla';

  @override
  String get chooseSecurityKey => 'Güvenlik anahtarı seçin';

  @override
  String get confirmSecurityKey => 'Güvenlik anahtarını onaylayın';

  @override
  String get dontInstallDriverSoftwareNow => 'Şimdilik sürücü yazılımını yükleme';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Daha sonra Yazılımlar & Güncellemeler uygulamasından yükleyebilirsiniz.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Güvenlik anahtarı gereklidir';

  @override
  String get secureBootSecurityKeysDontMatch => 'Güvenlik anahtarları uyuşmamaktadır';

  @override
  String get connectToInternetPageTitle => 'İnternete bağlan';

  @override
  String get connectToInternetDescription => 'Bu bilgisayarı internete bağlamak, Ubuntu\'nun ihtiyacı olan ek yazılımları yüklemesine ve zaman diliminizi seçmenize yardımcı olur.\n\nEthernet kablosuyla bağlan veya bir Wi-Fi ağı seç';

  @override
  String get useWiredConnection => 'Kablolu bağlantı kullan';

  @override
  String get noWiredConnection => 'Kablolu bağlantı saptanamadı';

  @override
  String get wiredDisabled => 'Kablolu bağlantı kapalı';

  @override
  String get wiredMustBeEnabled => 'Bilgisayarda etherneti kullanabilrmek için kablolu bağlantı aktif hale getirilmelidir';

  @override
  String get enableWired => 'Kablolu bağlantıyı etkinleştir';

  @override
  String get selectWifiNetwork => 'Wi-Fi ağına bağlan';

  @override
  String get hiddenWifiNetwork => 'Gizli Wi-Fi ağına bağlan';

  @override
  String get hiddenWifiNetworkNameLabel => 'Ağ adı';

  @override
  String get hiddenWifiNetworkNameRequired => 'Ağ adı gereklidir';

  @override
  String get noInternet => 'Şu anda internete bağlanmak istemiyorum';

  @override
  String get wirelessNetworkingDisabled => 'Kablosuz ağ kapatıldı';

  @override
  String get noWifiDevicesDetected => 'Wi-Fi cihazı algılanmadı';

  @override
  String get wifiMustBeEnabled => 'Bu bilgisayarda Wi-Fi kullanmak için, kablosuz ağın etkinleştirilmiş olması gerekir';

  @override
  String get enableWifi => 'Wi-Fi\'yi etkinleştir';

  @override
  String get connectButtonText => 'Bağlan';

  @override
  String get updatesOtherSoftwarePageTitle => 'Güncellemeler ve diğer yazılımlar';

  @override
  String get updatesOtherSoftwarePageDescription => 'Başlangıç olarak hangi uygulamaları kurmak istersiniz?';

  @override
  String get normalInstallationTitle => 'Normal kurulum';

  @override
  String get normalInstallationSubtitle => 'Web tarayıcısı, yardımcı programlar, ofis yazılımı, oyunlar ve medya oynatıcılar.';

  @override
  String get minimalInstallationTitle => 'Asgari kurulum';

  @override
  String get minimalInstallationSubtitle => 'Web tarayıcısı ve temel araçlar.';

  @override
  String get otherOptions => 'Diğer seçenekler';

  @override
  String get installThirdPartyTitle => 'Grafikler ve Wi-Fi donanımı için üçüncü taraf yazılımların yanı sıra ek medya biçimlerini de yükle';

  @override
  String get installThirdPartySubtitle => 'Bu yazılım, belgeleriyle birlikte verilen lisans koşullarına tabidir. Bazıları tescillidir.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Uyarı</font>: Bilgisayar güç kaynağına takılı değil.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Güvenlik anahtarı seç';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk şifreleme bilgisayarınızı kaybetme ihtimaline karşı dosyalarınızı korumaktadır. Bilgisayar her başladığında bir güvenlik anahtarı girmenizi gerektirmektedir.\n\n${RELEASE} haricindeki dosyalar şifrelenmeyecektir.';
  }

  @override
  String get chooseSecurityKeyHint => 'Güvenlik anahtarı seç';

  @override
  String get chooseSecurityKeyConfirmHint => 'Güvenlik anahtarını onayla';

  @override
  String get chooseSecurityKeyRequired => 'Güvenlik anahtarı gerekli';

  @override
  String get chooseSecurityKeyMismatch => 'Güvenlik anahtarları eşleşmiyor';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'Kurulum türü';

  @override
  String installationTypeOSDetected(Object os) {
    return 'This computer currently has $os on it. What would you like to do?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Bu bilgisayar hâlihazırda birden fazla işletim sistemine sahip. Ne yapmak istersiniz?';

  @override
  String get installationTypeNoOSDetected => 'Bu bilgisayarda herhangi bir işletim sistemi tespit edilmedi. Ne yapmak istersiniz?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Diski sil ve $DISTRO kur';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> This will delete all your programs, documents, photos, music, and any other files in all operating systems.';
  }

  @override
  String get installationTypeAdvancedLabel => 'İleri Seviye Özellikler...';

  @override
  String get installationTypeAdvancedTitle => 'İleri seviye özellikler';

  @override
  String get installationTypeNone => 'Hiçbiri';

  @override
  String get installationTypeNoneSelected => 'Hiçbiri seçilmedi';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Use LVM with the new $RELEASE installation';
  }

  @override
  String get installationTypeLVMSelected => 'LVM seçildi';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Encrypt the new $RELEASE installation for security';
  }

  @override
  String get installationTypeEncryptInfo => 'Bir sonraki adımda güvenlik anahtarı seçeceksiniz.';

  @override
  String get installationTypeZFS => 'DENEYSEL: Diski sil ve ZFS kullan';

  @override
  String get installationTypeZFSSelected => 'ZFS seçildi';

  @override
  String installationTypeReinstall(Object os) {
    return '$os sil ve yeniden kur';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Warning:</font> This will delete all your $os programs, documents, photos, music, and any other files.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product\'i $os yanına kurun';
  }

  @override
  String get installationTypeAlongsideInfo => 'Documents, music, and other other personal files will be kept. You can choose which operating system you want each time the computer starts up.';

  @override
  String get installationTypeManual => 'Başka bir şey';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'You can create or resize partitions yourself, or choose multiple partitions for $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Diski sil ve $DISTRO kur';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Sürücü seçin:';

  @override
  String get selectGuidedStorageInfoLabel => 'Bütün disk kullanılacaktır:';

  @override
  String get selectGuidedStorageInstallNow => 'Şimdi Kur';

  @override
  String get allocateDiskSpace => 'Disk alanı ayır';

  @override
  String get startInstallingButtonText => 'Kurulumu Başlat';

  @override
  String get diskHeadersDevice => 'Cihaz';

  @override
  String get diskHeadersType => 'Tür';

  @override
  String get diskHeadersMountPoint => 'Bağlama noktası';

  @override
  String get diskHeadersSize => 'Boyut';

  @override
  String get diskHeadersUsed => 'Kullanılan';

  @override
  String get diskHeadersSystem => 'Sistem';

  @override
  String get diskHeadersFormat => 'Biçim';

  @override
  String get freeDiskSpace => 'boş alan';

  @override
  String get newPartitionTable => 'Yeni bölüm tablosu';

  @override
  String get newPartitionTableConfirmationTitle => 'Bu cihazda yeni bir boş bölüm tablosu oluştur?';

  @override
  String get newPartitionTableConfirmationMessage => 'You have selected an entire device to partition. If you proceed with creating a new partition table on the device, then all current partitions will be removed.\n\nNote that you will be able to undo this operation later if you wish.';

  @override
  String get bootLoaderDevice => 'Device for boot loader installation';

  @override
  String get partitionCreateTitle => 'Bölüm oluştur';

  @override
  String get partitionEditTitle => 'Bölüm düzenle';

  @override
  String get partitionSizeLabel => 'Boyut:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'KB';

  @override
  String get partitionUnitMB => 'MB';

  @override
  String get partitionUnitGB => 'GB';

  @override
  String get partitionTypeLabel => 'Yeni bölümün türü:';

  @override
  String get partitionTypePrimary => 'Birincil';

  @override
  String get partitionTypeLogical => 'Mantıksal';

  @override
  String get partitionLocationLabel => 'Yeni bölümün konumu:';

  @override
  String get partitionLocationBeginning => 'Bu alanın başlangıcı';

  @override
  String get partitionLocationEnd => 'Bu alanın sonu';

  @override
  String get partitionFormatLabel => 'Used as:';

  @override
  String get partitionFormatExt4 => 'Ext4 journaling file system';

  @override
  String get partitionFormatExt3 => 'Ext3 journaling file system';

  @override
  String get partitionFormatExt2 => 'Ext2 dosya sistemi';

  @override
  String get partitionFormatBtrfs => 'btrfs journaling file system';

  @override
  String get partitionFormatJfs => 'JFS journaling file system';

  @override
  String get partitionFormatXfs => 'XFS journaling file system';

  @override
  String get partitionFormatFat => 'FAT dosya sistemi';

  @override
  String get partitionFormatFat12 => 'FAT12 dosya sistemi';

  @override
  String get partitionFormatFat16 => 'FAT16 dosya sistemi';

  @override
  String get partitionFormatFat32 => 'FAT32 dosya sistemi';

  @override
  String get partitionFormatSwap => 'Takas alanı';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 dosya sistemi';

  @override
  String get partitionFormatVfat => 'VFAT dosya sistemi';

  @override
  String get partitionFormatNtfs => 'NTFS dosya sistemi';

  @override
  String get partitionFormatReiserFS => 'ReiserFS dosya sistemi';

  @override
  String get partitionFormatZfsroot => 'ZFS root dosya sistemi';

  @override
  String get partitionErase => 'Bölümü biçimlendir';

  @override
  String get partitionMountPointLabel => 'Bağlama noktası:';

  @override
  String get whoAreYouPageTitle => 'Kimsiniz?';

  @override
  String get whoAreYouPageAutoLogin => 'Otomatik giriş yap';

  @override
  String get whoAreYouPageRequirePassword => 'Giriş yapmak için parola iste';

  @override
  String get whoAreYouPageRealNameLabel => 'Adınız';

  @override
  String get whoAreYouPageRealNameRequired => 'İsim gereklidir';

  @override
  String get whoAreYouPageComputerNameLabel => 'Bilgisayar adı';

  @override
  String get whoAreYouPageComputerNameInfo => 'Bu ad, diğer bilgisayarlarla kurulan iletişim esnasında kullanılır.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Bilgisayar adı gereklidir';

  @override
  String get whoAreYouPageInvalidComputerName => 'Bilgisayar adı geçersiz';

  @override
  String get whoAreYouPageUsernameLabel => 'Kullanıcı adı seç';

  @override
  String get whoAreYouPageUsernameRequired => 'Kullanıcı adı gereklidir';

  @override
  String get whoAreYouPageInvalidUsername => 'Kullanıcı adı geçersiz';

  @override
  String get whoAreYouPagePasswordLabel => 'Parola seç';

  @override
  String get whoAreYouPagePasswordRequired => 'Parola gereklidir';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Parolanızı doğrulayın';

  @override
  String get whoAreYouPagePasswordMismatch => 'Parolalar uyuşmuyor';

  @override
  String get whoAreYouPageShowPassword => 'Parolayı göster';

  @override
  String get writeChangesToDisk => 'Değişiklikleri diske yaz';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesPartitionTablesHeader => 'The partition tables of the following devices are changed:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Aşağıdaki bölümler biçimlendirilecek:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'partition #$disk${partition} as $format used for $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'partition #$disk${partition} as $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Görünüm seçin';

  @override
  String get chooseYourLookPageHeader => 'Görünüm ayarlarında bunu daha sonra değiştirebilirsiniz.';

  @override
  String get chooseYourLookPageDarkSetting => 'Koyu';

  @override
  String get chooseYourLookPageLightSetting => 'Açık';

  @override
  String get chooseYourLookPageLightBodyText => 'Herşey açık ve parlak';

  @override
  String get chooseYourLookPageDarkBodyText => 'Merhaba eski arkadaşım karanlık';

  @override
  String get installationCompleteTitle => 'Kurulum tamamlandı';

  @override
  String readyToUse(Object system) {
    return '**$system** kuruldu ve kullanıma hazır.';
  }

  @override
  String restartInto(Object system) {
    return 'Restart into $system';
  }

  @override
  String get shutdown => 'Kapat';

  @override
  String get turnOffBitlockerTitle => 'BitLocker\'ı kapat';

  @override
  String get turnOffBitlockerDescription => 'This computer uses Windows BitLocker encryption.\nYou need to turn off BitLocker in Windows before installing Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'For instructions, open this page on a phone or other device: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Windows\'a Yeniden Başlat';

  @override
  String get whereAreYouPageTitle => 'Neredesiniz?';

  @override
  String get whereAreYouLocationLabel => 'Konum';

  @override
  String get whereAreYouTimezoneLabel => 'Saat Dilimi';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return '$RELEASE hoşgeldiniz';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Fast and full of new features, the latest version of $RELEASE makes computing easier than ever. Here are just a few cool new things to look out for...';
  }

  @override
  String get softwareSlideTitle => 'Daha fazla yazılım bul';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Say goodbye to searching the web for new software. With access to the Snap Store and the $RELEASE software archive, you can find and install new apps with ease. Just type in what you\'re looking for, or explore categories such as Graphics & Photography, Games and Productivity, alongside helpful reviews from other users.';
  }

  @override
  String get musicSlideTitle => 'Müziğini yanında bulundur';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE comes with the amazing Rhythmbox music player. With advanced playback options, it\'s simple to queue up the perfect songs. And it works great with CDs and portable music players, so you can enjoy all your music wherever you go.';
  }

  @override
  String get musicSlideRhythmbox => 'Rhythmbox Müzik Oynatıcısı';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Fotoğraflarınızla iyi eğlenceler';

  @override
  String get photoSlideDescription => 'Shotwell is a handy photo manager that is ready for your gadgets. Connect a camera or a phone to transfer your photos, then it\'s easy to share them and keep them safe. And if you\'re feeling creative, you can find many other photo apps in Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Shotwell Fotoğraf Yöneticisi';

  @override
  String get photoSlideGimp => 'GIMP Görüntü Düzenleyici';

  @override
  String get photoSlideShotcut => 'Shotcut Video Düzenleyici';

  @override
  String get webSlideTitle => 'Make the most of the web';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE includes Firefox, the web browser used by millions of people around the world. And web applications you use frequently (like Facebook or Gmail, for example) can be pinned to your desktop for faster access, just like apps on your computer.';
  }

  @override
  String get webSlideFirefox => 'Firefox web tarayıcısı';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Ofis için ihtiyacınız olan her şey';

  @override
  String get officeSlideDescription => 'LibreOffice is a free office suite packed with everything you need to create documents, spreadsheets and presentations. Compatible with Microsoft Office file formats, it gives you all the features you need, without the price tag.';

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
    return 'At the heart of the $RELEASE philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, color schome and text size, $RELEASE makes computing easy - whoever and wherever you are.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Özelleştirme seçenekleri';

  @override
  String get accessSlideAppearance => 'Görünüm';

  @override
  String get accessSlideAssistiveTechnologies => 'Yardımcı teknolojiler';

  @override
  String get accessSlideLanguageSupport => 'Dil desteği';

  @override
  String get supportSlideTitle => 'Yardım ve destek';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'The official documentation covers many of the most common areas about $RELEASE. It\'s available both <a href=\"https://help.ubuntu.com\">online</a> and via the Help icon in the dock.';
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
  String get copyingFiles => 'Copying files...';

  @override
  String get installationFailed => 'Installation failed';
}
