import 'package:flutter/material.dart';
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

class FilesystemPage extends StatelessWidget {
  const FilesystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Wizard(
      userData: InstallationStep.values.length,
      routes: {
        Routes.installationType: WizardRoute(
          builder: InstallationTypePage.create,
          userData: InstallationStep.type.index,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.bitlocker: const WizardRoute(
          builder: BitLockerPage.create,
        ),
        Routes.installAlongside: WizardRoute(
          builder: InstallAlongsidePage.create,
          userData: InstallationStep.filesystem.index,
          onReplace: (_) => Routes.allocateDiskSpace,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.selectGuidedStorage: WizardRoute(
          builder: SelectGuidedStoragePage.create,
          userData: InstallationStep.filesystem.index,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.securityKey: WizardRoute(
          builder: SecurityKeyPage.create,
          userData: InstallationStep.filesystem.index,
          onNext: (settings) => _nextRoute(settings.arguments),
        ),
        Routes.allocateDiskSpace: WizardRoute(
          builder: AllocateDiskSpacePage.create,
          userData: InstallationStep.filesystem.index,
        ),
      },
    );
  }

  String? _nextRoute(dynamic arguments) {
    final service = getService<DiskStorageService>();
    if (arguments == InstallationType.manual) {
      return Routes.allocateDiskSpace;
    } else if (service.guidedTarget == null) {
      if (arguments == InstallationType.bitlocker) {
        return Routes.bitlocker;
      } else if (arguments == InstallationType.erase) {
        return Routes.selectGuidedStorage;
      } else if (arguments == InstallationType.alongside) {
        return Routes.installAlongside;
      }
    } else if (service.useEncryption && service.securityKey == null) {
      return Routes.securityKey;
    }
    return Routes.writeChangesToDisk;
  }
}
