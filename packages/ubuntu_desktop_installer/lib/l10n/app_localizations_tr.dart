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
  String get welcome => 'Hoş Geldiniz';

  @override
  String get welcomeHeader => 'Dil seçin:';

  @override
  String get tryOrInstallPageTitle => 'Dene veya kur';

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
  String get turnOffRST => 'RST\'yi kapat';

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
  String get detectLayout => 'Klavye Düzenini Tespit Et';

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
  String get connectToInternetPageTitle => 'İnternete bağlan';

  @override
  String get connectToInternetDescription => 'Bu bilgisayarı internete bağlamak, Ubuntu\'nun ihtiyacı olan ek yazılımları kurmasına ve zaman diliminizi seçmenize yardımcı olur.\n\nEthernet kablosuyla bağlan veya bir Wi-Fi ağı seç';

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
    return '<font color=\"$color\">Uyarı</font>: Bilgisayar güç kaynağına takılı değil.';
  }

  @override
  String get offlineWarning => 'Şu anda çevrimdışısın';

  @override
  String get chooseSecurityKeyTitle => 'Güvenlik anahtarı seç';

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
    return '<font color=\"$color\">Uyarı</font>: Bu güvenlik anahtarını kaybederseniz tüm veriler kaybolur. Gerekirse, anahtarınızı bir yere yazın ve güvenli başka bir yerde saklayın.';
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
  String get installationTypeAdvancedLabel => 'İleri Seviye Özellikler...';

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
  String get installationTypeManual => 'Başka bir şey';

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
  String get selectGuidedStorageInstallNow => 'Şimdi Kur';

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
  String get freeDiskSpace => 'Boş alan';

  @override
  String get newPartitionTable => 'Yeni bölüm tablosu';

  @override
  String get newPartitionTableConfirmationTitle => 'Bu cihazda yeni bir boş bölüm tablosu oluşturulsun mu?';

  @override
  String get newPartitionTableConfirmationMessage => 'Bölümlemek için tüm cihazı seçtiniz. Yeni bölüm tablosu oluşturmaya devam ederseniz, cihazdaki mevcut tüm bölümler kaldırılacak.\n\nDilerseniz bu işlemi daha sonra geri alabileceğinizi unutmayın.';

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
  String get whoAreYouPageRealNameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Bilgisayar adı';

  @override
  String get whoAreYouPageComputerNameInfo => 'Bu ad, diğer bilgisayarlarla kurulan iletişim esnasında kullanılır.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Bilgisayar adı gereklidir';

  @override
  String get whoAreYouPageComputerNameTooLong => 'That computer name is too long.';

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
  String get writeChangesToDisk => 'Değişiklikleri diske yaz';

  @override
  String get writeChangesFallbackSerial => 'disk';

  @override
  String get writeChangesDescription => 'Devam ederseniz, aşağıda listelenen değişiklikler disklere yazılacak. Daha fazla değişikliği elle yapabileceksiniz.';

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
    return '#$disk$partition bölümü $oldsize boyutundan $newsize boyutuna yeniden boyutlandırıldı';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return '#$disk$partition bölümü ($format olarak biçimlendirilmiş) $mount için kullanıldı';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return '#$disk$partition bölümü $format olarak biçimlendirildi';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return '#$disk$partition bölümü $mount için kullanıldı';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return '#$disk$partition bölümü oluşturuldu';
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
  String get restartNow => 'Şimdi Yeniden Başlat';

  @override
  String get continueTesting => 'Test Etmeye Devam Et';

  @override
  String get turnOffBitlockerTitle => 'BitLocker\'ı kapat';

  @override
  String get turnOffBitlockerDescription => 'Bu bilgisayar Windows BitLocker şifreleme kullanıyor.\nUbuntu\'yu kurmadan önce Windows\'ta BitLocker\'ı kapatmanız gerekli.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Talimatlar için bu sayfayı telefonda veya başka bir cihazda açın: <a href=\"https://$url\">$url</a>';
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
    return 'Hızlı ve yeni özelliklerle dolu $RELEASE en son sürümü, bilgisayar kullanımını her zamankinden daha kolay hale getiriyor. İşte dikkatinici çekecek birkaç harika yenilik...';
  }

  @override
  String get softwareSlideTitle => 'Daha fazla yazılım bul';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'İnternette yeni yazılım aramaya veda edin. Snap Store ve $RELEASE yazılım arşivine erişim sayesinde yeni uygulamaları kolaylıkla bulup kurabilirsiniz. Sadece aradığınızı yazın ya da diğer kullanıcıların faydalı incelemelerini de içeren Grafik ve Fotoğraf, Oyunlar ve Üretkenlik gibi kategorileri keşfedin.';
  }

  @override
  String get musicSlideTitle => 'Müziğini yanında bulundur';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE muhteşem Rhythmbox müzik çalar ile birlikte geliyor. Gelişmiş çalma seçenekleri ile şarkıları sıraya koymak çok kolay. Ayrıca CD\'ler ve taşınabilir müzik çalarlarla harika çalışır, böylece nereye giderseniz gidin tüm müziklerinizin keyfini çıkarabilirsiniz.';
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
  String get photoSlideDescription => 'Shotwell, cihazlarınız için kullanıma hazır olan kullanışlı bir fotoğraf yöneticisidir. Fotoğraflarınızı aktarmak için kamera veya telefon bağlayın, ardından onları paylaşmak ve saklamak çok kolay. Kendinizi üretken hissediyorsanız, Ubuntu Yazılımlar ile başka birçok fotoğraf uygulaması da bulabilirsiniz.';

  @override
  String get photoSlideShotwell => 'Shotwell Fotoğraf Yöneticisi';

  @override
  String get photoSlideGimp => 'GIMP Görüntü Düzenleyici';

  @override
  String get photoSlideShotcut => 'Shotcut Video Düzenleyici';

  @override
  String get webSlideTitle => 'İnternetten en iyi şekilde yararlanın';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE dünya çapında milyonlarca kişi tarafından kullanılan web tarayıcısı Firefox ile geliyor. Ayrıca sık kullandığınız internet uygulamaları (örneğin Facebook veya Gmail gibi), tıpkı bilgisayarınızdaki uygulamalar gibi daha hızlı erişim için masaüstünüze sabitleyebilirsiniz.';
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
  String get officeSlideDescription => 'LibreOffice belgeler, tablolar ve sunumlar oluşturmak için ihtiyacınız olan her şeyi içeren özgür bir ofis paketidir. Microsoft Office dosya biçimleriyle uyumlu olan bu paket, ihtiyacınız olan tüm özellikleri size sunar.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Herkes için erişim';

  @override
  String accessSlideDescription(Object RELEASE) {
    return '$RELEASE felsefesinin temelinde, bilgisayarın herkes için olduğu inancı yatmaktadır. Gelişmiş erişilebilirlik araçları ve dil, renk ve metin boyutunu değiştirme seçenekleriyle $RELEASE, kim ve nerede olursanız olun bilgisayar kullanmayı kolaylaştırır.';
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
    return 'Resmi belgeler $RELEASE ile ilgili en yaygın konuları kapsar. Hem <a href=\"https://help.ubuntu.com\">çevrim içi</a> hem de rıhtımdaki Yardım simgesi aracılığıyla kullanılabilir.';
  }

  @override
  String get supportSlideQuestions => '<a href=\"https://askubuntu.com\">Ask Ubuntu</a> adresinden sorularınızı sorabilir ve daha önce yanıtlanmış sorular arasında arama yapabilirsiniz. Kendi dilinizde destek <a href=\"https://loco.ubuntu.com/teams/ubuntu-tr/\">Yerel Topluluk Ekibi</a> adresinden sağlanabilir.';

  @override
  String get supportSlideResources => 'Diğer faydalı kaynaklara yönlendirmeler için lütfen <a href=\"https://www.ubuntu.com/support/community-support\">Topluluk desteği</a> ya da <a href=\"https://www.ubuntu.com/support\">Kurumsal destek</a> adreslerini ziyaret edin.';

  @override
  String get includedSoftware => 'Birlikte gelen yazılımlar';

  @override
  String get availableSoftware => 'Kullanılabilir yazılım';

  @override
  String get supportedSoftware => 'Desteklenen yazılım';

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
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return '$RELEASE kurmak için en az $SIZE disk alanına ihtiyacınız var.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'Bu bilgisayarda yalnızca $SIZE alan var.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'Bu bilgisayardaki en büyük disk yalnızca $SIZE boyutunda.';
  }

  @override
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test Connection';

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
  String get activeDirectoryAdminLabel => 'Domain Administrator';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';
}
