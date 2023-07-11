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

  @override
  String get activeDirectoryTitle => 'پیکربندی شاخهٔ فعّال';

  @override
  String get activeDirectoryTestConnection => 'آزمون اتّصال دامنه';

  @override
  String get activeDirectoryDomainLabel => 'دامنه';

  @override
  String get activeDirectoryDomainEmpty => 'لازم';

  @override
  String get activeDirectoryDomainTooLong => 'بیش از حد طولانی';

  @override
  String get activeDirectoryDomainInvalidChars => 'نویسه‌های نامعتبر';

  @override
  String get activeDirectoryDomainStartDot => 'با نقطه(.) آغاز می‌شود';

  @override
  String get activeDirectoryDomainEndDot => 'با نقطه(.) پایان می‌پذیرد';

  @override
  String get activeDirectoryDomainStartHyphen => 'با خط تیره(-) آغاز می‌شود';

  @override
  String get activeDirectoryDomainEndHyphen => 'با خط تیره(-) پایان می‌پذیرد';

  @override
  String get activeDirectoryDomainMultipleDots => 'دارای جندین دنباله از نقطه‌هاست (..)';

  @override
  String get activeDirectoryDomainNotFound => 'دامنه پیدا نشد';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'لازم';

  @override
  String get activeDirectoryAdminInvalidChars => 'نویسه‌های نامعتبر';

  @override
  String get activeDirectoryPasswordLabel => 'گذرواژه';

  @override
  String get activeDirectoryPasswordEmpty => 'لازم';

  @override
  String get activeDirectoryErrorTitle => 'خطا در پیکربندی وصل شدن به شاخهٔ فعّال';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';

  @override
  String get networkPageTitle => 'وصل شدن به شبکه';

  @override
  String get networkPageHeader => 'وصل کردن این رایانه به اینترنت می‌گذارد اوبونتو هر نرم‌افزار اضافی مورد نیازی را نصب کرده و به گزینش ناحیهٔ زمانیتان کمک می‌کند.\n\nبا کابل اترنت وصل شده یا شبکهٔ وای‌فای‌ای را برگزینید';

  @override
  String get networkWiredOption => 'استفاده از اتّصال سیمی';

  @override
  String get networkWiredNone => 'اتّصال سیمی شناسایی نشد';

  @override
  String get networkWiredOff => 'اتّصال سیمی خاموش است';

  @override
  String get networkWiredDisabled => 'برای استفاده از اترنت روی این رایانه، باید یک اتّصال سیمی به کار افتد';

  @override
  String get networkWiredEnable => 'به کار انداختن اتّصال سیمی';

  @override
  String get networkWifiOption => 'اتّصال به یک شبکهٔ وای‌فای';

  @override
  String get networkWifiOff => 'شبکهٔ بی‌سیم از کار افتاده است';

  @override
  String get networkWifiNone => 'هیچ افزارهٔ وای‌فای شناسایی نشد';

  @override
  String get networkWifiDisabled => 'برای استفاده از وای‌فای در این رایانه، شبکهٔ بی‌سیم باید به کار انداخته شود';

  @override
  String get networkWifiEnable => 'به کار انداختن وای‌فای';

  @override
  String get networkHiddenWifiOption => 'اتّصال به یک شبکهٔ وای‌فای مخفی';

  @override
  String get networkHiddenWifiNameLabel => 'نام شبکه';

  @override
  String get networkHiddenWifiNameRequired => 'یک نام برای شبکه مورد نیاز است';

  @override
  String get networkNoneOption => 'من نمی‌خواهم همین حالا به اینترنت متّصل شوم';
}
