import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'app_theme.dart';
import 'l10n/app_localizations.dart';
import 'pages/allocate_disk_space_page.dart';
import 'pages/choose_your_look_page.dart';
import 'pages/keyboard_layout_page.dart';
import 'pages/try_or_install_page.dart';
import 'pages/turn_off_rst_page.dart';
import 'pages/updates_other_software/updates_other_software_page.dart';
import 'pages/welcome_page.dart';
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
        home: WelcomePage(),
        routes: <String, WidgetBuilder>{
          Routes.tryOrInstall: (context) => TryOrInstallPage(),
          Routes.turnOffRST: (context) => const TurnOffRSTPage(),
          Routes.keyboardLayout: (context) => KeyboardLayoutPage(),
          Routes.updatesOtherSoftware: UpdatesOtherSoftwarePage.create,
          Routes.allocateDiskSpace: (context) => AllocateDiskSpacePage(),
          Routes.writeChangesToDisk: (context) => WriteChangesToDiskPage(),
          Routes.chooseYourLook: (context) => ChooseYourLookPage(),
        },
      ),
    );
  }
}
