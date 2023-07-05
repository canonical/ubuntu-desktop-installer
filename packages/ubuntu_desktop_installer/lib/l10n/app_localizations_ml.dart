import 'app_localizations.dart';

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ഉബുണ്ടു ഡെസ്ക്ടോപ്പ് ഇൻസ്റ്റാളർ';

  @override
  String windowTitle(Object RELEASE) {
    return '$RELEASE ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String get changeButtonText => 'മാറ്റുക';

  @override
  String get restartButtonText => 'പുനരാരംഭിക്കുക';

  @override
  String get revertButtonText => 'തിരിച്ചെടുക്കുക';

  @override
  String get quitButtonText => 'Quit installation';

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Welcome to $DISTRO';
  }

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO…';
  }

  @override
  String get welcomeHeader => 'Choose your language:';

  @override
  String tryOrInstallPageTitle(Object DISTRO) {
    return 'ഉപയോഗിച്ച് നോക്കുക അല്ലെങ്കിൽ ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String get repairInstallation => 'ഇൻസ്റ്റാളേഷൻ നന്നാക്കുക';

  @override
  String get repairInstallationDescription => 'റിപ്പയർ ചെയ്യുന്നത് ഡോക്യുമെന്റുകളോ ക്രമീകരണങ്ങളോ സ്പർശിക്കാതെ ഇൻസ്റ്റാൾ ചെയ്ത എല്ലാ സോഫ്റ്റ്വെയറുകളും വീണ്ടും ഇൻസ്റ്റാൾ ചെയ്യും.';

  @override
  String tryUbuntu(Object RELEASE) {
    return '$RELEASE ഉപയോഗിച്ച് നോക്കുക';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'നിങ്ങളുടെ കമ്പ്യൂട്ടറിൽ മാറ്റങ്ങളൊന്നും വരുത്താതെ തന്നെ നിങ്ങൾക്ക് $RELEASE പരീക്ഷിക്കാവുന്നതാണ്.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return '$RELEASE ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'നിങ്ങളുടെ നിലവിലെ ഓപ്പറേറ്റിംഗ് സിസ്റ്റത്തിനൊപ്പം (അല്ലെങ്കിൽ പകരം) $RELEASE ഇൻസ്റ്റാൾ ചെയ്യുക. ഇത് അധിക സമയം എടുക്കാൻ പാടില്ലാത്തതാണ്.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'നിങ്ങൾ <a href=\"$url\">റിലീസ് കുറിപ്പുകൾ</a> വായിക്കാൻ ആഗ്രഹിച്ചേക്കാം.';
  }

  @override
  String get rstTitle => 'RST ഓഫ് ചെയ്യുക';

  @override
  String get rstHeader => 'Turn off RST to continue';

  @override
  String get rstDescription => 'ഈ കമ്പ്യൂട്ടർ ഇന്റൽ ആർഎസ്ടി (റാപ്പിഡ് സ്റ്റോറേജ് ടെക്നോളജി) ഉപയോഗിക്കുന്നു. ഉബുണ്ടു ഇൻസ്റ്റാൾ ചെയ്യുന്നതിന് മുമ്പ് നിങ്ങൾ വിൻഡോസിൽ ആർഎസ്ടി ഓഫ് ചെയ്യേണ്ടതുണ്ട്.';

  @override
  String rstInstructions(Object url) {
    return 'നിർദ്ദേശങ്ങൾക്കായി, ഒരു ഫോണിലോ മറ്റ് ഉപകരണത്തിലോ ഈ പേജ് തുറക്കുക: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardTitle => 'കീബോർഡിന്റെ ക്രമീകരണം';

  @override
  String get keyboardHeader => 'നിങ്ങളുടെ കീബോർഡിന്റെ ക്രമീകരണം തിരഞ്ഞെടുക്കുക:';

  @override
  String get keyboardTestHint => 'നിങ്ങളുടെ കീബോർഡ് പരിശോധിക്കാൻ ഇവിടെ ടൈപ്പ് ചെയ്യുക';

  @override
  String get keyboardDetectTitle => 'കീബോർഡിന്റെ ക്രമീകരണം കണ്ടുപിടിക്കുക';

  @override
  String get keyboardDetectButton => 'Detect';

  @override
  String get keyboardVariantLabel => 'Keyboard variant:';

  @override
  String get keyboardPressKeyLabel => 'ഈ കീകളിൽ ഒന്ന് അമർത്തുക:';

  @override
  String get keyboardKeyPresentLabel => 'നിങ്ങളുടെ കീബോർഡിൽ ഈ കീ നിലവിലുണ്ടോ?';

  @override
  String get configureSecureBootTitle => 'സെക്യൂർ ബൂട്ട് ക്രമീകരിക്കുക';

  @override
  String get configureSecureBootDescription => 'നിങ്ങൾ മൂന്നാം-കക്ഷി ഡ്രൈവർ സോഫ്റ്റ്‌വെയർ ഇൻസ്റ്റാൾ ചെയ്യാൻ തിരഞ്ഞെടുത്തു. ഇതിന് സെക്യൂർ ബൂട്ട് ഓഫാക്കേണ്ടതുണ്ട്.\nഇത് ചെയ്യുന്നതിന്, നിങ്ങൾ ഇപ്പോൾ ഒരു സുരക്ഷാ കീ തിരഞ്ഞെടുക്കേണ്ടതുണ്ട്, കൂടാതെ സിസ്റ്റം പുനരാരംഭിക്കുമ്പോൾ അത് നൽകുകയും ചെയ്യേണ്ടതുമുണ്ട്.';

  @override
  String get configureSecureBootOption => 'സെക്യൂർ ബൂട്ട് ക്രമീകരിക്കുക';

  @override
  String get chooseSecurityKey => 'ഒരു സുരക്ഷാ കീ തിരഞ്ഞെടുക്കുക';

  @override
  String get confirmSecurityKey => 'സുരക്ഷാ കീ സ്ഥിരീകരിക്കുക';

  @override
  String get dontInstallDriverSoftwareNow => 'ഇപ്പോൾ ഡ്രൈവർ സോഫ്റ്റ്‌വെയർ ഇൻസ്റ്റാൾ ചെയ്യരുത്';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'സോഫ്റ്റ്‌വെയർ & അപ്ഡേറ്റസിൽ നിന്ന് പിനീട് ഇൻസ്റ്റാൾ ചെയ്യാവുന്നതാണ്.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'സുരക്ഷാ കീ ആവശ്യമാണ്';

  @override
  String get secureBootSecurityKeysDontMatch => 'സുരക്ഷാ കീകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get showSecurityKey => 'Show security key';

  @override
  String get connectToInternetPageTitle => 'ഇന്റർനെറ്റ് ആയിട്ട് ബന്ധിപ്പിക്കുക';

  @override
  String get connectToInternetDescription => 'ഈ കമ്പ്യൂട്ടർ ഇൻറർനെറ്റിലേക്ക് ബന്ധിപ്പിക്കുന്നത് ഉബുണ്ടുവിന് ആവശ്യമായ ഏതെങ്കിലും അധിക സോഫ്‌റ്റ്‌വെയർ ഇൻസ്റ്റാൾ ചെയ്യാൻ സഹായിക്കുകയും നിങ്ങളുടെ സമയ മേഖല തിരഞ്ഞെടുക്കാൻ സഹായിക്കുകയും ചെയ്യും.\n\nഇതർനെറ്റ് കേബിൾ വഴി ബന്ധിപ്പിക്കുക, അല്ലെങ്കിൽ ഒരു Wi-Fi നെറ്റ്‌വർക്ക് തിരഞ്ഞെടുക്കുക';

  @override
  String get useWiredConnection => 'വയർഡ് കണക്ഷൻ ഉപയോഗിക്കുക';

  @override
  String get noWiredConnection => 'വയർഡ് കണക്ഷനൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get wiredDisabled => 'വയർഡ് കണക്ഷൻ ഓഫ് ചെയ്തിരിക്കുകയാണ്';

  @override
  String get wiredMustBeEnabled => 'ഈ കമ്പ്യൂട്ടറിൽ ഇതർനെറ്റ് ഉപയോഗിക്കുന്നതിന്, ഒരു വയർഡ് കണക്ഷൻ പ്രവർത്തനക്ഷമമാക്കിയിരിക്കണം';

  @override
  String get enableWired => 'വയർഡ് പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get selectWifiNetwork => 'ഒരു Wi-Fi നെറ്റ്‌വർക്കിലേക്ക് ബന്ധിപ്പിക്കുക';

  @override
  String get hiddenWifiNetwork => 'Connect to a hidden Wi-Fi network';

  @override
  String get hiddenWifiNetworkNameLabel => 'Network name';

  @override
  String get hiddenWifiNetworkNameRequired => 'A network name is required';

  @override
  String get noInternet => 'എനിക്ക് ഇപ്പോൾ ഇന്റർനെറ്റിലേക്ക് ബന്ധിപ്പിക്കാൻ താൽപ്പര്യമില്ല';

  @override
  String get wirelessNetworkingDisabled => 'വയർലെസ് നെറ്റ്‌വർക്കിംഗ് പ്രവർത്തനരഹിതമാക്കി';

  @override
  String get noWifiDevicesDetected => 'Wi-Fi ഉപകരണങ്ങളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get wifiMustBeEnabled => 'ഈ കമ്പ്യൂട്ടറിൽ Wi-Fi ഉപയോഗിക്കുന്നതിന്, വയർലെസ് നെറ്റ്‌വർക്കിംഗ് പ്രവർത്തനക്ഷമമാക്കിയിരിക്കണം';

  @override
  String get enableWifi => 'Wi-Fi പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get connectButtonText => 'ബന്ധിപ്പിക്കുക';

  @override
  String get updatesOtherSoftwarePageTitle => 'അപ്ഡേറ്റുകളും മറ്റ് സോഫ്റ്റ്വെയറുകളും';

  @override
  String get updatesOtherSoftwarePageDescription => 'ആരംഭിക്കുന്നതിന് ഏതൊക്കെ ആപ്പുകളാണ് നിങ്ങൾ ഇൻസ്റ്റാൾ ചെയ്യാൻ ആഗ്രഹിക്കുന്നത്?';

  @override
  String get normalInstallationTitle => 'സാധാരണ ഇൻസ്റ്റലേഷൻ';

  @override
  String get normalInstallationSubtitle => 'വെബ് ബ്രൗസർ, യൂട്ടിലിറ്റികൾ, ഓഫീസ് സോഫ്റ്റ്‌വെയർ, ഗെയിമുകൾ, മീഡിയ പ്ലെയറുകൾ.';

  @override
  String get minimalInstallationTitle => 'കുറഞ്ഞ ഇൻസ്റ്റാളേഷൻ';

  @override
  String get minimalInstallationSubtitle => 'വെബ് ബ്രൗസറും അടിസ്ഥാന യൂട്ടിലിറ്റികളും.';

  @override
  String get otherOptions => 'മറ്റ് തിരഞ്ഞെടുപ്പുകൾ';

  @override
  String get installThirdPartyTitle => 'ഗ്രാഫിക്‌സിനും വൈഫൈ ഹാർഡ്‌വെയറിനുമായി മൂന്നാം-കക്ഷി സോഫ്‌റ്റ്‌വെയറും അധിക മീഡിയ ഫോർമാറ്റുകളും ഇൻസ്റ്റാൾ ചെയ്യുക';

  @override
  String get installThirdPartySubtitle => 'ഈ സോഫ്റ്റ്‌വെയർ അതിന്റെ ഡോക്യുമെന്റേഷനിൽ ഉൾപ്പെടുത്തിയിട്ടുള്ള ലൈസൻസ് നിബന്ധനകൾക്ക് വിധേയമാണ്. ചിലത് ഉടമസ്ഥതയിലുള്ളതാണ്.';

  @override
  String get installDriversTitle => 'Install third-party software for graphics and Wi-Fi hardware';

  @override
  String get installDriversSubtitle => 'These drivers are subject to license terms included with their documentation. They are proprietary.';

  @override
  String get installCodecsTitle => 'Download and install support for additional media formats';

  @override
  String get installCodecsSubtitle => 'This software is subject to license terms included with its documentation. Some are proprietary.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">മുന്നറിയിപ്പ്</font>: കമ്പ്യൂട്ടർ ഒരു വൈദ്യുത സ്രോതസ്സുമായി ബന്ധിപ്പിച്ചിട്ടില്ല.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'ഒരു സുരക്ഷാ കീ തിരഞ്ഞെടുക്കുക';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'നിങ്ങളുടെ കമ്പ്യൂട്ടർ നഷ്‌ടപ്പെട്ടാൽ ഡിസ്‌ക് എൻക്രിപ്ഷൻ നിങ്ങളുടെ ഫയലുകളെ സംരക്ഷിക്കുന്നു. ഓരോ തവണ കമ്പ്യൂട്ടർ ഓണാകുമ്പോഴും നിങ്ങൾ ഒരു സുരക്ഷാ കീ നൽകേണ്ടതുണ്ട്.\n\n$RELEASE-ന് പുറത്തുള്ള ഫയലുകളൊന്നും എൻക്രിപ്റ്റ് ചെയ്യപ്പെടില്ല.';
  }

  @override
  String get chooseSecurityKeyHint => 'ഒരു സുരക്ഷാ കീ തിരഞ്ഞെടുക്കുക';

  @override
  String get chooseSecurityKeyConfirmHint => 'സുരക്ഷാ കീ സ്ഥിരീകരിക്കുക';

  @override
  String get chooseSecurityKeyRequired => 'ഒരു സുരക്ഷാ കീ ആവശ്യമാണ്';

  @override
  String get chooseSecurityKeyMismatch => 'സുരക്ഷാ കീകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">മുന്നറിയിപ്പ്</font>: ഈ സുരക്ഷാ കീ നഷ്‌ടപ്പെടുകയാണെങ്കിൽ, എല്ലാ ഡാറ്റയും നഷ്‌ടമാകും. നിങ്ങൾക്ക് വേണമെങ്കിൽ, നിങ്ങളുടെ കീ എഴുതി മറ്റെവിടെയെങ്കിലും സുരക്ഷിതമായ സ്ഥലത്ത് സൂക്ഷിക്കുക.';
  }

  @override
  String get installationTypeTitle => 'ഇൻസ്റ്റാളേഷന്റെ തരം';

  @override
  String installationTypeOSDetected(Object os) {
    return 'ഈ കമ്പ്യൂട്ടറിൽ നിലവിൽ $os ഉണ്ട്. നിങ്ങൾ എന്താണ് ചെയ്യാൻ ആഗ്രഹിക്കുന്നത്?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'This computer currently has $os1 and $os2 on it. What would you like to do?';
  }

  @override
  String get installationTypeMultiOSDetected => 'This computer currently has multiple operating systems on it. What would you like to do?';

  @override
  String get installationTypeNoOSDetected => 'ഈ കമ്പ്യൂട്ടറിന് നിലവിൽ കണ്ടെത്തിയ ഓപ്പറേറ്റിംഗ് സിസ്റ്റങ്ങളൊന്നുമില്ല. നിങ്ങൾ എന്താണ് ചെയ്യാൻ ആഗ്രഹിക്കുന്നത്?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'ഡിസ്ക് മായ്ച്ച് $DISTRO ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">മുന്നറിയിപ്പ്:</font> ഇത് നിങ്ങളുടെ എല്ലാ പ്രോഗ്രാമുകളും ഡോക്യുമെന്റുകളും ഫോട്ടോകളും സംഗീതവും എല്ലാ ഓപ്പറേറ്റിംഗ് സിസ്റ്റങ്ങളിലുമുള്ള മറ്റേതെങ്കിലും ഫയലുകളും ഇല്ലാതാക്കും.';
  }

  @override
  String get installationTypeAdvancedLabel => 'വിപുലമായ സവിശേഷതകൾ…';

  @override
  String get installationTypeAdvancedTitle => 'വിപുലമായ സവിശേഷതകൾ';

  @override
  String get installationTypeNone => 'ഒന്നുമില്ല';

  @override
  String get installationTypeNoneSelected => 'ഒന്നും തിരഞ്ഞെടുത്തിട്ടില്ല';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'പുതിയ $RELEASE ഇൻസ്റ്റാളേഷനോടൊപ്പം LVM ഉപയോഗിക്കുക';
  }

  @override
  String get installationTypeLVMSelected => 'LVM തിരഞ്ഞെടുത്തു';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM and encryption selected';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'സുരക്ഷയ്ക്കായി പുതിയ $RELEASE ഇൻസ്റ്റാളേഷൻ എൻക്രിപ്റ്റ് ചെയ്യുക';
  }

  @override
  String get installationTypeEncryptInfo => 'അടുത്ത ഘട്ടത്തിൽ നിങ്ങൾ ഒരു സുരക്ഷാ കീ തിരഞ്ഞെടുക്കും.';

  @override
  String get installationTypeZFS => 'പരീക്ഷണാത്മകം: ഡിസ്ക് മായ്ച്ച് ZFS ഉപയോഗിക്കുക';

  @override
  String get installationTypeZFSSelected => 'ZFS തിരഞ്ഞെടുത്തു';

  @override
  String installationTypeReinstall(Object os) {
    return '$os മായ്ച്ച് വീണ്ടും ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">മുന്നറിയിപ്പ്:</font> ഇത് നിങ്ങളുടെ എല്ലാ $os പ്രോഗ്രാമുകളും ഡോക്യുമെന്റുകളും ഫോട്ടോകളും സംഗീതവും മറ്റേതെങ്കിലും ഫയലുകളും ഇല്ലാതാക്കും.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return '$os എന്നതിനൊപ്പം $product ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Install $product alongside $os1 and $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Install $product alongside them';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Install $product alongside other partitions';
  }

  @override
  String get installationTypeAlongsideInfo => 'പ്രമാണങ്ങളും സംഗീതവും മറ്റ് സ്വകാര്യ ഫയലുകളും സൂക്ഷിക്കും. ഓരോ തവണ കമ്പ്യൂട്ടർ ഓണാകുമ്പോഴും ഏത് ഓപ്പറേറ്റിംഗ് സിസ്റ്റം വേണമെന്ന് നിങ്ങൾക്ക് തിരഞ്ഞെടുക്കാം.';

  @override
  String get installationTypeManual => 'വേറെ എന്തെങ്കിലും';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'നിങ്ങൾക്ക് സ്വയം പാർട്ടീഷനുകൾ സൃഷ്ടിക്കുകയോ വലുപ്പം മാറ്റുകയോ ചെയ്യാം, അല്ലെങ്കിൽ $DISTRO-നായി ഒന്നിലധികം പാർട്ടീഷനുകൾ തിരഞ്ഞെടുക്കാം';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'ഡിസ്ക് മായ്ച്ച് $DISTRO ഇൻസ്റ്റാൾ ചെയ്യുക';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'ഡ്രൈവ് തിരഞ്ഞെടുക്കുക:';

  @override
  String get selectGuidedStorageInfoLabel => 'മുഴുവൻ ഡിസ്കും ഉപയോഗിക്കും:';

  @override
  String get selectGuidedStorageInstallNow => 'ഇപ്പോൾ ഇൻസ്റ്റാൾ ചെയ്യുക';

  @override
  String get installAlongsideSpaceDivider => 'Allocate drive space by dragging the divider below:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num smaller partitions are hidden, use the <a href=\"$url\">advanced partitioning tool</a> for more control';
  }

  @override
  String get installAlongsideResizePartition => 'Resize partition';

  @override
  String get installAlongsideAllocateSpace => 'Allocate space';

  @override
  String get installAlongsideFiles => 'Files';

  @override
  String get installAlongsidePartition => 'Partition:';

  @override
  String get installAlongsideSize => 'Size:';

  @override
  String get installAlongsideAvailable => 'Available:';

  @override
  String get allocateDiskSpace => 'ഡിസ്ക് സ്പേസ് നിയോഗിക്കുക';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Mount points must start with \"/\"';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Mount points cannot contain spaces';

  @override
  String get startInstallingButtonText => 'ഇൻസ്റ്റാളുചെയ്യൽ ആരംഭിക്കുക';

  @override
  String get diskHeadersDevice => 'ഉപകരണം';

  @override
  String get diskHeadersType => 'തരം';

  @override
  String get diskHeadersMountPoint => 'മൗണ്ട് പോയിന്റ്';

  @override
  String get diskHeadersSize => 'വലിപ്പം';

  @override
  String get diskHeadersUsed => 'ഉപയോഗിച്ചു';

  @override
  String get diskHeadersSystem => 'സിസ്റ്റം';

  @override
  String get diskHeadersFormat => 'ഫോർമാറ്റ്';

  @override
  String get freeDiskSpace => 'ഒഴിഞ്ഞ ഇടം';

  @override
  String get newPartitionTable => 'പുതിയ പാർട്ടീഷൻ ടേബിൾ';

  @override
  String get newPartitionTableConfirmationTitle => 'ഈ ഉപകരണത്തിൽ ഒരു പുതിയ ശൂന്യമായ പാർട്ടീഷൻ ടേബിൾ സൃഷ്ടിക്കണോ?';

  @override
  String get newPartitionTableConfirmationMessage => 'പാർട്ടീഷൻ ചെയ്യാൻ നിങ്ങൾ ഒരു മുഴുവൻ ഉപകരണവും തിരഞ്ഞെടുത്തിരിക്കുന്നു. നിങ്ങൾ ഉപകരണത്തിൽ ഒരു പുതിയ പാർട്ടീഷൻ ടേബിൾ തയ്യാറാക്കുന്നത് തുടരുകയാണെങ്കിൽ, നിലവിലുള്ള എല്ലാ പാർട്ടീഷനുകളും നീക്കം ചെയ്യപ്പെടും.\n\nനിങ്ങൾക്ക് വേണമെങ്കിൽ ഈ പ്രവർത്തനം പിന്നീട് പഴയപടിയാക്കാനാകുമെന്ന കാര്യം ശ്രദ്ധിക്കുക.';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'Limit reached';

  @override
  String get bootLoaderDevice => 'ബൂട്ട് ലോഡർ ഇൻസ്റ്റലേഷനുള്ള ഉപകരണം';

  @override
  String get partitionCreateTitle => 'പാർട്ടീഷൻ ഉണ്ടാക്കുക';

  @override
  String get partitionEditTitle => 'പാർട്ടീഷൻ എഡിറ്റ് ചെയ്യുക';

  @override
  String get partitionSizeLabel => 'വലിപ്പം:';

  @override
  String get partitionTypeLabel => 'പുതിയ പാർട്ടീഷന്റെ തരം:';

  @override
  String get partitionTypePrimary => 'പ്രാഥമികം';

  @override
  String get partitionTypeLogical => 'ലോജിക്കൽ';

  @override
  String get partitionLocationLabel => 'പുതിയ പാർട്ടീഷനുള്ള സ്ഥലം:';

  @override
  String get partitionLocationBeginning => 'ഈ ഇടത്തിന്റെ തുടക്കം';

  @override
  String get partitionLocationEnd => 'ഈ ഇടത്തിന്റെ അവസാനം';

  @override
  String get partitionFormatLabel => 'ഇതായി ഉപയോഗിക്കുന്നു:';

  @override
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'പാർട്ടീഷൻ ഫോർമാറ്റ് ചെയ്യുക';

  @override
  String get partitionMountPointLabel => 'മൗണ്ട് പോയിന്റ്:';

  @override
  String get identityPageTitle => 'നിങ്ങൾ ആരാണ്?';

  @override
  String get identityAutoLogin => 'സ്വയമേവ ലോഗിൻ ചെയ്യുക';

  @override
  String get identityRequirePassword => 'ലോഗിൻ ചെയ്യാൻ എന്റെ പാസ്‌വേഡ് ആവശ്യപ്പെടുക';

  @override
  String get identityRealNameLabel => 'താങ്കളുടെ പേര്';

  @override
  String get identityRealNameRequired => 'ഒരു പേര് ആവശ്യമാണ്';

  @override
  String get identityRealNameTooLong => 'That name is too long.';

  @override
  String get identityHostnameLabel => 'നിങ്ങളുടെ കമ്പ്യൂട്ടറിന്റെ പേര്';

  @override
  String get identityHostnameInfo => 'മറ്റ് കമ്പ്യൂട്ടറുകളുമായി സംസാരിക്കുമ്പോൾ അത് ഉപയോഗിക്കുന്ന പേര്.';

  @override
  String get identityHostnameRequired => 'ഒരു കമ്പ്യൂട്ടറിന്റെ പേര് ആവശ്യമാണ്';

  @override
  String get identityHostnameTooLong => 'That computer name is too long.';

  @override
  String get identityInvalidHostname => 'കമ്പ്യൂട്ടറിന്റെ പേര് അസാധുവാണ്';

  @override
  String get identityUsernameLabel => 'ഒരു യൂസർനെയിം തിരഞ്ഞെടുക്കുക';

  @override
  String get identityUsernameRequired => 'ഒരു യൂസർനെയിം ആവശ്യമാണ്';

  @override
  String get identityInvalidUsername => 'യൂസർനെയിം അസാധുവാണ്';

  @override
  String get identityUsernameInUse => 'That user name already exists.';

  @override
  String get identityUsernameSystemReserved => 'That name is reserved for system usage.';

  @override
  String get identityUsernameTooLong => 'That name is too long.';

  @override
  String get identityUsernameInvalidChars => 'That name contains invalid characters.';

  @override
  String get identityPasswordLabel => 'ഒരു പാസ്വേഡ് തിരഞ്ഞെടുക്കുക';

  @override
  String get identityPasswordRequired => 'ഒരു പാസ്‌വേഡ് ആവശ്യമാണ്';

  @override
  String get identityConfirmPasswordLabel => 'നിങ്ങളുടെ പാസ്‌വേഡ് സ്ഥിരീകരിക്കുക';

  @override
  String get identityPasswordMismatch => 'പാസ്‌വേഡുകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get identityPasswordShow => 'Show';

  @override
  String get identityPasswordHide => 'Hide';

  @override
  String get writeChangesToDisk => 'ഡിസ്കിൽ മാറ്റങ്ങൾ എഴുതുക';

  @override
  String get writeChangesFallbackSerial => 'ഡിസ്ക്';

  @override
  String get writeChangesDescription => 'നിങ്ങൾ തുടരുകയാണെങ്കിൽ, ചുവടെ ലിസ്റ്റുചെയ്തിരിക്കുന്ന മാറ്റങ്ങൾ ഡിസ്കുകളിലേക്ക് എഴുതപ്പെടും. നിങ്ങൾക്ക് സ്വമേധയാ കൂടുതൽ മാറ്റങ്ങൾ വരുത്താൻ കഴിയും.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'ഇനിപ്പറയുന്ന ഉപകരണങ്ങളുടെ പാർട്ടീഷൻ ടേബിളുകൾ മാറ്റി:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'ഇനിപ്പറയുന്ന പാർട്ടീഷനുകൾ ഫോർമാറ്റ് ചെയ്യാൻ പോകുന്നു:';

  @override
  String writeChangesPartitionResized(Object sysname, Object oldsize, Object newsize) {
    return 'partition <b>$sysname</b> resized from <b>$oldsize</b> to <b>$newsize</b>';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object sysname, Object format, Object mount) {
    return 'partition <b>$sysname</b> formatted as <b>$format</b> used for <b>$mount</b>';
  }

  @override
  String writeChangesPartitionFormatted(Object sysname, Object format) {
    return 'partition <b>$sysname</b> formatted as <b>$format</b>';
  }

  @override
  String writeChangesPartitionMounted(Object sysname, Object mount) {
    return 'partition <b>$sysname</b> used for <b>$mount</b>';
  }

  @override
  String writeChangesPartitionCreated(Object sysname) {
    return 'partition <b>$sysname</b> created';
  }

  @override
  String get themePageTitle => 'നിങ്ങളുടെ രൂപം തിരഞ്ഞെടുക്കുക';

  @override
  String get themePageHeader => 'രൂപഭാവ ക്രമീകരണങ്ങളിൽ നിങ്ങൾക്ക് ഇത് പിന്നീട് എപ്പോൾ വേണമെങ്കിലും മാറ്റാവുന്നതാണ്.';

  @override
  String get themeDark => 'ഇരുട്ട്';

  @override
  String get themeLight => 'വെളിച്ചം';

  @override
  String get installationCompleteTitle => 'ഇൻസ്റ്റലേഷൻ പൂർത്തിയായി';

  @override
  String readyToUse(Object system) {
    return '**$system** ഇൻസ്റ്റാൾ ചെയ്‌ത് ഉപയോഗിക്കാൻ തയ്യാറാണ്.';
  }

  @override
  String restartInto(Object system) {
    return '$system-ലേക്ക് റീസ്റ്റാർട്ട് ചെയ്യുക';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'You can continue testing $RELEASE now, but until you restart the computer, any changes you make or documents you save will not be preserved.';
  }

  @override
  String get shutdown => 'ഷട്ട് ഡൗൺ';

  @override
  String get restartNow => 'Restart now';

  @override
  String get continueTesting => 'Continue testing';

  @override
  String get bitlockerTitle => 'BitLocker ഓഫാക്കുക';

  @override
  String get bitlockerHeader => 'Turn off BitLocker to continue';

  @override
  String bitlockerDescription(Object option) {
    return 'ഈ കമ്പ്യൂട്ടർ Windows BitLocker എൻക്രിപ്ഷൻ ഉപയോഗിക്കുന്നു.\nഉബുണ്ടു ഇൻസ്റ്റാൾ ചെയ്യുന്നതിന് മുമ്പ് നിങ്ങൾ വിൻഡോസിൽ ബിറ്റ്‌ലോക്കർ ഓഫ് ചെയ്യേണ്ടതുണ്ട്.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'നിർദ്ദേശങ്ങൾക്കായി, ഒരു ഫോണിലോ മറ്റ് ഉപകരണത്തിലോ ഈ പേജ് തുറക്കുക: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'വിന്ഡോസിലേക്ക് പുനരാരംഭിക്കുക';

  @override
  String get restartIntoWindowsTitle => 'Restart into Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Are you sure you want to restart your computer? You will need to restart the $DISTRO installation later to finish installing $DISTRO.';
  }

  @override
  String get timezonePageTitle => 'Select your timezone';

  @override
  String get timezoneLocationLabel => 'Location';

  @override
  String get timezoneTimezoneLabel => 'Timezone';

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Welcome to $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Available:';

  @override
  String get installationSlidesIncluded => 'Included:';

  @override
  String get installationSlidesWelcomeTitle => 'Fast, free and full of new features';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'The latest version of $DISTRO makes computing easier than ever.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Whether you\'re a developer, creator, gamer or administrator you\'ll find new tools to improve your productivity and enhance your experience in $RELEASE.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'All the applications you need';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Install, manage and update all your apps in Ubuntu Software, including thousands of applications from both the Snap Store and $DISTRO archive.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Develop with the best of open source';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO is the ideal workstation for app or web development, data science and AI/ML as well as devops and administration. Every $DISTRO release includes the latest toolchains and supports all major IDEs.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Enhance your creativity';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'If you\'re an animator, designer, video creator or game developer it\'s easy to bring your workflows to $DISTRO with support for open source and industry standard software and applications.';
  }

  @override
  String get installationSlidesGamingTitle => 'Great for gaming';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO supports the latest NVIDIA and Mesa drivers to improve performance and compatibility. Thousands of Windows titles play great on $DISTRO via applications like Steam with no additional configuration.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Private and secure';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO provides all of the tools you need to stay private and secure online. With built in firewall and VPN support and a host of privacy-centric applications to ensure you are in full control of your data.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'All $DISTRO LTS releases come with five years of security patching included, extending to ten years with an Ubuntu Pro subscription.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Power up your productivity';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Desktop includes LibreOffice, a suite of Microsoft Office compatible open source applications for documents, spreadsheets and presentations. Popular collaboration tools are also available.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Access for everyone';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'At the heart of the $DISTRO philosophy is the belief that computing is for everyone. With advanced accessibility tools and options to change language, colours and text size, $DISTRO makes computing easy - whoever and wherever you are.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Orca Screen Reader';

  @override
  String get installationSlidesAccessibilityLanguages => 'Language support';

  @override
  String get installationSlidesSupportTitle => 'Help and support';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'The official $DISTRO documentation is available both online and via the Help icon in the dock.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu covers a range of questions and responses and the Ubuntu Discourse provides guides and discussions for new and experienced users.';

  @override
  String get installationSlidesSupportEnterprise => 'For enterprise users Canonical provides commercial support to make it easy to onboard and manage Ubuntu securely in the workplace.';

  @override
  String get installationSlidesSupportResources => 'Helpful resources:';

  @override
  String get installationSlidesSupportDocumentation => 'Official documentation';

  @override
  String get installationSlidesSupportUbuntuPro => 'Enterprise-grade 24/7 support with Ubuntu Pro';

  @override
  String get copyingFiles => 'Copying files…';

  @override
  String get installingSystem => 'Installing the system…';

  @override
  String get configuringSystem => 'Setting up the system…';

  @override
  String get installationFailed => 'Installation failed';

  @override
  String get notEnoughDiskSpaceTitle => 'Not enough space';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Not enough disk space to install $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Available:';

  @override
  String get notEnoughDiskSpaceRequired => 'Required:';

  @override
  String get activeDirectoryOption => 'Use Active Directory';

  @override
  String get activeDirectoryInfo => 'You\'ll enter domain and other details in the next step.';

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
}
