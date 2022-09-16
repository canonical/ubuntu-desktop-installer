import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Çıkış';

  @override
  String get finishButton => 'Bitir';

  @override
  String get saveButton => 'Kaydet';

  @override
  String get setupButton => 'Kurulum';

  @override
  String get selectLanguageTitle => 'Dil seçiniz';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'Profil kurulumu';

  @override
  String get profileSetupHeader => 'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Adınız';

  @override
  String get profileSetupRealnameRequired => 'İsim gereklidir';

  @override
  String get profileSetupUsernameHint => 'Kullanıcı adı seç';

  @override
  String get profileSetupUsernameHelper => 'Kullanıcı adının Windows kullanıcı adınızla eşleşmesi gerekmez.';

  @override
  String get profileSetupPasswordHint => 'Parola seç';

  @override
  String get profileSetupConfirmPasswordHint => 'Parolanızı doğrulayın';

  @override
  String get profileSetupShowAdvancedOptions => 'Gelişmiş seçenekleri sonraki sayfada göster';

  @override
  String get profileSetupPasswordMismatch => 'Parolalar uyuşmuyor';

  @override
  String get profileSetupUsernameRequired => 'Kullanıcı adı gereklidir';

  @override
  String get profileSetupUsernameInvalid => 'Kullanıcı adı geçersiz';

  @override
  String get profileSetupUsernameInUse => 'Bu kullanıcı adı zaten var.';

  @override
  String get profileSetupUsernameSystemReserved => 'Bu ad, sistem kullanımı için ayrılmıştır.';

  @override
  String get profileSetupUsernameTooLong => 'Bu ad çok uzun.';

  @override
  String get profileSetupUsernameInvalidChars => 'Bu ad geçersiz karakterler içeriyor.';

  @override
  String get profileSetupPasswordRequired => 'Parola gereklidir';

  @override
  String get advancedSetupTitle => 'Gelişmiş kurulum';

  @override
  String get advancedSetupHeader => 'Bu sayfada Ubuntu WSL\'i ihtiyaçlarınıza göre ayarlayabilirsiniz.';

  @override
  String get advancedSetupMountLocationHint => 'Bağlanma noktası';

  @override
  String get advancedSetupMountLocationHelper => 'Otomatik bağlamanın konumu';

  @override
  String get advancedSetupMountLocationInvalid => 'Konum geçersiz';

  @override
  String get advancedSetupMountOptionHint => 'Bağlama seçeneği';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Host Oluşturmayı Etkinleştir';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Seçildiğinde her başlangıçta /etc/hosts yeniden oluşturulur.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'resolv.conf Oluşturmayı Etkinleştir';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Seçildiğinde /etc/resolv.conf her başlangıçta yeniden oluşturulur.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'Arayüz Entegrasyonu';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Ubuntu WSL Yapılandırması - Gelişmiş seçenekler';

  @override
  String get configurationUIInteroperabilityHeader => 'Birlikte çalışabilirlik';

  @override
  String get configurationUIInteroperabilityTitle => 'Etkin';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Birlikte çalışabilirliğin etkin olup olmadığı.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Windows Yolu Ekle';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Otomatik Bağlama';

  @override
  String get configurationUIAutoMountTitle => 'Etkin';

  @override
  String get configurationUIAutoMountSubtitle => 'Otomatik Bağlama özelliğinin etkin olup olmadığı. Bu özellik WSL\'de Windows sürücüsünü bağlamanızı sağlar.';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab\'ı bağla';

  @override
  String get configurationUIMountFstabSubtitle => 'etc/fstab dosyasının bağlanıp bağlanmayacağı. Bu dosya, sistemin bağlayacağı dosya sistemleri hakkında bilgi içerir.';

  @override
  String get configurationUISystemdHeader => 'DENEYSEL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Etkin';

  @override
  String get configurationUISystemdSubtitle => 'systemd\'nin önyükleme sırasında etkinleştirilip etkinleştirilmeyeceği. DİKKAT: Bu deneysel bir özelliktir.';

  @override
  String get applyingChanges => 'Değişiklikler uygulanıyor…';

  @override
  String get applyingChangesDisclaimer => 'Bu işlem İnternet bağlantınıza bağlı olarak birkaç dakika sürebilir.';

  @override
  String get setupCompleteTitle => 'Kurulum tamamlandı';

  @override
  String setupCompleteHeader(Object user) {
    return 'Merhaba $user,\nKurulumu başarıyla tamamladınız.';
  }

  @override
  String get setupCompleteUpdate => 'Ubuntu\'yu en son sürüme güncellemek için aşağıdaki komutu çalıştırmanız önerilir:';

  @override
  String get setupCompleteRestart => '* Tüm ayarlar Ubuntu yeniden başlatıldıktan sonra geçerli olacaktır.';

  @override
  String get installationSlidesWelcome => 'Ubuntu WSL\'e Hoş Geldiniz';

  @override
  String get installationSlidesInitializing => 'Başlatılıyor...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Neredeyse bitti. Yükleyici yakında ilgilenmenizi gerektirecek.';

  @override
  String get installationSlidesLaunching => 'Dağıtım başlatılıyor...';

  @override
  String get installationSlidesErrorMsg => 'Bir şeyler yanlış gitti.';

  @override
  String get installationSlidesErrorTitle => 'Bir şeyler yanlış gitti';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'Her şey hazır. WSL\'de Ubuntu kullanmanın keyfini çıkarın';

  @override
  String get installationSlidesExitTitle => 'Ayrılmak istediğinden emin misin?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'İşimiz neredeyse bitti';

  @override
  String get installationSlidesCustomExitContents => 'Ana yükleyici penceresinde tamamlanması gereken sadece birkaç adım var.\nBunu bırakıp oraya gidebilir miyiz?';

  @override
  String get installationSlidesOk => 'Tamam';

  @override
  String get installationSlidesLeave => 'Ayrıl';

  @override
  String get installationSlidesCancel => 'İptal Et';

  @override
  String get installationSlidesUbuntuOnWsl => 'WSL\'de Ubuntu';

  @override
  String get installationSlidesUbuntuOnWslText => 'Linux uygulama geliştirme ve yürütme için Windows ile derinlemesine entegre edilmiş eksiksiz bir Ubuntu ortamı. Bulut, web, veri bilimi, IOT ve eğlence için optimize edilmiştir!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Web Geliştirme için\nUbuntu WSL';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Veri Bilimi için Ubuntu WSL';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Grafik Uygulamaları için\nUbuntu WSL';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'DevOps için Ubuntu WSL';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'İşletmeler için Ubuntu WSL';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Sertifikalı bir Ubuntu LTS ile \ngeliştiricileri Windows kurumsal \nekosisteminde güçlendirin.';

  @override
  String get installationSlidesFindOutMore => 'Daha fazlasını öğren';

  @override
  String get installationSlidesFindOutMoreVisit => 'Ziyaret et ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' WSL\'de Ubuntu ve Canonical\'in geliştiricileri ve kuruluşları nasıl desteklediği hakkında daha fazla bilgi edinmek için.';
}
