import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'pages.dart';
import 'routes.dart';

class UbuntuWslSetupWizard extends StatelessWidget {
  const UbuntuWslSetupWizard({
    Key? key,
    this.initialRoute,
  }) : super(key: key);

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: initialRoute ?? Routes.selectLanguage,
      routes: <String, WidgetBuilder>{
        Routes.selectLanguage: SelectLanguagePage.create,
        Routes.profileSetup: ProfileSetupPage.create,
        Routes.advancedSetup: AdvancedSetupPage.create,
        Routes.setupComplete: SetupCompletePage.create,
      },
      onNext: (settings) {
        switch (settings.name) {
          case Routes.profileSetup:
            if ((settings.arguments as bool?) == true) {
              return Routes.advancedSetup;
            }
            return Routes.setupComplete;
          default:
            return null;
        }
      },
    );
  }
}

class UbuntuWslReconfigureWizard extends StatelessWidget {
  const UbuntuWslReconfigureWizard({
    Key? key,
    this.initialRoute,
  }) : super(key: key);

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: initialRoute ?? Routes.advancedSetup,
      routes: <String, WidgetBuilder>{
        Routes.advancedSetup: AdvancedSetupPage.create,
        Routes.configurationUI: ConfigurationUIPage.create,
      },
    );
  }
}
