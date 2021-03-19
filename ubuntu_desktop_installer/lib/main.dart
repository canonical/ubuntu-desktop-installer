import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:yaru/yaru.dart';

import 'keyboardlayoutpage.dart';
import 'l10n/app_localizations.dart';
import 'tryorinstallpage.dart';
import 'turnoffrstpage.dart';
import 'welcomepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();
  final client = SubiquityClient();
  runApp(UbuntuDesktopInstallerApp(client: client));
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  final SubiquityClient client;

  const UbuntuDesktopInstallerApp({
    Key key,
    @required this.client,
  })  : assert(client != null, '`SubiquityClient` must not be `null`'),
        super(key: key);

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
        theme: yaruLightTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          ...AppLocalizations.localizationsDelegates,
          const LocalizationsDelegateOc(),
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: WelcomePage(client: client),
        routes: <String, WidgetBuilder>{
          '/tryorinstall': (context) => TryOrInstallPage(client: client),
          '/turnoffrst': (context) => const TurnOffRSTPage(),
          '/keyboardlayout': (context) => KeyboardLayoutPage(client: client),
        },
      ),
    );
  }
}
