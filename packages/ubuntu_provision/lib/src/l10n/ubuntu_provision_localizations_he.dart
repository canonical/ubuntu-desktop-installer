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
}
