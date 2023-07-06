import 'ubuntu_provision_localizations.dart';

/// The translations for Amharic (`am`).
class UbuntuProvisionLocalizationsAm extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String get keyboardTitle => 'የፊደል ገበታ አቀማመጥ';

  @override
  String get keyboardHeader => 'የፊደል ገበታ ማዘጋጃ ይምረጡ :';

  @override
  String get keyboardTestHint => 'የፊደል ገበታውን ለመሞከር እዚህ ይጻፉ';

  @override
  String get keyboardDetectTitle => 'የፊደል ገበታ አዘገጃጀቱን በመፈለግ ላይ';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'እባክዎን ከእነዚህ ቁልፎች አንዱን ይጫኑ :';

  @override
  String get keyboardKeyPresentLabel => 'ይህ የሚቀጥለው ቁልፍ በእርስዎ የፊደል ገብታው ውስጥ አለ?';
}
