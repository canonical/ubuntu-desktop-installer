


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
  String get configurationUIMountFstabSubtitle => 'האם ‎/etc/fstab יעוגן. קובץ ההגדרות ‎/etc/fstab מכיל את???';

  @override
  String get configurationUISystemdHeader => 'ניסיוני - Systemd';

  @override
  String get configurationUISystemdTitle => 'מופעל';

  @override
  String get configurationUISystemdSubtitle => 'האם על systemd לעלות יחד עם המערכת. אזהרה: זאת יכולת נסיונית.';

  @override
  String get applyingChanges => 'השינויים חלים…';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

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
}
