import 'ubuntu_provision_localizations.dart';

/// The translations for Lithuanian (`lt`).
class UbuntuProvisionLocalizationsLt extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get timezonePageTitle => 'Pasirinkite laiko juostą';

  @override
  String get timezoneLocationLabel => 'Vieta';

  @override
  String get timezoneTimezoneLabel => 'Laiko juosta';

  @override
  String get keyboardTitle => 'Klaviatūros išdėstymas';

  @override
  String get keyboardHeader => 'Pasirinkite klaviatūros išdėstymą:';

  @override
  String get keyboardTestHint => 'Rašykite čia, norėdami išbandyti klaviatūrą';

  @override
  String get keyboardDetectTitle => 'Aptikti klaviatūros išdėstymą';

  @override
  String get keyboardDetectButton => 'Aptikti';

  @override
  String get keyboardVariantLabel => 'Klaviatūros variantas:';

  @override
  String get keyboardPressKeyLabel => 'Paspauskite vieną iš šių klavišų:';

  @override
  String get keyboardKeyPresentLabel => 'Ar šis klavišas yra jūsų klaviatūroje?';

  @override
  String get themePageTitle => 'Pasirinkite apipavidalinimą';

  @override
  String get themePageHeader => 'Vėliau išvaizdos nustatymuose bet kada galėsite tai pakeisti.';

  @override
  String get themeDark => 'Tamsus';

  @override
  String get themeLight => 'Šviesus';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Jus sveikina $DISTRO';
  }

  @override
  String get localeHeader => 'Pasirinkite kalbą:';

  @override
  String get identityPageTitle => 'Nusistatykite paskyrą';

  @override
  String get identityAutoLogin => 'Automatiškai prisijungti prie paskyros';

  @override
  String get identityRequirePassword => 'Prisijungiant prie paskyros reikalauti slaptažodžio';

  @override
  String get identityRealNameLabel => 'Jūsų vardas';

  @override
  String get identityRealNameRequired => 'Reikia nurodyti vardą';

  @override
  String get identityRealNameTooLong => 'Šis vardas per ilgas.';

  @override
  String get identityHostnameLabel => 'Jūsų kompiuterio pavadinimas';

  @override
  String get identityHostnameInfo => 'Pavadinimas yra naudojamas bendraujant su kitais kompiuteriais.';

  @override
  String get identityHostnameRequired => 'Reikia nurodyti kompiuterio pavadinimą';

  @override
  String get identityHostnameTooLong => 'Šis kompiuterio pavadinimas per ilgas.';

  @override
  String get identityInvalidHostname => 'Kompiuterio pavadinimas yra netinkamas';

  @override
  String get identityUsernameLabel => 'Pasirinkite naudotojo vardą';

  @override
  String get identityUsernameRequired => 'Reikia nurodyti naudotojo vardą';

  @override
  String get identityInvalidUsername => 'Netinkamas naudotojo vardas';

  @override
  String get identityUsernameInUse => 'Šis naudotojo vardas jau yra.';

  @override
  String get identityUsernameSystemReserved => 'Šis vardas yra rezervuotas sisteminiam naudojimui.';

  @override
  String get identityUsernameTooLong => 'Šis vardas per ilgas.';

  @override
  String get identityUsernameInvalidChars => 'Šiame varde yra netinkamų simbolių.';

  @override
  String get identityPasswordLabel => 'Pasirinkite slaptažodį';

  @override
  String get identityPasswordRequired => 'Reikia nurodyti slaptažodį';

  @override
  String get identityConfirmPasswordLabel => 'Pakartokite slaptažodį';

  @override
  String get identityPasswordMismatch => 'Slaptažodžiai nesutampa';

  @override
  String get identityPasswordShow => 'Rodyti';

  @override
  String get identityPasswordHide => 'Slėpti';

  @override
  String get identityActiveDirectoryOption => 'Naudoti „Active Directory“';

  @override
  String get identityActiveDirectoryInfo => 'Kitame žingsnyje įvesite domeną bei kitą išsamesnę informaciją.';
}
