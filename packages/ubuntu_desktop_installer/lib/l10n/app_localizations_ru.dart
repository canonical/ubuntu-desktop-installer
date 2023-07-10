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
  String get changeButtonText => 'Изменить';

  @override
  String get restartButtonText => 'Перезагрузить';

  @override
  String get revertButtonText => 'Вернуть';

  @override
  String get quitButtonText => 'Отменить установку';

  @override
  String loadingPageTitle(Object DISTRO) {
    return 'Добро пожаловать в $DISTRO';
  }

  @override
  String loadingHeader(Object DISTRO) {
    return 'Подготовка $DISTRO…';
  }

  @override
  String welcomePageTitle(Object DISTRO) {
    return 'Попробовать или установить $DISTRO';
  }

  @override
  String get welcomeRepairOption => 'Исправить установку';

  @override
  String get welcomeRepairDescription => 'Исправление повторно устанавливает все установленные программы, не трогая документы и настройки.';

  @override
  String welcomeTryOption(Object RELEASE) {
    return 'Попробовать $RELEASE';
  }

  @override
  String welcomeTryDescription(Object RELEASE) {
    return 'Вы можете попробовать $RELEASE без каких-либо изменений на вашем компьютере.';
  }

  @override
  String welcomeInstallOption(Object RELEASE) {
    return 'Установить $RELEASE';
  }

  @override
  String welcomeInstallDescription(Object RELEASE) {
    return 'Установить $RELEASE рядом (или вместо) вашей текущей операционной системы. Это не займёт много времени.';
  }

  @override
  String welcomeReleaseNotesLabel(Object url) {
    return 'Вы также можете прочитать <a href=\"$url\">заметки о выпуске</a>.';
  }

  @override
  String get rstTitle => 'RST включён';

  @override
  String get rstHeader => 'Для продолжения отключите RST';

  @override
  String get rstDescription => 'Двнный компьютер использует Intel RST (Rapid Storage Technology). Перед тем, как продолжить установку Ubuntu, необходимо отключить RST в Windows.';

  @override
  String rstInstructions(Object url) {
    return 'Для получения справки отсканируйте QR-код на другом устройстве или посетите: <a href=\"https://$url\">$url</a>';
  }

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
  String get connectToInternetPageTitle => 'Подключение к сети';

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
  String get updatesOtherSoftwarePageTitle => 'Приложения и обновления';

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
  String get installCodecsTitle => 'Загрузить и установить поддержку дополнительных медиаформатов';

  @override
  String get installCodecsSubtitle => 'На это программное обеспечение распространяются лицензионные условия, прилагаемые к его документации. Некоторые из них являются проприетарными.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Внимание:</font> Компьютер не подключен к источнику питания.';
  }

  @override
  String get offlineWarning => 'Вы сейчас не в сети';

  @override
  String get chooseSecurityKeyTitle => 'Ключ безопасности';

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
    return '<font color=\"$color\">Предупреждение:</font> Если вы потеряете этот ключ безопасности, все данные будут потеряны. При необходимости вы можете записать ключ и хранить его в безопасном месте.';
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
  String get installationTypeManual => 'Создание разделов вручную';

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
  String get allocateDiskSpace => 'Создание разделов вручную';

  @override
  String get allocateDiskSpaceInvalidMountPointSlash => 'Точки монтирования должны начинаться с «/»';

  @override
  String get allocateDiskSpaceInvalidMountPointSpace => 'Точки монтирования не могут содержать пробелы';

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
  String get newPartitionTableConfirmationTitle => 'Новый пустой раздел';

  @override
  String get newPartitionTableConfirmationMessage => 'Создание новой таблицы разделов на этом устройстве удалит все его текущие разделы. При необходимости эту операцию можно отменить.';

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
  String get partitionFormatNone => 'Оставить неформатированным';

  @override
  String partitionFormatKeep(Object format) {
    return 'Leave formatted as $format';
  }

  @override
  String get partitionErase => 'Форматировать раздел';

  @override
  String get partitionMountPointLabel => 'Точка монтирования:';

  @override
  String get identityPageTitle => 'Создание своей учётной записи';

  @override
  String get identityAutoLogin => 'Входить в систему автоматически';

  @override
  String get identityRequirePassword => 'Требовать пароль для входа в систему';

  @override
  String get identityRealNameLabel => 'Ваше имя';

  @override
  String get identityRealNameRequired => 'Укажите имя';

  @override
  String get identityRealNameTooLong => 'Слишком длинное имя.';

  @override
  String get identityHostnameLabel => 'Имя компьютера';

  @override
  String get identityHostnameInfo => 'Имя, используемое при общении с другими компьютерами.';

  @override
  String get identityHostnameRequired => 'Требуется имя компьютера';

  @override
  String get identityHostnameTooLong => 'Слишком длинное имя компьютера.';

  @override
  String get identityInvalidHostname => 'Недопустимое имя компьютера';

  @override
  String get identityUsernameLabel => 'Выберите имя пользователя';

  @override
  String get identityUsernameRequired => 'Необходимо имя пользователя';

  @override
  String get identityInvalidUsername => 'Недопустимое имя пользователя';

  @override
  String get identityUsernameInUse => 'Это имя пользователя уже существует.';

  @override
  String get identityUsernameSystemReserved => 'Это имя зарезервировано для использования системой.';

  @override
  String get identityUsernameTooLong => 'Это имя слишком длинное.';

  @override
  String get identityUsernameInvalidChars => 'Это имя содержит недопустимые символы.';

  @override
  String get identityPasswordLabel => 'Выберите пароль';

  @override
  String get identityPasswordRequired => 'Требуется пароль';

  @override
  String get identityConfirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get identityPasswordMismatch => 'Пароли не совпадают';

  @override
  String get identityPasswordShow => 'Показать';

  @override
  String get identityPasswordHide => 'Скрыть';

  @override
  String get confirmPageTitle => 'Готово к установке';

  @override
  String get confirmHeader => 'Если вы продолжите, перечисленные ниже изменения будут записаны на диски. Дальнейшие изменения вы сможете внести вручную.';

  @override
  String get confirmDevicesTitle => 'Устройства';

  @override
  String get confirmPartitionsTitle => 'Разделы';

  @override
  String get confirmPartitionTables => 'Изменены таблицы разделов на следующих устройствах:';

  @override
  String confirmPartitionTable(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get confirmPartitionChanges => 'Будут применены следующие изменения разделов:';

  @override
  String confirmPartitionResize(Object sysname, Object oldsize, Object newsize) {
    return 'размер раздела <b>$sysname</b> изменён с <b>$oldsize</b> на <b>$newsize</b>';
  }

  @override
  String confirmPartitionFormatMount(Object sysname, Object format, Object mount) {
    return 'раздел <b>$sysname</b> отформатирован как <b>$format</b> и использован для <b>$mount</b>';
  }

  @override
  String confirmPartitionFormat(Object sysname, Object format) {
    return 'раздел <b>$sysname</b> отформатирован как <b>$format</b>';
  }

  @override
  String confirmPartitionMount(Object sysname, Object mount) {
    return 'раздел <b>$sysname</b> использован для <b>$mount</b>';
  }

  @override
  String confirmPartitionCreate(Object sysname) {
    return 'раздел <b>$sysname</b> создан';
  }

  @override
  String get confirmInstallButton => 'Установить';

  @override
  String get installationCompleteTitle => 'Установка завершена';

  @override
  String readyToUse(Object system) {
    return '**$system** установлена и готова к использованию';
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
  String get bitlockerTitle => 'BitLocker включён';

  @override
  String get bitlockerHeader => 'Для продолжения отключите BitLocker';

  @override
  String bitlockerDescription(Object option) {
    return 'Этот компьютер использует шифрование с помощью Windows BitLocker.\nВам необходимо использовать Windows для создания свободного места или выбрать \'$option\' для продолжения.';
  }

  @override
  String bitlockerInstructions(Object url) {
    return 'Чтобы получить инструкции, отсканируйте QR-код на другом устройстве или посетите: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Перезагрузить в Windows';

  @override
  String get restartIntoWindowsTitle => 'Перезагрузить в Windows?';

  @override
  String restartIntoWindowsDescription(Object DISTRO) {
    return 'Вы уверены, что хотите перезагрузить компьютер? Вам потребуется позже перезапустить установку $DISTRO, чтобы завершить установку $DISTRO.';
  }

  @override
  String installationSlidesTitle(Object RELEASE) {
    return 'Добро пожаловать в $RELEASE';
  }

  @override
  String get installationSlidesAvailable => 'Доступно:';

  @override
  String get installationSlidesIncluded => 'Включено:';

  @override
  String get installationSlidesWelcomeTitle => 'Быстрый, бесплатный и полный новых возможностей';

  @override
  String installationSlidesWelcomeHeader(Object DISTRO) {
    return 'Последняя версия $DISTRO делает использование вашего компьютера проще, чем когда-либо.';
  }

  @override
  String installationSlidesWelcomeBody(Object RELEASE) {
    return 'Независимо от того, являетесь ли вы разработчиком, создателем, игроком или администратором, $RELEASE предлагает новые инструменты для повышения вашей производительности и опыта.';
  }

  @override
  String get installationSlidesSoftwareTitle => 'Все необходимые приложения';

  @override
  String installationSlidesSoftwareBody(Object DISTRO) {
    return 'Устанавливайте, управляйте и обновляйте все свои приложения в Ubuntu Software, включая тысячи приложений из Snap Store и архива $DISTRO.';
  }

  @override
  String get installationSlidesDevelopmentTitle => 'Разрабатывайте с использованием лучшего из открытого исходного кода';

  @override
  String installationSlidesDevelopmentBody(Object DISTRO) {
    return '$DISTRO - это идеальная рабочая станция для разработки приложений и веб-приложений, data science и AI/ML, а также devops и администрирования. Каждый выпуск $DISTRO включает новейшие инструментальные цепочки и поддерживает все основные IDE.';
  }

  @override
  String get installationSlidesCreativityTitle => 'Повышайте свою креативность';

  @override
  String installationSlidesCreativityBody(Object DISTRO) {
    return 'Если вы аниматор, дизайнер, создатель видео или разработчик игр, вам будет легко перенести свои рабочие процессы в $DISTRO благодаря поддержке программного обеспечения и приложений с открытым исходным кодом и промышленных стандартов.';
  }

  @override
  String get installationSlidesGamingTitle => 'Отлично подходит для игр';

  @override
  String installationSlidesGamingBody(Object DISTRO) {
    return '$DISTRO поддерживает последние версии драйверов NVIDIA и Mesa для повышения производительности и совместимости. Тысячи игр для Windows отлично воспроизводятся на $DISTRO через такие приложения, как Steam, без дополнительной настройки.';
  }

  @override
  String get installationSlidesSecurityTitle => 'Конфиденциальность и безопасность';

  @override
  String installationSlidesSecurityBody(Object DISTRO) {
    return '$DISTRO предоставляет все инструменты, необходимые для обеспечения конфиденциальности и безопасности в Интернете. Благодаря встроенному брандмауэру и поддержке VPN, а также множеству приложений, ориентированных на конфиденциальность, вы полностью контролируете свои данные.';
  }

  @override
  String installationSlidesSecurityLts(Object DISTRO) {
    return 'Все выпуски $DISTRO LTS предоставляют исправления безопасности в течение пяти лет, которые могут быть продлены до десяти лет при подписке на Ubuntu Pro.';
  }

  @override
  String get installationSlidesProductivityTitle => 'Повысьте свою производительность';

  @override
  String installationSlidesProductivityBody(Object DISTRO) {
    return '$DISTRO Рабочий стол включает LibreOffice, набор совместимых с Microsoft Office приложений с открытым исходным кодом для работы с документами, электронными таблицами и презентациями. Также доступны популярные инструменты для совместной работы.';
  }

  @override
  String get installationSlidesAccessibilityTitle => 'Доступно для каждого';

  @override
  String installationSlidesAccessibilityBody(Object DISTRO) {
    return 'В основе философии $DISTRO лежит убеждение в том, что компьютер - для всех. Благодаря расширенным инструментам доступности и возможности изменения языка, цветов и размера текста, $DISTRO делает работу с компьютером простой - где бы и кем бы вы ни были.';
  }

  @override
  String get installationSlidesAccessibilityOrca => 'Программа чтения с экрана Orca';

  @override
  String get installationSlidesAccessibilityLanguages => 'Языковая поддержка';

  @override
  String get installationSlidesSupportTitle => 'Помощь и поддержка';

  @override
  String installationSlidesSupportHeader(Object DISTRO) {
    return 'Официальная поддержка $DISTRO доступна как в Интернете, так и через значок справки в док-панели.';
  }

  @override
  String get installationSlidesSupportCommunity => 'Ask Ubuntu охватывает ряд вопросов и ответов, а Ubuntu Discourse содержит руководства и обсуждения для новых и опытных пользователей.';

  @override
  String get installationSlidesSupportEnterprise => 'Для корпоративных пользователей Canonical предоставляет коммерческую поддержку, чтобы упростить внедрение и безопасное управление Ubuntu на рабочем месте.';

  @override
  String get installationSlidesSupportResources => 'Полезные ресурсы:';

  @override
  String get installationSlidesSupportDocumentation => 'Официальная документация';

  @override
  String get installationSlidesSupportUbuntuPro => 'Поддержка корпоративных пользователей в режиме 24/7 в Ubuntu Pro';

  @override
  String get copyingFiles => 'Копирование файлов…';

  @override
  String get installingSystem => 'Установка системы…';

  @override
  String get configuringSystem => 'Настройка системы…';

  @override
  String get installationFailed => 'Ошибка установки';

  @override
  String get notEnoughDiskSpaceTitle => 'Недостаточно места';

  @override
  String notEnoughDiskSpaceUbuntu(Object DISTRO) {
    return 'Недостаточно места на диске для установки $DISTRO';
  }

  @override
  String get notEnoughDiskSpaceAvailable => 'Доступно:';

  @override
  String get notEnoughDiskSpaceRequired => 'Требуется:';

  @override
  String get activeDirectoryOption => 'Использовать Active Directory';

  @override
  String get activeDirectoryInfo => 'Вы введёте домен и другие данные на следующем шаге.';

  @override
  String get activeDirectoryTitle => 'Настроить Active Directory';

  @override
  String get activeDirectoryTestConnection => 'Проверка подключения к домену';

  @override
  String get activeDirectoryDomainLabel => 'Домен';

  @override
  String get activeDirectoryDomainEmpty => 'Требуется';

  @override
  String get activeDirectoryDomainTooLong => 'Слишком длинный';

  @override
  String get activeDirectoryDomainInvalidChars => 'Недопустимые символы';

  @override
  String get activeDirectoryDomainStartDot => 'Начинается с точки (.)';

  @override
  String get activeDirectoryDomainEndDot => 'Заканчивается точкой (.)';

  @override
  String get activeDirectoryDomainStartHyphen => 'Начинается со знака дефиса (-)';

  @override
  String get activeDirectoryDomainEndHyphen => 'Заканчивается знаком дефиса (-)';

  @override
  String get activeDirectoryDomainMultipleDots => 'Содержит несколько последовательных точек (..)';

  @override
  String get activeDirectoryDomainNotFound => 'Домен не найден';

  @override
  String get activeDirectoryAdminLabel => 'Пользователь, присоединившийся к домену';

  @override
  String get activeDirectoryAdminEmpty => 'Требуется';

  @override
  String get activeDirectoryAdminInvalidChars => 'Недопустимые символы';

  @override
  String get activeDirectoryPasswordLabel => 'Пароль';

  @override
  String get activeDirectoryPasswordEmpty => 'Требуется';

  @override
  String get activeDirectoryErrorTitle => 'Ошибка настройки подключения к Active Directory';

  @override
  String get activeDirectoryErrorMessage => 'Извините, Active Directory не может быть настроен в данный момент. Как только ваша система будет запущена, посетите <a href=\"https://help.ubuntu.com/activedirectory\">help.ubuntu.com/activedirectory</a> для получения помощи.';
}
