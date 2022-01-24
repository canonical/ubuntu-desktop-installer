


import 'app_localizations.dart';

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'מתקין אובונטו לשולחן עבודה';

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
  String get welcome => 'ברוך בואך';

  @override
  String get tryOrInstallPageTitle => 'לנסות להתקין';

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
  String get turnOffRSTDescription => 'המחשב הזה משתמש ב־RST‏ (Rapid Storage Technology) מבית אינטל. עליך לכבות את RST דרך Windows בטרם הסרת אובונטו.';

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
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">אזהרה</font>: המחשב לא מחובר למקור חשמל.';
  }

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
    return 'במחשב זה מותקן כרגע $os. מה לעשות?';
  }

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
  String get installationTypeAlongsideInfo => 'מסמכים, מוזיקה וקבצים אישיים נוספים יישמרו. אפשר לבחור איזו מערכת הפעלה תיטען עם כל הפעלה של המחשב.';

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
  String get whoAreYouPagePasswordLabel => 'נא לבחור סיסמה';

  @override
  String get whoAreYouPagePasswordRequired => 'דרושה סיסמה';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'אישור הסיסמה שלך';

  @override
  String get whoAreYouPagePasswordMismatch => 'הסיסמאות סותרות זו את זו';

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
  String get writeChangesPartitionsHeader => 'המחיצות הבאות מועמדות לפרמוט:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'מחיצה מס׳ $disk${partition} בתור $format משמשת עבור $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'מחיצה מס׳ $disk${partition} בתור $format';
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
  String get chooseYourLookPageLightBodyText => 'הכול בהיר ומואר';

  @override
  String get chooseYourLookPageDarkBodyText => 'אפלה, ידידתי משכבר הימים';

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
  String get shutdown => 'כיבוי';

  @override
  String get turnOffBitlockerTitle => 'כיבוי BitLocker';

  @override
  String get turnOffBitlockerDescription => 'המחשב הזה משתמש בהצפנת BitLocker של Windows.\nעליך לכבות את BitLocker ב־Windows בטרם התקנת אובונטו.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'לקבלת הנחיות, יש לפתוח את העמוד הזה בטלפון שלך או בכל מכשיר אחר: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'הפעלה מחדש אל Windows';
}
