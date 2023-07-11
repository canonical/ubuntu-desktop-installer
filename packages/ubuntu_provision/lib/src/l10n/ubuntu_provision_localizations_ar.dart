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

  @override
  String get identityPageTitle => 'إعداد حسابك';

  @override
  String get identityAutoLogin => 'ولوج تلقائي';

  @override
  String get identityRequirePassword => 'طلب كلمة السر للولوج';

  @override
  String get identityRealNameLabel => 'Your name';

  @override
  String get identityRealNameRequired => 'A name is required';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'Your computer\'s name';

  @override
  String get identityHostnameInfo => 'يستخدم هذا الاسم للتواصل مع الحواسيب الأخرى.';

  @override
  String get identityHostnameRequired => 'A computer name is required';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'The computer name is invalid';

  @override
  String get identityUsernameLabel => 'Pick a username';

  @override
  String get identityUsernameRequired => 'A username is required';

  @override
  String get identityInvalidUsername => 'The username is invalid';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'Choose a password';

  @override
  String get identityPasswordRequired => 'A password is required';

  @override
  String get identityConfirmPasswordLabel => 'Confirm your password';

  @override
  String get identityPasswordMismatch => 'The passwords do not match';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';
}
