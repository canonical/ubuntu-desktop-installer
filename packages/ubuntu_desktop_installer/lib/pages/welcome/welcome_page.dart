import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'rst/rst_page.dart';
import 'try_or_install/try_or_install_page.dart';

export 'rst/rst_page.dart';
export 'try_or_install/try_or_install_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static Widget create(BuildContext context) => const WelcomePage();

  @override
  Widget build(BuildContext context) {
    return Wizard(
      userData: InstallationStep.values.length,
      routes: {
        Routes.tryOrInstall: WizardRoute(
          builder: TryOrInstallPage.create,
          userData: InstallationStep.locale.index,
        ),
        Routes.rst: const WizardRoute(
          builder: RstPage.create,
        ),
      },
    );
  }
}
