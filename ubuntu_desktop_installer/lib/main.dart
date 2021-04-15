import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'keyboard_layout_page.dart';
import 'keyboard_model.dart';
import 'l10n/app_localizations.dart';
import 'try_or_install_page.dart';
import 'turn_off_rst_page.dart';
import 'welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => SubiquityClient()),
      ChangeNotifierProvider(create: (_) => KeyboardModel()),
    ],
    child: UbuntuDesktopInstallerApp(),
  ));
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  const UbuntuDesktopInstallerApp({
    Key key,
  }) : super(key: key);

  static final _locale =
      ValueNotifier(Locale(Intl.shortLocale(Intl.systemLocale)));

  static Locale get locale => _locale.value;
  static set locale(Locale locale) {
    _locale.value = locale;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _locale,
      builder: (context, value, _) => MaterialApp(
        locale: value,
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        theme: yaru.lightTheme,
        darkTheme: yaru.darkTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          ...AppLocalizations.localizationsDelegates,
          const LocalizationsDelegateOc(),
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: WelcomePage(),
        routes: <String, WidgetBuilder>{
          '/tryorinstall': (context) => TryOrInstallPage(),
          '/turnoffrst': (context) => const TurnOffRSTPage(),
          '/keyboardlayout': (context) => KeyboardLayoutPage(),
        },
      ),
    );
  }
}
