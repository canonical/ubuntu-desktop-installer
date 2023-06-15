import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'bitlocker/bitlocker_page.dart';
import 'guided_reformat/guided_reformat_page.dart';
import 'guided_resize/guided_resize_page.dart';
import 'installation_type/installation_type_page.dart';
import 'manual/manual_storage_page.dart';
import 'security_key/security_key_page.dart';
import 'storage_routes.dart';

export 'bitlocker/bitlocker_page.dart';
export 'guided_reformat/guided_reformat_page.dart';
export 'guided_resize/guided_resize_page.dart';
export 'installation_type/installation_type_page.dart';
export 'manual/manual_storage_page.dart';
export 'security_key/security_key_page.dart';
export 'storage_routes.dart';

class StorageWizard extends ConsumerWidget {
  const StorageWizard({super.key});

  static Future<bool> load(WidgetRef ref) {
    return InstallationTypePage.load(ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wizard(
      userData: WizardData(totalSteps: InstallationStep.values.length),
      routes: {
        Routes.installationType: WizardRoute(
          builder: (_) => const InstallationTypePage(),
          userData: WizardRouteData(step: InstallationStep.type.index),
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.bitlocker: WizardRoute(
          builder: (_) => const BitLockerPage(),
        ),
        StorageRoutes.guidedResize: WizardRoute(
          builder: (_) => const GuidedResizePage(),
          userData: WizardRouteData(step: InstallationStep.storage.index),
          onLoad: (_) => GuidedResizePage.load(ref),
          onReplace: (_) => StorageRoutes.manual,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        StorageRoutes.guidedReformat: WizardRoute(
          builder: (_) => const GuidedReformatPage(),
          userData: WizardRouteData(step: InstallationStep.storage.index),
          onLoad: (_) => GuidedReformatPage.load(ref),
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.securityKey: WizardRoute(
          builder: (_) => const SecurityKeyPage(),
          userData: WizardRouteData(step: InstallationStep.storage.index),
          onLoad: (_) => SecurityKeyPage.load(ref),
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        StorageRoutes.manual: WizardRoute(
          builder: (_) => const ManualStoragePage(),
          userData: WizardRouteData(step: InstallationStep.storage.index),
          onLoad: (_) => ManualStoragePage.load(ref),
        ),
      },
    );
  }

  String? _nextRoute(dynamic arguments) {
    final storage = getService<StorageService>();
    if (arguments == InstallationType.manual) {
      return StorageRoutes.manual;
    } else if (storage.guidedTarget == null) {
      if (arguments == InstallationType.bitlocker) {
        return Routes.bitlocker;
      } else if (arguments == InstallationType.erase) {
        return StorageRoutes.guidedReformat;
      } else if (arguments == InstallationType.alongside) {
        return StorageRoutes.guidedResize;
      }
    } else if (storage.useEncryption && storage.securityKey == null) {
      return Routes.securityKey;
    }
    return Routes.confirm;
  }
}
