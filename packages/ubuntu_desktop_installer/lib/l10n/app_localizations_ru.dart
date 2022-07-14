


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
  String get welcome => 'Добро пожаловать';

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
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Внимание</font>. Компьютер не подключен к источнику питания.';
  }

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
  String get freeDiskSpace => 'свободное место';

  @override
  String get newPartitionTable => 'Новая таблица разделов';

  @override
  String get newPartitionTableConfirmationTitle => 'Создать новую пустую таблицу разделов на этом устройстве?';

  @override
  String get newPartitionTableConfirmationMessage => 'Вы выбрали целое устройство для разбиения его на разделы. Если вы продолжите создание новой таблицы разделов на устройстве, все текущие разделы будут удалены.\n\nОбратите внимание, что, если захотите, то сможете отменить эту операцию позже.';

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
  String get whoAreYouPageComputerNameLabel => 'Имя компьютера';

  @override
  String get whoAreYouPageComputerNameInfo => 'Имя, используемое при общении с другими компьютерами.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Требуется имя компьютера';

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
  String get whoAreYouPageShowPassword => 'Показать пароль';

  @override
  String get writeChangesToDisk => 'Записать изменения на диск';

  @override
  String get writeChangesFallbackSerial => 'диск';

  @override
  String get writeChangesDescription => 'Если вы продолжите, перечисленные ниже изменения будут записаны на диски. Дальнейшие изменения вы сможете внести вручную.';

  @override
  String get writeChangesPartitionTablesHeader => 'Изменены таблицы разделов на следующих устройствах:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Следующие разделы будут отформатированы:';

  @override
  String writeChangesPartitionEntryMounted(Object disk, Object partition, Object format, Object mount) {
    return 'раздел #$disk${partition} как $format используется для $mount';
  }

  @override
  String writeChangesPartitionEntryUnmounted(Object disk, Object partition, Object format) {
    return 'раздел #$disk${partition} как $format';
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
  String get chooseYourLookPageLightBodyText => 'Всё светло и ярко';

  @override
  String get chooseYourLookPageDarkBodyText => 'Здравствуй, темнота, мой старый друг';

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
  String get shutdown => 'Отключить';

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
  String welcomeSlideTitle(Object RELEASE) {
    return 'Добро пожаловать в $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Быстрая и изобилующая новыми функциями последняя версия $RELEASE делает работу компьютера проще, чем когда-либо. Вот несколько крутых новинок, на которые стоит обратить внимание...';
  }

  @override
  String get softwareSlideTitle => 'Найдите ещё больше программного обеспечения';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Попрощайтесь с поиском в интернете нового программного обеспечения. Имея доступ к Snap Store и архиву программного обеспечения $RELEASE, вы можете легко находить и устанавливать новые приложения. Просто наберите на клавиатуре то, что вы ищете, или просмотрите такие категории, как «Графика и фотография», «Игры» и «Работа», а также отзывы других пользователей.';
  }

  @override
  String get musicSlideTitle => 'Возьмите с собой свою музыку';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE поставляется с потрясающим музыкальным проигрывателем Rhythmbox. Благодаря расширенным параметрам воспроизведения легко ставить в очередь любимые песни. Кроме того, он отлично работает с компакт-дисками и портативными музыкальными проигрывателями, поэтому вы можете наслаждаться музыкой, куда бы ни отправились.';
  }

  @override
  String get musicSlideRhythmbox => 'Аудио проигрыватель Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Получайте удовольствие от своих фотографий';

  @override
  String get photoSlideDescription => 'Shotwell — удобный менеджер фотографий, доступный для ваших гаджетов. Подключите камеру или телефон, чтобы загрузить фотографии, после этого вы можете как делиться ими, так и безопасно хранить. А если вы ощущаете себя творческим человеком, то можете найти множество других приложений для работы с фотографиями в Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Менеджер фотографий Shotwell';

  @override
  String get photoSlideGimp => 'Редактор изображений GIMP';

  @override
  String get photoSlideShotcut => 'Видеоредактор Shotcut';

  @override
  String get webSlideTitle => 'Получите максимум от интернета';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE включает Firefox, веб-браузер, которым пользуются миллионы людей по всему миру. И, часто используемые вами веб-приложения (например, Facebook или Gmail), могут быть закреплены на рабочем столе для более быстрого доступа, как и приложения на вашем компьютере.';
  }

  @override
  String get webSlideFirefox => 'Веб-браузер Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Веб-браузер Chromium';

  @override
  String get officeSlideTitle => 'Всё что нужно для офиса';

  @override
  String get officeSlideDescription => 'LibreOffice — это бесплатный офисный пакет, в котором есть всё необходимое для создания документов, электронных таблиц и презентаций. Совместимый с форматами файлов Microsoft Office, он предоставляет вам все необходимые функции совершенно бесплатно.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Доступ для каждого';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'В основе философии $RELEASE лежит убеждение, что компьютеры предназначены для каждого. Благодаря расширенным инструментам специальных возможностей и параметрам изменения языка, цветовой схемы и размера текста $RELEASE упрощает работу с компьютером, где бы вы ни находились.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Параметры настройки';

  @override
  String get accessSlideAppearance => 'Внешний вид';

  @override
  String get accessSlideAssistiveTechnologies => 'Специальные возможности';

  @override
  String get accessSlideLanguageSupport => 'Языковая поддержка';

  @override
  String get supportSlideTitle => 'Помощь и поддержка';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'Официальная документация охватывает многие из наиболее распространенных областей $RELEASE. Она доступна как <a href=\"https://help.ubuntu.com\">онлайн</a>, так и с помощью значка справки на панели задач.';
  }

  @override
  String get supportSlideQuestions => 'На странице <a href=\"https://askubuntu.com\">Ask Ubuntu</a> вы можете задавать вопросы и выполнять поиск по внушительной коллекции уже отвеченных вопросов. Поддержка на вашем родном языке может быть предоставлена вашей <a href=\"https://loco.ubuntu.com/teams\">местной командой сообщества</a>.';

  @override
  String get supportSlideResources => 'Чтобы получить ссылки на другие полезные ресурсы, посетите <a href=\"https://www.ubuntu.com/support/community-support\">Community support</a> или <a href=\"https://www.ubuntu.com/support\">Commercial support</a>.';

  @override
  String get includedSoftware => 'Включённое программное обеспечение';

  @override
  String get availableSoftware => 'Доступное программное обеспечение';

  @override
  String get supportedSoftware => 'Поддерживаемое программное обеспечение';

  @override
  String get copyingFiles => 'Копирование файлов...';

  @override
  String get installationFailed => 'Ошибка установки';
}
