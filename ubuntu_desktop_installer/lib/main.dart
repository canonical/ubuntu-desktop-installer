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
  // FIXME: assets/languagelist comes from subiquity, but once we have a more
  // comprehensive set of translations we should replace that list by our own.
  await client.fetchLanguageList('assets/languagelist');
  runApp(UbuntuDesktopInstallerApp(client: client));
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  final SubiquityClient client;

  const UbuntuDesktopInstallerApp({
    Key key,
    @required this.client,
  })  : assert(client != null, '`SubiquityClient` must not be `null`'),
        super(key: key);

  Iterable<Locale> get _supportedLocale {
    final locales =
        AppLocalizations.supportedLocales.map((e) => e.languageCode);

    return client.languagelist
        .where((e) => locales.contains(e.item1.languageCode))
        .map((e) => e.item1);
  }

  static final _locale = ValueNotifier(Locale(Intl.systemLocale));

  static Locale get locale => _locale.value;
  static set locale(Locale locale) {
    _locale.value = locale;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _locale,
      builder: (context, val, _) => MaterialApp(
        locale: val,
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        theme: yaruLightTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          ...AppLocalizations.localizationsDelegates,
          GlobalUbuntuLocalizations.delegate,
        ],
        supportedLocales: _supportedLocale,
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
