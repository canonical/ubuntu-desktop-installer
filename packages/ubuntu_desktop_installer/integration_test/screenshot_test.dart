import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_session/ubuntu_session.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru/yaru.dart';

import 'test_pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  autoUpdateGoldenFiles = true; // TODO

  setUp(() async {
    await cleanUpSubiquity();

    final mockGnomeSessionManager = MockGnomeSessionManager();
    when(mockGnomeSessionManager.inhibit(
            appId: anyNamed('appId'),
            topLevelXId: anyNamed('topLevelXId'),
            reason: anyNamed('reason'),
            flags: anyNamed('flags')))
        .thenAnswer((_) async => 42);
    registerMockService<GnomeSessionManager>(mockGnomeSessionManager);
  });
  tearDown(() async => await resetAllServices());

  testWidgets('screenshots', (tester) async {
    await runInstallerApp([], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    await testWelcomePage(tester, screenshot: 'welcome');
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester, screenshot: 'keyboard-layout');
    await tester.pumpAndSettle();

    await testConnectToInternetPage(
      tester,
      mode: ConnectMode.none,
      screenshot: 'connect-to-internet',
    );
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(
      tester,
      mode: InstallationMode.minimal,
      screenshot: 'updates-and-other-software',
    );
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.erase,
      screenshot: 'installation-type',
    );
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(
      tester,
      screenshot: 'write-changes-to-disk',
    );
    await tester.pumpAndSettle();

    await testWhereAreYouPage(tester, screenshot: 'where-are-you');
    await tester.pump();

    await testWhoAreYouPage(
      tester,
      identity: const IdentityData(
        realname: 'User',
        hostname: 'ubuntu',
        username: 'user',
      ),
      password: 'password',
      screenshot: 'who-are-you',
    );
    await tester.pumpAndSettle();

    await testChooseYourLookPage(tester, screenshot: 'choose-your-look');
    await tester.pump();

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testInstallationCompletePage(
      tester,
      screenshot: 'installation-complete',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('choose security key', (tester) async {
    await runInstallerApp(
      ['--initial-route=${Routes.installationType}'],
      flavor: flavorVariant.currentValue!,
    );
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.erase,
      advancedFeature: AdvancedFeature.lvm,
      useEncryption: true,
    );
    await tester.pumpAndSettle();

    await testChooseSecurityKeyPage(
      tester,
      securityKey: 'password',
      screenshot: 'choose-security-key',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('manual partitioning', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10-along-ubuntu.json',
      '--bootloader=uefi',
      '--initial-route=${Routes.installationType}',
    ], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.manual);
    await tester.pumpAndSettle();

    await testAllocateDiskSpacePage(tester, screenshot: 'allocate-disk-space');
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('alongside windows', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10-along-ubuntu.json',
      '--bootloader=uefi',
      '--initial-route=${Routes.installationType}',
    ], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.alongside);
    await tester.pumpAndSettle();

    await testInstallAlongsidePage(
      tester,
      sizes: {'sda3 (ntfs)': 40000},
      screenshot: 'install-alongside',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('select guided storage', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/many-nics-and-disks.json',
      '--bootloader=uefi',
      '--initial-route=${Routes.installationType}',
    ], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.erase);
    await tester.pumpAndSettle();

    await testSelectGuidedStoragePage(
      tester,
      screenshot: 'select-guided-storage',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('try-or-install', (tester) async {
    await runInstallerApp(
      ['--try-or-install'],
      flavor: flavorVariant.currentValue!,
    );
    await tester.pumpAndSettle();

    await testWelcomePage(tester);
    await tester.pumpAndSettle();

    await testTryOrInstallPage(
      tester,
      option: Option.installUbuntu,
      screenshot: 'try-or-install',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('turn off bitlocker', (tester) async {
    await runInstallerApp([
      '--machine-config=examples/win10.json',
      '--initial-route=${Routes.installationType}',
    ], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.manual);
    await tester.pumpAndSettle();

    await testTurnOffBitLockerPage(tester, screenshot: 'turn-off-bitlocker');
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('turn off rst', (tester) async {
    await runInstallerApp([], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    // no suitable machine config for testing => push the page manually on top
    // of the welcome page to avoid a disabled back-button if /turn-off-rst was
    // the initial route
    final context = tester.element(find.byType(WelcomePage));
    Navigator.push(context, MaterialPageRoute(builder: TurnOffRSTPage.create));
    await tester.pumpAndSettle();

    await testTurnOffRSTPage(tester, screenshot: 'turn-off-rst');
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('active directory', (tester) async {
    await runInstallerApp([], flavor: flavorVariant.currentValue!);
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(WelcomePage));
    Navigator.push(
        context, MaterialPageRoute(builder: ActiveDirectoryPage.create));
    await tester.pumpAndSettle();

    await testActiveDirectoryPage(
      tester,
      adminName: 'admin',
      password: 'password',
      screenshot: 'active-directory',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);

  testWidgets('not enough disk space', (tester) async {
    await runInstallerApp(
      ['--initial-route=${Routes.notEnoughDiskSpace}'],
      flavor: flavorVariant.currentValue!,
    );

    await tester.pumpAndSettle();

    await testNotEnoughDiskSpacePage(
      tester,
      screenshot: 'not-enough-disk-space',
    );
    await tester.pumpAndSettle();
  }, variant: flavorVariant);
}

final flavorVariant = ValueVariant({
  FlavorData(
    name: 'Ubuntu',
    theme: yaruLight,
    darkTheme: yaruLight,
  ),
  FlavorData(
    name: 'Ubuntu',
    theme: yaruDark,
    darkTheme: yaruDark,
  ),
});
