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
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

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
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

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
    return '<font color=\"$color\">אזהרה:</font> המחשב לא מחובר למקור חשמל.';
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
    return '<font color=\"$color\">אזהרה:</font> אובדן מפתח האבטחה עשוי להוביל לאובדן כל הנתונים. במקרה הצורך, מומלץ לכתוב את המפתח על פתק ולאחסן אותו במקום בטוח.';
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
  String get startInstallingButtonText => 'התקנה';

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
  String get freeDiskSpace => 'שטח פנוי';

  @override
  String get newPartitionTable => 'טבלת מחיצות חדשה';

  @override
  String get newPartitionTableConfirmationTitle => 'ליצור טבלת מחיצות ריקה בהתקן הזה?';

  @override
  String get newPartitionTableConfirmationMessage => 'בחרת לחלק התקן שלם למחיצות. בחירה להמשיך ביצירת טבלת מחיצות חדשה בהתקן תסיר את כל המחיצות הנוכחיות.\n\nנא לשים לב שזאת פעולה בלתי הפיכה.';

  @override
  String get tooManyPrimaryPartitions => 'יותר מדי מחיצות ראשיות';

  @override
  String get partitionLimitReached => 'הגעת למגבלה';

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
  String get whoAreYouPageRealNameTooLong => 'השם ארוך מדי.';

  @override
  String get whoAreYouPageComputerNameLabel => 'שם המחשב שלך';

  @override
  String get whoAreYouPageComputerNameInfo => 'השם שישמש את המחשב בעת תקשורת מול מחשבים אחרים.';

  @override
  String get whoAreYouPageComputerNameRequired => 'דרוש שם מחשב';

  @override
  String get whoAreYouPageComputerNameTooLong => 'שם המחשב הזה ארוך מדי.';

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
  String get whoAreYouPagePasswordShow => 'חשיפה';

  @override
  String get whoAreYouPagePasswordHide => 'הסתרה';

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
    return 'המערכת **$system** מותקנת ומוכנה לשימוש';
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
  String get restartIntoWindows => 'להפעיל מחדש אל Windows';

  @override
  String get whereAreYouPageTitle => 'מה מיקומך?';

  @override
  String get whereAreYouLocationLabel => 'מיקום';

  @override
  String get whereAreYouTimezoneLabel => 'אזור זמן';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Available:';

  @override
  String get installationSlidesIncluded => 'Included:';

  @override
  String get installationSlidesWelcomeTitle => 'Fast, free and full of new features';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'The latest version of $DISTRO makes computing easier than ever.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'All the applications you need';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and $DISTRO archive.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Develop with the best of open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Enhance your creativity';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'Great for gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Private and secure';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'All $DISTRO LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Power up your productivity';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Access for everyone';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Screen Reader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Language support';

  @override
  String get installationSlidesSupportTitle => 'Help & Support';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'The official $DISTRO documentation is available both online and via the Help icon in the dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'Helpful resources:';

  @override
  String get installationSlidesSupportDocumentation => 'Official documentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Enterprise-grade 24/7 support with Ubuntu Pro';

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

  @override
  String get activeDirectoryOption => 'להשתמש ב־Active Directory';

  @override
  String get activeDirectoryInfo => 'אפשר למלא את פרטי שם התחום (דומיין) ופרטים נוספים בצעד הבא.';

  @override
  String get activeDirectoryTitle => 'הגדרת Active Directory';

  @override
  String get activeDirectoryTestConnection => 'בדיקת חיבור לתחום';

  @override
  String get activeDirectoryDomainLabel => 'שם תחום (דומיין)';

  @override
  String get activeDirectoryDomainEmpty => 'חובה';

  @override
  String get activeDirectoryDomainTooLong => 'ארוך מדי';

  @override
  String get activeDirectoryDomainInvalidChars => 'תווים שגויים';

  @override
  String get activeDirectoryDomainStartDot => 'מתחיל בנקודה (.)';

  @override
  String get activeDirectoryDomainEndDot => 'מסתיים בנקודה (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'מתחיל במינוס (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'מסתיים במינוס (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'מכיל מספר נקודות ברצף (..)';

  @override
  String get activeDirectoryDomainNotFound => 'שם התחום לא נמצא';

  @override
  String get activeDirectoryAdminLabel => 'צירוף משתמש לתחום';

  @override
  String get activeDirectoryAdminEmpty => 'חובה';

  @override
  String get activeDirectoryAdminInvalidChars => 'תווים שגויים';

  @override
  String get activeDirectoryPasswordLabel => 'סיסמה';

  @override
  String get activeDirectoryPasswordEmpty => 'חובה';

  @override
  String get activeDirectoryErrorTitle => 'שגיאה בהגדרת החיבור ל־Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'אי אפשר להגדיר חיבור ל־Active Directory כרגע, עמך הסליחה. לאחר סיום התקנת המערכת, יש לבקר בכתובת <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> לקבלת עזרה.';
}
