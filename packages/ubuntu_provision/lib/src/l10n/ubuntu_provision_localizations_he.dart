import 'ubuntu_provision_localizations.dart';

/// The translations for Hebrew (`he`).
class UbuntuProvisionLocalizationsHe extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get timezonePageTitle => 'נא לבחור את אזור הזמן שלך';

  @override
  String get timezoneLocationLabel => 'מיקום';

  @override
  String get timezoneTimezoneLabel => 'אזור זמן';

  @override
  String get keyboardTitle => 'פריסת מקלדת';

  @override
  String get keyboardHeader => 'נא לבחור את פריסת המקלדת שלך:';

  @override
  String get keyboardTestHint => 'ניתן להקליד כאן כדי לבדוק את המקלדת שלך';

  @override
  String get keyboardDetectTitle => 'איתור פריסת המקלדת';

  @override
  String get keyboardDetectButton => 'זיהוי';

  @override
  String get keyboardVariantLabel => 'הגוון מקלדת:';

  @override
  String get keyboardPressKeyLabel => 'נא ללחוץ על אחד מהתווים הבאים:';

  @override
  String get keyboardKeyPresentLabel => 'האם המקש הבא קיים במקלדת שלך?';

  @override
  String get themePageTitle => 'נא לבחור את ערכת העיצוב שלך';

  @override
  String get themePageHeader => 'תמיד ניתן לשנות את זה מאוחר יותר בהגדרות המראה.';

  @override
  String get themeDark => 'כהה';

  @override
  String get themeLight => 'בהיר';

  @override
  String localePageTitle(Object DISTRO) {
    return 'ברוך בואך אל $DISTRO';
  }

  @override
  String get localeHeader => 'נא לבחור שפה:';

  @override
  String get identityPageTitle => 'הקמת החשבון שלך';

  @override
  String get identityAutoLogin => 'כניסה אוטומטית';

  @override
  String get identityRequirePassword => 'דרישת הסיסמה שלי לצורך כניסה';

  @override
  String get identityRealNameLabel => 'שמך';

  @override
  String get identityRealNameRequired => 'דרוש שם';

  @override
  String get identityRealNameTooLong => 'השם ארוך מדי.';

  @override
  String get identityHostnameLabel => 'שם המחשב שלך';

  @override
  String get identityHostnameInfo => 'השם שישמש את המחשב בעת תקשורת מול מחשבים אחרים.';

  @override
  String get identityHostnameRequired => 'דרוש שם מחשב';

  @override
  String get identityHostnameTooLong => 'שם המחשב הזה ארוך מדי.';

  @override
  String get identityInvalidHostname => 'שם המחשב שגוי';

  @override
  String get identityUsernameLabel => 'נא לבחור שם משתמש';

  @override
  String get identityUsernameRequired => 'דרוש שם משתמש';

  @override
  String get identityInvalidUsername => 'שם המשתמש שגוי';

  @override
  String get identityUsernameInUse => 'שם משתמש זה כבר קיים.';

  @override
  String get identityUsernameSystemReserved => 'שם זה שמור לטובת המערכת.';

  @override
  String get identityUsernameTooLong => 'השם הזה ארוך מדי.';

  @override
  String get identityUsernameInvalidChars => 'השם הזה מכיל תווים שגויים.';

  @override
  String get identityPasswordLabel => 'נא לבחור סיסמה';

  @override
  String get identityPasswordRequired => 'דרושה סיסמה';

  @override
  String get identityConfirmPasswordLabel => 'אישור הסיסמה שלך';

  @override
  String get identityPasswordMismatch => 'הסיסמאות סותרות זו את זו';

  @override
  String get identityPasswordShow => 'חשיפה';

  @override
  String get identityPasswordHide => 'הסתרה';

  @override
  String get identityActiveDirectoryOption => 'להשתמש ב־Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'אפשר למלא את פרטי שם התחום (דומיין) ופרטים נוספים בצעד הבא.';
}
