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
}
