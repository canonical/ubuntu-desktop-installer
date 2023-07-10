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
}
