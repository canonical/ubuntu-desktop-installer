import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'pages/allocate_disk_space_page.dart';
import 'pages/choose_your_look_page.dart';
import 'pages/keyboard_layout/keyboard_layout_page.dart';
import 'pages/try_or_install/try_or_install_page.dart';
import 'pages/turn_off_rst_page.dart';
import 'pages/updates_other_software/updates_other_software_page.dart';
import 'pages/welcome/welcome_page.dart';
import 'pages/who_are_you/who_are_you_page.dart';
import 'pages/write_changes_to_disk_page.dart';
import 'routes.dart';

class UbuntuDesktopInstallerApp extends StatelessWidget {
  const UbuntuDesktopInstallerApp({
    Key? key,
  }) : super(key: key);

  static final _locale =
      ValueNotifier(Locale(Intl.shortLocale(Intl.systemLocale)));

  static Locale get locale => _locale.value;
  static set locale(Locale locale) {
    _locale.value = locale;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: _locale,
      builder: (context, value, _) => MaterialApp(
        locale: value,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        theme: yaru.lightTheme,
        darkTheme: yaru.darkTheme,
        themeMode: context.watch<AppTheme>().value,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          ...AppLocalizations.localizationsDelegates,
          const LocalizationsDelegateOc(),
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: Routes.welcome,
        routes: <String, WidgetBuilder>{
          Routes.welcome: WelcomePage.create,
          Routes.tryOrInstall: TryOrInstallPage.create,
          Routes.turnOffRST: TurnOffRSTPage.create,
          Routes.keyboardLayout: KeyboardLayoutPage.create,
          Routes.updatesOtherSoftware: UpdatesOtherSoftwarePage.create,
          Routes.allocateDiskSpace: AllocateDiskSpacePage.create,
          Routes.writeChangesToDisk: WriteChangesToDiskPage.create,
          Routes.chooseYourLook: ChooseYourLookPage.create,
          Routes.whoAreYou: WhoAreYouPage.create,
        },
      ),
    );
  }
}
