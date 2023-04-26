import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test/test_utils.dart';
import 'test_pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => autoUpdateGoldenFiles = true);

  setUp(() async {
    await cleanUpSubiquity();
    registerMockService<DesktopService>(FakeDesktopService());
    registerMockService<ProductService>(FakeProductService());
    await YaruWindowTitleBar.ensureInitialized();
    return YaruTestWindow.ensureInitialized(
      state: const YaruWindowState(isActive: true, isClosable: true),
    );
  });

  tearDown(() async => await resetAllServices());

  testWidgets('1.locale', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await testLocalePage(
      tester,
      screenshot: '$currentThemeName/1.locale',
    );
  }, variant: themeVariant);

  testWidgets('2.install-ubuntu', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.tryOrInstall);
    await tester.pumpAndSettle();

    await testTryOrInstallPage(
      tester,
      option: Option.installUbuntu,
      screenshot: '$currentThemeName/2.install-ubuntu',
    );
  }, variant: themeVariant);

  testWidgets('3.keyboard', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.keyboard);
    await tester.pumpAndSettle();

    await testKeyboardPage(
      tester,
      screenshot: '$currentThemeName/3.keyboard',
    );
  }, variant: themeVariant);

  testWidgets('3.rst', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.rst);
    await tester.pumpAndSettle();

    await testRstPage(
      tester,
      screenshot: '$currentThemeName/3.rst',
    );
  }, variant: themeVariant);

  testWidgets('4.network', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.network);
    await tester.pumpAndSettle();

    await testNetworkPage(
      tester,
      mode: ConnectMode.none,
      screenshot: '$currentThemeName/4.network',
    );
  }, variant: themeVariant);

  testWidgets('5.updates', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.updatesOtherSoftware);
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(
      tester,
      screenshot: '$currentThemeName/5.updates',
    );
  }, variant: themeVariant);

  testWidgets('6.not-enough-space', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.notEnoughDiskSpace);
    await tester.pumpAndSettle();

    await testNotEnoughDiskSpacePage(
      tester,
      screenshot: '$currentThemeName/6.not-enough-space',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('6.erase-disk', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.installationType);
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.erase,
      screenshot: '$currentThemeName/6.erase-disk',
    );
  }, variant: themeVariant);

  testWidgets('6.advanced-features', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.installationType);
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.erase,
      advancedFeature: AdvancedFeature.lvm,
      screenshot: '$currentThemeName/6.advanced-features',
    );
  }, variant: themeVariant);

  testWidgets('6.alongside-windows', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10.json',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.installationType);
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.bitlocker,
      screenshot: '$currentThemeName/6.alongside-windows',
    );
  }, variant: themeVariant);

  testWidgets('7.manual-partitioning', (tester) async {
    await runInstallerApp([
      '--',
      '--bootloader=uefi',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.allocateDiskSpace);
    await tester.pumpAndSettle();

    await testAllocateDiskSpacePage(
      tester,
      storage: [
        testDisk(
          path: '/dev/sda',
          partitions: [
            Partition(
              size: toBytes(50, DataUnit.gigabytes),
              mount: '/',
              path: '/dev/sda1',
            ),
          ],
        ),
      ],
      screenshot: '$currentThemeName/7.manual-partitioning',
    );
  }, variant: themeVariant);

  testWidgets('7.resize-windows', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10-along-ubuntu.json',
      '--',
      '--bootloader=uefi',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.installAlongside);
    await tester.pumpAndSettle();

    await testInstallAlongsidePage(
      tester,
      sizes: {'ext4': 32768},
      screenshot: '$currentThemeName/7.resize-windows',
    );
  }, variant: themeVariant);

  testWidgets('7.select-disk', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10.json',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.selectGuidedStorage);
    await tester.pumpAndSettle();

    await testSelectGuidedStoragePage(
      tester,
      screenshot: '$currentThemeName/7.select-disk',
    );
  }, variant: themeVariant);

  testWidgets('7.bitlocker', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.bitlocker);
    await tester.pumpAndSettle();

    await testBitLockerPage(
      tester,
      screenshot: '$currentThemeName/7.bitlocker',
    );
  }, variant: themeVariant);

  testWidgets('8.security-key', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.securityKey);
    await tester.pumpAndSettle();

    await testSecurityKeyPage(
      tester,
      securityKey: 'password',
      screenshot: '$currentThemeName/8.security-key',
    );
  }, variant: themeVariant);

  testWidgets('9.ready-to-install', (tester) async {
    await runInstallerApp([
      '--initial-route=${Routes.installationType}',
      '--',
      '--bootloader=uefi',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.erase,
    );
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(
      tester,
      screenshot: '$currentThemeName/9.ready-to-install',
    );
  }, variant: themeVariant);

  testWidgets('10.timezone', (tester) async {
    await runInstallerApp([
      '--initial-route=${Routes.timezone}',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await testTimezonePage(
      tester,
      screenshot: '$currentThemeName/10.timezone',
    );
  }, variant: themeVariant);

  testWidgets('11.identity', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.identity);
    await tester.pumpAndSettle();

    await testIdentityPage(
      tester,
      identity: const IdentityData(
        realname: 'Ubuntu User',
        hostname: 'ubuntu',
        username: 'user',
      ),
      password: 'password',
      screenshot: '$currentThemeName/11.identity',
    );
  }, variant: themeVariant);

  testWidgets('12.active-directory', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.activeDirectory);
    await tester.pumpAndSettle();

    await testActiveDirectoryPage(
      tester,
      adminName: 'admin',
      password: 'password',
      screenshot: '$currentThemeName/12.active-directory',
    );
  }, variant: themeVariant);

  testWidgets('13.theme', (tester) async {
    await runInstallerApp([], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.theme);
    await tester.pumpAndSettle();

    await testThemePage(
      tester,
      screenshot: '$currentThemeName/13.theme',
    );
  }, variant: themeVariant);

  testWidgets('14.installation-slides', (tester) async {
    await YaruTestWindow.ensureInitialized(
      state: const YaruWindowState(isActive: true, isClosable: false),
    );

    await runInstallerApp([
      '--initial-route=${Routes.installationSlides}',
    ], flavor: currentFlavor);
    await tester.pump(kThemeAnimationDuration);

    for (var i = 0; i < defaultSlides.length; ++i) {
      await takeScreenshot(
        tester,
        '$currentThemeName/14.installation-slide-$i',
      );
      if (i < defaultSlides.length - 1) {
        await tester.tap(find.byIcon(YaruIcons.pan_end));
        await tester.pump(kThemeAnimationDuration);
      }
    }
  }, variant: themeVariant);

  testWidgets('15.installation-complete', (tester) async {
    await runInstallerApp([
      '--initial-route=${Routes.installationComplete}',
    ], flavor: currentFlavor);
    await tester.pumpAndSettle();

    await testInstallationCompletePage(
      tester,
      screenshot: '$currentThemeName/15.installation-complete',
    );
  }, variant: themeVariant);
}

class FakeDesktopService implements DesktopService {
  @override
  Future<void> inhibit() async {}

  @override
  Future<void> setTheme(Brightness brightness) async {}

  @override
  Future<void> close() async {}
}

class FakeDiskStorageService extends DiskStorageService {
  FakeDiskStorageService(super.client);

  @override
  bool get hasEnoughDiskSpace => false;
}

class FakeProductService implements ProductService {
  @override
  ProductInfo getProductInfo() => ProductInfo(name: 'Ubuntu', version: '23.04');
}

FlavorData get currentFlavor {
  return FlavorData(
    name: 'Ubuntu',
    theme: themeVariant.currentValue!,
    darkTheme: themeVariant.currentValue!,
  );
}

String get currentThemeName => themeVariant.currentName;

final themeVariant = YaruThemeVariant();

class YaruThemeVariant extends ValueVariant<ThemeData> {
  YaruThemeVariant()
      : super(_resolveThemes(Platform.environment['UDI_SCREENSHOT_THEME']));

  String get currentName => describeValue(currentValue!);

  @override
  String describeValue(ThemeData value) {
    if (identical(value, yaruLight)) {
      return 'light';
    } else if (identical(value, yaruDark)) {
      return 'dark';
    } else if (identical(value, yaruHighContrastLight)) {
      return 'high-contrast-light';
    } else if (identical(value, yaruHighContrastDark)) {
      return 'high-contrast-dark';
    } else {
      return 'unknown';
    }
  }

  static Set<ThemeData> _resolveThemes(String? name) {
    switch (name) {
      case 'light':
        return {yaruLight};
      case 'dark':
        return {yaruDark};
      case 'high-contrast-light':
        return {yaruHighContrastLight};
      case 'high-contrast-dark':
        return {yaruHighContrastDark};
      default:
        return {
          yaruLight,
          yaruDark,
          yaruHighContrastLight,
          yaruHighContrastDark,
        };
    }
  }
}

extension on WidgetTester {
  Future<void> jumpToWizardRoute(String route) {
    final context = element(find.byType(WizardPage));
    Wizard.of(context).jump(route);
    return pumpAndSettle();
  }
}
