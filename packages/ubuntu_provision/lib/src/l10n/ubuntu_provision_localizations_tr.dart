import 'ubuntu_provision_localizations.dart';

/// The translations for Turkish (`tr`).
class UbuntuProvisionLocalizationsTr extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get timezonePageTitle => 'Saat diliminizi seçin';

  @override
  String get timezoneLocationLabel => 'Konum';

  @override
  String get timezoneTimezoneLabel => 'Saat Dilimi';

  @override
  String get keyboardTitle => 'Klavye düzeni';

  @override
  String get keyboardHeader => 'Klavye düzeninizi seçin:';

  @override
  String get keyboardTestHint => 'Klavyenizi test etmek için buraya yazın';

  @override
  String get keyboardDetectTitle => 'Klavye düzenini algıla';

  @override
  String get keyboardDetectButton => 'Algıla';

  @override
  String get keyboardVariantLabel => 'Klavye yerleşimi:';

  @override
  String get keyboardPressKeyLabel => 'Lütfen aşağıdaki tuşlardan birine basın:';

  @override
  String get keyboardKeyPresentLabel => 'Aşağıdaki tuş klavyenizde bulunuyor mu?';

  @override
  String get themePageTitle => 'Temanızı seçin';

  @override
  String get themePageHeader => 'Görünüm ayarlarında bunu daha sonra değiştirebilirsiniz.';

  @override
  String get themeDark => 'Koyu';

  @override
  String get themeLight => 'Açık';

  @override
  String localePageTitle(Object DISTRO) {
    return '$DISTRO dağıtımına hoş geldiniz';
  }

  @override
  String get localeHeader => 'Dil seçin:';

  @override
  String get identityPageTitle => 'Hesap oluşturun';

  @override
  String get identityAutoLogin => 'Otomatik giriş yap';

  @override
  String get identityRequirePassword => 'Giriş yapmak için parola iste';

  @override
  String get identityRealNameLabel => 'Adınız';

  @override
  String get identityRealNameRequired => 'İsim gereklidir';

  @override
  String get identityRealNameTooLong => 'Bu isim çok uzun.';

  @override
  String get identityHostnameLabel => 'Bilgisayar adı';

  @override
  String get identityHostnameInfo => 'Bu ad, diğer bilgisayarlarla kurulan iletişim esnasında kullanılır.';

  @override
  String get identityHostnameRequired => 'Bilgisayar adı gereklidir';

  @override
  String get identityHostnameTooLong => 'Bu bilgisayar ismi çok uzun.';

  @override
  String get identityInvalidHostname => 'Bilgisayar adı geçersiz';

  @override
  String get identityUsernameLabel => 'Kullanıcı adı seç';

  @override
  String get identityUsernameRequired => 'Kullanıcı adı gereklidir';

  @override
  String get identityInvalidUsername => 'Kullanıcı adı geçersiz';

  @override
  String get identityUsernameInUse => 'Bu kullanıcı adı zaten var.';

  @override
  String get identityUsernameSystemReserved => 'Bu ad sistem kullanımı için ayrılmış.';

  @override
  String get identityUsernameTooLong => 'Bu ad çok uzun.';

  @override
  String get identityUsernameInvalidChars => 'Bu ad geçersiz karakter içeriyor.';

  @override
  String get identityPasswordLabel => 'Parola seç';

  @override
  String get identityPasswordRequired => 'Parola gereklidir';

  @override
  String get identityConfirmPasswordLabel => 'Parolanızı doğrulayın';

  @override
  String get identityPasswordMismatch => 'Parolalar uyuşmuyor';

  @override
  String get identityPasswordShow => 'Göster';

  @override
  String get identityPasswordHide => 'Gizle';

  @override
  String get identityActiveDirectoryOption => 'Active Directory kullan';

  @override
  String get identityActiveDirectoryInfo => 'Bir sonraki adımda alan adı ve diğer ayrıntıları gireceksiniz.';
}
