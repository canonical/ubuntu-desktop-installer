import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Встановлювач Ubuntu Desktop';

  @override
  String windowTitle(Object RELEASE) {
    return 'Встановити $RELEASE';
  }

  @override
  String get cancelButtonText => 'Скасувати';

  @override
  String get changeButtonText => 'Змінити';

  @override
  String get okButtonText => 'Гаразд';

  @override
  String get noButtonText => 'Ні';

  @override
  String get restartButtonText => 'Перезавантажити';

  @override
  String get revertButtonText => 'Відбій';

  @override
  String get yesButtonText => 'Так';

  @override
  String get quitButtonText => 'Скасувати встановлення';

  @override
  String get welcome => 'Ласкаво просимо';

  @override
  String get welcomeHeader => 'Оберіть мову:';

  @override
  String get tryOrInstallPageTitle => 'Спробувати або встановити';

  @override
  String get repairInstallation => 'Виправити встановлення';

  @override
  String get repairInstallationDescription => 'Під час виправлення буде перевстановлено все програмне забезпечення, не торкаючись документів чи налаштувань.';

  @override
  String tryUbuntu(Object RELEASE) {
    return 'Спробувати $RELEASE';
  }

  @override
  String tryUbuntuDescription(Object RELEASE) {
    return 'Ви можете спробувати $RELEASE, не роблячи ніяких змін на вашому комп\'ютері.';
  }

  @override
  String installUbuntu(Object RELEASE) {
    return 'Встановити $RELEASE';
  }

  @override
  String installUbuntuDescription(Object RELEASE) {
    return 'Встановити $RELEASE поряд (або замість) вашої поточної операційної системи. Це не повинно зайняти занадто багато часу.';
  }

  @override
  String releaseNotesLabel(Object url) {
    return 'Можливо, ви захочете прочитати <a href=\"$url\">примітки до випуску</a>.';
  }

  @override
  String get turnOffRST => 'Вимкнути RST';

  @override
  String get turnOffRSTDescription => 'Цей комп’ютер використовує технологію Intel RST (Rapid Storage Technology). Перед встановленням Ubuntu вам потрібно вимкнути RST у Windows.';

  @override
  String instructionsForRST(Object url) {
    return 'Для отримання інструкцій відкрийте цю сторінку на телефоні або іншому пристрої: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get keyboardLayoutPageTitle => 'Розкладка клавіатури';

  @override
  String get chooseYourKeyboardLayout => 'Оберіть розкладку клавіатури:';

  @override
  String get typeToTest => 'Введіть що-небудь, щоб перевірити клавіатуру';

  @override
  String get detectLayout => 'Визначити розкладку клавіатури';

  @override
  String get pressOneKey => 'Будь ласка, натисніть одну з цих клавiш:';

  @override
  String get isKeyPresent => 'Чи присутня ця клавіша на клавіатурі?';

  @override
  String get configureSecureBootTitle => 'Налаштувати безпечне завантаження';

  @override
  String get configureSecureBootDescription => 'Ви вирішили встановити стороннє програмне забезпечення для драйверів. Для цього необхідно вимкнути безпечне завантаження.\nДля цього потрібно вибрати ключ безпеки зараз, та ввести його після перезавантаженні системи.';

  @override
  String get configureSecureBootOption => 'Налаштувати безпечне завантаження';

  @override
  String get chooseSecurityKey => 'Оберіть ключ безпеки';

  @override
  String get confirmSecurityKey => 'Підтвердить ключ безпеки';

  @override
  String get dontInstallDriverSoftwareNow => 'Наразі не встановлювати програмне забезпечення драйвера';

  @override
  String get dontInstallDriverSoftwareNowDescription => 'Ви можете встановити його пізніше з розділу \"Програми та оновлення\".';

  @override
  String get configureSecureBootSecurityKeyRequired => 'Потрібен ключ безпеки';

  @override
  String get secureBootSecurityKeysDontMatch => 'Не збігаються ключі захисту';

  @override
  String get showSecurityKey => 'Показати ключ безпеки';

  @override
  String get connectToInternetPageTitle => 'Підключитись до інтернету';

  @override
  String get connectToInternetDescription => 'Підключення цього комп\'ютера до Інтернету допоможе Ubuntu встановити необхідне додаткове програмне забезпечення та вибрати часовий пояс.\n\nПідключіться за допомогою кабелю Ethernet або виберіть Wi-Fi мережу';

  @override
  String get useWiredConnection => 'Використовувати дротове підключення';

  @override
  String get noWiredConnection => 'Дротового підключення не виявлено';

  @override
  String get wiredDisabled => 'Дротове підключення вимкнено';

  @override
  String get wiredMustBeEnabled => 'Для використання Ethernet на цьому комп\'ютері повинно бути включено дротове підключення';

  @override
  String get enableWired => 'Увімкнути дротове підключення';

  @override
  String get selectWifiNetwork => 'Підключитися до Wi-Fi мережі';

  @override
  String get hiddenWifiNetwork => 'Підключитися до прихованої Wi-Fi мережі';

  @override
  String get hiddenWifiNetworkNameLabel => 'Назва мережі';

  @override
  String get hiddenWifiNetworkNameRequired => 'Необхідно вказати назву мережі';

  @override
  String get noInternet => 'Я не хочу зараз підключатися до Інтернету';

  @override
  String get wirelessNetworkingDisabled => 'Бездротове підключення вимкнено';

  @override
  String get noWifiDevicesDetected => 'Не знайдено жодного Wi-Fi пристрою';

  @override
  String get wifiMustBeEnabled => 'Для використання Wi-Fi на цьому комп\'ютері має бути ввімкнений бездротовий зв’язок';

  @override
  String get enableWifi => 'Ввімкнути Wi-Fi';

  @override
  String get connectButtonText => 'З\'єднатися';

  @override
  String get updatesOtherSoftwarePageTitle => 'Оновлення та інше програмне забезпечення';

  @override
  String get updatesOtherSoftwarePageDescription => 'Які програми ви хотіли б встановити для початку?';

  @override
  String get normalInstallationTitle => 'Звичайна установка';

  @override
  String get normalInstallationSubtitle => 'Веб-браузер, утиліти, офісне програмне забезпечення, ігри та медіа-плеєри.';

  @override
  String get minimalInstallationTitle => 'Мінімальна установка';

  @override
  String get minimalInstallationSubtitle => 'Веб-браузер та базові утиліти.';

  @override
  String get otherOptions => 'Інші параметри';

  @override
  String get installThirdPartyTitle => 'Встановити стороннє програмне забезпечення для графічного та Wi-Fi обладнання, а також додаткових медіа-форматів';

  @override
  String get installThirdPartySubtitle => 'На це програмне забезпечення поширюються ліцензійні умови, що додаються до його документації. Деякі з них є запатентованими.';

  @override
  String get installDriversTitle => 'Встановити стороннє програмне забезпечення для графіки та обладнання Wi-Fi';

  @override
  String get installDriversSubtitle => 'Ці драйвери підпадають під дію ліцензійних умов, включених до їх документації. Вони є пропрієтарними..';

  @override
  String get installCodecsTitle => 'Встановити підтримку додаткових медіа-форматів';

  @override
  String get installCodecsSubtitle => 'На це програмне забезпечення поширюються ліцензійні умови, що додаються до його документації. Деякі з них є пропрієтарними.';

  @override
  String onBatteryWarning(Object color) {
    return '<font color=\"$color\">Попередження</font>: комп\'ютер не підключено до джерела живлення.';
  }

  @override
  String get offlineWarning => 'You are currently offline';

  @override
  String get chooseSecurityKeyTitle => 'Оберіть ключ безпеки';

  @override
  String chooseSecurityKeyHeader(Object RELEASE) {
    return 'Шифрування диска захищає ваші файли на випадок втрати комп\'ютера. Воно вимагає введення ключа безпеки під час кожного запуску комп\'ютера.\n\nБудь-які файли за межами $RELEASE не будуть зашифровані.';
  }

  @override
  String get chooseSecurityKeyHint => 'Оберіть ключ безпеки';

  @override
  String get chooseSecurityKeyConfirmHint => 'Підтвердить ключ безпеки';

  @override
  String get chooseSecurityKeyRequired => 'Потрібен ключ безпеки';

  @override
  String get chooseSecurityKeyMismatch => 'Не збігаються ключі безпеки';

  @override
  String chooseSecurityKeyWarning(Object color) {
    return '<font color=\"$color\">Попередження</font>: якщо ви втратите цей ключ безпеки, всі дані будуть втрачені. У разі необхідності, запишіть свій ключ і зберігайте його в безпечному місці.';
  }

  @override
  String get installationTypeTitle => 'Тип встановлення';

  @override
  String installationTypeOSDetected(Object os) {
    return 'На цьому комп\'ютері зараз встановлено $os. Що б ви хотіли зробити?';
  }

  @override
  String installationTypeDualOSDetected(Object os1, Object os2) {
    return 'На цьому комп\'ютері зараз знаходяться $os1 та $os2. Що ви хочете зробити?';
  }

  @override
  String get installationTypeMultiOSDetected => 'На Вашому комп\'ютері встановлено декілька операційних систем. Що Ви бажаєте зробити?';

  @override
  String get installationTypeNoOSDetected => 'На Вашому комп\'ютері не виявлено жодної операційної системи. Що Ви бажаєте зробити?';

  @override
  String installationTypeErase(Object DISTRO) {
    return 'Стерти диск і встановити $DISTRO';
  }

  @override
  String installationTypeEraseWarning(Object color) {
    return '<font color=\"$color\">Попередження:</font> Це призведе до видалення всіх ваших програм, документів, фотографій, музики та будь-яких інших файлів у всіх операційних системах.';
  }

  @override
  String get installationTypeAdvancedLabel => 'Додаткові можливості...';

  @override
  String get installationTypeAdvancedTitle => 'Додаткові можливості';

  @override
  String get installationTypeNone => 'Немає';

  @override
  String get installationTypeNoneSelected => 'Нічого не вибрано';

  @override
  String installationTypeLVM(Object RELEASE) {
    return 'Скористатися LVM для нової інсталяції $RELEASE';
  }

  @override
  String get installationTypeLVMSelected => 'LVM обрано';

  @override
  String get installationTypeLVMEncryptionSelected => 'LVM та шифрування обрано';

  @override
  String installationTypeEncrypt(Object RELEASE) {
    return 'Зашифрувати нову установку $RELEASE для безпеки';
  }

  @override
  String get installationTypeEncryptInfo => 'Ключ захисту можна буде вибрати на наступному кроці.';

  @override
  String get installationTypeZFS => 'ЕКСПЕРИМЕНТАЛЬНО: Витерти диск і скористатися ZFS';

  @override
  String get installationTypeZFSSelected => 'Обрано ZFS';

  @override
  String installationTypeReinstall(Object os) {
    return 'Видалити $os і встановити заново';
  }

  @override
  String installationTypeReinstallWarning(Object color, Object os) {
    return '<font color=\"$color\">Попередження:</font> це призведе до видалення всіх ваших $os програм, документів, фотографій, музики та будь-яких інших файлів.';
  }

  @override
  String installationTypeAlongside(Object product, Object os) {
    return 'Встановити $product поряд з $os';
  }

  @override
  String installationTypeAlongsideDual(Object product, Object os1, Object os2) {
    return 'Встановити $product поряд з $os1 та $os2';
  }

  @override
  String installationTypeAlongsideMulti(Object product) {
    return 'Встановити $product поряд з ними';
  }

  @override
  String installationTypeAlongsideUnknown(Object product) {
    return 'Встановити $product поряд з іншими розділами';
  }

  @override
  String get installationTypeAlongsideInfo => 'Документи, музика та інші особисті файли будуть збережені. Ви можете вибрати, яку операційну систему ви бажаєте використовувати при кожному запуску комп\'ютера.';

  @override
  String get installationTypeManual => 'Щось інше';

  @override
  String installationTypeManualInfo(Object DISTRO) {
    return 'Ви можете створити або змінити розмір розділів самостійно, або вибрати кілька розділів для $DISTRO';
  }

  @override
  String selectGuidedStoragePageTitle(Object DISTRO) {
    return 'Стерти диск і встановити $DISTRO';
  }

  @override
  String get selectGuidedStorageDropdownLabel => 'Оберіть диск:';

  @override
  String get selectGuidedStorageInfoLabel => 'Буде використано весь диск:';

  @override
  String get selectGuidedStorageInstallNow => 'Встановити зараз';

  @override
  String get installAlongsideSpaceDivider => 'Розподіліть місце на диску, перетягнувши розділювач:';

  @override
  String installAlongsideHiddenPartitions(Object num, Object url) {
    return '$num менших розділів приховано, скористайтеся <a href=\"$url\">розширеним інструментом розбиття на розділи</a> для більшого контролю';
  }

  @override
  String get installAlongsideResizePartition => 'Змінити розмір розділу';

  @override
  String get installAlongsideAllocateSpace => 'Виділити простір';

  @override
  String get installAlongsideFiles => 'Файли';

  @override
  String get installAlongsidePartition => 'Розділ:';

  @override
  String get installAlongsideSize => 'Розмір:';

  @override
  String get installAlongsideAvailable => 'Вільно:';

  @override
  String get allocateDiskSpace => 'Виділити дисковий простір';

  @override
  String get startInstallingButtonText => 'Почати встановлення';

  @override
  String get diskHeadersDevice => 'Пристрій';

  @override
  String get diskHeadersType => 'Тип';

  @override
  String get diskHeadersMountPoint => 'Точка монтування';

  @override
  String get diskHeadersSize => 'Розмір';

  @override
  String get diskHeadersUsed => 'Використано';

  @override
  String get diskHeadersSystem => 'Система';

  @override
  String get diskHeadersFormat => 'Формат';

  @override
  String get freeDiskSpace => 'вільний простір';

  @override
  String get newPartitionTable => 'Нова таблиця розділів';

  @override
  String get newPartitionTableConfirmationTitle => 'Створити нову порожню таблицю розділів на цьому пристрої?';

  @override
  String get newPartitionTableConfirmationMessage => 'Ви вибрали весь пристрій для розбиття на розділи. Якщо ви продовжите створення нової таблиці розділів на ньому, всі поточні розділи будуть видалені.\n\nЗауважте, що ви зможете скасувати цю операцію пізніше, якщо захочете.';

  @override
  String get tooManyPrimaryPartitions => 'Too many primary partitions';

  @override
  String get partitionLimitReached => 'limit reached';

  @override
  String get bootLoaderDevice => 'Пристрій для встановлення завантажувача';

  @override
  String get partitionCreateTitle => 'Створити розділ';

  @override
  String get partitionEditTitle => 'Редагувати розділ';

  @override
  String get partitionSizeLabel => 'Розмір:';

  @override
  String get partitionUnitB => 'Б';

  @override
  String get partitionUnitKB => 'КБ';

  @override
  String get partitionUnitMB => 'МБ';

  @override
  String get partitionUnitGB => 'ГБ';

  @override
  String get partitionTypeLabel => 'Тип нового розділу:';

  @override
  String get partitionTypePrimary => 'Основний';

  @override
  String get partitionTypeLogical => 'Додатковий';

  @override
  String get partitionLocationLabel => 'Розташування нового розділу:';

  @override
  String get partitionLocationBeginning => 'Початок цього простору';

  @override
  String get partitionLocationEnd => 'Кінець цього простору';

  @override
  String get partitionFormatLabel => 'Використовується як:';

  @override
  String get partitionFormatExt4 => 'Журнальна файлова система Ext4';

  @override
  String get partitionFormatExt3 => 'Журнальна файлова система Ext3';

  @override
  String get partitionFormatExt2 => 'Файлова система Ext2';

  @override
  String get partitionFormatBtrfs => 'Журнальна файлова система btrfs';

  @override
  String get partitionFormatJfs => 'Журнальна файлова система JFS';

  @override
  String get partitionFormatXfs => 'Журнальна файлова система XFS';

  @override
  String get partitionFormatFat => 'Файлова система FAT';

  @override
  String get partitionFormatFat12 => 'Файлова система FAT12';

  @override
  String get partitionFormatFat16 => 'Файлова система FAT16';

  @override
  String get partitionFormatFat32 => 'Файлова система FAT32';

  @override
  String get partitionFormatSwap => 'Своп-зона';

  @override
  String get partitionFormatIso9660 => 'Файлова система ISO 9660';

  @override
  String get partitionFormatVfat => 'Файлова система VFAT';

  @override
  String get partitionFormatNtfs => 'Файлова система NTFS';

  @override
  String get partitionFormatReiserFS => 'Файлова система ReiserFS';

  @override
  String get partitionFormatZfsroot => 'Коренева файлова система ZFS';

  @override
  String get partitionErase => 'Відформатувати розділ';

  @override
  String get partitionMountPointLabel => 'Точка монтування:';

  @override
  String get whoAreYouPageTitle => 'Хто ви?';

  @override
  String get whoAreYouPageAutoLogin => 'Входити автоматично';

  @override
  String get whoAreYouPageRequirePassword => 'Для входу потрібен пароль';

  @override
  String get whoAreYouPageRealNameLabel => 'Ваше ім\'я';

  @override
  String get whoAreYouPageRealNameRequired => 'Потрібно вказати ім\'я';

  @override
  String get whoAreYouPageComputerNameLabel => 'Iм\'я вашого комп\'ютера';

  @override
  String get whoAreYouPageComputerNameInfo => 'Iм\'я, яке використовується для зв\'язку з іншими комп\'ютерами.';

  @override
  String get whoAreYouPageComputerNameRequired => 'Потрібно вказати ім\'я комп\'ютера';

  @override
  String get whoAreYouPageInvalidComputerName => 'Ім\'я комп\'ютера вказано невірно';

  @override
  String get whoAreYouPageUsernameLabel => 'Оберіть ім\'я користувача';

  @override
  String get whoAreYouPageUsernameRequired => 'Потрібно ввести ім\'я користувача';

  @override
  String get whoAreYouPageInvalidUsername => 'Ім\'я користувача вказано невірно';

  @override
  String get whoAreYouPageUsernameInUse => 'Таке ім\'я користувача вже існує.';

  @override
  String get whoAreYouPageUsernameSystemReserved => 'Це ім\'я зарезервоване для використання в системі.';

  @override
  String get whoAreYouPageUsernameTooLong => 'Це ім\'я занадто довге.';

  @override
  String get whoAreYouPageUsernameInvalidChars => 'Це ім\'я містить недопустимі символи.';

  @override
  String get whoAreYouPagePasswordLabel => 'Оберіть пароль';

  @override
  String get whoAreYouPagePasswordRequired => 'Потрібно ввести пароль';

  @override
  String get whoAreYouPageConfirmPasswordLabel => 'Підтвердить пароль';

  @override
  String get whoAreYouPagePasswordMismatch => 'Паролі не збігаються';

  @override
  String get whoAreYouPageShowPassword => 'Показати пароль';

  @override
  String get writeChangesToDisk => 'Записати зміни на диск';

  @override
  String get writeChangesFallbackSerial => 'диск';

  @override
  String get writeChangesDescription => 'Якщо ви продовжите, перелічені нижче зміни будуть записані на диски. Ви зможете внести подальші зміни вручну.';

  @override
  String get writeChangesPartitionTablesHeader => 'Змінено таблиці розділів наступних пристроїв:';

  @override
  String writeChangesPartitionTablesEntry(Object serial, Object path) {
    return '$serial ($path)';
  }

  @override
  String get writeChangesPartitionsHeader => 'Будуть застосовані наступні зміни розділів:';

  @override
  String writeChangesPartitionResized(Object disk, Object partition, Object oldsize, Object newsize) {
    return 'розмір розділу #$disk$partition змінено з $oldsize на $newsize';
  }

  @override
  String writeChangesPartitionFormattedMounted(Object disk, Object partition, Object format, Object mount) {
    return 'розділ #$disk$partition, відформатований як $format, використано для $mount';
  }

  @override
  String writeChangesPartitionFormatted(Object disk, Object partition, Object format) {
    return 'розділ #$disk$partition відформатовано як $format';
  }

  @override
  String writeChangesPartitionMounted(Object disk, Object partition, Object mount) {
    return 'розділ #$disk$partition використано для $mount';
  }

  @override
  String writeChangesPartitionCreated(Object disk, Object partition) {
    return 'створено розділ #$disk$partition';
  }

  @override
  String get chooseYourLookPageTitle => 'Оберіть зовнішній вигляд';

  @override
  String get chooseYourLookPageHeader => 'Ви завжди можете змінити це пізніше в налаштуваннях зовнішнього вигляду.';

  @override
  String get chooseYourLookPageDarkSetting => 'Темний';

  @override
  String get chooseYourLookPageLightSetting => 'Світлий';

  @override
  String get installationCompleteTitle => 'Встановлення завершено';

  @override
  String readyToUse(Object system) {
    return '**$system** встановлена та готова до використання.';
  }

  @override
  String restartInto(Object system) {
    return 'Перезавантажитися в $system';
  }

  @override
  String restartWarning(Object RELEASE) {
    return 'You can continue testing $RELEASE now, but until you restart the computer, any changes you make or documents you save will not be preserved.';
  }

  @override
  String get shutdown => 'Вимкнути';

  @override
  String get restartNow => 'Restart Now';

  @override
  String get continueTesting => 'Continue Testing';

  @override
  String get turnOffBitlockerTitle => 'Вимкнути BitLocker';

  @override
  String get turnOffBitlockerDescription => 'На цьому комп\'ютері використовується шифрування Windows BitLocker.\nПеред встановленням Ubuntu потрібно вимкнути BitLocker у Windows.';

  @override
  String turnOffBitlockerLinkInstructions(Object url) {
    return 'Для отримання інструкцій відкрийте цю сторінку на телефоні або іншому пристрої: <a href=\"https://$url\">$url</a>';
  }

  @override
  String get restartIntoWindows => 'Перезавантажити в Windows';

  @override
  String get whereAreYouPageTitle => 'Де ви знаходитесь?';

  @override
  String get whereAreYouLocationLabel => 'Місце розташування';

  @override
  String get whereAreYouTimezoneLabel => 'Часовий пояс';

  @override
  String welcomeSlideTitle(Object RELEASE) {
    return 'Ласкаво просимо до $RELEASE';
  }

  @override
  String welcomeSlideDescription(Object RELEASE) {
    return 'Швидка і повна нових можливостей, остання версія $RELEASE робить роботу комп\'ютера простішою, ніж будь-коли. Ось лише кілька цікавих нововведень, на які варто звернути увагу...';
  }

  @override
  String get softwareSlideTitle => 'Знайти ще більше програм';

  @override
  String softwareSlideDescription(Object RELEASE) {
    return 'Попрощайтеся з пошуком нового програмного забезпечення в Інтернеті. Завдяки доступу до магазину Snap Store та архіву програм $RELEASE ви можете легко знаходити та інсталювати нові програми. Просто введіть те, що ви шукаєте, або перегляньте такі категорії, як \"Графіка та фотографія\", \"Ігри\" та \"Продуктивність\", а також корисні відгуки інших користувачів.';
  }

  @override
  String get musicSlideTitle => 'Візьміть музику з собою';

  @override
  String musicSlideDescription(Object RELEASE) {
    return '$RELEASE поставляється з дивовижним музичним плеєром Rhythmbox. Завдяки розширеним функціям відтворення можна легко поставити в чергу чудові пісні. Він чудово працює з компакт-дисками та портативними музичними програвачами, тож ви можете насолоджуватися музикою, де б ви не були.';
  }

  @override
  String get musicSlideRhythmbox => 'Музичний програвач Rhythmbox';

  @override
  String get musicSlideSpotify => 'Spotify';

  @override
  String get musicSlideVLC => 'VLC';

  @override
  String get photoSlideTitle => 'Отримайте задоволення від своїх фотографій';

  @override
  String get photoSlideDescription => 'Shotwell - це зручний фото-менеджер, який вже готовий для ваших гаджетів. Підключіть камеру або телефон, щоб перенести свої фотографії, а потім легко ділитися ними та зберігати їх у безпеці. А якщо ви відчуваєте себе творчою людиною, ви можете знайти багато інших програм для роботи з фотографіями в Ubuntu Software.';

  @override
  String get photoSlideShotwell => 'Менеджер фотографій Shotwell';

  @override
  String get photoSlideGimp => 'Графічний редактор GIMP';

  @override
  String get photoSlideShotcut => 'Відео-редактор Shotcut';

  @override
  String get webSlideTitle => 'Використовуйте можливості Інтернету на повну';

  @override
  String webSlideDescription(Object RELEASE) {
    return '$RELEASE включає Firefox, веб-браузер, яким користуються мільйони людей по всьому світу. А веб-додатки, які ви часто використовуєте (наприклад, Facebook або Gmail), можна закріпити на робочому столі для швидшого доступу, так само як і програми на вашому комп\'ютері.';
  }

  @override
  String get webSlideFirefox => 'Веб-переглядач Firefox';

  @override
  String get webSlideThunderbird => 'Thunderbird';

  @override
  String get webSlideChromium => 'Chromium';

  @override
  String get officeSlideTitle => 'Все необхідне для офісу';

  @override
  String get officeSlideDescription => 'LibreOffice - це вільний офісний пакет, який містить все необхідне для створення документів, електронних таблиць та презентацій. Сумісний з форматами файлів Microsoft Office, він надає всі необхідні функції.';

  @override
  String get officeSlideWriter => 'LibreOffice Writer';

  @override
  String get officeSlideCalc => 'LibreOffice Calc';

  @override
  String get officeSlideImpress => 'LibreOffice Impress';

  @override
  String get accessSlideTitle => 'Доступ для кожного';

  @override
  String accessSlideDescription(Object RELEASE) {
    return 'В основі філософії $RELEASE лежить віра в те, що комп\'ютерні технології доступні для всіх. Завдяки вдосконаленим інструментам доступності та опціям зміни мови, кольорів і розміру тексту, $RELEASE робить роботу з комп\'ютером легкою - ким би і де б ви не були.';
  }

  @override
  String get accessSlideCustomizationOptions => 'Параметри налаштування';

  @override
  String get accessSlideAppearance => 'Зовнішній вигляд';

  @override
  String get accessSlideAssistiveTechnologies => 'Особливі можливості';

  @override
  String get accessSlideLanguageSupport => 'Мовна підтримка';

  @override
  String get supportSlideTitle => 'Допомога та підтримка';

  @override
  String supportSlideDocumentation(Object RELEASE) {
    return 'Офіційна документація охоплює багато найбільш поширених аспектів $RELEASE. Вона доступна як <a href=\"https://help.ubuntu.com\">онлайн</a>, так і через іконку \"Довідка\" в панелі завдань.';
  }

  @override
  String get supportSlideQuestions => 'На сторінці <a href=\"https://askubuntu.com\">Ask Ubuntu</a> ви можете ставити запитання та шукати по значній колекції запитань, на які вже є відповіді. Підтримку вашою рідною мовою може надати ваша <a href=\"https://loco.ubuntu.com/teams\">команда місцевої спільноти</a>.';

  @override
  String get supportSlideResources => 'Посилання на інші корисні ресурси можна знайти за посиланням <a href=\"https://www.ubuntu.com/support/community-support\">Підтримка спільноти</a> або <a href=\"https://www.ubuntu.com/support\">Комерційна підтримка</a>.';

  @override
  String get includedSoftware => 'Програмне забезпечення, що входить у комплект';

  @override
  String get availableSoftware => 'Наявне програмне забезпечення';

  @override
  String get supportedSoftware => 'Підтримуване програмне забезпечення';

  @override
  String get copyingFiles => 'Копіювання файлів…';

  @override
  String get installingSystem => 'Встановлення системи…';

  @override
  String get configuringSystem => 'Налаштування системи…';

  @override
  String get installationFailed => 'Встановлення не вдалося';

  @override
  String get notEnoughDiskSpaceTitle => 'Вибачте';

  @override
  String notEnoughDiskSpaceHeader(Object SIZE, Object RELEASE) {
    return 'Для встановлення $RELEASE потрібно щонайменше $SIZE дискового простору.';
  }

  @override
  String notEnoughDiskSpaceHasOnly(Object SIZE) {
    return 'На цьому комп\'ютері є лише $SIZE.';
  }

  @override
  String notEnoughDiskSpaceBiggestDisk(Object SIZE) {
    return 'Найбільший диск на цьому комп\'ютері лише $SIZE.';
  }
}
