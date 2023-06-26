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
  String get changeButtonText => 'שינוי';

  @override
  String get restartButtonText => 'הפעלה מחדש';

  @override
  String get revertButtonText => 'החזרה';

  @override
  String get quitButtonText => 'יציאה מההתקנה';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'ברוך בואך אל $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return '$DISTRO בהכנות…';
  }

  @override
  String get welcomeHeader => 'נא לבחור שפה:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'להתנסות או להתקין את $DISTRO';
  }

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
  String get turnOffRST => 'RST פעיל';

  @override
  String get turnOffRSTTitle => 'יש לכבות את ה־RST כדי להמשיך';

  @override
  String get turnOffRSTDescription => 'המחשב הזה משתמש ב־RST‏ (Rapid Storage Technology) מבית אינטל. יש לכבות את RST דרך Windows בטרם התקנת אובונטו.';

  @override
  String instructionsForRST(Object url) {
    return 'לקבלת הנחיות, יש לסרוק את קוד ה־QR הזה במכשיר אחר או לבקר באתר: <a href=\"https://$url\">$url</a>';
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
  String get detectButtonText => 'זיהוי';

  @override
  String get keyboardVariant => 'הגוון מקלדת:';

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
  String get connectToInternetPageTitle => 'התחברות לרשת';

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
  String get updatesOtherSoftwarePageTitle => 'יישומים ועדכונים';

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
  String get chooseSecurityKeyTitle => 'מפתח אבטחה';

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
  String get installationTypeManual => 'חלוקה ידנית למחיצות';

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
  String get allocateDiskSpace => 'חלוקת מחיצות ידנית';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'נקודות עיגון חייבות להתחיל ב־„/”';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'נקודות עיגון לא יכולות להכיל רווחים';

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
  String get newPartitionTableConfirmationTitle => 'מחיצה ריקה חדשה';

  @override
  String get newPartitionTableConfirmationMessage => 'יצירת טבלת מחיצות חדשה על כל הכונן תסיר את כל המחיצות הנוכחיות שלו. אי אפשר להשתקם מהפעולה הזאת במקרה הצורך.';

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
  String get partitionFormatNone => 'להשאיר בלי פרמוט';

  @override
  String partitionFormatKeep(Object format) {
    return 'להשאיר בעיצוב $format';
  }

  @override
  String get partitionErase => 'פרמוט המחיצה';

  @override
  String get partitionMountPointLabel => 'נקודת עגינה:';

  @override
  String get whoAreYouPageTitle => 'הקמת החשבון שלך';

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
  String get writeChangesToDisk => 'סיימנו להתכונן להתקנה';

  @override
  String get writeChangesFallbackSerial => 'כונן';

  @override
  String get writeChangesDescription => 'בחירה להמשיך בתהליך תוביל לכך שהשינויים שמופיעים להלן ייכתבו לכונן. אפשר לערוך שינויים נוספים ידנית בהמשך.';

  @override
  String get writeChangesDevicesTitle => 'התקנים';

  @override
  String get writeChangesPartitionsTitle => 'מחיצות';

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
    return 'הגודל של מחיצה <b>$disk$partition</b> ישתנה מ־<b>$oldsize</b> ל־<b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'מחיצה <b>$disk$partition</b> פורמטה כ־<b>$format</b> ומשמשת עבור <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'מחיצה <b>$disk$partition</b> פורמטה בתור <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'מחיצה <b>$disk$partition</b> תשמש עבור <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'המחיצה <b>$disk$partition</b> נוצרה';
  }

  @override
  String get chooseYourLookPageTitle => 'נא לבחור את ערכת העיצוב שלך';

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
  String get turnOffBitlockerTitle => 'BitLocker פעיל';

  @override
  String get turnOffBitlockerHeadline => 'יש לכבות את BitLocker';

  @override
  String turnOffBitlockerDescription(Object option) {
    return 'המחשב הזה משתמש בהצפנת BitLocker של Windows.\nיש להשתמש ב־Windows כדי לפנות מקום או לבחור ב‚$option’ כדי להמשיך.';
  }

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'לקבלת הנחיות, יש לסרוק את קוד ה־QR הזה במכשיר אחר או לבקר באתר: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'להפעיל מחדש אל Windows';

  @override
  String get restartIntoWindowsTitle => 'לעלות מחדש ל־Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'להפעיל את המחשב מחדש? יש להפעיל את ההתקנה של $DISTRO מחדש בהמשך כדי לסיים את התקנת $DISTRO.';
  }

  @override
  String get whereAreYouPageTitle => 'נא לבחור את אזור הזמן שלך';

  @override
  String get whereAreYouLocationLabel => 'מיקום';

  @override
  String get whereAreYouTimezoneLabel => 'אזור זמן';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'ברוך בואך אל $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'זמין:';

  @override
  String get installationSlidesIncluded => 'כחלק:';

  @override
  String get installationSlidesWelcomeTitle => 'מהיר, חינמי ומפוצץ ביכולות חדשות';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'הגרסה העדכנית ביותר של $DISTRO הופכת את השימוש במחשב לפשוט מאי פעם.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'בין אם למטרות פיתוח, יצירה, משחקים או ניהול ניתן למצוא כלים חדשים לשיפור היעילות והחוויה עם $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'כל היישומים שדרושים לך';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'אפשר להתקין, לנהל ולעדכן את כל היישומים שלך עם מרכז התוכנה של אובונטו לרבות אלפי יישומים מחנות Snap ומארכיון $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'כלי פיתוח קוד פתוח מהשורה הראשונה';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO היא תחנת העבודה האידאלית לפיתוח יישומים ואתרים, מדעי נתונים ובינה מלאכותית/למידת מכונה לרבות DevOps וניהול. כל מהדורה של $DISTRO כוללת את סוללת כלי העבודה העדכנית ביותר ותומכת בכל סביבות הפיתוח המשולבות העיקריות.';
  }

  @override
  String get installationSlidesCreativityTitle => 'לפרוץ את גבולות הדמיון';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'מנפישים, מעצבים, יוצרי סרטונים ומפתחי משחקים יכולים להביא את הרגלי העבודה שלהם לתוך $DISTRO עם תמיכה בקוד פתוח ובתוכנות ויישומים שמקובלים בתעשייה.';
  }

  @override
  String get installationSlidesGamingTitle => 'מעולה למשחקים';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return 'ב־$DISTRO יש תמיכה במנהלי ההתקנים העדכניים ביותר של NVIDIA ושל Mesa כדי לשפר את הביצועים והתאימות. אלפי משחקי צמרת שנתמכים ב־Windows פועלים היטב עם $DISTRO דרך יישומים כמו Steam ללא הגדרות נוספות.';
  }

  @override
  String get installationSlidesSecurityTitle => 'פרטי ומאובטח';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return 'כחלק מ־$DISTRO מסופקים כל הכלים שדרושים לך כדי לשמור על פרטיות ואבטחה באינטרנט. עם חומת אש מובנית ותמיכה ב־VPN ובכמות מרשימה של יישומים ששומרים על פרטיותך בקנאות כדי לעזור לך לוודא שיש לך שליטה מלאה על המידע שלך.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'כל מהדורות $DISTRO LTS (תמיכה לזמן ארוך) זוכות לחמש שנים של תיקוני אבטחת מידע אותן ניתן להרחיב לעשר עם מינוי של אובונטו פרו.';
  }

  @override
  String get installationSlidesProductivityTitle => 'פשוט להפיק יותר';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return 'שולחן העבודה של $DISTRO כולל את LibreOffice, חבילת יישומי קוד פתוח תואמי Microsoft Office עבור מסמכים, גיליונות נתונים ומצגות. לרבות כלי שיתוף פעולה נוספים.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'גישה לכל אחד ואחת';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'במרכז הפילוסופיה של $DISTRO קיימת האמונה שמחשוב מיועד לכולם. עם כלי נגישות מתקדמים ואפשרויות להחלפת השפה, הצבעים וגודל הכתב, $DISTRO מקל על השימוש במחשב - בכל אופן ואזור גאוגרפי.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'מקריא המסך Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'תמיכה בשפות';

  @override
  String get installationSlidesSupportTitle => 'עזרה ותמיכה';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'התיעוד הרשמי של $DISTRO זמין גם דרך האינטרנט וגם דרך סמל העזרה במעגן.';
  }

  @override
  String get installationSlidesSupportCommunity => 'האתר Ask Ubuntu חולש על פני מגוון רחב של שאלות ותשובות ו־Ubuntu Discourse מספק מדריכים ודיונים למשתמשים חדשים ומנוסים.';

  @override
  String get installationSlidesSupportEnterprise => 'למשתמשים תאגידיים מספקת Canonical תמיכה מסחרית כדי להקל על ההגירה והניהול של אובונטו בצורה מאובטחת בסביבת העבודה.';

  @override
  String get installationSlidesSupportResources => 'משאבים חיוניים:';

  @override
  String get installationSlidesSupportDocumentation => 'תיעוד רשמי';

  @override
  String get installationSlidesSupportUbuntuPro => 'תמיכה 24/7 ברמה תעשייתית עם אובונטו פרו';

  @override
  String get copyingFiles => 'קבצים מועתקים…';

  @override
  String get installingSystem => 'המערכת מותקנת…';

  @override
  String get configuringSystem => 'המערכת מוגדרת…';

  @override
  String get installationFailed => 'ההתקנה נכשלה';

  @override
  String get notEnoughDiskSpaceTitle => 'אין מספיק מקום';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'אין מספיק מקום להתקין את $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'פנוי:';

  @override
  String get notEnoughDiskSpaceRequired => 'נחוץ:';

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
