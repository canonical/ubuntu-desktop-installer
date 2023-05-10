import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'not_enough_disk_space/not_enough_disk_space_page.dart';
import 'source_page.dart';

export 'not_enough_disk_space/not_enough_disk_space_page.dart';
export 'source_page.dart';

class SourceWizard extends StatelessWidget {
  const SourceWizard({super.key});

  static Future<bool> load(WidgetRef ref) {
    return SourcePage.load(ref).then((_) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Wizard(
      userData: InstallationStep.values.length,
      routes: {
        Navigator.defaultRouteName: WizardRoute(
          builder: (_) => const SourcePage(),
          userData: InstallationStep.source.index,
        ),
        Routes.notEnoughDiskSpace: WizardRoute(
          builder: (_) => const NotEnoughDiskSpacePage(),
        ),
      },
    );
  }
}
