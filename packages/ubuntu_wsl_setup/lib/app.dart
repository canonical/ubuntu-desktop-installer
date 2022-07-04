import 'package:flutter/material.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru/yaru.dart';

import 'l10n.dart';
import 'locale.dart';
import 'wizard.dart';
import 'routes.dart';

class UbuntuWslSetupApp extends StatelessWidget {
  const UbuntuWslSetupApp({
    Key? key,
    this.variant,
    this.initialRoute,
    this.withSlides = false,
  }) : super(key: key);

  final Variant? variant;
  final String? initialRoute;
  final bool withSlides;

  @override
  Widget build(BuildContext context) {
    return InheritedLocale(
      child: Builder(builder: (context) {
        return MaterialApp(
          locale: InheritedLocale.of(context),
          onGenerateTitle: (context) {
            final lang = AppLocalizations.of(context);
            setWindowTitle(lang.windowTitle);
            return lang.appTitle;
          },
          theme: yaruLight,
          darkTheme: yaruDark,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          home: buildWizard(context),
        );
      }),
    );
  }

  Widget buildWizard(BuildContext context) {
    if (variant == null && withSlides == false) {
      return const SizedBox.shrink();
    }

    return UbuntuWslSetupWizard(
      initialRoute: initialRoute ?? routeForVariant(variant!),
    );
  }

  String routeForVariant(Variant value) {
    switch (value) {
      case Variant.WSL_SETUP:
        return Routes.selectLanguage;
      case Variant.WSL_CONFIGURATION:
        return Routes.advancedReconfig;
      default:
        throw UnsupportedError('Unsupported WSL variant: $variant');
    }
  }
}
