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

  @override
  String get activeDirectoryTitle => 'Nastavit pro Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Vyzkoušet spojení s doménou';

  @override
  String get activeDirectoryDomainLabel => 'Doména';

  @override
  String get activeDirectoryDomainEmpty => 'Vyžadováno';

  @override
  String get activeDirectoryDomainTooLong => 'Příliš dlouhé';

  @override
  String get activeDirectoryDomainInvalidChars => 'Neplatné znaky';

  @override
  String get activeDirectoryDomainStartDot => 'Začíná na tečku (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Končí na tečku (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Začíná na spojovník/pomlčku (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Končí na spojovník/pomlčku (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Obsahuje několik teček za sebou (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Doména nenalezena';

  @override
  String get activeDirectoryAdminLabel => 'Uživatel s oprávněním pro přidání do domény';

  @override
  String get activeDirectoryAdminEmpty => 'Vyžadováno';

  @override
  String get activeDirectoryAdminInvalidChars => 'Neplatné znaky';

  @override
  String get activeDirectoryPasswordLabel => 'Heslo';

  @override
  String get activeDirectoryPasswordEmpty => 'Vyžadováno';

  @override
  String get activeDirectoryErrorTitle => 'Chyba při nastavování pro Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Je nám líto, v tuto chvíli se nedaří nastavit pro Active Directory. Po nastartování nového systému pak navštivte <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, kde získáte další informace.';

  @override
  String get networkPageTitle => 'Připojit k síti';

  @override
  String get networkPageHeader => 'Připojení tohoto počítač k Internetu pomůže Ubuntu nainstalovat jakýkoli potřebný dodatečný software a pomůže zvolit vaše časové pásmo.\n\nPřipojte se Ethernetovým kabelem, nebo zvolte Wi-Fi síť';

  @override
  String get networkWiredOption => 'Použít drátové připojení';

  @override
  String get networkWiredNone => 'Nezjištěno žádné drátové připojení';

  @override
  String get networkWiredOff => 'Drátové připojení je vypnuto';

  @override
  String get networkWiredDisabled => 'Aby na tomto počítači bylo možné použít rozhraní Ethernet, je třeba zapnout drátové připojení';

  @override
  String get networkWiredEnable => 'Zapnout drátové';

  @override
  String get networkWifiOption => 'Připojit k Wi-Fi síti';

  @override
  String get networkWifiOff => 'Bezdrátové připojení je vypnuté';

  @override
  String get networkWifiNone => 'Nevybrána žádná Wi-Fi zařízení';

  @override
  String get networkWifiDisabled => 'Aby na tomto počítači bylo možné použít rozhraní Wi-Fi, je třeba zapnout bezdrátové připojení';

  @override
  String get networkWifiEnable => 'Zapnout Wi-Fi';

  @override
  String get networkHiddenWifiOption => 'Připojit ke skryté Wi-Fi síti';

  @override
  String get networkHiddenWifiNameLabel => 'Název sítě';

  @override
  String get networkHiddenWifiNameRequired => 'Je vyžadován název sítě';

  @override
  String get networkNoneOption => 'V tuto chvíli se nechci připojovat k Internetu';
}
