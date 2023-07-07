import 'ubuntu_provision_localizations.dart';

/// The translations for Catalan Valencian (`ca`).
class UbuntuProvisionLocalizationsCa extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get timezonePageTitle => 'On sou?';

  @override
  String get timezoneLocationLabel => 'Ubicació';

  @override
  String get timezoneTimezoneLabel => 'Fus horari';

  @override
  String get keyboardTitle => 'Disposició de teclat';

  @override
  String get keyboardHeader => 'Trieu la vostra distribució de teclat:';

  @override
  String get keyboardTestHint => 'Escriviu aquí per provar el vostre teclat';

  @override
  String get keyboardDetectTitle => 'Detecta la disposició del teclat';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'Premeu una de les tecles següents:';

  @override
  String get keyboardKeyPresentLabel => 'Teniu la tecla següent al vostre teclat?';
}
