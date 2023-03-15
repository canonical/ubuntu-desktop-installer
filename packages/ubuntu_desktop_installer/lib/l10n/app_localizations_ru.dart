import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Установщик Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Установить $RELEASE';
  }

  @override
  String get cancelButtonText => 'Отменить';

  @override
  String get changeButtonText => 'Изменить';

  @override
  String get okButtonText => 'OK';

  @override
  String get noButtonText => 'Нет';

  @override
  String get restartButtonText => 'Перезагрузить';

  @override
  String get revertButtonText => 'Вернуть';

  @override
  String get yesButtonText => 'Да';

  @override
  String get quitButtonText => 'Отменить установку';

  @override
  String get welcome => 'Добро пожаловать';

  @override
  String preparingUbuntu(Object DISTRO) {
    return 'Preparing $DISTRO...';
  }

  @override
  String get welcomeHeader => 'Выберите язык:';

  @override
  String get tryOrInstallPageTitle => 'Попробовать или установить';

  @override
  String get repairInstallation => 'Исправить установку';

  @override
  String get repairInstallationDescription => 'Исправление повторно устанавливает все установленные программы, не трогая документы и настройки.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Попробовать $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Вы можете попробовать $RELEASE без каких-либо изменений на вашем компьютере.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Установить $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Установить $RELEASE рядом (или вместо) вашей текущей операционной системы. Это не займёт много времени.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Вы также можете прочитать <a href=\"$url\">заметки о выпуске</a>.';
  }

  @override
  String get turnOffRST => 'Выключить RST';

  @override
  String get turnOffRSTDescription => 'Двнный компьютер использует Intel RST (Rapid Storage Technology). Перед тем, как продолжить установку Ubuntu, необходимо отключить RST в Windows.';

  @override
  String instructionsForRST(Object url) {
    return 'Для получения справки, откройте эту страницу на телефоне или другом устройстве: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Раскладка клавиатуры';

  @override
  String get chooseYourKeyboardLayout => 'Выберите раскладку клавиатуры:';

  @override
  String get typeToTest => 'Введите здесь, чтобы проверить свою клавиатуру';

  @override
  String get detectLayout => 'Определить раскладку клавиатуры';

  @override
  String get detectButtonText => 'Detect';

  @override
  String get keyboardVariant => 'Keyboard variant:';

  @override
  String get pressOneKey => 'Нажмите одну из следующих клавиш:';

  @override
  String get isKeyPresent => 'Есть ли следующая клавиша на вашей клавиатуре?';

  @override
  String get configureSecureBootTitle => 'Настроить Secure Boot';

  @override
  String get configureSecureBootDescription => 'Вы выбрали установку стороннего драйвера. Для этого необходимо отключить Secure Boot.\nДля этого вам нужно сейчас выбрать ключ безопасности и ввести его при перезагрузке системы.';

  @override
  String get configureSecureBootOption => 'Настроить Secure Boot';

  @override
  String get chooseSecurityKey => 'Выберите ключ безопасности';

  @override
  String get confirmSecurityKey => 'Подтвердите ключ безопасности';

  @override
  String get dontInstallDriverSoftwareNow => 'Пока не устанавливать драйверы';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Вы можете установить их позже в приложении «Программы и обновления».';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Требуется ключ безопасности';

  @override
  String get secureBootSecurityKeysDontMatch => 'Ключи безопасности не совпадают';

  @override
  String get showSecurityKey => 'Показать ключ безопасности';

  @override
  String get connectToInternetPageTitle => 'Интернет соединение';

  @override
  String get connectToInternetDescription => 'Соединение данного компьютера с интернетом позволит Ubuntu установить дополнительное программное обеспечение и поможет выбрать ваш часовой пояс.\n\nПрисоедините кабель сети интернет или выберите сеть Wi-Fi';

  @override
  String get useWiredConnection => 'Использовать проводное подключение';

  @override
  String get noWiredConnection => 'Проводное подключение не обнаружено';

  @override
  String get wiredDisabled => 'Проводное подключение отключено';

  @override
  String get wiredMustBeEnabled => 'Чтобы воспользоваться сетью интернет на этом компьютере, должно быть включено проводное соединение';

  @override
  String get enableWired => 'Включить проводное подключение';

  @override
  String get selectWifiNetwork => 'Подключиться к сети Wi-Fi';

  @override
  String get hiddenWifiNetwork => 'Подключиться к скрытой сети Wi-Fi';

  @override
  String get hiddenWifiNetworkNameLabel => 'Название сети';

  @override
  String get hiddenWifiNetworkNameRequired => 'Укажите название сети';

  @override
  String get noInternet => 'Прямо сейчас я не хочу подключаться к Интернету';

  @override
  String get wirelessNetworkingDisabled => 'Беспроводная сеть отключена';

  @override
  String get noWifiDevicesDetected => 'Устройства Wi-Fi не обнаружены';

  @override
  String get wifiMustBeEnabled => 'Чтобы использовать на этом компьютере Wi-Fi, необходимо включить беспроводную сеть';

  @override
  String get enableWifi => 'Включить Wi-Fi';

  @override
  String get connectButtonText => 'Соединение';

  @override
  String get updatesOtherSoftwarePageTitle => 'Обновления и другое программное обеспечение';

  @override
  String get updatesOtherSoftwarePageDescription => 'Какие приложения вы хотели бы установить для начала?';

  @override
  String get normalInstallationTitle => 'Обычная установка';

  @override
  String get normalInstallationSubtitle => 'Веб-браузер, утилиты, офисные программы, игры и медиапроигрыватели.';

  @override
  String get minimalInstallationTitle => 'Минимальная установка';

  @override
  String get minimalInstallationSubtitle => 'Веб-браузер и основные утилиты.';

  @override
  String get otherOptions => 'Другие опции';

  @override
  String get installThirdPartyTitle => 'Установка стороннего программного обеспечения для графики и Wi-Fi, а также дополнительные форматы мультимедиа';

  @override
  String get installThirdPartySubtitle => 'На это программное обеспечение распространяются условиями лицензии, содержащиеся в документации. Часть из них является проприетарной.';

  @override
  String get installDriversTitle => 'Установка программного обеспечения сторонних производителей для графики и Wi-Fi оборудования';

  @override
  String get installDriversSubtitle => 'На эти драйверы распространяются лицензионные условия, прилагаемые к их документации. Они являются проприетарными.';

  @override
  String get installCodecsTitle => 'Установить поддержку дополнительных медиаформатов';

  @override
  String get installCodecsSubtitle => 'На это программное обеспечение распространяются лицензионные условия, прилагаемые к его документации. Некоторые из них являются проприетарными.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Внимание</font>. Компьютер не подключен к источнику питания.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'Выберите ключ безопасности';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Шифрование диска защищает ваши файлы в случае потери компьютера. Это требует введение ключа безопасности при каждом запуске компьютера.\n\nЛюбые файлы за пределами $RELEASE не будут зашифрованы.';
  }

  @override
  String get chooseSecurityKeyHint => 'Выберите ключ безопасности';

  @override
  String get chooseSecurityKeyConfirmHint => 'Подтвердить ключ безопасности';

  @override
  String get chooseSecurityKeyRequired => 'Требуется ключ безопасности';

  @override
  String get chooseSecurityKeyMismatch => 'Ключи безопасности не совпадают';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Предупреждение</font>. Если вы потеряете этот ключ безопасности, все данные будут потеряны. При необходимости вы можете записать ключ и хранить его в безопасном месте.';
  }

  @override
  String get installationTypeTitle => 'Тип установки';

  @override
  String installationTypeOSDetected(Object os) {
    return 'На этом компьютере установлена операционная система $os. Что вы хотите сделать?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'На этом компьютере установлены $os1 и $os2. Что вы хотите сделать?';
  }

  @override
  String get installationTypeMultiOSDetected => 'На этом компьютере установлено несколько операционных систем. Что вы хотите сделать?';

  @override
  String get installationTypeNoOSDetected => 'На этом компьютере не обнаружено установленных операционных систем. Что вы хотите сделать?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Стереть диск и установить $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Внимание:</font> При этом будут удалены все ваши программы, документы, фото, музыка и другие файлы во всех операционных системах.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Дополнительные возможности...';

  @override
  String get installationTypeAdvancedTitle => 'Дополнительные возможности';

  @override
  String get installationTypeNone => 'Ничего';

  @override
  String get installationTypeNoneSelected => 'Ничего не выбрано';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Использовать LVM с новой установкой $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'Выбран LVM';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM и шифрование выбраны';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Зашифровать новую установку $RELEASE для безопасности';
  }

  @override
  String get installationTypeEncryptInfo => 'На следующем шаге выберите ключ безопасности.';

  @override
  String get installationTypeZFS => 'ЭКСПЕРИМЕНТАЛЬНОЕ: Стереть диск и использовать ZFS';

  @override
  String get installationTypeZFSSelected => 'Выбрана ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Удалить $os и переустановить';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Внимание:</font> При этом будут удалены все имевшиеся в $os программы, документы, фото, музыка и другие файлы.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Установить $product вместе с $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Установить $product вместе с $os1 и $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Установить $product вместе с ними';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Установите $product рядом с другими разделами';
  }

  @override
  String get installationTypeAlongsideInfo => 'Документы, музыка и другие личные файлы будут сохранены. Вы сможете выбрать нужную операционную систему для загрузки при каждом запуске компьютера.';

  @override
  String get installationTypeManual => 'Другой вариант';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Вы можете создать или изменить разделы самостоятельно, или выбрать для $DISTRO несколько разделов';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Стереть диск и установить $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Выберите диск:';

  @override
  String get selectGuidedStorageInfoLabel => 'Диск будет использован целиком:';

  @override
  String get selectGuidedStorageInstallNow => 'Установить сейчас';

  @override
  String get installAlongsideSpaceDivider => 'Выделите место на диске, переместив разделитель:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num более мелких разделов скрыто, для большего контроля используйте <a href=\"$url\">расширенный инструмент для разбиения на разделы</a>';
  }

  @override
  String get installAlongsideResizePartition => 'Изменить размер раздела';

  @override
  String get installAlongsideAllocateSpace => 'Выделить место';

  @override
  String get installAlongsideFiles => 'Файлы';

  @override
  String get installAlongsidePartition => 'Раздел:';

  @override
  String get installAlongsideSize => 'Размер:';

  @override
  String get installAlongsideAvailable => 'Доступно:';

  @override
  String get allocateDiskSpace => 'Выделить место на диске';

  @override
  String get startInstallingButtonText => 'Начать установку';

  @override
  String get diskHeadersDevice => 'Устройство';

  @override
  String get diskHeadersType => 'Тип';

  @override
  String get diskHeadersMountPoint => 'Точка монтирования';

  @override
  String get diskHeadersSize => 'Размер';

  @override
  String get diskHeadersUsed => 'Использовано';

  @override
  String get diskHeadersSystem => 'Система';

  @override
  String get diskHeadersFormat => 'Формат';

  @override
  String get freeDiskSpace => 'Свободное место';

  @override
  String get newPartitionTable => 'Новая таблица разделов';

  @override
  String get newPartitionTableConfirmationTitle => 'Создать новую пустую таблицу разделов на этом устройстве?';

  @override
  String get newPartitionTableConfirmationMessage => 'Вы выбрали целое устройство для разбиения его на разделы. Если вы продолжите создание новой таблицы разделов на устройстве, все текущие разделы будут удалены.\n\nОбратите внимание, что, если захотите, то сможете отменить эту операцию позже.';

  @override
  String get tooManyPrimaryPartitions => 'Слишком много первичных разделов';

  @override
  String get partitionLimitReached => 'Достигнут предел';

  @override
  String get bootLoaderDevice => 'Устройство для установки загрузчика';

  @override
  String get partitionCreateTitle => 'Создать раздел';

  @override
  String get partitionEditTitle => 'Изменить раздел';

  @override
  String get partitionSizeLabel => 'Размер:';

  @override
  String get partitionUnitB => 'Б';

  @override
  String get partitionUnitKB => 'КБ';

  @override
  String get partitionUnitMB => 'МБ';

  @override
  String get partitionUnitGB => 'ГБ';

  @override
  String get partitionTypeLabel => 'Тип нового раздела:';

  @override
  String get partitionTypePrimary => 'Первичный';

  @override
  String get partitionTypeLogical => 'Логический';

  @override
  String get partitionLocationLabel => 'Расположение нового раздела:';

  @override
  String get partitionLocationBeginning => 'Начало этого пространства';

  @override
  String get partitionLocationEnd => 'Конец этого пространства';

  @override
  String get partitionFormatLabel => 'Использовано:';

  @override
  String get partitionFormatExt4 => 'Журналируемая файловая система Ext4';

  @override
  String get partitionFormatExt3 => 'Журналируемая файловая система Ext3';

  @override
  String get partitionFormatExt2 => 'Файловая система Ext2';

  @override
  String get partitionFormatBtrfs => 'Журналируемая файловая система btrfs';

  @override
  String get partitionFormatJfs => 'Журналируемая файловая система JFS';

  @override
  String get partitionFormatXfs => 'Журналируемя файловая система XFS';

  @override
  String get partitionFormatFat => 'Файловая система FAT';

  @override
  String get partitionFormatFat12 => 'Файловая система FAT12';

  @override
  String get partitionFormatFat16 => 'Файловая система FAT16';

  @override
  String get partitionFormatFat32 => 'Файловая система FAT32';

  @override
  String get partitionFormatSwap => 'Область подкачки';

  @override
  String get partitionFormatIso9660 => 'Файловая система ISO 9660';

  @override
  String get partitionFormatVfat => 'Файловая система VFAT';

  @override
  String get partitionFormatNtfs => 'Файловая система NTFS';

  @override
  String get partitionFormatReiserFS => 'Файловая система ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Корневая файловая система ZFS';

  @override
  String get partitionFormatNone => 'Leave unformatted';

  @override
  String get partitionErase => 'Форматировать раздел';

  @override
  String get partitionMountPointLabel => 'Точка монтирования:';

  @override
  String get whoAreYouPageTitle => 'Кто вы?';

  @override
  String get whoAreYouPageAutoLogin => 'Входить в систему автоматически';

  @override
  String get whoAreYouPageRequirePassword => 'Требовать пароль для входа в систему';

  @override
  String get whoAreYouPageRealNameLabel => 'Ваше имя';

  @override
  String get whoAreYouPageRealNameRequired => 'Укажите имя';

  @override
  String get whoAreYouPageRealNameTooLong => 'That name is too long.';

  @override
  String get whoAreYouPageComputerNameLabel => 'Имя компьютера';

  @override
  String get whoAreYouPageComputerNameInfo => 'Имя, используемое при общении с другими компьютерами.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Требуется имя компьютера';

  @override
  String get whoAreYouPageComputerNameTooLong => 'That computer name is too long.';

  @override
  String get whoAreYouPageInvalidComputerName => 'Недопустимое имя компьютера';

  @override
  String get whoAreYouPageUsernameLabel => 'Выберите имя пользователя';

  @override
  String get whoAreYouPageUsernameRequired => 'Необходимо имя пользователя';

  @override
  String get whoAreYouPageInvalidUsername => 'Недопустимое имя пользователя';

  @override
  String get whoAreYouPageUsernameInUse => 'Это имя пользователя уже существует.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Это имя зарезервировано для использования системой.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Это имя слишком длинное.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Это имя содержит недопустимые символы.';

  @override
  String get whoAreYouPagePasswordLabel => 'Выберите пароль';

  @override
  String get whoAreYouPagePasswordRequired => 'Требуется пароль';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get whoAreYouPagePasswordMismatch => 'Пароли не совпадают';

  @override
  String get whoAreYouPagePasswordShow => 'Show';

  @override
  String get whoAreYouPagePasswordHide => 'Hide';

  @override
  String get writeChangesToDisk => 'Записать изменения на диск';

  @override
  String get writeChangesFallbackSerial => 'диск';

  @override
  String get writeChangesDescription => 'Если вы продолжите, перечисленные ниже изменения будут записаны на диски. Дальнейшие изменения вы сможете внести вручную.';

  @override
  String get writeChangesDevicesTitle => 'Devices';

  @override
  String get writeChangesPartitionsTitle => 'Partitions';

  @override
  String get writeChangesPartitionTablesHeader => 'Изменены таблицы разделов на следующих устройствах:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Будут применены следующие изменения разделов:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'размер раздела #$disk$partition изменен с $oldsize на $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'раздел #$disk$partition отформатирован как $format и использован для $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'раздел #$disk$partition отформатирован как $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'раздел #$disk$partition использован для $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'раздел #$disk$partition создан';
  }

  @override
  String get chooseYourLookPageTitle => 'Выберите свой внешний вид';

  @override
  String get chooseYourLookPageHeader => 'Вы всегда можете изменить это позже в настройках внешнего вида.';

  @override
  String get chooseYourLookPageDarkSetting => 'Тёмный';

  @override
  String get chooseYourLookPageLightSetting => 'Светлый';

  @override
  String get installationCompleteTitle => 'Установка завершена';

  @override
  String readyToUse(Object system) {
    return '**$system** установлена и готова к использованию.';
  }

  @override
  String restartInto(Object system) {
    return 'Перезагрузка в $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'Можете продолжить тестирование $RELEASE, но при перезагрузке компьютера все внесённые вами изменения или сохранённые документы будут потеряны.';
  }

  @override
  String get shutdown => 'Отключить';

  @override
  String get restartNow => 'Перезагрузить';

  @override
  String get continueTesting => 'Продолжить тестирование';

  @override
  String get turnOffBitlockerTitle => 'Отключить BitLocker';

  @override
  String get turnOffBitlockerDescription => 'Этот компьютер использует шифрование с помощью Windows BitLocker.\nВам необходимо отключить BitLocker в Windows перед установкой Ubuntu.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Чтобы получить инструкции, откройте страницу <a href=\"https://$url\">$url</a> на телефоне или другом устройстве';
  }

  @override
  String get restartIntoWindows => 'Перезагрузить в Windows';

  @override
  String get whereAreYouPageTitle => 'Где вы находитесь?';

  @override
  String get whereAreYouLocationLabel => 'Место нахождения';

  @override
  String get whereAreYouTimezoneLabel => 'Часовой пояс';

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
  String get installationSlidesSupportTitle => 'Help & Support';

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
  String get copyingFiles => 'Копирование файлов…';

  @override
  String get installingSystem => 'Установка системы…';

  @override
  String get configuringSystem => 'Настройка системы…';

  @override
  String get installationFailed => 'Ошибка установки';

  @override
  String get notEnoughDiskSpaceTitle => 'Извините';

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
