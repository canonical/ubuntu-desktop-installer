import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'rst/rst_page.dart';
import 'welcome_page.dart';

export 'rst/rst_page.dart';
export 'welcome_page.dart';

class WelcomeWizard extends StatelessWidget {
  const WelcomeWizard({super.key});

  static Widget create(BuildContext context) => const WelcomeWizard();

  @override
  Widget build(BuildContext context) {
    return Wizard(
      userData: InstallationStep.values.length,
      routes: {
        Navigator.defaultRouteName: WizardRoute(
          builder: (_) => const WelcomePage(),
          userData: InstallationStep.locale.index,
        ),
        Routes.rst: WizardRoute(
          builder: (_) => const RstPage(),
        ),
      },
    );
  }
}
