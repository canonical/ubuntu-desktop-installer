import 'ubuntu_provision_localizations.dart';

/// The translations for Sinhala Sinhalese (`si`).
class UbuntuProvisionLocalizationsSi extends UbuntuProvisionLocalizations {
  UbuntuProvisionLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get timezonePageTitle => 'ඔබ කොහිද?';

  @override
  String get timezoneLocationLabel => 'ස්ථානය';

  @override
  String get timezoneTimezoneLabel => 'වේලා කලාපය';

  @override
  String get keyboardTitle => 'යතුරුපුවරුවේ පිරිසැලසුම';

  @override
  String get keyboardHeader => 'ඔබගේ යතුරුපුවරු පිරිසැලසුම තෝරන්න:';

  @override
  String get keyboardTestHint => 'ඔබගේ යතුරුපුවරුව පරීක්‍ෂාවට මෙතැන ලියන්න';

  @override
  String get keyboardDetectTitle => 'යතුරුපුවරුවේ පිරිසැලසුම අනාවරණය';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'පහත යතුරු වලින් එකක් ඔබන්න:';

  @override
  String get keyboardKeyPresentLabel => 'පහත යතුර ඔබගේ යතුරුපුවරුවේ තිබේද?';

  @override
  String get themePageTitle => 'ඔබගේ පෙනුම තෝරන්න';

  @override
  String get themePageHeader => 'මෙය පසුව පෙනුම සැකසුම් හරහා වෙනස් කිරීමට හැකිය.';

  @override
  String get themeDark => 'අඳුරු';

  @override
  String get themeLight => 'දීප්ත';

  @override
  String localePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String get localeHeader => 'ඔබගේ භාෂාව තෝරන්න:';

  @override
  String get identityPageTitle => 'ඔබ කවුද?';

  @override
  String get identityAutoLogin => 'ස්වයංක්‍රීයව පිවිසෙන්න';

  @override
  String get identityRequirePassword => 'ප්‍රවේශය සඳහා මාගේ මුරපදය වුවමනාය';

  @override
  String get identityRealNameLabel => 'ඔබගේ නම';

  @override
  String get identityRealNameRequired => 'නමක් වුවමනාය';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'ඔබගේ පරිගණකයේ නම';

  @override
  String get identityHostnameInfo => 'වෙනත් පරිගණක වෙත අමතන විට නම භාවිතා වේ.';

  @override
  String get identityHostnameRequired => 'පරිගණකයට නමක් වුවමනාය';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'පරිගණකයේ නම වැරදිය';

  @override
  String get identityUsernameLabel => 'පරිශ්‍රීලක නාමයක් තෝරන්න';

  @override
  String get identityUsernameRequired => 'පරිශ්‍රීලක නාමයක් වුවමනාය';

  @override
  String get identityInvalidUsername => 'පරිශ්‍රීලක නාමය වැරදිය';

  @override
  String get identityUsernameInUse => 'පරිශ්‍රීලක නාමය දැනටමත් පවතී.';

  @override
  String get identityUsernameSystemReserved => 'එම නම පද්ධතියේ භාවිතයට වෙන් කර ඇත.';

  @override
  String get identityUsernameTooLong => 'නම ඉතා දිගයි.';

  @override
  String get identityUsernameInvalidChars => 'නමෙහි වලංගු නොවන අකුරු අඩංගුය.';

  @override
  String get identityPasswordLabel => 'මුරපදයක් තෝරන්න';

  @override
  String get identityPasswordRequired => 'මුරපදයක් වුවමනාය';

  @override
  String get identityConfirmPasswordLabel => 'මුරපදය තහවුරු කරන්න';

  @override
  String get identityPasswordMismatch => 'මුරපද නොගැළපේ';

  @override
  String get identityPasswordShow => 'පෙන්වන්න';

  @override
  String get identityPasswordHide => 'සඟවන්න';

  @override
  String get identityActiveDirectoryOption => 'Use Active Directory';

  @override
  String get identityActiveDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

  @override
  String get activeDirectoryTitle => 'Configure Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Test domain connectivity';

  @override
  String get activeDirectoryDomainLabel => 'Domain';

  @override
  String get activeDirectoryDomainEmpty => 'Required';

  @override
  String get activeDirectoryDomainTooLong => 'Too long';

  @override
  String get activeDirectoryDomainInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryDomainStartDot => 'Starts with a dot (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Ends with a dot (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Starts with a hyphen (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Ends with a hyphen (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Contains multiple sequenced dots (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Domain not found';

  @override
  String get activeDirectoryAdminLabel => 'Domain join user';

  @override
  String get activeDirectoryAdminEmpty => 'Required';

  @override
  String get activeDirectoryAdminInvalidChars => 'Invalid characters';

  @override
  String get activeDirectoryPasswordLabel => 'Password';

  @override
  String get activeDirectoryPasswordEmpty => 'Required';

  @override
  String get activeDirectoryErrorTitle => 'Error configuring connection to Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Sorry, Active Directory can\'t be set up at the moment. Once your system is up and running, visit <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> for help.';

  @override
  String get networkPageTitle => 'අන්තර්ජාලයට සබඳින්න';

  @override
  String get networkPageHeader => 'මෙම පරිගණකය අන්තර්ජාලයට සම්බන්ධ කිරීමෙන් උබුන්ටු සඳහා අවශ්‍ය ඕනෑම අමතර මෘදුකාංගයක් ස්ථාපනයට මෙන්ම ඔබගේ වේලා කලාපය තෝරා ගැනීමට හැකිය.\n\nඊතර්නෙට් රැහැන සම්බන්ධ කරන්න හෝ වයි-ෆයි ජාලයක් තෝරන්න';

  @override
  String get networkWiredOption => 'රැහැන් සම්බන්ධතාවය යොදාගන්න';

  @override
  String get networkWiredNone => 'රැහැන් සම්බන්ධතාවයක් අනාවරණය නොවිණි';

  @override
  String get networkWiredOff => 'රැහැන් සම්බන්ධතාවය අක්‍රියයි';

  @override
  String get networkWiredDisabled => 'මෙම පරිගණකයේ ඊතර්නෙට් භාවිතයට, රැහැන්ගත සම්බන්ධතාවයක් සබල කළ යුතුය';

  @override
  String get networkWiredEnable => 'රැහැන්ගත සබල කරන්න';

  @override
  String get networkWifiOption => 'වයි-ෆයි ජාලයකට සබඳින්න';

  @override
  String get networkWifiOff => 'රැහැන් රහිත ජාලකරණය අබලයි';

  @override
  String get networkWifiNone => 'කිසිදු වයි-ෆයි උපාංගයක් අනාවරණය වී නැත';

  @override
  String get networkWifiDisabled => 'මෙම පරිගණකයේ වයි-ෆයි භාවිතයට, රැහැන් රහිත ජාලකරණය සබල කළ යුතුය';

  @override
  String get networkWifiEnable => 'වයි-ෆයි සබල කරන්න';

  @override
  String get networkHiddenWifiOption => 'සැඟවුණු වයි-ෆයි ජාලයකට සබඳින්න';

  @override
  String get networkHiddenWifiNameLabel => 'ජාලයේ නම';

  @override
  String get networkHiddenWifiNameRequired => 'ජාල නාමයක් වුවමනාය';

  @override
  String get networkNoneOption => 'දැන් අන්තර්ජාලයට සම්බන්ධ වීමට අවශ්‍ය නැත';
}
