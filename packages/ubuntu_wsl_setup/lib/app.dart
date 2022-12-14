import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:yaru/yaru.dart';

import 'l10n.dart';
import 'locale.dart';
import 'wizard.dart';
import 'routes.dart';

class UbuntuWslSetupApp extends StatelessWidget {
  const UbuntuWslSetupApp({
    super.key,
    required this.model,
  });

  final AppModel model;

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
          home: model.showSplashScreen == false
              ? buildWizard(context)
              : SplashScreen(
                  animationDuration: const Duration(seconds: 6),
                  builder: buildWizard,
                ),
        );
      }),
    );
  }

  Widget? buildWizard(BuildContext context) {
    if (model.variant == null &&
        model.initialRoute != Routes.installationSlides) {
      return model.showSplashScreen ? null : const SizedBox.shrink();
    }

    return UbuntuWslSetupWizard(
      initialRoute: model.initialRoute,
    );
  }
}
