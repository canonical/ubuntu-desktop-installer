import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';

import 'not_enough_disk_space/not_enough_disk_space_page.dart';
import 'source_page.dart';

export 'not_enough_disk_space/not_enough_disk_space_page.dart';
export 'source_page.dart';

class SourceWizard extends ConsumerWidget {
  const SourceWizard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wizard(
      userData: WizardData(totalSteps: InstallationStep.values.length),
      routes: {
        Navigator.defaultRouteName: WizardRoute(
          builder: (_) => const SourcePage(),
          userData: WizardRouteData(step: InstallationStep.source.index),
        ),
        Routes.notEnoughDiskSpace: WizardRoute(
          builder: (_) => const NotEnoughDiskSpacePage(),
          onLoad: (_) => NotEnoughDiskSpacePage.load(ref),
        ),
      },
    );
  }
}
