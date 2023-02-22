import 'app_localizations.dart';

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'אשף התקנת אובונטו לשולחן עבודה';

  @override
  String windowTitle(Object RELEASE) {
    return 'להתקין את $RELEASE';
  }

  @override
  String get cancelButtonText => 'ביטול';

  @override
  String get changeButtonText => 'עריכה';

  @override
  String get okButtonText => 'אישור';

  @override
  String get noButtonText => 'לא';

  @override
  String get restartButtonText => 'הפעלה מחדש';

  @override
  String get revertButtonText => 'החזרה';

  @override
  String get yesButtonText => 'כן';

  @override
  String get quitButtonText => 'יציאה מההתקנה';

  @override
  String get welcome => 'ברוך בואך';

  @override
  String get welcomeHeader => 'נא לבחור שפה:';

  @override
  String get tryOrInstallPageTitle => 'להתנסות או להתקין';

  @override
  String get repairInstallation => 'תיקון התקנה';

  @override
  String get repairInstallationDescription => 'תיקון יתקין את כל התכניות המותקנות מחדש מבלי לגעת במסמכים או בהגדרות.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'להתנסות ב־$RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'אפשר להתנסות ב־$RELEASE מבלי לערוך שינויים במחשב שלך.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'להתקין את $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'התקנת $RELEASE לצד (או במקום) מערכת ההפעלה הנוכחית שלך. אמור להיות תהליך קצר.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'ממליצים לך לקרוא את <a href=\"$url\">הערות ההוצאה לאור</a>.';
  }

  @override
  String get turnOffRST => 'כיבוי RST';

  @override
  String get turnOffRSTDescription => 'המחשב הזה משתמש ב־RST‏ (Rapid Storage Technology) מבית אינטל. יש לכבות את RST דרך Windows בטרם התקנת אובונטו.';

  @override
  String instructionsForRST(Object url) {
    return 'לקבלת הנחיות, יש לפתוח את העמוד הזה בטלפון שלך או בכל מכשיר אחר: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'פריסת מקלדת';

  @override
  String get chooseYourKeyboardLayout => 'נא לבחור את פריסת המקלדת שלך:';

  @override
  String get typeToTest => 'ניתן להקליד כאן כדי לבדוק את המקלדת שלך';

  @override
  String get detectLayout => 'איתור פריסת המקלדת';

  @override
  String get pressOneKey => 'נא ללחוץ על אחד מהתווים הבאים:';

  @override
  String get isKeyPresent => 'האם המקש הבא קיים במקלדת שלך?';

  @override
  String get configureSecureBootTitle => 'הגדרת טעינה מאובטחת (Secure Boot)';

  @override
  String get configureSecureBootDescription => 'בחרת להתקין תכנית מנהל התקן מגורם צד־שלישי. פעולה שכזאת דורשת את כיבוי הטעינה המאובטחת (Secure Boot).\nכדי לעשות זאת, עליך לבחור מפתח אבטחה כעת ולהקליד אותו לאחר שהמערכת תופעל מחדש.';

  @override
  String get configureSecureBootOption => 'הגדרת טעינה מאובטחת (Secure Boot)';

  @override
  String get chooseSecurityKey => 'נא לבחור מפתח אבטחה';

  @override
  String get confirmSecurityKey => 'אישור מפתח האבטחה';

  @override
  String get dontInstallDriverSoftwareNow => 'לא להתקין את תכנית מנהל ההתקן לבינתיים';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'אפשר להתקין מאוחר יותר דרך תכנה ועדכונים.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'נדרש מפתח אבטחה';

  @override
  String get secureBootSecurityKeysDontMatch => 'מפתחות האבטחה סותרים זה את זה';

  @override
  String get showSecurityKey => 'הצגת מפתח אבטחה';

  @override
  String get connectToInternetPageTitle => 'התחברות לאינטרנט';

  @override
  String get connectToInternetDescription => 'חיבור המחשב הזה לאינטרנט יסייע לאובונטו להתקין תכניות נוספות חיוניות ויסייע בבחירת אזור הזמן שלך.\n\nאפשר להתחבר בכבל רשת או לבחור רשת אלחוטית';

  @override
  String get useWiredConnection => 'להשתמש בחיבור קווי';

  @override
  String get noWiredConnection => 'לא זוהה חיבור קווי';

  @override
  String get wiredDisabled => 'החיבור הקווי מושבת';

  @override
  String get wiredMustBeEnabled => 'כדי להשתמש בכבל רשת במחשב הזה יש להפעיל את החיבור הקווי';

  @override
  String get enableWired => 'להפעיל חיבור קווי';

  @override
  String get selectWifiNetwork => 'התחברות לרשת אלחוטית';

  @override
  String get hiddenWifiNetwork => 'התחברות לרשת אלחוטית נסתרת';

  @override
  String get hiddenWifiNetworkNameLabel => 'שם הרשת';

  @override
  String get hiddenWifiNetworkNameRequired => 'שם הרשת נחוץ';

  @override
  String get noInternet => 'לא רוצה להתחבר לאינטרנט כרגע';

  @override
  String get wirelessNetworkingDisabled => 'רשת אלחוטית מושבתת';

  @override
  String get noWifiDevicesDetected => 'לא זוהו התקני רשת אלחוטית';

  @override
  String get wifiMustBeEnabled => 'כדי להשתמש ברשת אלחוטית במחשב הזה, יש להפעיל את התקשורת האלחוטית';

  @override
  String get enableWifi => 'הפעלת רשת אלחוטית';

  @override
  String get connectButtonText => 'התחברות';

  @override
  String get updatesOtherSoftwarePageTitle => 'עדכונים ותכניות נוספות';

  @override
  String get updatesOtherSoftwarePageDescription => 'אילו יישומים להתקין בתור התחלה?';

  @override
  String get normalInstallationTitle => 'התקנה רגילה';

  @override
  String get normalInstallationSubtitle => 'דפדפן, עזרים, חבילת תכניות משרדיות, משחקים ונגני מדיה.';

  @override
  String get minimalInstallationTitle => 'התקנה מצומצמת';

  @override
  String get minimalInstallationSubtitle => 'דפדפן ועזרים בסיסיים.';

  @override
  String get otherOptions => 'אפשרויות נוספות';

  @override
  String get installThirdPartyTitle => 'התקנת תכניות צד־שלישי לחומרה גרפית ואלחוטית, לרבות תצורות מדיה נוספות';

  @override
  String get installThirdPartySubtitle => 'התכניות האלו כפופות לתנאי אישוי שנכללים בתיעוד שלהן. חלקן קנייניות.';

  @override
  String get installDriversTitle => 'התקנת תוכנת צד־שלישי לחומרת גרפיקה ותקשורת אלחוטית';

  @override
  String get installDriversSubtitle => 'מנהלי התקנים אלה כפופים לתנאי הרישיון שנכללים בתיעוד שלהם. הם קנייניים.';

  @override
  String get installCodecsTitle => 'הורדה והתקנה של תמיכה בתצורות מדיה נוספות';

  @override
  String get installCodecsSubtitle => 'תוכנה זו כפופה לתנאי הרישיון שנכללים בתיעוד שלה. חלקם קנייניים.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">אזהרה</font>: המחשב לא מחובר למקור חשמל.';
  }

  @override
  String get offlineWarning => 'החיבור שלך מנותק';

  @override
  String get chooseSecurityKeyTitle => 'נא לבחור מפתח אבטחה';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'הצפנת הכונן מגנה על הקבצים שלך במקרה של אובדן המחשב. התכונה דורשת ממך להזין מפתח אבטחה עם כל הפעלה של המחשב.\n\nקבצים שמחוץ ל־$RELEASE לא יוצפנו.';
  }

  @override
  String get chooseSecurityKeyHint => 'נא לבחור מפתח אבטחה';

  @override
  String get chooseSecurityKeyConfirmHint => 'אישור מפתח האבטחה';

  @override
  String get chooseSecurityKeyRequired => 'נדרש מפתח אבטחה';

  @override
  String get chooseSecurityKeyMismatch => 'מפתחות האבטחה סותרים זה את זה';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">אזהרה</font>: אובדן מפתח האבטחה עשוי להוביל לאובדן כל הנתונים. במקרה הצורך, מומלץ לכתוב את המפתח על פתק ולאחסן אותו במקום בטוח.';
  }

  @override
  String get installationTypeTitle => 'סוג ההתקנה';

  @override
  String installationTypeOSDetected(Object os) {
    return 'במחשב זה מותקנת כרגע $os. מה לעשות?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'במחשב זה מותקנות כרגע $os1 ו־$os2. מה לעשות?';
  }

  @override
  String get installationTypeMultiOSDetected => 'במחשב זה מותקנות מספר מערכות הפעלה. מה לעשות?';

  @override
  String get installationTypeNoOSDetected => 'לא זוהו מערכות הפעלה כלשהן במחשב זה. מה לעשות?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'למחוק את הכונן ולהתקין את $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">אזהרה:</font> פעולה זו תמחק את כל התכניות, המסמכים, התמונות, המוזיקה וכל סוגי הקבצים שהם בכל מערכות ההפעלה.';
  }

  @override
  String get installationTypeAdvancedLabel => 'יכולות מתקדמות…';

  @override
  String get installationTypeAdvancedTitle => 'יכולות מתקדמות';

  @override
  String get installationTypeNone => 'אין';

  @override
  String get installationTypeNoneSelected => 'לא נבחרו';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'להשתמש במנהל כרכים לוגי עם התקנת $RELEASE החדשה';
  }

  @override
  String get installationTypeLVMSelected => 'נבחר מנהל כרכים לוגי';

  @override
  String get installationTypeLVMEncryptionSelected => 'נבחרו LVM והצפנה';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'להצפין את התקנת $RELEASE החדשה לשיפור האבטחה';
  }

  @override
  String get installationTypeEncryptInfo => 'בשלב הבא ניתן לבחור מפתח אבטחה.';

  @override
  String get installationTypeZFS => 'ניסיוני: למחוק את הכונן ולהשתמש ב־ZFS';

  @override
  String get installationTypeZFSSelected => 'נבחר ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'למחוק את $os ולהתקין מחדש';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">אזהרה:</font> פעולה זו תמחק את כל התכניות, המסמכים, התמונות, המוזיקה וקבצים מסוגים נוספים כחלק ממערכת $os.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'להתקין את $product לצד $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'להתקין את $product לצד $os1 ו־$os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'להתקין את $product לצדם';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'להתקין את $product לצד מחיצות אחרות';
  }

  @override
  String get installationTypeAlongsideInfo => 'המסמכים, המוזיקה וקבצים אישיים נוספים יישמרו. אפשר לבחור איזו מערכת הפעלה תיטען עם כל הפעלה של המחשב.';

  @override
  String get installationTypeManual => 'משהו אחר';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'אפשר ליצור או לשנות גודל של מחיצות באופן עצמאי או לבחור מגוון מחיצות עבור $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'למחוק את הכונן ולהתקין את $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'בחירת כונן:';

  @override
  String get selectGuidedStorageInfoLabel => 'ייעשה שימוש בכונן כולו:';

  @override
  String get selectGuidedStorageInstallNow => 'להתקין כעת';

  @override
  String get installAlongsideSpaceDivider => 'גרירת החוצץ שלהלן תגדיר את הקצאת המקום בכונן:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num מחיצות קטנות יותר מוסתרות, יש להשתמש ב<a href=\"$url\">כלי המתקדם לחלוקה למחיצות</a> לשליטה טובה יותר';
  }

  @override
  String get installAlongsideResizePartition => 'שינוי גודל מחיצה';

  @override
  String get installAlongsideAllocateSpace => 'הקצאת מקום';

  @override
  String get installAlongsideFiles => 'קבצים';

  @override
  String get installAlongsidePartition => 'מחיצה:';

  @override
  String get installAlongsideSize => 'גודל:';

  @override
  String get installAlongsideAvailable => 'זמין:';

  @override
  String get allocateDiskSpace => 'הקצאת מקום בכונן';

  @override
  String get startInstallingButtonText => 'להתחיל בהתקנה';

  @override
  String get diskHeadersDevice => 'התקן';

  @override
  String get diskHeadersType => 'סוג';

  @override
  String get diskHeadersMountPoint => 'נקודת עגינה';

  @override
  String get diskHeadersSize => 'גודל';

  @override
  String get diskHeadersUsed => 'בשימוש';

  @override
  String get diskHeadersSystem => 'מערכת';

  @override
  String get diskHeadersFormat => 'פורמט';

  @override
  String get freeDiskSpace => 'מקום פנוי';

  @override
  String get newPartitionTable => 'טבלת מחיצות חדשה';

  @override
  String get newPartitionTableConfirmationTitle => 'ליצור טבלת מחיצות ריקה בהתקן הזה?';

  @override
  String get newPartitionTableConfirmationMessage => 'בחרת לחלק התקן שלם למחיצות. בחירה להמשיך ביצירת טבלת מחיצות חדשה בהתקן תסיר את כל המחיצות הנוכחיות.\n\nנא לשים לב שזאת פעולה בלתי הפיכה.';

  @override
  String get tooManyPrimaryPartitions => 'יותר מדי מחיצות ראשיות';

  @override
  String get partitionLimitReached => 'הגעת לגבול';

  @override
  String get bootLoaderDevice => 'התקן להתקנת מנהל טעינה';

  @override
  String get partitionCreateTitle => 'יצירת מחיצה';

  @override
  String get partitionEditTitle => 'עריכת מחיצה';

  @override
  String get partitionSizeLabel => 'גודל:';

  @override
  String get partitionUnitB => 'ב׳';

  @override
  String get partitionUnitKB => 'ק״ב';

  @override
  String get partitionUnitMB => 'מ״ב';

  @override
  String get partitionUnitGB => 'ג״ב';

  @override
  String get partitionTypeLabel => 'סוג המחיצה החדשה:';

  @override
  String get partitionTypePrimary => 'עיקרית';

  @override
  String get partitionTypeLogical => 'לוגית';

  @override
  String get partitionLocationLabel => 'מיקום המחיצה החדשה:';

  @override
  String get partitionLocationBeginning => 'תחילת שטח זה';

  @override
  String get partitionLocationEnd => 'סוף שטח זה';

  @override
  String get partitionFormatLabel => 'בשימוש בתור:';

  @override
  String get partitionFormatExt4 => 'מערכת קבצים מתועדת מסוג Ext4';

  @override
  String get partitionFormatExt3 => 'מערכת קבצים מתועדת מסוג Ext3';

  @override
  String get partitionFormatExt2 => 'מערכת קבצים מסוג Ext2';

  @override
  String get partitionFormatBtrfs => 'מערכת קבצים מתועדת מסוג btrfs';

  @override
  String get partitionFormatJfs => 'מערכת קבצים מתועדת מסוג JFS';

  @override
  String get partitionFormatXfs => 'מערכת קבצים מתועדת מסוג XFS';

  @override
  String get partitionFormatFat => 'מערכת קבצים מסוג FAT';

  @override
  String get partitionFormatFat12 => 'מערכת קבצים מסוג FAT12';

  @override
  String get partitionFormatFat16 => 'מערכת קבצים מסוג FAT16';

  @override
  String get partitionFormatFat32 => 'מערכת קבצים מסוג FAT32';

  @override
  String get partitionFormatSwap => 'שטח החלפה';

  @override
  String get partitionFormatIso9660 => 'מערכת קבצים מסוג ISO 9660';

  @override
  String get partitionFormatVfat => 'מערכת קבצים מסוג VFAT';

  @override
  String get partitionFormatNtfs => 'מערכת קבצים מסוג NTFS';

  @override
  String get partitionFormatReiserFS => 'מערכת קבצים מסוג ReiserFS';

  @override
  String get partitionFormatZfsroot => 'מערכת קבצים לבסיס ZFS';

  @override
  String get partitionFormatNone => 'להשאיר בלי פרמוט';

  @override
  String get partitionErase => 'פרמוט המחיצה';

  @override
  String get partitionMountPointLabel => 'נקודת עגינה:';

  @override
  String get whoAreYouPageTitle => 'עם מי הכבוד?';

  @override
  String get whoAreYouPageAutoLogin => 'כניסה אוטומטית';

  @override
  String get whoAreYouPageRequirePassword => 'דרישת הסיסמה שלי לצורך כניסה';

  @override
  String get whoAreYouPageRealNameLabel => 'שמך';

  @override
  String get whoAreYouPageRealNameRequired => 'דרוש שם';

  @override
  String get whoAreYouPageComputerNameLabel => 'שם המחשב שלך';

  @override
  String get whoAreYouPageComputerNameInfo => 'השם שישמש את המחשב בעת תקשורת מול מחשבים אחרים.';

  @override
  String get whoAreYouPageComputerNameRequired => 'דרוש שם מחשב';

  @override
  String get whoAreYouPageInvalidComputerName => 'שם המחשב שגוי';

  @override
  String get whoAreYouPageUsernameLabel => 'נא לבחור שם משתמש';

  @override
  String get whoAreYouPageUsernameRequired => 'דרוש שם משתמש';

  @override
  String get whoAreYouPageInvalidUsername => 'שם המשתמש שגוי';

  @override
  String get whoAreYouPageUsernameInUse => 'שם משתמש זה כבר קיים.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'שם זה שמור לטובת המערכת.';

  @override
  String get whoAreYouPageUsernameTooLong => 'השם הזה ארוך מדי.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'השם הזה מכיל תווים שגויים.';

  @override
  String get whoAreYouPagePasswordLabel => 'נא לבחור סיסמה';

  @override
  String get whoAreYouPagePasswordRequired => 'דרושה סיסמה';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'אישור הסיסמה שלך';

  @override
  String get whoAreYouPagePasswordMismatch => 'הסיסמאות סותרות זו את זו';

  @override
  String get whoAreYouPagePasswordShow => 'Show';

  @override
  String get whoAreYouPagePasswordHide => 'Hide';

  @override
  String get writeChangesToDisk => 'כתיבת השינויים לכונן';

  @override
  String get writeChangesFallbackSerial => 'כונן';

  @override
  String get writeChangesDescription => 'בחירה להמשיך בתהליך תוביל לכך שהשינויים שמופיעים להלן ייכתבו לכונן. אפשר לערוך שינויים נוספים ידנית בהמשך.';

  @override
  String get writeChangesPartitionTablesHeader => 'טבלאות המחיצות של ההתקנים הבאים נערכו:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'השינויים הבאים יחולו על המחיצות:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'הגודל של מחיצה מס׳ $disk$partition ישתנה מ־$oldsize ל־$newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'מחיצה מס׳ $disk$partition תפורמט כ־$format ותשמש עבור $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'מחיצה מס׳ $disk$partition תפורמט בתור $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'מחיצה מס׳ $disk$partition תשמש עבור $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'מחיצה מס׳ $disk$partition נוצרה';
  }

  @override
  String get chooseYourLookPageTitle => 'נא לבחור את הסגנון שלך';

  @override
  String get chooseYourLookPageHeader => 'תמיד ניתן לשנות את זה מאוחר יותר בהגדרות המראה.';

  @override
  String get chooseYourLookPageDarkSetting => 'כהה';

  @override
  String get chooseYourLookPageLightSetting => 'בהיר';

  @override
  String get installationCompleteTitle => 'ההתקנה הושלמה';

  @override
  String readyToUse(Object system) {
    return 'המערכת **$system** מותקנת ומוכנה לשימוש.';
  }

  @override
  String restartInto(Object system) {
    return 'הפעלה מחדש אל $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'אפשר להמשיך לבחון את $RELEASE כעת אבל רק עד הפעלת המחשב מחדש, השינויים שייערכו למסמכים לא יישמרו.';
  }

  @override
  String get shutdown => 'כיבוי';

  @override
  String get restartNow => 'להפעיל מחדש כעת';

  @override
  String get continueTesting => 'להמשיך לבחון';

  @override
  String get turnOffBitlockerTitle => 'כיבוי BitLocker';

  @override
  String get turnOffBitlockerDescription => 'המחשב הזה משתמש בהצפנת BitLocker של Windows.\nיש לכבות את BitLocker ב־Windows בטרם התקנת אובונטו.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'לקבלת הנחיות, יש לפתוח את העמוד הזה בטלפון שלך או בכל מכשיר אחר: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'הפעלה מחדש אל Windows';

  @override
  String get whereAreYouPageTitle => 'מה מיקומך?';

  @override
  String get whereAreYouLocationLabel => 'מיקום';

  @override
  String get whereAreYouTimezoneLabel => 'אזור זמן';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'ברוך בואך אל $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'עם מהירות משופרת ומגוון יכולות, המהדורה העדכנית של $RELEASE מקלה על השימוש במחשב יותר מאי פעם. בהמשך מופיעים מגוון דברים מרתקים ששווה לצפות להם…';
  }

  @override
  String get softwareSlideTitle => 'מגוון רחב של תוכנות';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'חסל סדר חיפוש אחר תוכנות חדשות באינטרנט. עם גישה לחנות Snap ולארכיון התוכנה של $RELEASE, ניתן למצוא ולהתקין יישומים חדשים בקלות. פשוט יש להקליד את מה שמעניין אותך או לעיין בקטגוריות כגון גרפיקה וצילום, משחקים וכלי משרד, לצד ביקורות מועילות מצד משתמשים אחרים.';
  }

  @override
  String get musicSlideTitle => 'המוזיקה שלך הולכת איתך';

  @override
  String musicSlideDescription(Object RELEASE) {
    return 'כחלק מההיצע של $RELEASE ניתן למצוא את נגן המוזיקה Rhythmbox. אפשרויות הנגינה המתקדמות שלו מאפשרות לך להכין רשימות עם השירים הכי מושלמים שיש. הוא עובד נפלא עם תקליטורים ונגני מוזיקה ניידים, כך שכל המוזיקה שלך יכולה ללוות אותך לכל מקום.';
  }

  @override
  String get musicSlideRhythmbox => 'נגן המוזיקה Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'להשתולל עם התמונות שלך';

  @override
  String get photoSlideDescription => 'Shotwell הוא מנהל תמונות שימושי שמתנהל נהדר מול הגאדג׳טים שלך. אפשר לחבר מצלמה או טלפון כדי להעביר את התמונות שלך, לאחר מכן, אפשר לשתף או להגן עליהן בקלות. כשתוקפת אותך היצירתיות אפשר למצוא יישומי תמונות נוספים בחנות התוכנות של אובונטו.';

  @override
  String get photoSlideShotwell => 'מנהל התמונות Shotwell';

  @override
  String get photoSlideGimp => 'עורך התמונות GIMP';

  @override
  String get photoSlideShotcut => 'עורך הווידאו Shotcut';

  @override
  String get webSlideTitle => 'להפיק את המיטב מהאינטרנט';

  @override
  String webSlideDescription(Object RELEASE) {
    return 'למערכת $RELEASE מצורף Firefox, הדפדפן שמשמש מיליונים ברחבי העולם. וניתן לנעוץ יישומים שמשמשים אותך באופן תדיר (כגון פייסבוק או Gmail, למשל) לשולחן העבודה לגישה מהירה יותר, כמו כל יישום אחר במחשב שלך.';
  }

  @override
  String get webSlideFirefox => 'דפדפן האינטרנט Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'כל מה שנחוץ למשרד';

  @override
  String get officeSlideDescription => 'LibreOffice היא חבילת כלים משרדיים שכוללת בתוכה את כל מה שדרוש כדי ליצור מסמכים, גיליונות נתונים ומצגות. תואם לתצורות הקבצים של Microsoft Office, היא נותנת לך את כל מה שנחוץ לך, בלי שורת המחיר.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'גישה לכולם';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'בלב הפילוסופיה שמאחורי $RELEASE קיימת האמונה שמחשוב מיועד לכל אחד ואחת. עם כלי נגישות מתקדמים, אפשרויות להחלפת השפה, ערכות צבעים וגודלי כתב, קל יותר להשתמש במחשב עם $RELEASE - ללא תלות בזהות או במיקום.';
  }

  @override
  String get accessSlideCustomizationOptions => 'אפשרויות התאמה';

  @override
  String get accessSlideAppearance => 'מראה';

  @override
  String get accessSlideAssistiveTechnologies => 'טכנולוגיות מסייעות';

  @override
  String get accessSlideLanguageSupport => 'תמיכה בשפות';

  @override
  String get supportSlideTitle => 'עזרה ותמיכה';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'התיעוד הרשמי נותן מענה נרחב למגוון תחומים בנושא $RELEASE. הוא זמין גם באופן <a href=\"https://help.ubuntu.com\">מקוון</a> וגם דרך סמל העזרה במעגן.';
  }

  @override
  String get supportSlideQuestions => 'ב־<a href=\"https://askubuntu.com\">Ask Ubuntu</a> אפשר לשאול שאלות ולחפש במאגר מרשים של שאלות שנענו. יתכן ש<a href=\"https://loco.ubuntu.com/teams\">צוות הקהילה המקומית</a> שלך מספק תמיכה בשפה שנוחה לך.';

  @override
  String get supportSlideResources => 'לקבלת הכוונות למשאבים שימושיים נפוצים, מומלץ לפנות ל<a href=\"https://www.ubuntu.com/support/community-support\">תמיכה הקהילתית</a> או ל<a href=\"https://www.ubuntu.com/support\">תמיכה המסחרית</a>.';

  @override
  String get includedSoftware => 'תוכנות מצורפות';

  @override
  String get availableSoftware => 'תוכנות זמינות';

  @override
  String get supportedSoftware => 'תוכנות נתמכות';

  @override
  String get copyingFiles => 'קבצים מועתקים…';

  @override
  String get installingSystem => 'המערכת מותקנת…';

  @override
  String get configuringSystem => 'המערכת מוגדרת…';

  @override
  String get installationFailed => 'ההתקנה נכשלה';

  @override
  String get notEnoughDiskSpaceTitle => 'מחילה';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'נדרשים $SIZE לפחות של מקום פנוי כדי להתקין את $RELEASE.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'במחשב זה יש רק $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'גודל הכונן הגדול ביותר במחשב הזה הוא $SIZE בלבד.';
  }
}
