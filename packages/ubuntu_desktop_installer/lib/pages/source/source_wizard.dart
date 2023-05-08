import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'not_enough_disk_space/not_enough_disk_space_page.dart';
import 'source_page.dart';

export 'not_enough_disk_space/not_enough_disk_space_page.dart';
export 'source_page.dart';

class SourceWizard extends StatelessWidget {
  const SourceWizard({super.key});

  @override
  Widget build(BuildContext context) {
    return InstallerWizard(
      userData: InstallationStep.values.length,
      routes: {
        Navigator.defaultRouteName: WizardRoute(
          builder: (_) => const SourcePage(),
          userData: InstallationStep.software.index,
        ),
        Routes.notEnoughDiskSpace: WizardRoute(
          builder: (_) => const NotEnoughDiskSpacePage(),
        ),
      },
    );
  }
}
