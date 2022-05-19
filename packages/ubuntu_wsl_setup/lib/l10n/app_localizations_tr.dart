


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
  String get finishButton => 'Finish';

  @override
  String get saveButton => 'Kaydet';

  @override
  String get setupButton => 'Kurulum';

  @override
  String get selectLanguageTitle => 'Dil seçiniz';

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
  String get profileSetupUsernameHelper => 'The username does not need to match your windows username.';

  @override
  String get profileSetupPasswordHint => 'Parola seç';

  @override
  String get profileSetupConfirmPasswordHint => 'Parolanızı doğrulayın';

  @override
  String get profileSetupShowAdvancedOptions => 'Show advanced options next page';

  @override
  String get profileSetupPasswordMismatch => 'Parolalar uyuşmuyor';

  @override
  String get profileSetupUsernameRequired => 'Kullanıcı adı gereklidir';

  @override
  String get profileSetupUsernameInvalid => 'Kullanıcı adı geçersiz';

  @override
  String get profileSetupUsernameInUse => 'That user name already exists.';

  @override
  String get profileSetupUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get profileSetupUsernameTooLong => 'That name is too long.';

  @override
  String get profileSetupUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get profileSetupPasswordRequired => 'Parola gereklidir';

  @override
  String get advancedSetupTitle => 'Gelişmiş kurulum';

  @override
  String get advancedSetupHeader => 'In this page, you can tweak Ubuntu WSL to your needs.';

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
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'resolv.conf Oluşturmayı Etkinleştir';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

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
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => '/etc/fstab\'ı bağla';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the necessary information to automate the process of mouting partitions.';

  @override
  String get configurationUISystemdHeader => 'DENEYSEL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Etkin';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Değişiklikler uygulanıyor...';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

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
}
