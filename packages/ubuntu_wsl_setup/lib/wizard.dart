import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'pages.dart';
import 'routes.dart';

class UbuntuWslSetupWizard extends StatelessWidget {
  const UbuntuWslSetupWizard({
    super.key,
    required this.initialRoute,
  });

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      initialRoute: initialRoute,
      routes: <String, WizardRoute>{
        Routes.installationSlides: WizardRoute(
          builder: InstallationSlidesPage.create,
          onReplace: (settings) {
            if ((settings.arguments as bool) == true) {
              return Routes.profileSetup;
            }
            return Routes.selectLanguage;
          },
        ),
        Routes.selectLanguage: const WizardRoute(
          builder: SelectLanguagePage.create,
        ),
        Routes.profileSetup: WizardRoute(
          builder: ProfileSetupPage.create,
          onNext: (settings) {
            if ((settings.arguments as bool?) == true) {
              return Routes.advancedSetup;
            }
            return Routes.applyingChanges;
          },
        ),
        Routes.advancedSetup: const WizardRoute(
          builder: AdvancedSetupPage.create,
        ),
        Routes.applyingChanges: const WizardRoute(
          builder: ApplyingChangesPage.create,
        ),
        Routes.advancedReconfig: const WizardRoute(
          builder: AdvancedSetupPage.create,
        ),
        Routes.configurationUI: const WizardRoute(
          builder: ConfigurationUIPage.create,
        ),
        Routes.applyingChangesReconfig: const WizardRoute(
          builder: ApplyingChangesPage.create,
        ),
      },
    );
  }
}
