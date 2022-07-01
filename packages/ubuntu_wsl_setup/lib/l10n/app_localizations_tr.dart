


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
  String get profileSetupUsernameInUse => 'That username already exists.';

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
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. This file contains information about the filesystems the system will mount.';

  @override
  String get configurationUISystemdHeader => 'DENEYSEL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Etkin';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Değişiklikler uygulanıyor…';

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

  @override
  String get installationSlidesWelcome => 'Welcome to Ubuntu WSL';

  @override
  String get installationSlidesInitializing => 'Initializing...';

  @override
  String get installationSlidesUnpacking => 'Unpacking the distro';

  @override
  String get installationSlidesInstalling => 'Almost done. The installer will require your attention soon.';

  @override
  String get installationSlidesLaunching => 'Launching distro...';

  @override
  String get installationSlidesErrorMsg => 'Something went wrong.';

  @override
  String get installationSlidesErrorTitle => 'Something went wrong';

  @override
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get installationSlidesExitTitle => 'Are you sure you want to leave?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'We are almost done';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'Ok';

  @override
  String get installationSlidesLeave => 'Leave';

  @override
  String get installationSlidesCancel => 'Cancel';

  @override
  String get installationSlidesUbuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
