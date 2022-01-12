


import 'app_localizations.dart';

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Ubuntun työpöytäversion asennusohjelma';

  @override
  String windowTitle(Object RELEASE) {
    return 'Asenna $RELEASE';
  }

  @override
  String get cancelButtonText => 'Peru';

  @override
  String get changeButtonText => 'Muuta';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Ei';

  @override
  String get restartButtonText => 'Käynnistä uudelleen';

  @override
  String get revertButtonText => 'Kumoa';

  @override
  String get yesButtonText => 'Kyllä';

  @override
  String get welcome => 'Tervetuloa';

  @override
  String get tryOrInstallPageTitle => 'Kokeile tai asenna';

  @override
  String get repairInstallation => 'Korjaa asennus';

  @override
  String get repairInstallationDescription => 'Korjaus asentaa kaikki ohjelmat uudelleen mutta asiakirjat ja asennukset säilytetään.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Kokeile ${RELEASE}a';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Voit kokeilla ${RELEASE}a tekemättä muutoksia tietokoneellesi.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Asenna $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Asenna $RELEASE nykyisen käyttöjärjestelmäsi rinnalle tai tilalle. Asentaminen ei kestä kauan.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Voit halutessasi lukea <a href=\"$url\">julkaisumuistion</a>.';
  }

  @override
  String get turnOffRST => 'Sammuta RST';

  @override
  String get turnOffRSTDescription => 'Tämä tietokone käyttää Intel RST:tä (Rapid Storage Technology). Sinun tulee sammuttaa RST, ennen kuin asennat Ubuntun.';

  @override
  String instructionsForRST(Object url) {
    return 'Lue ohjeet esimerkiksi puhelimellasi tai jollain toisella laitteella: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Näppäimistön asettelu';

  @override
  String get chooseYourKeyboardLayout => 'Valitse näppäimistön asettelu:';

  @override
  String get typeToTest => 'Kokeile näppäimistön asetuksia kirjoittamalla tähän';

  @override
  String get detectLayout => 'Tunnista näppäimistön asettelu';

  @override
  String get pressOneKey => 'Paina yhtä seuraavista näppäimistä:';

  @override
  String get isKeyPresent => 'Löytyykö seuraava näppäin näppäimistöstäsi?';

  @override
  String get configureSecureBootTitle => 'Määritä Secure Boot';

  @override
  String get configureSecureBootDescription => 'Valitsit kolmansien osapuolten ajurien asennuksen. Tämä vaatii että Secure Boot tulee määrittää.\nTämä vaatii, että valitset turva-avaimen nyt ja kirjoitat sen järjestelmän käynnistyessä uudelleen.';

  @override
  String get configureSecureBootOption => 'Määritä Secure Boot';

  @override
  String get chooseSecurityKey => 'Valitse salausavain';

  @override
  String get confirmSecurityKey => 'Vahvista salausavain';

  @override
  String get dontInstallDriverSoftwareNow => 'Älä asenna ajureita toistaiseksi';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Voit asentaa ne myöhemmin Päivitykset ja muut ohjelmistot -ohjelmassa.';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Salausavain vaaditaan';

  @override
  String get secureBootSecurityKeysDontMatch => 'Salausavaimet eivät täsmää';

  @override
  String get connectToInternetPageTitle => 'Yhdistä internetiin';

  @override
  String get connectToInternetDescription => 'Tietokoneen liittäminen internetiin auttaa Ubuntua asentamaan tarvittavat lisäohjelmistot ja valitsemaan aikavyöhykkeen.\n\nYhdistä Ethernet-kaapelilla tai valitse Wi-Fi-verkko';

  @override
  String get useWiredConnection => 'Käytä langallista yhteyttä';

  @override
  String get noWiredConnection => 'Langallista yhteyttä ei havaittu';

  @override
  String get wiredDisabled => 'Langallinen yhteys on kytketty pois päältä';

  @override
  String get wiredMustBeEnabled => 'Jos haluat käyttää ethernet-yhteyttä tässä tietokoneessa, langallinen yhteys on otettava käyttöön';

  @override
  String get enableWired => 'Ota langallinen yhteys käyttöön';

  @override
  String get selectWifiNetwork => 'Yhdistä Wi-Fi-verkkoon';

  @override
  String get noInternet => 'En halua muodostaa yhteyttä internetiin juuri nyt';

  @override
  String get wirelessNetworkingDisabled => 'Langaton verkko ei käytössä';

  @override
  String get noWifiDevicesDetected => 'Wi-Fi-laitteita ei havaittu';

  @override
  String get wifiMustBeEnabled => 'Jos haluat käyttää Wi-Fi-yhteyttä tällä tietokoneella, langaton verkko on otettava käyttöön';

  @override
  String get enableWifi => 'Ota Wi-Fi käyttöön';

  @override
  String get connectButtonText => 'Yhdistä';

  @override
  String get updatesOtherSoftwarePageTitle => 'Päivitykset ja muut ohjelmistot';

  @override
  String get updatesOtherSoftwarePageDescription => 'Millä sovelluksin haluat aloittaa?';

  @override
  String get normalInstallationTitle => 'Tavallinen asennus';

  @override
  String get normalInstallationSubtitle => 'Verkkoselain, apuohjelmat, toimisto-ohjelmisto, pelit ja multimediasoittimet.';

  @override
  String get minimalInstallationTitle => 'Vähimmäisasennus';

  @override
  String get minimalInstallationSubtitle => 'Verkkoselain ja perusapuohjelmat.';

  @override
  String get otherOptions => 'Muut valinnat';

  @override
  String get installThirdPartyTitle => 'Asenna kolmannen osapuolen ohjelmistot näytönohjainta ja wifi-laitteistoa sekä eri mediamuotoja varten';

  @override
  String get installThirdPartySubtitle => 'Näihin ohjelmistoihin kohdistuvat dokumentaation mukana olevat lisenssiehdot. Jotkin voivat olla suljetun lähdekoodin ohjelmistoja.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Warning</font>: The computer is not plugged in to a power source.';
  }

  @override
  String get chooseSecurityKeyTitle => 'Valitse salausavain';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Kiintolevyn salaus suojaa tiedostoja jos tietokone katoaa tai se varastetaan. Suojaus edellyttää salausavaimen syöttämistä jokaisella tietokoneen käynnistyskerralla.\n\n${RELEASE}-asennuksen ulkopuolisia tiedostoja ei salata.';
  }

  @override
  String get chooseSecurityKeyHint => 'Valitse salausavain';

  @override
  String get chooseSecurityKeyConfirmHint => 'Vahvista salausavain';

  @override
  String get chooseSecurityKeyRequired => 'Salausavain vaaditaan';

  @override
  String get chooseSecurityKeyMismatch => 'Salausavaimet eivät täsmää';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Varoitus</font>: Jos tämä salausavain katoaa tai unohdat sen, kaikki tiedot menetetään. Kirjoita tarvittaessa salausavain muistiin ja säilytä sitä turvallisessa paikassa ja älä tietokoneen lähettyvillä.';
  }

  @override
  String get installationTypeTitle => 'Asennustyyppi';

  @override
  String installationTypeOSDetected(Object os) {
    return 'Tässä tietokoneessa on tällä hetkellä asennettuna käyttöjärjestelmä \"$os\". Mitä haluat tehdä?';
  }

  @override
  String get installationTypeNoOSDetected => 'Tässä tietokoneessa ei havaittu asennettuja käyttöjärjestelmiä. Mitä haluat tehdä?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Tyhjennä levy ja asenna $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Varoitus:</font> Tämä poistaa kaikkien käyttöjärjestelmien kaikki sovellukset, asiakirjat, valokuvat, musiikit ja muut tiedostot.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Edistyneet asetukset...';

  @override
  String get installationTypeAdvancedTitle => 'Edistyneet asetukset';

  @override
  String get installationTypeNone => 'Ei mitään';

  @override
  String get installationTypeNoneSelected => 'Ei valintoja';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Käytä LVM:ää uudessa $RELEASE-asennuksessa';
  }

  @override
  String get installationTypeLVMSelected => 'LVM valittu';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Salaa uusi $RELEASE-asennus paremman tietoturvan vuoksi';
  }

  @override
  String get installationTypeEncryptInfo => 'Salausavain valitaan seuraavassa vaiheessa.';

  @override
  String get installationTypeZFS => 'KOKEELLINEN: Tyhjennä levy ja käytä ZFS:ää';

  @override
  String get installationTypeZFSSelected => 'ZFS valittu';

  @override
  String installationTypeReinstall(Object os) {
    return 'Poista $os ja asenna uudelleen';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Varoitus:</font> Tämä poistaa kaikki käyttäjärjestelmän \"$os\" sovellukset, asiakirjat, valokuvat, musiikit ja muut tiedostot.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Asenna $product käyttöjärjestelmän \"$os\" tilalle';
  }

  @override
  String get installationTypeAlongsideInfo => 'Asiakirjat, musiikki ja muut henkilökohtaiset tiedostot säilytetään. Jokaisella tietokoneen käynnistyskerralla voit valita, mikä käyttöjärjestelmä käynnistetään.';

  @override
  String get installationTypeManual => 'Jokin muu vaihtoehto';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Voit luoda tai muuttaa osioiden kokoja itse, tai valita useita osioita ${DISTRO}n käytettäväksi';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Tyhjennä levy ja asenna $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Valitse asema:';

  @override
  String get selectGuidedStorageInfoLabel => 'Koko levy käytetään:';

  @override
  String get selectGuidedStorageInstallNow => 'Asenna nyt';

  @override
  String get allocateDiskSpace => 'Varaa levytilaa';

  @override
  String get startInstallingButtonText => 'Aloita asennus';

  @override
  String get diskHeadersDevice => 'Laite';

  @override
  String get diskHeadersType => 'Tyyppi';

  @override
  String get diskHeadersMountPoint => 'Liitoskohta';

  @override
  String get diskHeadersSize => 'Koko';

  @override
  String get diskHeadersUsed => 'Käytössä';

  @override
  String get diskHeadersSystem => 'Järjestelmä';

  @override
  String get diskHeadersFormat => 'Alusta';

  @override
  String get freeDiskSpace => 'vapaata tilaa';

  @override
  String get newPartitionTable => 'Uusi osiotaulu';

  @override
  String get newPartitionTableConfirmationTitle => 'Luo uusi tyhjä osiotaulu tälle laitteelle?';

  @override
  String get newPartitionTableConfirmationMessage => 'Valitsit koko laitteen osioitavaksi. Mikäli jatkat uuden osiotaulun tekemistä, kaikki laitteen nykyiset levyosiot poistetaan.\n\nHuomaa, että voit myöhemmin perua tämän toimenpiteen, jos haluat.';

  @override
  String get bootLoaderDevice => 'Laite, jolle alkulatausohjelma asennetaan';

  @override
  String get partitionCreateTitle => 'Luo osio';

  @override
  String get partitionEditTitle => 'Muokkaa osiota';

  @override
  String get partitionSizeLabel => 'Koko:';

  @override
  String get partitionUnitB => 't';

  @override
  String get partitionUnitKB => 'kt';

  @override
  String get partitionUnitMB => 'Mt';

  @override
  String get partitionUnitGB => 'Gt';

  @override
  String get partitionTypeLabel => 'Uuden osion tyyppi:';

  @override
  String get partitionTypePrimary => 'Ensisijainen';

  @override
  String get partitionTypeLogical => 'Looginen';

  @override
  String get partitionLocationLabel => 'Uuden osion paikka:';

  @override
  String get partitionLocationBeginning => 'Tilan alku';

  @override
  String get partitionLocationEnd => 'Tilan loppu';

  @override
  String get partitionFormatLabel => 'Tiedostojärjestelmä:';

  @override
  String get partitionFormatExt4 => 'Ext4-tiedostojärjestelmä sisältäen tapahtumakirjanpidon';

  @override
  String get partitionFormatExt3 => 'Ext3-tiedostojärjestelmä sisältäen tapahtumakirjanpidon';

  @override
  String get partitionFormatExt2 => 'Ext2-tiedostojärjestelmä';

  @override
  String get partitionFormatBtrfs => 'btrfs-tiedostojärjestelmä sisältäen tapahtumakirjanpidon';

  @override
  String get partitionFormatJfs => 'JFS-tiedostojärjestelmä sisältäen tapahtumakirjanpidon';

  @override
  String get partitionFormatXfs => 'XFS-tiedostojärjestelmä sisältäen tapahtumakirjanpidon';

  @override
  String get partitionFormatFat => 'FAT-tiedostojärjestelmä';

  @override
  String get partitionFormatFat12 => 'FAT12-tiedostojärjestelmä';

  @override
  String get partitionFormatFat16 => 'FAT16-tiedostojärjestelmä';

  @override
  String get partitionFormatFat32 => 'FAT32-tiedostojärjestelmä';

  @override
  String get partitionFormatSwap => 'Sivutusosio (swap)';

  @override
  String get partitionFormatIso9660 => 'ISO 9660 -tiedostojärjestelmä';

  @override
  String get partitionFormatVfat => 'VFAT-tiedostojärjestelmä';

  @override
  String get partitionFormatNtfs => 'NTFS-tiedostojärjestelmä';

  @override
  String get partitionFormatReiserFS => 'ReiserFS-tiedostojärjestelmä';

  @override
  String get partitionFormatZfsroot => 'ZFS root -tiedostojärjestelmä';

  @override
  String get partitionErase => 'Alusta osio';

  @override
  String get partitionMountPointLabel => 'Liitoskohta:';

  @override
  String get whoAreYouPageTitle => 'Kuka olet?';

  @override
  String get whoAreYouPageAutoLogin => 'Kirjaudu sisään automaattisesti';

  @override
  String get whoAreYouPageRequirePassword => 'Vaadi salasana sisäänkirjautumiseen';

  @override
  String get whoAreYouPageRealNameLabel => 'Nimi';

  @override
  String get whoAreYouPageRealNameRequired => 'Nimi vaaditaan';

  @override
  String get whoAreYouPageComputerNameLabel => 'Tietokoneen nimi';

  @override
  String get whoAreYouPageComputerNameInfo => 'Nimi, jolla tietokone tunnistautuu toisille tietokoneille.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Tietokoneen nimi vaaditaan';

  @override
  String get whoAreYouPageInvalidComputerName => 'Tietokoneen nimi on virheellinen';

  @override
  String get whoAreYouPageUsernameLabel => 'Valitse käyttäjätunnus';

  @override
  String get whoAreYouPageUsernameRequired => 'Käyttäjätunnus vaaditaan';

  @override
  String get whoAreYouPageInvalidUsername => 'Käyttäjätunnus on virheellinen';

  @override
  String get whoAreYouPagePasswordLabel => 'Valitse salasana';

  @override
  String get whoAreYouPagePasswordRequired => 'Salasana vaaditaan';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Vahvista salasana';

  @override
  String get whoAreYouPagePasswordMismatch => 'Salasanat eivät täsmää';

  @override
  String get writeChangesToDisk => 'Tallenna muutokset levylle';

  @override
  String get writeChangesFallbackSerial => 'levy';

  @override
  String get writeChangesDescription => 'Jos jatkat, alla luetellut muutokset kirjoitetaan levyille. Muussa tapauksessa voit tehdä itse lisää muutoksia.';

  @override
  String get writeChangesPartitionTablesHeader => 'Seuraavien laitteiden osiotauluja on muutettu:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Seuraaviin levyosioihin luodaan uusi tiedostojärjestelmä:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'osio #$disk${partition} tiedostojärjestelmänä $format liitetty kohtaan $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'osio #$disk${partition} tiedostojärjestelmänä $format';
  }

  @override
  String get chooseYourLookPageTitle => 'Valitse ulkoasu';

  @override
  String get chooseYourLookPageHeader => 'Voit vaihtaa ulkoasua milloin tahansa asetusten kautta.';

  @override
  String get chooseYourLookPageDarkSetting => 'Tumma';

  @override
  String get chooseYourLookPageLightSetting => 'Vaalea';

  @override
  String get chooseYourLookPageLightBodyText => 'Kaikki on vaaleaa ja kirkasta';

  @override
  String get chooseYourLookPageDarkBodyText => 'Hei pimeys, vanha ystäväni';

  @override
  String get installationCompleteTitle => 'Asennus on valmis';

  @override
  String readyToUse(Object system) {
    return '**$system** on asennettu ja on valmis käytettäväksi.';
  }

  @override
  String restartInto(Object system) {
    return 'Käynnistä uudelleen käyttöjärjestelmään \"$system\"';
  }

  @override
  String get shutdown => 'Sammuta';

  @override
  String get turnOffBitlockerTitle => 'Sammuta BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Tämä tietokone käyttää Windowsin BitLocker-salausta.\nSinun tulee sammuttaa BitLocker, ennen kuin asennat Ubuntun.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Lue ohjeet esimerkiksi puhelimellasi tai jollain toisella laitteella: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Uudelleenkäynnistä Windowsiin';
}
