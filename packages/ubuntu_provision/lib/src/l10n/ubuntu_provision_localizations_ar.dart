import 'ubuntu_provision_localizations.dart';

/// The translations for Arabic (`ar`).
class UbuntuProvisionLocalizationsAr extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get timezonePageTitle => 'حدد منطقتك الزمنية';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'المنطقة الزمنية';

  @override
  String get keyboardTitle => 'تخطيط لوحة المفاتيح';

  @override
  String get keyboardHeader => 'اختر تخطيط لوحة المفاتيح:';

  @override
  String get keyboardTestHint => 'اكتب هنا لتجربة لوحة المفاتيح';

  @override
  String get keyboardDetectTitle => 'كشف تخطيط لوحة المفاتيح';

  @override
  String get keyboardDetectButton => 'كشف';

  @override
  String get keyboardVariantLabel => 'نوع لوحة المفاتيح:';

  @override
  String get keyboardPressKeyLabel => 'رجاء اضغط على أحد المفاتيح التالية:';

  @override
  String get keyboardKeyPresentLabel => 'هل هذا المفتاح موجود على لوحة مفاتيحك؟';

  @override
  String get themePageTitle => 'Choose your theme';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String localePageTitle(Object DISTRO) {
    return 'مرحبا بك في $DISTRO';
  }

  @override
  String get localeHeader => 'اختر لغتك language:';
}
