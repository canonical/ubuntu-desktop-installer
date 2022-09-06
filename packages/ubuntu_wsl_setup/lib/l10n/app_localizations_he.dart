


import 'app_localizations.dart';

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'אובונטו WSL';

  @override
  String get windowTitle => 'אובונטו WSL';

  @override
  String get exitButton => 'יציאה';

  @override
  String get finishButton => 'סיום';

  @override
  String get saveButton => 'שמירה';

  @override
  String get setupButton => 'הקמה';

  @override
  String get selectLanguageTitle => 'נא לבחור את השפה שלך';

  @override
  String installLangPacksTitle(String lang) {
    return 'Install packages for better $lang language support';
  }

  @override
  String get installLangPacksSubtitle => 'Not recommended for slow connections.';

  @override
  String get profileSetupTitle => 'הקמת פרופיל';

  @override
  String get profileSetupHeader => 'נא ליצור חשבון UNIX למשתמש כברירת מחדל. למידע נוסף ניתן לבקר בכתובת: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'שמך';

  @override
  String get profileSetupRealnameRequired => 'דרוש שם';

  @override
  String get profileSetupUsernameHint => 'נא לבחור שם משתמש';

  @override
  String get profileSetupUsernameHelper => 'שם המשתמש לא חייב להיות תואם לשם המשתמש שלך ב־Windows.';

  @override
  String get profileSetupPasswordHint => 'נא לבחור סיסמה';

  @override
  String get profileSetupConfirmPasswordHint => 'אישור הסיסמה שלך';

  @override
  String get profileSetupShowAdvancedOptions => 'הצגת אפשרויות מתקדמות בעמוד הבא';

  @override
  String get profileSetupPasswordMismatch => 'הסיסמאות סותרות זו את זו';

  @override
  String get profileSetupUsernameRequired => 'דרוש שם משתמש';

  @override
  String get profileSetupUsernameInvalid => 'שם המשתמש שגוי';

  @override
  String get profileSetupUsernameInUse => 'שם משתמש זה כבר קיים.';

  @override
  String get profileSetupUsernameSystemReserved => 'שם זה שמור לטובת המערכת.';

  @override
  String get profileSetupUsernameTooLong => 'השם הזה ארוך מדי.';

  @override
  String get profileSetupUsernameInvalidChars => 'השם הזה מכיל תווים שגויים.';

  @override
  String get profileSetupPasswordRequired => 'דרושה סיסמה';

  @override
  String get advancedSetupTitle => 'הקמה מתקדמת';

  @override
  String get advancedSetupHeader => 'בעמוד הזה אפשר לכוונן את אובונטו WSL לצורכיך.';

  @override
  String get advancedSetupMountLocationHint => 'מיקום עיגון';

  @override
  String get advancedSetupMountLocationHelper => 'מיקום העיגון האוטומטי';

  @override
  String get advancedSetupMountLocationInvalid => 'המיקום שגוי';

  @override
  String get advancedSetupMountOptionHint => 'אפשרות עיגון';

  @override
  String get advancedSetupMountOptionHelper => 'אפשרות העיגון מועברת לעיגון האוטומטי';

  @override
  String get advancedSetupHostGenerationTitle => 'הפעלת יצירת מארח';

  @override
  String get advancedSetupHostGenerationSubtitle => 'בחירה מפעילה יצירה מחדש של ‎/etc/hosts עם כל הפעלה.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'הפעלת יצירת resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'בחירה מפעילה יצירה מחדש של ‎/etc/resolv.conf עם כל הפעלה.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'שילוב עם מנשק המשתמש';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'בחירה מפעילה הקמת סביבת DISPLAY אוטומטית. דרוש שרת X מגורם צד־שלישי.';

  @override
  String get configurationUITitle => 'הגדרות אובונטו WSL - אפשרויות מתקדמות';

  @override
  String get configurationUIInteroperabilityHeader => 'הדדיות';

  @override
  String get configurationUIInteroperabilityTitle => 'פעיל';

  @override
  String get configurationUIInteroperabilitySubtitle => 'האם ההדדיות מופעלת.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'הוספת נתיב Windows';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'האם הנתיב מה־Windows יתווסף למשתנה הסביבה PATH (נתיבי חיפוש קובצי הפעלה) ב־WSL';

  @override
  String get configurationUIAutoMountHeader => 'עיגון אוטומטי';

  @override
  String get configurationUIAutoMountTitle => 'מופעל';

  @override
  String get configurationUIAutoMountSubtitle => 'האם יכולת העיגון האוטומטי פעילה. יכולת זו מאפשרת לך לעגן כונן Windows ב־WSL.';

  @override
  String get configurationUIMountFstabTitle => 'עיגון ‎/etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'האם ‎/etc/fstab יעוגן. קובץ זה מכיל מידע על מערכות הקבצים שהמערכת תעגן.';

  @override
  String get configurationUISystemdHeader => 'ניסיוני - Systemd';

  @override
  String get configurationUISystemdTitle => 'מופעל';

  @override
  String get configurationUISystemdSubtitle => 'האם על systemd לעלות יחד עם המערכת. אזהרה: זאת יכולת נסיונית.';

  @override
  String get applyingChanges => 'השינויים חלים…';

  @override
  String get applyingChangesDisclaimer => 'פעולה זו עלולה לארוך מספר דקות כתלות בחיבור האינטרנט שלך.';

  @override
  String get setupCompleteTitle => 'ההקמה הושלמה';

  @override
  String setupCompleteHeader(Object user) {
    return 'היי $user,\nהשלמת את ההקמה.';
  }

  @override
  String get setupCompleteUpdate => 'מומלץ להריץ את הפקודה הבאה כדי לעדכן את אובונטו לגרסה העדכנית ביותר:';

  @override
  String get setupCompleteRestart => '* כל ההגדרות יחולו לאחר הפעלת אובונטו מחדש.';

  @override
  String get installationSlidesWelcome => 'ברוך בואך לאובונטו WSL';

  @override
  String get installationSlidesInitializing => 'מופעל…';

  @override
  String get installationSlidesUnpacking => 'ההפצה נפרסת';

  @override
  String get installationSlidesInstalling => 'כמעט סיימנו. תוכנית ההתקנה תדרוש את תשומת לבך בקרוב.';

  @override
  String get installationSlidesLaunching => 'ההפצה נטענת…';

  @override
  String get installationSlidesErrorMsg => 'משהו השתבש.';

  @override
  String get installationSlidesErrorTitle => 'משהו השתבש';

  @override
  String get installationSlidesErrorSub => 'נא להפעיל את WSL מחדש בעזרת הפקודות האלו ולנסות שוב:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nאירעה שגיאה שלא ניתן להשתקם ממנה.\n\nנא לסגור את היישום הזה, לפתוח Powershell או את שורת הפקודה ולהריץ את הפקודות הבאות:\n';

  @override
  String get installationSlidesDone => 'הכול מוכן. מאחלים לך ליהנות מאובונטו על WSL';

  @override
  String get installationSlidesExitTitle => 'לעזוב?';

  @override
  String get installationSlidesExitContents => 'סגירת החלון הזה לא תמנע מההתקנה להמשיך לפעול ברקע.\n\nמלבד זאת, אפשר להמשיך ולחקור מה אפשר לעשות עם אובונטו על WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'כמעט סיימנו';

  @override
  String get installationSlidesCustomExitContents => 'יש להשלים עוד כמה צעדים פשוטים בחלון ההתקנה הראשי.\nאפשר לצאת מהחלון הזה ולעבור לשם?';

  @override
  String get installationSlidesOk => 'בסדר';

  @override
  String get installationSlidesLeave => 'לעזוב';

  @override
  String get installationSlidesCancel => 'לבטל';

  @override
  String get installationSlidesUbuntuOnWsl => 'אובונטו על WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'סביבת אובונטו מלאה, עם שילוב אדוק בתוך Windows, לפיתוח והפעלה של יישומי לינוקס. מותאמת לענן, לאינטרנט, מדעי נתונים, מכשירים קטנים ולעשות כיף!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'אובונטו WSL\nלפיתוח אתרים';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'ניתן לפתח ב־WSL באמצעות סביבות פיתוח ל־Windows כולל VS Code ו־IntelliJ וליהנות מתמיכה מלאה ב־NodeJS וב־Ruby.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'אובונטו WSL למדעי נתונים';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'חבילת מדעי הנתונים של NVIDIA מעניקה לך להוציא את הביצועים המיטביים במיזמים מתחומי מדעי הנתונים ולמידת מכונה על גבי מנהלי התקנים שמותאמים לסביבת Windows.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'אובונטו WSL\nליישומים גרפיים';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'ניתן לפתח ולהציג בתצוגה מקדימה אתרים ויישומים גרפיים בלינוקס בעזרת WSLg לפיתוח למספר פלטפורמות.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'אובונטו WSL ל־DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'בדיקת תאימות של תהליכי CI/CD על ידי פיתוח על אובונטו WSL מקומית בטרם פרסום לסביבה מבצעית עם אובונטו';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'אובונטו WSL לתאגידים';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'הענקת יכולות למפתחים בסביבות\nפיתוח תאגידיות מבוססות Windows\nבעזרת אובונטו עם תמיכה לטווח ארוך.';

  @override
  String get installationSlidesFindOutMore => 'למידע נוסף';

  @override
  String get installationSlidesFindOutMoreVisit => 'ניתן לבקר באתר ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' כדי ללמוד עוד בנוגע לאובונטו על WSL ואיך Canonical תומכת במפתחים ובארגונים.';
}
