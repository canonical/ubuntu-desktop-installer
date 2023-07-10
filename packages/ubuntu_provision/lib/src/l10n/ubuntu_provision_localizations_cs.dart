import 'ubuntu_provision_localizations.dart';

/// The translations for Czech (`cs`).
class UbuntuProvisionLocalizationsCs extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get timezonePageTitle => 'Vyberte své časové pásmo';

  @override
  String get timezoneLocationLabel => 'Umístění';

  @override
  String get timezoneTimezoneLabel => 'Časové pásmo';

  @override
  String get keyboardTitle => 'Rozvržení klávesnice';

  @override
  String get keyboardHeader => 'Zvolte si rozvržení klávesnice:';

  @override
  String get keyboardTestHint => 'Správné fungování rozvržení si můžete vyzkoušet zde';

  @override
  String get keyboardDetectTitle => 'Zjistit rozvržení klávesnice';

  @override
  String get keyboardDetectButton => 'Zjistit';

  @override
  String get keyboardVariantLabel => 'Varianta klávesnice:';

  @override
  String get keyboardPressKeyLabel => 'Stiskněte některou z následujících kláves:';

  @override
  String get keyboardKeyPresentLabel => 'Máte na klávesnici následující klávesu?';

  @override
  String get themePageTitle => 'Zvolte si motiv vzhledu';

  @override
  String get themePageHeader => 'Toto je možné později kdykoli změnit v nastavení vzhledu.';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get themeLight => 'Světlý';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Vítejte v $DISTRO';
  }

  @override
  String get localeHeader => 'Zvolte svůj jazyk:';

  @override
  String get identityPageTitle => 'Nastavení vašeho účtu';

  @override
  String get identityAutoLogin => 'Přihlásit se automaticky';

  @override
  String get identityRequirePassword => 'Při přihlašování se vyžadovat heslo';

  @override
  String get identityRealNameLabel => '(Vaše) jméno';

  @override
  String get identityRealNameRequired => 'Je třeba zadat jméno';

  @override
  String get identityRealNameTooLong => 'Jméno je příliš dlouhé.';

  @override
  String get identityHostnameLabel => 'Název pro váš počítač';

  @override
  String get identityHostnameInfo => 'Tento název slouží při komunikaci s ostatními počítači.';

  @override
  String get identityHostnameRequired => 'Je třeba zadat název pro počítač';

  @override
  String get identityHostnameTooLong => 'Takový název počítače je příliš dlouhý.';

  @override
  String get identityInvalidHostname => 'Daný název pro počítač nelze použít (neplatný znak)';

  @override
  String get identityUsernameLabel => 'Zvolte si uživatelské jméno';

  @override
  String get identityUsernameRequired => 'Je třeba zadat uživatelské jméno';

  @override
  String get identityInvalidUsername => 'Dané uživatelské jméno nelze použít (neplatný znak)';

  @override
  String get identityUsernameInUse => 'Takové uživatelské jméno už existuje.';

  @override
  String get identityUsernameSystemReserved => 'Takové jméno je rezervováno pro využití systémem.';

  @override
  String get identityUsernameTooLong => 'Takové jméno je příliš dlouhé.';

  @override
  String get identityUsernameInvalidChars => 'Takové jméno obsahuje neplatné znaky.';

  @override
  String get identityPasswordLabel => 'Zvolte si heslo';

  @override
  String get identityPasswordRequired => 'Je třeba zadat heslo';

  @override
  String get identityConfirmPasswordLabel => 'Zopakujte zadání hesla (prevence překlepu)';

  @override
  String get identityPasswordMismatch => 'Do každé z kolonek pro heslo jste napsali něco jiného';

  @override
  String get identityPasswordShow => 'Zobrazit';

  @override
  String get identityPasswordHide => 'Skrýt';

  @override
  String get identityActiveDirectoryOption => 'Použít Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'V dalším kroku zadáte doménu a další podrobnosti.';
}
