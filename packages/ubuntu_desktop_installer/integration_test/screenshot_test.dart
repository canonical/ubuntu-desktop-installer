import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/ubuntu_bootstrap.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_provision_test/ubuntu_provision_test.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.testLocalePage(
      screenshot: '$currentThemeName/1.locale',
    );
  }, variant: themeVariant);

  testWidgets('2.welcome', (tester) async {
    await tester
        .runApp(() => runInstallerApp(['--welcome'], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.welcome);
    await tester.pumpAndSettle();

    await tester.testWelcomePage(
      option: Option.welcomeInstallOption,
      screenshot: '$currentThemeName/2.welcome',
    );
  }, variant: themeVariant);

  testWidgets('3.rst', (tester) async {
    registerService<SubiquityClient>(FakeSubiquityClient.new);

    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.rst);
    await tester.pumpAndSettle();

    await tester.testRstPage(
      screenshot: '$currentThemeName/3.rst',
    );
  }, variant: themeVariant);

  testWidgets('3.keyboard', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.keyboard);
    await tester.pumpAndSettle();

    await tester.testKeyboardPage(
      screenshot: '$currentThemeName/3.keyboard',
    );
  }, variant: themeVariant);

  testWidgets('4.network', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.network);
    await tester.pumpAndSettle();

    await tester.testNetworkPage(
      mode: ConnectMode.none,
      screenshot: '$currentThemeName/4.network',
    );
  }, variant: themeVariant);

  testWidgets('5.refresh', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.refresh);
    await tester.pumpAndSettle();

    await tester.testRefreshPage(
      screenshot: '$currentThemeName/5.refresh',
    );
  }, variant: themeVariant);

  testWidgets('5.updates', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.source);
    await tester.pumpAndSettle();

    await tester.testSourcePage(
      screenshot: '$currentThemeName/5.updates',
    );
  }, variant: themeVariant);

  testWidgets('6.not-enough-space', (tester) async {
    final client = FakeSubiquityClient();
    registerServiceInstance<SubiquityClient>(client);

    final service = FakeStorageService(client);
    registerServiceInstance<StorageService>(service);

    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.source);
    await tester.jumpToPage(Routes.notEnoughDiskSpace);
    await tester.pumpAndSettle();

    await tester.testNotEnoughDiskSpacePage(
      screenshot: '$currentThemeName/6.not-enough-space',
    );
  }, variant: themeVariant);

  testWidgets('6.erase-disk', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(
      type: StorageType.erase,
      screenshot: '$currentThemeName/6.erase-disk',
    );
  }, variant: themeVariant);

  testWidgets('6.advanced-features', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(
      type: StorageType.erase,
      guidedCapability: GuidedCapability.LVM,
      screenshot: '$currentThemeName/6.advanced-features',
    );
  }, variant: themeVariant);

  testWidgets('6.alongside-windows', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--machine-config=examples/machines/win10.json',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(
      type: StorageType.alongside,
      screenshot: '$currentThemeName/6.alongside-windows',
    );
  }, variant: themeVariant);

  testWidgets('7.manual-partitioning', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--',
          '--bootloader=uefi',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.manual);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testManualStoragePage(
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
  }, variant: themeVariant);

  testWidgets('7.guided-resize', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--machine-config=examples/machines/win10-along-ubuntu.json',
          '--',
          '--bootloader=uefi',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.alongside);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testGuidedResizePage(
      sizes: {'ext4': 32768},
      screenshot: '$currentThemeName/7.guided-resize',
    );
  }, variant: themeVariant);

  testWidgets('7.guided-reformat', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--machine-config=examples/machines/imsm.json',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.erase);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testGuidedReformatPage(
      screenshot: '$currentThemeName/7.guided-reformat',
    );
  }, variant: themeVariant);

  testWidgets('7.bitlocker', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--machine-config=examples/machines/win10.json',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.alongside);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testBitLockerPage(
      screenshot: '$currentThemeName/7.bitlocker',
    );
  }, variant: themeVariant);

  testWidgets('8.security-key', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--machine-config=examples/machines/win10-along-ubuntu.json',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(
      type: StorageType.erase,
      guidedCapability: GuidedCapability.LVM_LUKS,
    );
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testSecurityKeyPage(
      securityKey: 'password',
      screenshot: '$currentThemeName/8.security-key',
    );
  }, variant: themeVariant);

  testWidgets('9.confirm', (tester) async {
    await tester.runApp(() => runInstallerApp([
          '--',
          '--bootloader=uefi',
        ], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToStorageWizard();
    await tester.pumpAndSettle();

    await tester.testStoragePage(
      type: StorageType.erase,
    );
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testConfirmPage(
      screenshot: '$currentThemeName/9.confirm',
    );
  }, variant: themeVariant);

  testWidgets('10.timezone', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.timezone);
    await tester.pumpAndSettle();

    await tester.testTimezonePage(
      screenshot: '$currentThemeName/10.timezone',
    );
  }, variant: themeVariant);

  testWidgets('11.identity', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.identity);
    await tester.pumpAndSettle();

    await tester.testIdentityPage(
      identity: const Identity(
        realname: 'Ubuntu User',
        hostname: 'ubuntu',
        username: 'user',
      ),
      password: 'password',
      screenshot: '$currentThemeName/11.identity',
    );
  }, variant: themeVariant);

  testWidgets('12.active-directory', (tester) async {
    final client = FakeSubiquityClient();
    registerServiceInstance<SubiquityClient>(client);

    final service = FakeActiveDirectoryService(client);
    registerServiceInstance<ActiveDirectoryService>(service);

    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.activeDirectory);
    await tester.pumpAndSettle();

    await tester.testActiveDirectoryPage(
      adminName: 'admin',
      password: 'password',
      screenshot: '$currentThemeName/12.active-directory',
    );
  }, variant: themeVariant);

  testWidgets('13.theme', (tester) async {
    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.theme);
    await tester.pumpAndSettle();

    await tester.testThemePage(
      screenshot: '$currentThemeName/13.theme',
    );
  }, variant: themeVariant);

  testWidgets('14.install', (tester) async {
    await YaruTestWindow.ensureInitialized(
      state: const YaruWindowState(isActive: true, isClosable: false),
    );

    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.install);
    await tester.pump(kThemeAnimationDuration);

    for (var i = 0; i < defaultSlides.length; ++i) {
      await tester.takeScreenshot(
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

    await tester.runApp(() => runInstallerApp([], theme: currentTheme));
    await tester.pumpAndSettle();

    await tester.jumpToPage(Routes.install);
    await tester.pumpAndSettle();

    await tester.testInstallPage(
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

  @override
  String getReleaseNotesURL(String languageCode) =>
      'https://wiki.ubuntu.com/ManticMinotaur/ReleaseNotes';
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
  Future<void> jumpToStorageWizard() async {
    // an installation source must be explicitly selected before calling storage APIs
    await jumpToPage(Routes.source);
    await tapNext();
    await pumpUntil(find.byType(StorageWizard));
  }
}
