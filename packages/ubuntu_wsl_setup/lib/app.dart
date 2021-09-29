import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'l10n.dart';
import 'wizard.dart';

class UbuntuWslSetupApp extends StatelessWidget {
  const UbuntuWslSetupApp({
    Key? key,
    this.initialRoute,
    this.reconfigure = false,
  }) : super(key: key);

  final String? initialRoute;
  final bool reconfigure;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Settings.of(context).locale,
      onGenerateTitle: (context) {
        final lang = AppLocalizations.of(context);
        setWindowTitle(lang.windowTitle);
        return lang.appTitle;
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Settings.of(context).theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: reconfigure
          ? UbuntuWslReconfigureWizard(initialRoute: initialRoute)
          : UbuntuWslSetupWizard(initialRoute: initialRoute),
    );
  }
}
