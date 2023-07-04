import 'app_localizations.dart';

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'نصب کنندهٔ میزکار اوبونتو';

  @override
  String windowTitle(Object RELEASE) {
    return 'نصب $RELEASE';
  }

  @override
  String get changeButtonText => 'تغییر';

  @override
  String get restartButtonText => 'آغاز دوباره';

  @override
  String get revertButtonText => 'بازگردانی';

  @override
  String get quitButtonText => 'خروج از نصب';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'به $DISTRO خوش آمدید';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'آماده‌سازی $DISTRO…';
  }

  @override
  String get welcomeHeader => 'زبانتان را برگزینید:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'آزمودن یا نصب $DISTRO';
  }

  @override
  String get repairInstallation => 'تعمیر نصب';

  @override
  String get repairInstallationDescription => 'تعمیر، همهٔ نرم افزارهای نصب شده را بدون دست زدن به اسناد یا تنظیمات، دوباره نصب می‌کند.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'آزمودن $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'شما می‌توانید $RELEASE را بدون ایجاد هیچ تغییری در رایانه خود امتحان کنید.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'نصب $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return '$RELEASE را در کنار (یا به جای) سیستم‌عامل کنونی شما نصب می‌کنید. این نباید خیلی طول بکشد.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'ممکن است بخواهید <a href=\"$url\">یادداشت‌های انتشار</a> را بخوانید.';
  }

  @override
  String get rstTitle => 'RST به کار افتاده';

  @override
  String get rstHeader => 'برای ادامه RST را خاموش کنید';

  @override
  String get rstDescription => 'این کامپیوتر از Intel RST (فناوری ذخیره‌سازی سریع) استفاده می‌کند. قبل از نصب اوبونتو باید RST را در ویندوز خاموش کنید.';

  @override
  String rstInstructions(Object url) {
    return 'برای دستورالعمل‌ها، رمز پاس را روی افزاره‌ای دیگر پوییده یا ببینید: <a href=\"https://$url\">$url</a>';
  }

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
  String get configureSecureBootTitle => 'پیکربندی راه‌اندازی ایمن';

  @override
  String get configureSecureBootDescription => 'شما نصب نرم‌افزار درایور شخص ثالث را انتخاب کرده‌اید. برای این کار باید راه‌اندازی ایمن را خاموش کنید.\nبرای انجام این کار، اکنون باید یک کلید امنیتی را انتخاب کنید و پس از راه اندازی دوبارهٔ سامانه، آن را وارد کنید.';

  @override
  String get configureSecureBootOption => 'پیکربندی راه‌اندازی ایمن';

  @override
  String get chooseSecurityKey => 'انتخاب یک کلید امنیتی';

  @override
  String get confirmSecurityKey => 'تأیید کلید امنیتی';

  @override
  String get dontInstallDriverSoftwareNow => 'فعلاً نرم‌افزار درایور را نصب نکن';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'شما می‌توانید آن را بعداً از نرم‌افزارها و به‌روز رسانی‌ها نصب کنید.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'کلید امنیتی مورد نیاز است';

  @override
  String get secureBootSecurityKeysDontMatch => 'کلیدهای امنیتی مطابقت ندارند';

  @override
  String get showSecurityKey => 'نمایش کلید امنیتی';

  @override
  String get connectToInternetPageTitle => 'وصل شدن به شبکه';

  @override
  String get connectToInternetDescription => 'وصل کردن این رایانه به اینترنت می‌گذارد اوبونتو هر نرم‌افزار اضافی مورد نیازی را نصب کرده و به گزینش ناحیهٔ زمانیتان کمک می‌کند.\n\nبا کابل اترنت وصل شده یا شبکهٔ وای‌فای‌ای را برگزینید';

  @override
  String get useWiredConnection => 'استفاده از اتّصال سیمی';

  @override
  String get noWiredConnection => 'اتّصال سیمی شناسایی نشد';

  @override
  String get wiredDisabled => 'اتّصال سیمی خاموش است';

  @override
  String get wiredMustBeEnabled => 'برای استفاده از اترنت روی این رایانه، باید یک اتّصال سیمی به کار افتد';

  @override
  String get enableWired => 'به کار انداختن اتّصال سیمی';

  @override
  String get selectWifiNetwork => 'اتّصال به یک شبکهٔ وای‌فای';

  @override
  String get hiddenWifiNetwork => 'اتّصال به یک شبکهٔ وای‌فای مخفی';

  @override
  String get hiddenWifiNetworkNameLabel => 'نام شبکه';

  @override
  String get hiddenWifiNetworkNameRequired => 'یک نام برای شبکه مورد نیاز است';

  @override
  String get noInternet => 'من نمی‌خواهم همین حالا به اینترنت متّصل شوم';

  @override
  String get wirelessNetworkingDisabled => 'شبکهٔ بی‌سیم از کار افتاده است';

  @override
  String get noWifiDevicesDetected => 'هیچ افزارهٔ وای‌فای شناسایی نشد';

  @override
  String get wifiMustBeEnabled => 'برای استفاده از وای‌فای در این رایانه، شبکهٔ بی‌سیم باید به کار انداخته شود';

  @override
  String get enableWifi => 'به کار انداختن وای‌فای';

  @override
  String get connectButtonText => 'وصل شدن';

  @override
  String get updatesOtherSoftwarePageTitle => 'برنامه‌ها و به‌روز رسانی‌ها';

  @override
  String get updatesOtherSoftwarePageDescription => 'برای شروع چه برنامه‌هایی را می‌خواهید نصب کنید؟';

  @override
  String get normalInstallationTitle => 'نصب معمولی';

  @override
  String get normalInstallationSubtitle => 'مرورگر وب، برنامه‌های کاربردی، نرم‌افزار آفیس، بازی‌ها و پخش‌کننده‌های رسانه‌ای.';

  @override
  String get minimalInstallationTitle => 'نصب کمینه';

  @override
  String get minimalInstallationSubtitle => 'مرورگر وب و ابزارهای پایه.';

  @override
  String get otherOptions => 'دیگر گزینه‌ها';

  @override
  String get installThirdPartyTitle => 'نرم‌افزارهای شخص ثالث را برای سخت‌افزارهای گرافیکی و وای‌فای و همچنین قالب‌های رسانه‌ای اضافی نصب کنید';

  @override
  String get installThirdPartySubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String get installDriversTitle => 'نصب نرم‌افزارهای سوم‌شخص برای سخت‌افزارهای وای‌فای و گرافیک';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'بارگیری و نصب پشتیبانی برای قالب‌های رسانه‌ای بیش‌تر';

  @override
  String get installCodecsSubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">هشدار:</font> رایانه به برق وصل نیست.';
  }

  @override
  String get offlineWarning => 'در حال حاضر برون‌خطید';

  @override
  String get chooseSecurityKeyTitle => 'کلید امنیتی';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'رمزنگاری دیسک، از پرونده‌هایتان در صورت گم کردن رایانه‌تان حفاظت می‌کند. این کار نیازمند وارد کردن یک کلید امنیتی در هر بار روشن کردن رایانه است.\n\nهیچ پرونده‌ای بیرون $RELEASE رمزنگاری نخواهد شد.';
  }

  @override
  String get chooseSecurityKeyHint => 'گزینش کلید امنیتی';

  @override
  String get chooseSecurityKeyConfirmHint => 'تأیید کلید امنیتی';

  @override
  String get chooseSecurityKeyRequired => 'کلید امنیتی‌ای لازم است';

  @override
  String get chooseSecurityKeyMismatch => 'کلیدهای امنیتی یکسان نیستند';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Warning:</font> If you lose this security key, all data will be lost. If you need to, write down your key and keep it in a safe place elsewhere.';
  }

  @override
  String get installationTypeTitle => 'گونهٔ نصب';

  @override
  String installationTypeOSDetected(Object os) {
    return 'این رایانه اکنون $os دارد. می‌خواهید چه کنید؟';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'این رایانه اکنون $os1 و $os2 را دارد. می‌خواهید چه کنید؟';
  }

  @override
  String get installationTypeMultiOSDetected => 'این رایانه هم‌اکنون دارای چندین سیستم‌عامل است. می‌خواهید چه کنید؟';

  @override
  String get installationTypeNoOSDetected => 'این رایانه هم‌اکنون دارای هیچ سیستم‌عامل شناخته‌شده‌ای نیست. می‌خواهید چه کنید؟';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'پاک کردن دیسک و نصب $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">هشدار:</font> این کار تمامی برنامه‌ها، سندها، نگاره‌ها، آهنگ‌ها و هر پروندهٔ دیگری را روی هر سیستم‌عاملی حذف خواهد کرد.';
  }

  @override
  String get installationTypeAdvancedLabel => 'ویژگی‌های پیش‌رفته…';

  @override
  String get installationTypeAdvancedTitle => 'ویژگی‌های پیش‌رفته';

  @override
  String get installationTypeNone => 'هیچ‌کدام';

  @override
  String get installationTypeNoneSelected => 'هیچ‌کدام گزیده نشدند';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'استفاده از LVM برای نصب $RELEASE جدید';
  }

  @override
  String get installationTypeLVMSelected => 'استفاده از LVM گزیده شد';

  @override
  String get installationTypeLVMEncryptionSelected => 'استفاده از LVM و رمزنگاری گزیده شد';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'رمزنگاری نصب $RELEASE جدید برای امنیت';
  }

  @override
  String get installationTypeEncryptInfo => 'در گام بعدی، کلید امنیتی‌ای خواهید گزید.';

  @override
  String get installationTypeZFS => 'آزمایشی: پاک کردن دیسک و استفاده از ZFS';

  @override
  String get installationTypeZFSSelected => 'استفاده از ZFS گزیده شد';

  @override
  String installationTypeReinstall(Object os) {
    return 'پاک کردن $os و نصب دوباره';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">هشدار:</font> این کار تمامی برنامه‌ها، سندها، نگاره‌ها، آهنگ‌ها و هر پروندهٔ دیگری روی $os را حذف خواهد کرد.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'نصب $product کنار $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'نصب $product کنار $os1 و $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'نصب $product کنارشان';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'نصب $product کنار دیگر افرازها';
  }

  @override
  String get installationTypeAlongsideInfo => 'سندها، آهنگ‌ها و دیگرپرونده‌های شخصی حفظ خواهند شد. هر بار که رایانه روشن می‌شود می‌توانید بگزینید که کدام سیستم‌عامل را می‌خواهید.';

  @override
  String get installationTypeManual => 'افرازش دستی';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'می‌توانید خودتان افرازها را ایحاد و تغییر اندازه داده یا چندین افراز را برای $DISTRO برگزینید';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'پاک کردن دیسک و نصب $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'گزینش گرداننده:';

  @override
  String get selectGuidedStorageInfoLabel => 'تمام دیسک استفاده خواهد شد:';

  @override
  String get selectGuidedStorageInstallNow => 'اکنون نصب شود';

  @override
  String get installAlongsideSpaceDivider => 'با کشیدن تقسیم‌کنندهٔ زیر، فضای گرداننده را تخصیص دهید:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'تغییر اندازهٔ افراز';

  @override
  String get installAlongsideAllocateSpace => 'تخصیص فضا';

  @override
  String get installAlongsideFiles => 'پرونده‌ها';

  @override
  String get installAlongsidePartition => 'افراز:';

  @override
  String get installAlongsideSize => 'اندازه:';

  @override
  String get installAlongsideAvailable => 'موجود:';

  @override
  String get allocateDiskSpace => 'افرازش دستی';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Mount points must start with \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Mount points cannot contain spaces';

  @override
  String get startInstallingButtonText => 'نصب';

  @override
  String get diskHeadersDevice => 'افزاره';

  @override
  String get diskHeadersType => 'گونه';

  @override
  String get diskHeadersMountPoint => 'نقطهٔ سوار شدن';

  @override
  String get diskHeadersSize => 'اندازه‌';

  @override
  String get diskHeadersUsed => 'استفاده شده';

  @override
  String get diskHeadersSystem => 'سامانه';

  @override
  String get diskHeadersFormat => 'قالب‌بندی';

  @override
  String get freeDiskSpace => 'فضای آزاد';

  @override
  String get newPartitionTable => 'جدول افراز جدید';

  @override
  String get newPartitionTableConfirmationTitle => 'افراز خالی جدید';

  @override
  String get newPartitionTableConfirmationMessage => 'Creating a new partition table on an entire device will remove all of its current partitions. This operation can be undone if needed.';

  @override
  String get tooManyPrimaryPartitions => 'افرازهای اصلی بیش از حد';

  @override
  String get partitionLimitReached => 'به محدودیت رسیده';

  @override
  String get bootLoaderDevice => 'افزاره برای نصب بارکنندهٔ راه‌اندازی';

  @override
  String get partitionCreateTitle => 'ایجاد افراز';

  @override
  String get partitionEditTitle => 'ویرایش افراز';

  @override
  String get partitionSizeLabel => 'اندازه:';

  @override
  String get partitionUnitB => 'ب';

  @override
  String get partitionUnitKB => 'ک‌ب';

  @override
  String get partitionUnitMB => 'م‌ب';

  @override
  String get partitionUnitGB => 'گ‌ب';

  @override
  String get partitionTypeLabel => 'گونهٔ افراز جدید:';

  @override
  String get partitionTypePrimary => 'اصلی';

  @override
  String get partitionTypeLogical => 'منطقی';

  @override
  String get partitionLocationLabel => 'مکان افراز جدید:';

  @override
  String get partitionLocationBeginning => 'ابتدای این فضا';

  @override
  String get partitionLocationEnd => 'پایان این فضا';

  @override
  String get partitionFormatLabel => 'استفاده شده برای:';

  @override
  String get partitionFormatNone => 'قالب‌بندی نشده گذاشتن';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'قالب‌بندی افراز';

  @override
  String get partitionMountPointLabel => 'نقطهٔ سوار کردن:';

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
  String get writeChangesToDisk => 'آمادهٔ نصب';

  @override
  String get writeChangesFallbackSerial => 'دیسک';

  @override
  String get writeChangesDescription => 'If you continue, the changes listed below will be written to the disks. You will be able to make further changes manually.';

  @override
  String get writeChangesDevicesTitle => 'افزاره‌ها';

  @override
  String get writeChangesPartitionsTitle => 'افزارها';

  @override
  String get writeChangesPartitionTablesHeader => 'جدول افرازهای افزاره‌های زیر تغییر کرده‌اند:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'تغییرهای افراز زیرمی‌خواهند اعمال شوند:';

  @override
  String writeChangesPartitionResized(Object sysname, Object oldsize, Object newsize) {
    return 'اندازهٔ افراز <b>$sysname</b> از <b>$oldsize</b> به <b>$newsize</b> تغییر کرد';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object sysname, Object format, Object mount) {
    return 'افراز <b>$sysname</b> به صورت <b>$format</b> برای <b>$mount</b> قالب‌بندی شد';
  }

  @override
  String writeChangesPartitionFormatted(Object sysname, Object format) {
    return 'افراز <b>$sysname</b> به صورت <b>$format</b> قالب‌بندی شد';
  }

  @override
  String writeChangesPartitionMounted(Object sysname, Object mount) {
    return 'افراز <b>$sysname</b> برای <b>$mount</b> استفاده شد';
  }

  @override
  String writeChangesPartitionCreated(Object sysname) {
    return 'افراز <b>$sysname</b> ایجاد شد';
  }

  @override
  String get themePageTitle => 'گزینش زمینه‌تان';

  @override
  String get themePageHeader => 'بعدها همواره می‌توانید این مورد را در تنظیمات ظاهر تغییر دهید.';

  @override
  String get themeDark => 'تیره';

  @override
  String get themeLight => 'روشن';

  @override
  String get installationCompleteTitle => 'نصب کامل شد';

  @override
  String readyToUse(Object system) {
    return '**$system** نصب شده و آمادهٔ استفاده است';
  }

  @override
  String restartInto(Object system) {
    return 'آغاز دوباره به $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'اکنون می‌توانید به آزمودن $RELEASE ادامه دهید؛ ولی تا زمانی که رایانه را دوباره آغاز کنید، هر تغییری یا سندی که ایجاد کنید حفظ نخواهد شد.';
  }

  @override
  String get shutdown => 'خاموش کردن';

  @override
  String get restartNow => 'اکنون دوباره آغاز شود';

  @override
  String get continueTesting => 'ادامهٔ آزمودن';

  @override
  String get bitlockerTitle => 'بیت‌لاکر به کار افتاده';

  @override
  String get bitlockerHeader => 'برای ادامه بیت‌لاکر را خاموش کنید';

  @override
  String bitlockerDescription(Object option) {
    return 'This computer uses Windows BitLocker encryption.\nYou need to use Windows to create free space or choose \'$option\' to continue.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'برای دستورالعمل‌ها، رمز پاس را روی افزاره‌ای دیگر پوییده یا ببینید: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'آغاز دوباره به ویندوز';

  @override
  String get restartIntoWindowsTitle => 'آغاز دوباره به ویندوز؟';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Are you sure you want to restart your computer? You will need to restart the $DISTRO installation later to finish installing $DISTRO.';
  }

  @override
  String get timezonePageTitle => 'گزینش ناحیهٔ زمانیتان';

  @override
  String get timezoneLocationLabel => 'مکان';

  @override
  String get timezoneTimezoneLabel => 'ناحیهٔ زمانی';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'به $RELEASE خوش آمدید';
  }

  @override
  String get installationSlidesAvailable => 'موجود:';

  @override
  String get installationSlidesIncluded => 'دارای:';

  @override
  String get installationSlidesWelcomeTitle => 'سریع، آزاد و پر از ویژگی‌های جدید';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'جدیدترین نگارش $DISTRO رایانش را آسان‌تر از همیشه کرده است.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'چه توسعه‌دهنده باشید، چه سازندهٔ محتوا، بازیکن یا مدیر، ابزارهایی جدید برای بهبود بهره‌وری و ارتقای تجربه‌تان در $RELEASE خواهید یافت.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'تمامی برنامه‌هایی که نیاز دارید';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'نصب، مدیریت و به‌روز رسانی تمامی کاره‌هایتان در نرم‌افزارهای اوبونتو، شامل هزاران برنامه از مخازن $DISTRO و فروشگاه اسنپ.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'توسعه با بهترین‌های نرم‌افزار آزاد';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'ارتقای خلّاقیتتان';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'عالی برای بازی';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'محرمانه و امن';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'تمامی نگارش‌های LTS $DISTRO با پنج سال وصلهٔ امنیتی آمده که با اشتراک Pro اوبونتو به ده سال افزایش می‌یابد.';
  }

  @override
  String get installationSlidesProductivityTitle => 'افزایش بهره‌وریتان';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'دسترسی برای همگان';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'صفحه‌خوان اورکا';

  @override
  String get installationSlidesAccessibilityLanguages => 'پشتیبانی زبان';

  @override
  String get installationSlidesSupportTitle => 'راهنمایی و پشتیبانی';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'مستندات رسمی $DISTRO هم به صورت برخط و هم از نقشک راهنما در داک موجودند.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'منبع‌های مفید:';

  @override
  String get installationSlidesSupportDocumentation => 'مستندات رسمی';

  @override
  String get installationSlidesSupportUbuntuPro => 'پشتیبانی ردهٔ تجاری ۲۴/۷ با Pro اوبونتو';

  @override
  String get copyingFiles => 'رونوشت کردن پرونده‌ها…';

  @override
  String get installingSystem => 'نصب کردن سامانه…';

  @override
  String get configuringSystem => 'برپا کردن سامانه…';

  @override
  String get installationFailed => 'نصب شکست خورد';

  @override
  String get notEnoughDiskSpaceTitle => 'فضای ناکافی';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'فضای ناکافی برای نصب $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'موجود:';

  @override
  String get notEnoughDiskSpaceRequired => 'لازم:';

  @override
  String get activeDirectoryOption => 'استفاده از شاخهٔ فعّال';

  @override
  String get activeDirectoryInfo => 'در گام بعدی دامنه و دیگر حزییات را وارد خواهید کرد.';

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
}
