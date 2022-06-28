


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
  String get welcome => 'Welcome to Ubuntu WSL';

  @override
  String get initializing => 'Initializing...';

  @override
  String get unpacking => 'Unpacking the distro';

  @override
  String get installing => 'Almost done. The installer will require your attention soon.';

  @override
  String get launching => 'Launching distro...';

  @override
  String get errorMsg => 'Something went wrong.';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorSub => 'Please restart WSL with the following command and try again:\n\twsl --shutdown\n\twsl --unregister DISTRO_NAME';

  @override
  String get errorText => '\nAn irrecoverable error happened.\n\nPlease close this application, open Powershell or the command prompt and issue the following commands:\n';

  @override
  String get done => 'All set. Enjoy using Ubuntu on WSL';

  @override
  String get exitTitle => 'Are you sure you want to leave?';

  @override
  String get exitContents => 'Closing this window will not prevent the installation from continuing in the background.\n\nBesides, you can continue exploring what you can do with Ubuntu on WSL.';

  @override
  String get customExitTitle => 'We are almost done';

  @override
  String get customExitContents => 'Just a few steps to be completed in the main installer window.\nCan we quit this one and go there?';

  @override
  String get ok => 'Ok';

  @override
  String get leave => 'Leave';

  @override
  String get cancel => 'Cancel';

  @override
  String get ubuntuOnWsl => 'Ubuntu on WSL';

  @override
  String get ubuntuOnWslText => 'A full Ubuntu environment, deeply integrated with Windows, for Linux application development and execution. Optimised for cloud, web, data science, IOT and fun!';

  @override
  String get ubuntuWslWebDev => 'Ubuntu WSL for\nWeb Development';

  @override
  String get ubuntuWslWebDevText => 'Develop in WSL using native Windows IDEs including VS Code and IntelliJ and benefit from full NodeJS and Ruby support.';

  @override
  String get ubuntuWslDataScience => 'Ubuntu WSL for Data Science';

  @override
  String get ubuntuWslDataScienceText => 'NVIDIA Data Science Stack lets you maximize the performance of Data Science and Machine Learning projects on top of native Windows NVIDIA drivers.';

  @override
  String get ubuntuWslGuiApps => 'Ubuntu WSL for\nGraphical Apps';

  @override
  String get ubuntuWslGuiAppsText => 'Develop and preview web and graphical applications on Linux using WSLg for multi-platform development.';

  @override
  String get ubuntuWslDevOps => 'Ubuntu WSL for DevOps';

  @override
  String get ubuntuWslDevOpsText => 'Ensure CI/CD pipeline compatibility by developing on Ubuntu WSL locally before publishing to an Ubuntu production environment';

  @override
  String get ubuntuWslEnterprises => 'Ubuntu WSL for Enterprises';

  @override
  String get ubuntuWslEnterprisesText => 'Empower developers in a Windows\nenterprise ecosystem with a certified\nUbuntu LTS.';

  @override
  String get findOutMore => 'Find out more';

  @override
  String get findOutMoreVisit => 'Visit ';

  @override
  String get findOutMoreLink => 'Ubuntu.com/wsl';

  @override
  String get findOutMoreText => ' to find out more about Ubuntu on WSL and how Canonical supports developers and organisations.';
}
