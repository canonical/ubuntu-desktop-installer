import 'ubuntu_provision_localizations.dart';

/// The translations for German (`de`).
class UbuntuProvisionLocalizationsDe extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get timezonePageTitle => 'Wählen Sie Ihre Zeitzone aus';

  @override
  String get timezoneLocationLabel => 'Standort';

  @override
  String get timezoneTimezoneLabel => 'Zeitzone';

  @override
  String get keyboardTitle => 'Tastaturbelegung';

  @override
  String get keyboardHeader => 'Wählen Sie Ihre Tastaturbelegung aus:';

  @override
  String get keyboardTestHint => 'Geben Sie hier etwas ein, um Ihre Tastaturbelegung zu überprüfen';

  @override
  String get keyboardDetectTitle => 'Tastaturbelegung erkennen';

  @override
  String get keyboardDetectButton => 'Erkennen';

  @override
  String get keyboardVariantLabel => 'Tastaturvariante:';

  @override
  String get keyboardPressKeyLabel => 'Bitte drücken Sie eine der folgenden Tasten:';

  @override
  String get keyboardKeyPresentLabel => 'Ist die folgende Taste auf Ihrer Tastatur vorhanden?';

  @override
  String get themePageTitle => 'Wählen Sie Ihr Thema aus';

  @override
  String get themePageHeader => 'Sie können dies später in den Einstellungen für das Erscheinungsbild jederzeit ändern.';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeLight => 'Hell';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Willkommen bei $DISTRO';
  }

  @override
  String get localeHeader => 'Wählen Sie Ihre Sprache aus:';

  @override
  String get identityPageTitle => 'Ihr Konto einrichten';

  @override
  String get identityAutoLogin => 'Automatisch anmelden';

  @override
  String get identityRequirePassword => 'Mein Passwort zum Anmelden abfragen';

  @override
  String get identityRealNameLabel => 'Ihr Name';

  @override
  String get identityRealNameRequired => 'Ein Name ist erforderlich';

  @override
  String get identityRealNameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get identityHostnameLabel => 'Name Ihres Computers';

  @override
  String get identityHostnameInfo => 'Der Name, der bei der Kommunikation mit anderen Computern verwendet wird.';

  @override
  String get identityHostnameRequired => 'Ein Computername ist erforderlich';

  @override
  String get identityHostnameTooLong => 'Dieser Computername ist zu lang.';

  @override
  String get identityInvalidHostname => 'Der Computername ist ungültig';

  @override
  String get identityUsernameLabel => 'Einen Benutzernamen auswählen';

  @override
  String get identityUsernameRequired => 'Ein Benutzername ist erforderlich';

  @override
  String get identityInvalidUsername => 'Der Benutzername ist ungültig';

  @override
  String get identityUsernameInUse => 'Dieser Benutzername existiert bereits.';

  @override
  String get identityUsernameSystemReserved => 'Dieser Name ist für die Systemnutzung reserviert.';

  @override
  String get identityUsernameTooLong => 'Dieser Name ist zu lang.';

  @override
  String get identityUsernameInvalidChars => 'Dieser Name enthält ungültige Zeichen.';

  @override
  String get identityPasswordLabel => 'Ein Passwort auswählen';

  @override
  String get identityPasswordRequired => 'Ein Passwort ist erforderlich';

  @override
  String get identityConfirmPasswordLabel => 'Bestätigen Sie Ihr Passwort';

  @override
  String get identityPasswordMismatch => 'Die Passwörter stimmen nicht überein';

  @override
  String get identityPasswordShow => 'Anzeigen';

  @override
  String get identityPasswordHide => 'Ausblenden';

  @override
  String get identityActiveDirectoryOption => 'Active Directory verwenden';

  @override
  String get identityActiveDirectoryInfo => 'Im nächsten Schritt geben Sie die Domäne und andere Details ein.';

  @override
  String get activeDirectoryTitle => 'Active Directory konfigurieren';

  @override
  String get activeDirectoryTestConnection => 'Domänenverbindung testen';

  @override
  String get activeDirectoryDomainLabel => 'Domäne';

  @override
  String get activeDirectoryDomainEmpty => 'Erforderlich';

  @override
  String get activeDirectoryDomainTooLong => 'Zu lang';

  @override
  String get activeDirectoryDomainInvalidChars => 'Ungültige Zeichen';

  @override
  String get activeDirectoryDomainStartDot => 'Beginnt mit einem Punkt (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Endet mit einem Punkt (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Beginnt mit einem Bindestrich (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Endet mit einem Bindestrich (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Enthält mehrere aufeinanderfolgende Punkte (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domäne nicht gefunden';

  @override
  String get activeDirectoryAdminLabel => 'Benutzername für den Domänenbeitritt';

  @override
  String get activeDirectoryAdminEmpty => 'Erforderlich';

  @override
  String get activeDirectoryAdminInvalidChars => 'Ungültige Zeichen';

  @override
  String get activeDirectoryPasswordLabel => 'Passwort';

  @override
  String get activeDirectoryPasswordEmpty => 'Erforderlich';

  @override
  String get activeDirectoryErrorTitle => 'Fehler beim Konfigurieren der Verbindung zum Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Entschuldigung, Active Directory kann im Moment nicht eingerichtet werden. Besuchen Sie für Hilfe <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a>, sobald Ihr System hochgefahren und in Betrieb ist.';
}
