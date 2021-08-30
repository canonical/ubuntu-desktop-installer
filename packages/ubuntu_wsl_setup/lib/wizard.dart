import 'package:flutter/material.dart';
import 'package:wizard_router/wizard_router.dart';

import 'pages.dart';
import 'routes.dart';

class UbuntuWslSetupWizard extends StatelessWidget {
  const UbuntuWslSetupWizard({
    Key? key,
    required this.reconfigure,
  }) : super(key: key);

  final bool reconfigure;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: Routes.selectLanguage,
      routes: <String, WidgetBuilder>{
        if (!reconfigure) Routes.selectLanguage: SelectLanguagePage.create,
        if (!reconfigure) Routes.profileSetup: ProfileSetupPage.create,
        Routes.advancedSetup: AdvancedSetupPage.create,
        Routes.configurationUI: ConfigurationUIPage.create,
        Routes.setupComplete: SetupCompletePage.create,
      },
      onNext: (settings) {
        switch (settings.name) {
          case Routes.profileSetup:
            if ((settings.arguments as bool?) == true) {
              return Routes.advancedSetup;
            }
            return Routes.configurationUI;
          default:
            return null;
        }
      },
    );
  }
}
