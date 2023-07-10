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
}
