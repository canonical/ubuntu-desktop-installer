import 'ubuntu_provision_localizations.dart';

/// The translations for Swedish (`sv`).
class UbuntuProvisionLocalizationsSv extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get timezonePageTitle => 'Välj din tidszon';

  @override
  String get timezoneLocationLabel => 'Plats';

  @override
  String get timezoneTimezoneLabel => 'Tidszon';

  @override
  String get keyboardTitle => 'Tangentbordslayout';

  @override
  String get keyboardHeader => 'Välj din tangentbordslayout:';

  @override
  String get keyboardTestHint => 'Skriv här för att testa ditt tangentbord';

  @override
  String get keyboardDetectTitle => 'Upptäck tangentbordslayout';

  @override
  String get keyboardDetectButton => 'Upptäck';

  @override
  String get keyboardVariantLabel => 'Tangentbordsvariant:';

  @override
  String get keyboardPressKeyLabel => 'Vänligen tryck på en av följande tangenter:';

  @override
  String get keyboardKeyPresentLabel => 'Finns följande tangent på ditt tangentbord?';

  @override
  String get themePageTitle => 'Välj ditt tema';

  @override
  String get themePageHeader => 'Du kan alltid ändra detta senare i utseendeinställningarna.';

  @override
  String get themeDark => 'Mörk';

  @override
  String get themeLight => 'Ljus';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Välkommen till $DISTRO';
  }

  @override
  String get localeHeader => 'Välj ditt språk:';

  @override
  String get identityPageTitle => 'Ställ in ditt konto';

  @override
  String get identityAutoLogin => 'Logga in automatiskt';

  @override
  String get identityRequirePassword => 'Kräv mitt lösenord för att logga in';

  @override
  String get identityRealNameLabel => 'Ditt namn';

  @override
  String get identityRealNameRequired => 'Ett namn krävs';

  @override
  String get identityRealNameTooLong => 'Det namnet är för långt.';

  @override
  String get identityHostnameLabel => 'Din dators namn';

  @override
  String get identityHostnameInfo => 'Namnet den använder när den pratar med andra datorer.';

  @override
  String get identityHostnameRequired => 'Ett datornamn krävs';

  @override
  String get identityHostnameTooLong => 'Det datornamnet är för långt.';

  @override
  String get identityInvalidHostname => 'Datornamnet är ogiltigt';

  @override
  String get identityUsernameLabel => 'Välj ett användarnamn';

  @override
  String get identityUsernameRequired => 'Ett användarnamn krävs';

  @override
  String get identityInvalidUsername => 'Användarnamnet är ogiltigt';

  @override
  String get identityUsernameInUse => 'Det användarnamnet existerar redan.';

  @override
  String get identityUsernameSystemReserved => 'Det namnet är reserverat för systemanvändning.';

  @override
  String get identityUsernameTooLong => 'Det namnet är för långt.';

  @override
  String get identityUsernameInvalidChars => 'Det namnet innehåller ogiltiga tecken.';

  @override
  String get identityPasswordLabel => 'Välj ett lösenord';

  @override
  String get identityPasswordRequired => 'Ett lösenord krävs';

  @override
  String get identityConfirmPasswordLabel => 'Bekräfta ditt lösenord';

  @override
  String get identityPasswordMismatch => 'Lösenorden stämmer inte överens';

  @override
  String get identityPasswordShow => 'Visa';

  @override
  String get identityPasswordHide => 'Dölj';

  @override
  String get identityActiveDirectoryOption => 'Använd Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'Du anger domän och andra detaljer i nästa steg.';

  @override
  String get activeDirectoryTitle => 'Konfigurera Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Testa domänanslutning';

  @override
  String get activeDirectoryDomainLabel => 'Domän';

  @override
  String get activeDirectoryDomainEmpty => 'Krävs';

  @override
  String get activeDirectoryDomainTooLong => 'För lång';

  @override
  String get activeDirectoryDomainInvalidChars => 'Ogiltiga tecken';

  @override
  String get activeDirectoryDomainStartDot => 'Börjar med en punkt (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Slutar med en punkt (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Börjar med ett bindestreck (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Slutar med ett bindestreck (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Innehåller flera sekvenserade punkter (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domän hittades inte';

  @override
  String get activeDirectoryAdminLabel => 'Domän gå med användare';

  @override
  String get activeDirectoryAdminEmpty => 'Krävs';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ogiltiga tecken';

  @override
  String get activeDirectoryPasswordLabel => 'Lösenord';

  @override
  String get activeDirectoryPasswordEmpty => 'Krävs';

  @override
  String get activeDirectoryErrorTitle => 'Fel vid konfiguration av anslutning till Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Tyvärr, Active Directory kan inte ställas in just nu. när ditt system är igång, besök <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> för hjälp.';

  @override
  String get networkPageTitle => 'Anslut till ett nätverk';

  @override
  String get networkPageHeader => 'Att ansluta den här datorn till internet hjälper Ubuntu att installera all extra programvara som behövs och hjälpa dig att välja din tidszon.\n\nAnslut med Ethernet-kabel eller välj ett Wi-Fi-nätverk';

  @override
  String get networkWiredOption => 'Använd trådbunden anslutning';

  @override
  String get networkWiredNone => 'Ingen trådbunden anslutning upptäcktes';

  @override
  String get networkWiredOff => 'Den trådbundna anslutningen är avstängd';

  @override
  String get networkWiredDisabled => 'För att använda Ethernet på den här datorn måste en trådbunden anslutning vara aktiverad';

  @override
  String get networkWiredEnable => 'Aktivera trådbunden';

  @override
  String get networkWifiOption => 'Anslut till ett Wi-Fi nätverk';

  @override
  String get networkWifiOff => 'Trådlöst nätverk inaktiverat';

  @override
  String get networkWifiNone => 'Inga Wi-Fi-enheter upptäcktes';

  @override
  String get networkWifiDisabled => 'För att kunna använda Wi-Fi på den här datorn måste trådlöst nätverk vara aktiverat';

  @override
  String get networkWifiEnable => 'Aktivera Wi-Fi';

  @override
  String get networkHiddenWifiOption => 'Anslut till ett dolt Wi-Fi-nätverk';

  @override
  String get networkHiddenWifiNameLabel => 'Nätverksnamn';

  @override
  String get networkHiddenWifiNameRequired => 'Ett nätverksnamn krävs';

  @override
  String get networkNoneOption => 'Jag vill inte ansluta till internet just nu';
}
