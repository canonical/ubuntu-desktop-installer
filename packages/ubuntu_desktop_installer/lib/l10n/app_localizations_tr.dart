import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Ubuntu Masaüstü Kurucu';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE Kur';
  }

  @override
  String get cancelButtonText => 'İptal et';

  @override
  String get changeButtonText => 'Değiştir';

  @override
  String get okButtonText => 'Tamam';

  @override
  String get noButtonText => 'Hayır';

  @override
  String get restartButtonText => 'Yeniden başlat';

  @override
  String get revertButtonText => 'Geri al';

  @override
  String get yesButtonText => 'Evet';

  @override
  String get quitButtonText => 'Kurulumdan Çık';

  @override
  String welcomePageTitle(Object DISTRO) {
    return '$DISTRO dağıtımına hoş geldiniz';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return '$DISTRO hazırlanıyor...';
  }

  @override
  String get welcomeHeader => 'Dil seçin:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return '$DISTRO\'yu dene veya kur';
  }

  @override
  String get repairInstallation => 'Kurulumu tamir et';

  @override
  String get repairInstallationDescription => 'Tamir etme seçeneği, tüm yazılımlarınızı tekrardan kuracak ve belgeleriniz ile ayarlarınıza dokunmayacaktır.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE Dene';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Bilgisayarınızda hiç bir değişiklik yapmadan $RELEASE deneyebilirsiniz.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE Kur';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Mevcut işletim sisteminizin yanına (ya da yerine) $RELEASE kur. Çok uzun sürmeyecektir.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return '<a href=\"$url\">Sürüm notlarını</a> okumak isteyebilirsiniz.';
  }

  @override
  String get turnOffRST => 'RST etkin';

  @override
  String get turnOffRSTTitle => 'Turn off RST to continue';

  @override
  String get turnOffRSTDescription => 'Bu bilgisayar Intel RST (Rapid Storage Technology) kullanmaktadır. Ubuntu\'yu kurmadan önce Windows\'tan RST\'yi kapatmalısınız.';

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
  String get detectLayout => 'Klavye düzenini algıla';

  @override
  String get detectButtonText => 'Algıla';

  @override
  String get keyboardVariant => 'Klavye yerleşimi:';

  @override
  String get pressOneKey => 'Lütfen aşağıdaki tuşlardan birine basın:';

  @override
  String get isKeyPresent => 'Aşağıdaki tuş klavyenizde bulunuyor mu?';

  @override
  String get configureSecureBootTitle => 'Güvenli Önyüklemeyi Yapılandır';

  @override
  String get configureSecureBootDescription => 'Üçüncü parti sürücüleri kurmayı seçtiniz. Bu, Güvenli Önyüklemeyi kapatmanızı gerektirir. \nBunu yapabilmek için, şimdi bir güvenlik anahtarı seçmeli ve sistem yeniden başlatıldığında bu anahtarı girmelisiniz.';

  @override
  String get configureSecureBootOption => 'Güvenli Önyüklemeyi Yapılandır';

  @override
  String get chooseSecurityKey => 'Güvenlik anahtarı seçin';

  @override
  String get confirmSecurityKey => 'Güvenlik anahtarını onaylayın';

  @override
  String get dontInstallDriverSoftwareNow => 'Şimdilik sürücü yazılımını kurma';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Daha sonra Yazılımlar ve Güncellemeler uygulamasından kurabilirsiniz.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Güvenlik anahtarı gereklidir';

  @override
  String get secureBootSecurityKeysDontMatch => 'Güvenlik anahtarları uyuşmamaktadır';

  @override
  String get showSecurityKey => 'Güvenlik anahtarını göster';

  @override
  String get connectToInternetPageTitle => 'Bir ağa bağlan';

  @override
  String get connectToInternetDescription => 'Bu bilgisayarı internete bağlamak, Ubuntu\'nun ihtiyacı olan ek yazılımları kurmasına ve zaman diliminizi seçmenize yardımcı olur.\n\nEthernet kablosuyla bağlan veya bir Wi-Fi ağı seç';

  @override
  String get useWiredConnection => 'Kablolu bağlantı kullan';

  @override
  String get noWiredConnection => 'Kablolu bağlantı saptanamadı';

  @override
  String get wiredDisabled => 'Kablolu bağlantı kapalı';

  @override
  String get wiredMustBeEnabled => 'Bilgisayarda Etherneti kullanabilrmek için kablolu bağlantı aktif hale getirilmelidir';

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
  String get updatesOtherSoftwarePageTitle => 'Uygulama ve güncelleştirmeler';

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
  String get installThirdPartyTitle => 'Grafikler ve Wi-Fi donanımı için üçüncü taraf yazılımların yanı sıra ek medya biçimlerini de kur';

  @override
  String get installThirdPartySubtitle => 'Bu yazılım, belgeleriyle birlikte verilen lisans koşullarına tabidir. Bazıları tescillidir.';

  @override
  String get installDriversTitle => 'Grafik ve Wi-Fi donanımı için üçüncü taraf yazılımları kur';

  @override
  String get installDriversSubtitle => 'Bu sürücüler, belgeleriyle birlikte verilen lisans koşullarına tabidir. Sahipli ürünlerdir.';

  @override
  String get installCodecsTitle => 'Ek ortam biçimleri desteğini indir ve kur';

  @override
  String get installCodecsSubtitle => 'Bu yazılım, belgeleriyle birlikte verilen lisans koşullarına tabidir. Bazıları sahiplidir.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Uyarı:</font> Bilgisayar güç kaynağına takılı değil.';
  }

  @override
  String get offlineWarning => 'Şu anda çevrimdışısın';

  @override
  String get chooseSecurityKeyTitle => 'Güvenlik anahtarı';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Disk şifreleme bilgisayarınızı kaybetme ihtimaline karşı dosyalarınızı korumaktadır. Bilgisayar her başladığında bir güvenlik anahtarı girmenizi gerektirmektedir.\n\n$RELEASE haricindeki dosyalar şifrelenmeyecektir.';
  }

  @override
  String get chooseSecurityKeyHint => 'Güvenlik anahtarı seç';

  @override
  String get chooseSecurityKeyConfirmHint => 'Güvenlik anahtarını onayla';

  @override
  String get chooseSecurityKeyRequired => 'Güvenlik anahtarı gereklidir';

  @override
  String get chooseSecurityKeyMismatch => 'Güvenlik anahtarları eşleşmiyor';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Uyarı:</font> Bu güvenlik anahtarını kaybederseniz tüm veriler kaybolur. Gerekirse, anahtarınızı bir yere yazın ve güvenli başka bir yerde saklayın.';
  }

  @override
  String get installationTypeTitle => 'Kurulum türü';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Bu bilgisayarda şu anda $os var. Ne yapmak istersiniz?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'Bu bilgisayarda şu anda $os1 ve $os2 var. Ne yapmak istersiniz?';
  }

  @override
  String get installationTypeMultiOSDetected => 'Bu bilgisayar şu an birden fazla işletim sistemi var. Ne yapmak istersiniz?';

  @override
  String get installationTypeNoOSDetected => 'Bu bilgisayarda herhangi bir işletim sistemi tespit edilmedi. Ne yapmak istersiniz?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Diski sil ve $DISTRO kur';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Uyarı:</font> Bu, tüm işletim sistemlerindeki tüm programları, belgeleri, fotoğrafları, müzikleri ve diğer dosyaları siler.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Gelişmiş özellikler...';

  @override
  String get installationTypeAdvancedTitle => 'İleri seviye özellikler';

  @override
  String get installationTypeNone => 'Hiçbiri';

  @override
  String get installationTypeNoneSelected => 'Hiçbiri seçilmedi';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Yeni $RELEASE kurulumuyla LVM kullan';
  }

  @override
  String get installationTypeLVMSelected => 'LVM seçildi';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM ve şifreleme seçildi';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Güvenlik için yeni $RELEASE kurulumunu şifrele';
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
    return '<font color=\"$color\">Uyarı:</font> Bu, tüm $os programlarını, belgeleri, fotoğrafları, müzikleri ve diğer dosyaları siler.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$product\'i $os yanına kurun';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return '$product işletim sistemini $os1 ve $os2 yanına kur';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return '$product işletim sistemini onların yanına kur';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return '$product işletim sistemini diğer bölümlerin yanına kur';
  }

  @override
  String get installationTypeAlongsideInfo => 'Belgeler, müzik ve diğer kişisel dosyalar korunacak. Bilgisayar her başlatıldığında hangi işletim sistemini istediğinizi seçebilirsiniz.';

  @override
  String get installationTypeManual => 'Elle bölümlendirme';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Bölümleri kendiniz oluşturabilir veya yeniden boyutlandırabilir ya da $DISTRO için birden çok bölüm seçebilirsiniz';
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
  String get selectGuidedStorageInstallNow => 'Şimdi kur';

  @override
  String get installAlongsideSpaceDivider => 'Aşağıdaki ayırıcıyı sürükleyerek sürücü alanı ayır:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num küçük bölüm gizli, daha fazla denetim için <a href=\"$url\">gelişmiş bölümleme aracını</a> kullanın';
  }

  @override
  String get installAlongsideResizePartition => 'Bölümü yeniden boyutlandır';

  @override
  String get installAlongsideAllocateSpace => 'Alan ayır';

  @override
  String get installAlongsideFiles => 'Dosyalar';

  @override
  String get installAlongsidePartition => 'Bölüm:';

  @override
  String get installAlongsideSize => 'Boyut:';

  @override
  String get installAlongsideAvailable => 'Kullanılabilir:';

  @override
  String get allocateDiskSpace => 'Elle biçimlendirme';

  @override
  String get startInstallingButtonText => 'Kur';

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
  String get freeDiskSpace => 'Boş alan';

  @override
  String get newPartitionTable => 'Yeni bölüm tablosu';

  @override
  String get newPartitionTableConfirmationTitle => 'Yeni boş bölüm';

  @override
  String get newPartitionTableConfirmationMessage => 'Cihazın tamamında yeni bir bölüm tablosu oluşturmak var olan bölümleri siler. Bu işlem gerekirse geri alınabilir.';

  @override
  String get tooManyPrimaryPartitions => 'Çok fazla birincil bölüm';

  @override
  String get partitionLimitReached => 'Sınıra ulaşıldı';

  @override
  String get bootLoaderDevice => 'Önyükleyici kurulumu yapılacak cihaz';

  @override
  String get partitionCreateTitle => 'Bölüm oluştur';

  @override
  String get partitionEditTitle => 'Bölüm düzenle';

  @override
  String get partitionSizeLabel => 'Boyut:';

  @override
  String get partitionUnitB => 'B';

  @override
  String get partitionUnitKB => 'kB';

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
  String get partitionFormatLabel => 'Kullanılan:';

  @override
  String get partitionFormatF2fs => 'Flash-Friendly File System';

  @override
  String get partitionFormatExt4 => 'Ext4 günlüklü dosya sistemi';

  @override
  String get partitionFormatExt3 => 'Ext3 günlüklü dosya sistemi';

  @override
  String get partitionFormatExt2 => 'Ext2 dosya sistemi';

  @override
  String get partitionFormatBtrfs => 'btrfs günlüklü dosya sistemi';

  @override
  String get partitionFormatJfs => 'JFS günlüklü dosya sistemi';

  @override
  String get partitionFormatXfs => 'XFS günlüklü dosya sistemi';

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
  String get partitionFormatNone => 'Biçimlendirilmemiş bırak';

  @override
  String get partitionErase => 'Bölümü biçimlendir';

  @override
  String get partitionMountPointLabel => 'Bağlama noktası:';

  @override
  String get whoAreYouPageTitle => 'Hesap oluşturun';

  @override
  String get whoAreYouPageAutoLogin => 'Otomatik giriş yap';

  @override
  String get whoAreYouPageRequirePassword => 'Giriş yapmak için parola iste';

  @override
  String get whoAreYouPageRealNameLabel => 'Adınız';

  @override
  String get whoAreYouPageRealNameRequired => 'İsim gereklidir';

  @override
  String get whoAreYouPageRealNameTooLong => 'Bu isim çok uzun.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Bilgisayar adı';

  @override
  String get whoAreYouPageComputerNameInfo => 'Bu ad, diğer bilgisayarlarla kurulan iletişim esnasında kullanılır.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Bilgisayar adı gereklidir';

  @override
  String get whoAreYouPageComputerNameTooLong => 'Bu bilgisayar ismi çok uzun.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Bilgisayar adı geçersiz';

  @override
  String get whoAreYouPageUsernameLabel => 'Kullanıcı adı seç';

  @override
  String get whoAreYouPageUsernameRequired => 'Kullanıcı adı gereklidir';

  @override
  String get whoAreYouPageInvalidUsername => 'Kullanıcı adı geçersiz';

  @override
  String get whoAreYouPageUsernameInUse => 'Bu kullanıcı adı zaten var.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Bu ad sistem kullanımı için ayrılmış.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Bu ad çok uzun.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Bu ad geçersiz karakter içeriyor.';

  @override
  String get whoAreYouPagePasswordLabel => 'Parola seç';

  @override
  String get whoAreYouPagePasswordRequired => 'Parola gereklidir';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Parolanızı doğrulayın';

  @override
  String get whoAreYouPagePasswordMismatch => 'Parolalar uyuşmuyor';

  @override
  String get whoAreYouPagePasswordShow => 'Göster';

  @override
  String get whoAreYouPagePasswordHide => 'Gizle';

  @override
  String get writeChangesToDisk => 'Kuruluma hazır';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Devam ederseniz, aşağıda listelenen değişiklikler disklere yazılacak. Daha fazla değişikliği elle yapabileceksiniz.';

  @override
  String get writeChangesDevicesTitle => 'Aygıtlar';

  @override
  String get writeChangesPartitionsTitle => 'Disk bölümleri';

  @override
  String get writeChangesPartitionTablesHeader => 'Aşağıdaki cihazların bölüm tabloları değiştirildi:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Aşağıdaki bölüm değişiklikleri uygulanacak:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return '<b>$disk$partition</b> bölümü <b>$oldsize</b> boyutundan <b>$newsize</b> boyutuna yeniden boyutlandırıldı';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return '<b>$format </b> biçimindeki <b>$disk$partition</b> bölümü <b>$mount</b> için kullanıldı';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return '<b>$disk$partition</b> bölümü <b>$format</b> olarak biçimlendirildi';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return '<b>$disk$partition</b> bölümü <b>$mount</b> için kullanıldı';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return '<b>$disk$partition</b> bölümü oluşturuldu';
  }

  @override
  String get chooseYourLookPageTitle => 'Temanızı seçin';

  @override
  String get chooseYourLookPageHeader => 'Görünüm ayarlarında bunu daha sonra değiştirebilirsiniz.';

  @override
  String get chooseYourLookPageDarkSetting => 'Koyu';

  @override
  String get chooseYourLookPageLightSetting => 'Açık';

  @override
  String get installationCompleteTitle => 'Kurulum tamamlandı';

  @override
  String readyToUse(Object system) {
    return '**$system** kuruldu ve kullanıma hazır.';
  }

  @override
  String restartInto(Object system) {
    return '$system ile yeniden başlat';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Şimdi $RELEASE test etmeye devam edebilirsiniz, ancak bilgisayarı yeniden başlatana kadar yaptığınız değişiklikler ya da kaydettiğiniz belgeler korunmayacaktır.';
  }

  @override
  String get shutdown => 'Kapat';

  @override
  String get restartNow => 'Şimdi yeniden başlat';

  @override
  String get continueTesting => 'Test etmeye devam et';

  @override
  String get turnOffBitlockerTitle => 'BitLocker aktif';

  @override
  String get turnOffBitlockerHeadline => 'Turn off BitLocker to continue';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'Bu bilgisayar Windows BitLocker şifreleme kullanıyor.\nUbuntu\'yu kurmadan önce Windows\'ta BitLocker\'ı kapatmanız gerekli.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Talimatlar için bu sayfayı telefonda veya başka bir cihazda açın: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Windows\'a yeniden başlat';

  @override
  String get restartIntoWindowsTitle => 'Restart into Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Are you sure you want to restart your computer? You will need to restart the $DISTRO installation later to finish installing $DISTRO.';
  }

  @override
  String get whereAreYouPageTitle => 'Saat diliminizi seçin';

  @override
  String get whereAreYouLocationLabel => 'Konum';

  @override
  String get whereAreYouTimezoneLabel => 'Saat Dilimi';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return '$RELEASE sürümüne hoş geldiniz';
  }

  @override
  String get installationSlidesAvailable => 'Mevcut:';

  @override
  String get installationSlidesIncluded => 'Dahil:';

  @override
  String get installationSlidesWelcomeTitle => 'Hızlı, ücretsiz ve yeni özelliklerle dolu';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return '$DISTRO\'nun son sürümü işleri hiç olmadığı kadar kolaylaştırır.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Geliştirici, içerik üreticisi, sanatçı, oyuncu ya da sistem yöneticisi olun fark etmez, $RELEASE sürümünde verimliliğinizi arttıracak ve deneyiminizi iyileştirecek yeni araçlar bulacaksınız.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'İhtiyacınız olan tüm uygulamalar';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Snap Store ve $DISTRO arşivindeki binlercesi de dahil olmak üzere tüm uygulamaları Ubuntu Software ile kurun, yönetin ve güncelleyin.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Açık kaynağın en iyisi ile geliştir';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO uygulama veya web geliştirme, veri bilimi, yapay zeka ve makine öğrenmesi yanı sıra sistem yönetimi ve DevOps için ideal iş istasyonudur. Her $DISTRO sürümü en güncel toolchainleri içerir ve tüm popüler IDE\'leri destekler.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Yaratıcılığınızı zenginleştirin';

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
  String get copyingFiles => 'Dosyalar kopyalanıyor…';

  @override
  String get installingSystem => 'Sistem kuruluyor…';

  @override
  String get configuringSystem => 'Sistem yapılandırılıyor…';

  @override
  String get installationFailed => 'Kurulum başarısız oldu';

  @override
  String get notEnoughDiskSpaceTitle => 'Üzgünüm';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';

  @override
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test domain connectivity';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domain not found';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';

  @override
  String get activeDirectoryErrorTitle => 'Error configuring connection to Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';
}
