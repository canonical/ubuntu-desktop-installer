import 'ubuntu_provision_localizations.dart';

/// The translations for Persian (`fa`).
class UbuntuProvisionLocalizationsFa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get timezonePageTitle => 'گزینش ناحیهٔ زمانیتان';

  @override
  String get timezoneLocationLabel => 'مکان';

  @override
  String get timezoneTimezoneLabel => 'ناحیهٔ زمانی';

  @override
  String get keyboardTitle => 'چیدمان صفحه‌کلید';

  @override
  String get keyboardHeader => 'گزینش چیدمان صفحه‌کلیدتان:';

  @override
  String get keyboardTestHint => 'برای آزمایش صفحه‌کلیدتان، این‌جا بنویسید';

  @override
  String get keyboardDetectTitle => 'تشخیص چیدمان صفحه‌کلید';

  @override
  String get keyboardDetectButton => 'تشخیص';

  @override
  String get keyboardVariantLabel => 'دگرگونهٔ صفحه‌کلید:';

  @override
  String get keyboardPressKeyLabel => 'لطفاً یکی از کلیدهای زیر را فشار دهید:';

  @override
  String get keyboardKeyPresentLabel => 'آیا این کلید در صفحه‌کلیدتان وجود دارد؟';

  @override
  String get themePageTitle => 'گزینش زمینه‌تان';

  @override
  String get themePageHeader => 'بعدها همواره می‌توانید این مورد را در تنظیمات ظاهر تغییر دهید.';

  @override
  String get themeDark => 'تیره';

  @override
  String get themeLight => 'روشن';

  @override
  String localePageTitle(Object DISTRO) {
    return 'به $DISTRO خوش آمدید';
  }

  @override
  String get localeHeader => 'زبانتان را برگزینید:';

  @override
  String get identityPageTitle => 'برپایی حسابتان';

  @override
  String get identityAutoLogin => 'ورود خودکار';

  @override
  String get identityRequirePassword => 'برای ورود گذر‌واژه لازم است';

  @override
  String get identityRealNameLabel => 'نامتان';

  @override
  String get identityRealNameRequired => 'نامی لازم است';

  @override
  String get identityRealNameTooLong => 'نام بیش از حد طولانی است.';

  @override
  String get identityHostnameLabel => 'نام رایانه‌تان';

  @override
  String get identityHostnameInfo => 'نامی که هنگام صحبت با دیگر رایانه‌ها استفاده می‌کند.';

  @override
  String get identityHostnameRequired => 'نام رایانه‌ای لازم است';

  @override
  String get identityHostnameTooLong => 'نام رایانه بیش از حد طولانی است.';

  @override
  String get identityInvalidHostname => 'نام رایانه نامعتبر است';

  @override
  String get identityUsernameLabel => 'گزینش نام کاربری';

  @override
  String get identityUsernameRequired => 'نام کاربری‌ای لازم است';

  @override
  String get identityInvalidUsername => 'نام کاربری نامعتبر است';

  @override
  String get identityUsernameInUse => 'این نام کاربری از پیش وجود دارد.';

  @override
  String get identityUsernameSystemReserved => 'این نام برای استفادهٔ سامانه کنار گذاشته شده.';

  @override
  String get identityUsernameTooLong => 'نام بیش از حد طولانی است.';

  @override
  String get identityUsernameInvalidChars => 'نام دارای نویسه‌های نامعتبر است.';

  @override
  String get identityPasswordLabel => 'گزینش گذرواژه';

  @override
  String get identityPasswordRequired => 'گذرواژه‌ای لازم است';

  @override
  String get identityConfirmPasswordLabel => 'تأیید گذرواژه‌تان';

  @override
  String get identityPasswordMismatch => 'گذرواژه‌ها یکسان نیستند';

  @override
  String get identityPasswordShow => 'نمایش';

  @override
  String get identityPasswordHide => 'نهفتن';

  @override
  String get identityActiveDirectoryOption => 'استفاده از شاخهٔ فعّال';

  @override
  String get identityActiveDirectoryInfo => 'در گام بعدی دامنه و دیگر حزییات را وارد خواهید کرد.';
}
