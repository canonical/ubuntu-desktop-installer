import 'ubuntu_provision_localizations.dart';

/// The translations for Slovak (`sk`).
class UbuntuProvisionLocalizationsSk extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get timezonePageTitle => 'Vyberte si svoje časové pásmo';

  @override
  String get timezoneLocationLabel => 'Umiestnenie';

  @override
  String get timezoneTimezoneLabel => 'Časové pásmo';

  @override
  String get keyboardTitle => 'Rozloženie klávesnice';

  @override
  String get keyboardHeader => 'Vyberte si rozloženie klávesnice:';

  @override
  String get keyboardTestHint => 'Správne fungovanie rozloženia si môžete vyskúšať tu';

  @override
  String get keyboardDetectTitle => 'Zistiť rozloženie klávesnice';

  @override
  String get keyboardDetectButton => 'Zistiť';

  @override
  String get keyboardVariantLabel => 'Variant klávesnice:';

  @override
  String get keyboardPressKeyLabel => 'Stlačte niektorú z nasledujúcich kláves:';

  @override
  String get keyboardKeyPresentLabel => 'Máte na klávesnici nasledujúci kláves?';

  @override
  String get themePageTitle => 'Vyberte si motív vzhľadu';

  @override
  String get themePageHeader => 'Môžete ho neskôr kedykoľvek zmeniť v nastaveniach vzhľadu.';

  @override
  String get themeDark => 'Tmavý';

  @override
  String get themeLight => 'Svetlý';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Vitajte v $DISTRO';
  }

  @override
  String get localeHeader => 'Vyberte si svoj jazyk:';

  @override
  String get identityPageTitle => 'Nastavenie vášho účtu';

  @override
  String get identityAutoLogin => 'Prihlásiť sa automaticky';

  @override
  String get identityRequirePassword => 'Pri prihlasovaní sa vyžadovať heslo';

  @override
  String get identityRealNameLabel => 'Vaše meno';

  @override
  String get identityRealNameRequired => 'Je potrebné zadať meno';

  @override
  String get identityRealNameTooLong => 'Meno je príliš dlhé.';

  @override
  String get identityHostnameLabel => 'Názov pre váš počítač';

  @override
  String get identityHostnameInfo => 'Tento názov slúži pri komunikácii s ostatnými počítačmi.';

  @override
  String get identityHostnameRequired => 'Je potrebné zadať názov pre počítač';

  @override
  String get identityHostnameTooLong => 'Takýto názov počítača je príliš dlhý.';

  @override
  String get identityInvalidHostname => 'Zadaný názov pre počítač nie je možné použiť';

  @override
  String get identityUsernameLabel => 'Vyberte si používateľské meno';

  @override
  String get identityUsernameRequired => 'Je potrebné zadať používateľské meno';

  @override
  String get identityInvalidUsername => 'Zadané používateľské meno nie je možné použiť';

  @override
  String get identityUsernameInUse => 'Také používateľské meno už existuje.';

  @override
  String get identityUsernameSystemReserved => 'Také meno je rezervované pre využitie systémom.';

  @override
  String get identityUsernameTooLong => 'Také meno je príliš dlhé.';

  @override
  String get identityUsernameInvalidChars => 'Také meno obsahuje neplatné znaky.';

  @override
  String get identityPasswordLabel => 'Vyberte si heslo';

  @override
  String get identityPasswordRequired => 'Je potrebné zadať heslo';

  @override
  String get identityConfirmPasswordLabel => 'Zopakujte zadanie hesla';

  @override
  String get identityPasswordMismatch => 'Do každej z kolónok pre heslo ste napísali niečo iné';

  @override
  String get identityPasswordShow => 'Zobraziť';

  @override
  String get identityPasswordHide => 'Skryť';

  @override
  String get identityActiveDirectoryOption => 'Použiť Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'V ďalšom kroku zadáte doménu a ďalšie podrobnosti.';

  @override
  String get activeDirectoryTitle => 'Konfigurácia služby Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Vyskúšať spojenie s doménou';

  @override
  String get activeDirectoryDomainLabel => 'Doména';

  @override
  String get activeDirectoryDomainEmpty => 'Vyžadované';

  @override
  String get activeDirectoryDomainTooLong => 'Príliš dlhé';

  @override
  String get activeDirectoryDomainInvalidChars => 'Neplatné znaky';

  @override
  String get activeDirectoryDomainStartDot => 'Začína na bodku (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Končí na bodku (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Začína na spojovník/pomlčku (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Končí na spojovník/pomlčku (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Obsahuje niekoľko bodiek za sebou (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Doména nenájdená';

  @override
  String get activeDirectoryAdminLabel => 'Používateľ s oprávnením pre pridanie do domény';

  @override
  String get activeDirectoryAdminEmpty => 'Vyžadované';

  @override
  String get activeDirectoryAdminInvalidChars => 'Neplatné znaky';

  @override
  String get activeDirectoryPasswordLabel => 'Heslo';

  @override
  String get activeDirectoryPasswordEmpty => 'Vyžadované';

  @override
  String get activeDirectoryErrorTitle => 'Chyba pri konfigurácii pripojenia k Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Je nám ľúto, v tejto chvíli sa nedarí nastaviť službu Active Directory. Po spustení systému navštívte stránku <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, kde získate ďalšie informácie.';
}
