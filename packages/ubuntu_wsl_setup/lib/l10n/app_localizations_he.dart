


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
  String get installationSlidesErrorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get installationSlidesErrorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get installationSlidesDone => 'הכול מוכן. מאחלים לך ליהנות מאובונטו על WSL';

  @override
  String get installationSlidesExitTitle => 'לעזוב?';

  @override
  String get installationSlidesExitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get installationSlidesCustomExitTitle => 'כמעט סיימנו';

  @override
  String get installationSlidesCustomExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get installationSlidesOk => 'בסדר';

  @override
  String get installationSlidesLeave => 'לעזוב';

  @override
  String get installationSlidesCancel => 'לבטל';

  @override
  String get installationSlidesUbuntuOnWsl => 'אובונטו על WSL';

  @override
  String get installationSlidesUbuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get installationSlidesUbuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get installationSlidesUbuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get installationSlidesUbuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get installationSlidesUbuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get installationSlidesUbuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get installationSlidesUbuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get installationSlidesUbuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get installationSlidesUbuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get installationSlidesUbuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get installationSlidesUbuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get installationSlidesFindOutMore => 'Find out more';

  @override
  String get installationSlidesFindOutMoreVisit => 'Visit ';

  @override
  String get installationSlidesFindOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get installationSlidesFindOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
