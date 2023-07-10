import 'ubuntu_provision_localizations.dart';

/// The translations for Indonesian (`id`).
class UbuntuProvisionLocalizationsId extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get timezonePageTitle => 'Di manakah Anda?';

  @override
  String get timezoneLocationLabel => 'Lokasi';

  @override
  String get timezoneTimezoneLabel => 'Zona waktu';

  @override
  String get keyboardTitle => 'Tata letak papan ketik';

  @override
  String get keyboardHeader => 'Pilih tata letak papan ketik Anda:';

  @override
  String get keyboardTestHint => 'Ketik di sini untuk menguji papan ketik Anda';

  @override
  String get keyboardDetectTitle => 'Deteksi Tata Letak Papan Ketik';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Silakan tekan salah satu tombol berikut:';

  @override
  String get keyboardKeyPresentLabel => 'Apakah tombol berikut ada di papan ketik Anda?';

  @override
  String get themePageTitle => 'Pilih penampilan Anda';

  @override
  String get themePageHeader => 'Anda selalu dapat mengubahnya nanti di pengaturan tampilan.';

  @override
  String get themeDark => 'Gelap';

  @override
  String get themeLight => 'Terang';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'Pilih bahasa Anda:';

  @override
  String get identityPageTitle => 'Siapa kamu?';

  @override
  String get identityAutoLogin => 'Masuk secara otomatis';

  @override
  String get identityRequirePassword => 'Perlu kata sandi saya untuk masuk';

  @override
  String get identityRealNameLabel => 'Namamu';

  @override
  String get identityRealNameRequired => 'Sebuah nama diperlukan';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'Nama komputer Anda';

  @override
  String get identityHostnameInfo => 'Nama yang digunakannya saat berbicara dengan komputer lain.';

  @override
  String get identityHostnameRequired => 'Sebuah nama komputer diperlukan';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'Nama komputer tidak valid';

  @override
  String get identityUsernameLabel => 'Pilih nama pengguna';

  @override
  String get identityUsernameRequired => 'Nama pengguna diperlukan';

  @override
  String get identityInvalidUsername => 'Nama pengguna tidak valid';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'Pilih sebuah kata sandi';

  @override
  String get identityPasswordRequired => 'Kata sandi diperlukan';

  @override
  String get identityConfirmPasswordLabel => 'Konfirmasikan kata sandi Anda';

  @override
  String get identityPasswordMismatch => 'Kata sandi tidak cocok';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

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
