import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'l10n.dart';
import 'wizard.dart';

class UbuntuWslSetupApp extends StatelessWidget {
  const UbuntuWslSetupApp({
    Key? key,
    this.variant,
    this.initialRoute,
  }) : super(key: key);

  final Variant? variant;
  final String? initialRoute;

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
      home: buildWizard(context),
    );
  }

  Widget buildWizard(BuildContext context) {
    switch (variant) {
      case Variant.WSL_SETUP:
        return UbuntuWslSetupWizard(initialRoute: initialRoute);
      case Variant.WSL_CONFIGURATION:
        return UbuntuWslReconfigureWizard(initialRoute: initialRoute);
      case null:
        return const SizedBox.shrink();
      default:
        throw UnsupportedError('Unsupported WSL variant: $variant');
    }
  }
}
