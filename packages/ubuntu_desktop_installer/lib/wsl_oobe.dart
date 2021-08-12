import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'l10n.dart';
import 'pages.dart';
import 'routes.dart';
import 'settings.dart';
import 'utils.dart';

class UbuntuWslOobeWizardApp extends StatelessWidget {
  const UbuntuWslOobeWizardApp({
    Key? key,
    required this.reconfigure,
  }) : super(key: key);

  final bool reconfigure;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Settings.of(context).locale,
      onGenerateTitle: (context) {
        final lang = AppLocalizations.of(context)!;
        setWindowTitle(lang.wslWindowTitle);
        return lang.wslAppTitle;
      },
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
      themeMode: Settings.of(context).theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        const LocalizationsDelegateOc(),
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: _WslOobeWizard(reconfigure: reconfigure),
    );
  }
}

class _WslOobeWizard extends StatelessWidget {
  const _WslOobeWizard({
    Key? key,
    required this.reconfigure,
  }) : super(key: key);

  final bool reconfigure;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: Routes.welcome,
      routes: <String, WidgetBuilder>{
        Routes.welcome: WelcomePage.create,
      },
    );
  }
}
