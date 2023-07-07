import 'ubuntu_provision_localizations.dart';

/// The translations for Italian (`it`).
class UbuntuProvisionLocalizationsIt extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Fuso orario';

  @override
  String get keyboardTitle => 'Disposizione della tastiera';

  @override
  String get keyboardHeader => 'Scegliere la disposizione della tastiera:';

  @override
  String get keyboardTestHint => 'Digitare qui per provare la tastiera';

  @override
  String get keyboardDetectTitle => 'Rileva disposizione tastiera';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Prego premere uno dei seguenti tasti:';

  @override
  String get keyboardKeyPresentLabel => 'Il seguente tasto è presente sulla propria tastiera?';

  @override
  String get themePageTitle => 'Scegli il aspetto';

  @override
  String get themePageHeader => 'You can always change this later in the appearance settings.';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';
}
