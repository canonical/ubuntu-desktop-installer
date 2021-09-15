import 'package:flutter/material.dart';
import 'package:wizard_router/wizard_router.dart';

import 'pages.dart';
import 'routes.dart';

class UbuntuWslSetupWizard extends StatelessWidget {
  const UbuntuWslSetupWizard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: Routes.selectLanguage,
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
  const UbuntuWslReconfigureWizard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: Routes.advancedSetup,
      routes: <String, WidgetBuilder>{
        Routes.advancedSetup: AdvancedSetupPage.create,
        Routes.configurationUI: ConfigurationUIPage.create,
      },
    );
  }
}
