import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'test_pages.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final window = await YaruWindow.ensureInitialized();

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

  tearDown(() async {
    final windowClosed = YaruTestWindow.waitForClosed();
    window.close();
    await windowClosed;
    await resetAllServices();
  });

  testWidgets('1.locale', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await testLocalePage(
      tester,
      screenshot: '$currentThemeName/1.locale',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('2.welcome', (tester) async {
    await runInstallerApp(['--welcome'], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.welcome);
    await tester.pumpAndSettle();

    await testWelcomePage(
      tester,
      option: Option.installUbuntu,
      screenshot: '$currentThemeName/2.welcome',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('3.rst', (tester) async {
    registerService<SubiquityClient>(FakeSubiquityClient.new);

    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.rst);
    await tester.pumpAndSettle();

    await testRstPage(
      tester,
      screenshot: '$currentThemeName/3.rst',
    );
  }, variant: themeVariant);

  testWidgets('3.keyboard', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.keyboard);
    await tester.pumpAndSettle();

    await testKeyboardPage(
      tester,
      screenshot: '$currentThemeName/3.keyboard',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('4.network', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.network);
    await tester.pumpAndSettle();

    await testNetworkPage(
      tester,
      mode: ConnectMode.none,
      screenshot: '$currentThemeName/4.network',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('5.updates', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.source);
    await tester.pumpAndSettle();

    await testSourcePage(
      tester,
      screenshot: '$currentThemeName/5.updates',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('6.not-enough-space', (tester) async {
    final client = FakeSubiquityClient();
    registerServiceInstance<SubiquityClient>(client);

    final service = FakeStorageService(client);
    registerServiceInstance<StorageService>(service);

    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.source);
    await tester.jumpToWizardRoute(Routes.notEnoughDiskSpace);
    await tester.pumpAndSettle();

    await testNotEnoughDiskSpacePage(
      tester,
      screenshot: '$currentThemeName/6.not-enough-space',
    );
  }, variant: themeVariant);

  testWidgets('6.erase-disk', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(
      tester,
      type: StorageType.erase,
      screenshot: '$currentThemeName/6.erase-disk',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('6.advanced-features', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(
      tester,
      type: StorageType.erase,
      advancedFeature: AdvancedFeature.lvm,
      screenshot: '$currentThemeName/6.advanced-features',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('6.alongside-windows', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10.json',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(
      tester,
      type: StorageType.alongside,
      screenshot: '$currentThemeName/6.alongside-windows',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('7.manual-partitioning', (tester) async {
    await runInstallerApp([
      '--',
      '--bootloader=uefi',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.manual);
    await tester.pumpAndSettle();

    await testManualStoragePage(
      tester,
      storage: [
        fakeDisk(
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
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('7.guided-resize', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10-along-ubuntu.json',
      '--',
      '--bootloader=uefi',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.alongside);
    await tester.pumpAndSettle();

    await testGuidedResizePage(
      tester,
      sizes: {'ext4': 32768},
      screenshot: '$currentThemeName/7.guided-resize',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('7.guided-reformat', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/imsm.json',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.erase);
    await tester.pumpAndSettle();

    await testGuidedReformatPage(
      tester,
      screenshot: '$currentThemeName/7.guided-reformat',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('7.bitlocker', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10.json',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.alongside);
    await tester.pumpAndSettle();

    await testBitLockerPage(
      tester,
      screenshot: '$currentThemeName/7.bitlocker',
    );
  }, variant: themeVariant);

  testWidgets('8.security-key', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10-along-ubuntu.json',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(
      tester,
      type: StorageType.erase,
      advancedFeature: AdvancedFeature.lvm,
      useEncryption: true,
    );
    await tester.pumpAndSettle();

    await testSecurityKeyPage(
      tester,
      securityKey: 'password',
      screenshot: '$currentThemeName/8.security-key',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('9.confirm', (tester) async {
    await runInstallerApp([
      '--',
      '--bootloader=uefi',
    ], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await testStoragePage(
      tester,
      type: StorageType.erase,
    );
    await tester.pumpAndSettle();

    await testConfirmPage(
      tester,
      screenshot: '$currentThemeName/9.confirm',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('10.timezone', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.timezone);
    await tester.pumpAndSettle();

    await testTimezonePage(
      tester,
      screenshot: '$currentThemeName/10.timezone',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('11.identity', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.identity);
    await tester.pumpAndSettle();

    await testIdentityPage(
      tester,
      identity: const Identity(
        realname: 'Ubuntu User',
        hostname: 'ubuntu',
        username: 'user',
      ),
      password: 'password',
      screenshot: '$currentThemeName/11.identity',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('12.active-directory', (tester) async {
    final client = FakeSubiquityClient();
    registerServiceInstance<SubiquityClient>(client);

    final service = FakeActiveDirectoryService(client);
    registerServiceInstance<ActiveDirectoryService>(service);

    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.activeDirectory);
    await tester.pumpAndSettle();

    await testActiveDirectoryPage(
      tester,
      adminName: 'admin',
      password: 'password',
      screenshot: '$currentThemeName/12.active-directory',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('13.theme', (tester) async {
    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.theme);
    await tester.pumpAndSettle();

    await testThemePage(
      tester,
      screenshot: '$currentThemeName/13.theme',
    );
    await tester.pumpAndSettle();
  }, variant: themeVariant);

  testWidgets('14.install', (tester) async {
    await YaruTestWindow.ensureInitialized(
      state: const YaruWindowState(isActive: true, isClosable: false),
    );

    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.install);
    await tester.pump(kThemeAnimationDuration);

    for (var i = 0; i < defaultSlides.length; ++i) {
      await takeScreenshot(
        tester,
        '$currentThemeName/14.install-$i',
      );
      if (i < defaultSlides.length - 1) {
        await tester.tap(find.iconButton(YaruIcons.pan_end));
        await tester.pump(kThemeAnimationDuration);
      }
    }
  }, variant: themeVariant);

  testWidgets('15.complete', (tester) async {
    registerService<SubiquityClient>(
        () => FakeSubiquityClient(ApplicationState.DONE));

    await runInstallerApp([], theme: currentTheme);
    await tester.pumpAndSettle();

    await tester.jumpToWizardRoute(Routes.install);
    await tester.pumpAndSettle();

    await testInstallPage(
      tester,
      screenshot: '$currentThemeName/15.complete',
    );
  }, variant: themeVariant);
}

class FakeActiveDirectoryService extends SubiquityActiveDirectoryService {
  FakeActiveDirectoryService(super.client);

  @override
  Future<bool> isUsed() async => true;
}

class FakeDesktopService implements DesktopService {
  @override
  Future<void> inhibit() async {}

  @override
  Future<void> close() async {}
}

class FakeProductService implements ProductService {
  @override
  ProductInfo getProductInfo() => ProductInfo(name: 'Ubuntu', version: '23.04');
}

class FakeStorageService extends StorageService {
  FakeStorageService(super.client);

  @override
  int get installMinimumSize => 24426577920;

  @override
  int get largestDiskSize => 16284385280;
}

class FakeSubiquityClient extends SubiquityClient {
  FakeSubiquityClient([this.state = ApplicationState.WAITING]);

  final ApplicationState state;

  @override
  Future<ApplicationStatus> getStatus({ApplicationState? current}) async {
    return fakeApplicationStatus(state);
  }

  @override
  Stream<ApplicationStatus?> monitorStatus() {
    return Stream.value(fakeApplicationStatus(state));
  }

  @override
  Future<bool> hasRst() async => true;
}

ThemeData get currentTheme => themeVariant.currentValue!;
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
      case 'dark':
        return {yaruDark};
      case 'high-contrast-light':
        return {yaruHighContrastLight};
      case 'high-contrast-dark':
        return {yaruHighContrastDark};
      case 'all':
        return {
          yaruLight,
          yaruDark,
          yaruHighContrastLight,
          yaruHighContrastDark,
        };
      default:
        return {yaruLight};
    }
  }
}

extension on WidgetTester {
  Future<void> jumpToWizardRoute(String route) {
    final context = element(find.byType(WizardPage));
    Wizard.of(context).jump(route);
    return pumpAndSettle();
  }

  Future<void> jumpToStorageWizard() async {
    // an installation source must be explicitly selected before calling storage APIs
    await jumpToWizardRoute(Routes.source);
    await tapNext();
    await pumpUntil(find.byType(StorageWizard));
  }
}
