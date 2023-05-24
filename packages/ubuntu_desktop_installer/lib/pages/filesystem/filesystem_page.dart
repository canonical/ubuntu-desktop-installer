import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'allocate_disk_space/allocate_disk_space_page.dart';
import 'bitlocker/bitlocker_page.dart';
import 'install_alongside/install_alongside_page.dart';
import 'installation_type/installation_type_page.dart';
import 'security_key/security_key_page.dart';
import 'select_guided_storage/select_guided_storage_page.dart';

export 'allocate_disk_space/allocate_disk_space_page.dart';
export 'bitlocker/bitlocker_page.dart';
export 'install_alongside/install_alongside_page.dart';
export 'installation_type/installation_type_page.dart';
export 'security_key/security_key_page.dart';
export 'select_guided_storage/select_guided_storage_page.dart';

class FilesystemPage extends ConsumerWidget {
  const FilesystemPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return InstallationTypePage.load(ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wizard(
      userData: InstallationStep.values.length,
      routes: {
        Routes.installationType: WizardRoute(
          builder: (_) => const InstallationTypePage(),
          userData: InstallationStep.type.index,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.bitlocker: WizardRoute(
          builder: (_) => const BitLockerPage(),
        ),
        Routes.installAlongside: WizardRoute(
          builder: (_) => const InstallAlongsidePage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => InstallAlongsidePage.load(ref),
          onReplace: (_) => Routes.allocateDiskSpace,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.selectGuidedStorage: WizardRoute(
          builder: (_) => const SelectGuidedStoragePage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => SelectGuidedStoragePage.load(ref),
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.securityKey: WizardRoute(
          builder: (_) => const SecurityKeyPage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => SecurityKeyPage.load(ref),
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.allocateDiskSpace: WizardRoute(
          builder: (_) => const AllocateDiskSpacePage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => AllocateDiskSpacePage.load(ref),
        ),
      },
    );
  }

  String? _nextRoute(dynamic arguments) {
    final storage = getService<StorageService>();
    if (arguments == InstallationType.manual) {
      return Routes.allocateDiskSpace;
    } else if (storage.guidedTarget == null) {
      if (arguments == InstallationType.bitlocker) {
        return Routes.bitlocker;
      } else if (arguments == InstallationType.erase) {
        return Routes.selectGuidedStorage;
      } else if (arguments == InstallationType.alongside) {
        return Routes.installAlongside;
      }
    } else if (storage.useEncryption && storage.securityKey == null) {
      return Routes.securityKey;
    }
    return Routes.confirm;
  }
}
