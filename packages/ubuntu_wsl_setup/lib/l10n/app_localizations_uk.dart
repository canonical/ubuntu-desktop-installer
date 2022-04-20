


import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Вийти';

  @override
  String get finishButton => 'Завершити';

  @override
  String get saveButton => 'Зберегти';

  @override
  String get setupButton => 'Встановити';

  @override
  String get selectLanguageTitle => 'Оберіть мову';

  @override
  String get profileSetupTitle => 'Налаштування профілю';

  @override
  String get profileSetupHeader => 'Будь ласка, створіть типовий обліковий запис користувача UNIX. Для отримання додаткової інформації відвідайте: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'Ваше ім\'я';

  @override
  String get profileSetupRealnameRequired => 'Ім’я - обов’язково';

  @override
  String get profileSetupUsernameHint => 'Оберіть ім’я користувача';

  @override
  String get profileSetupUsernameHelper => 'Ім’я користувача не повинно збігатися з вашим ім’ям користувача Windows.';

  @override
  String get profileSetupPasswordHint => 'Виберіть пароль';

  @override
  String get profileSetupConfirmPasswordHint => 'Підтвердити пароль';

  @override
  String get profileSetupShowAdvancedOptions => 'Показати розширені параметри на наступній сторінці';

  @override
  String get profileSetupPasswordMismatch => 'Паролі не збігаються';

  @override
  String get profileSetupUsernameRequired => 'Ім’я користувача - обов\'язково';

  @override
  String get profileSetupUsernameInvalid => 'Ім’я користувача непридатне';

  @override
  String get profileSetupPasswordRequired => 'Пароль - обов’язково';

  @override
  String get advancedSetupTitle => 'Розширені налаштування';

  @override
  String get advancedSetupHeader => 'На цій сторінці ви можете налаштувати Ubuntu WSL відповідно до ваших потреб.';

  @override
  String get advancedSetupMountLocationHint => 'Місце монтування';

  @override
  String get advancedSetupMountLocationHelper => 'Місце автоматичного монтування';

  @override
  String get advancedSetupMountLocationInvalid => 'Місце непридатне';

  @override
  String get advancedSetupMountOptionHint => 'Параметри монтування';

  @override
  String get advancedSetupMountOptionHelper => 'Параметри монтування для автоматичного монтування';

  @override
  String get advancedSetupHostGenerationTitle => 'Увімкнути створення hosts';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Дозволяє повторно генерувати /etc/hosts під час кожного запуску.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Увімкнути створення resolv.conf';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Дозволяє повторно генерувати /etc/resolv.conf під час кожного запуску.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI інтеграція';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Дозволяє автоматичне налаштування оточення DISPLAY. Потрібен сторонній X-сервер.';

  @override
  String get configurationUITitle => 'Інтерфейс користувача налаштування Ubuntu WSL (експериментальний)';

  @override
  String get configurationUIInteroperabilityHeader => 'Взаємодія';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Автоматичне монтування';

  @override
  String get configurationUIAutoMountTitle => 'Увімкнено';

  @override
  String get configurationUIAutoMountSubtitle => 'Показує чи ввімкнено функцію автоматичного монтування. Ця функція дозволяє монтувати диск Windows у WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Монтування у /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Показує чи буде змонтовано пристрої з /etc/fstab. Чи файл конфігурації /etc/fstab містить їх?';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes...';

  @override
  String get applyingChangesDisclaimer => 'This may take several minutes depending on your Internet connection.';

  @override
  String get setupCompleteTitle => 'Встановлення завершено';

  @override
  String setupCompleteHeader(Object user) {
    return 'Вітаємо, $user!\nВи успішно завершили встановлення.';
  }

  @override
  String get setupCompleteUpdate => 'Для оновлення Ubuntu до останньої версії рекомендується виконати наступну команду:';

  @override
  String get setupCompleteRestart => '* Усі налаштування набудуть чинності після перезапуску Ubuntu.';
}
