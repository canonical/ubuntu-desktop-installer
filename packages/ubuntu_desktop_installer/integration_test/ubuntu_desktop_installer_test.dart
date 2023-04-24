import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/main.dart' as app;
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaml/yaml.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test/test_utils.dart';
import 'test_pages.dart';

// ignore_for_file: type=lint

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(YaruTestWindow.ensureInitialized);

  setUp(() async {
    await cleanUpSubiquity();
    registerMockService<DesktopService>(FakeDesktopService());
  });
  tearDown(() async => await resetAllServices());

  testWidgets('minimal installation', (tester) async {
    const language = 'Français';
    const locale = 'fr_FR.UTF-8';
    const timezone = 'Europe/Paris';
    const keyboardLayout = KeyboardSetting(layout: 'Français');
    const keyboardSetting = KeyboardSetting(layout: 'fr');
    const identity = IdentityData(
      realname: 'User',
      hostname: 'ubuntu',
      username: 'user',
    );

    await app.main(<String>[]);
    await tester.pumpAndSettle();

    await testWelcomePage(tester, language: language);
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester, keyboard: keyboardLayout);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(tester, mode: InstallationMode.minimal);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.erase);
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(tester);
    await tester.pumpAndSettle();

    await testWhereAreYouPage(tester, timezone: timezone);
    await tester.pump();

    await testWhoAreYouPage(
      tester,
      identity: identity,
      password: 'password',
    );
    await tester.pumpAndSettle();

    await testChooseYourLookPage(tester);
    await tester.pump();

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testInstallationCompletePage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(
      identity: identity,
      keyboard: keyboardSetting,
      locale: locale,
      timezone: timezone,
    );
  });

  testWidgets('guided lvm + encryption', (tester) async {
    const identity = IdentityData(
      realname: 'User',
      hostname: 'ubuntu',
      username: 'user',
    );

    await app.main(<String>[]);
    await tester.pumpAndSettle();

    await testWelcomePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(tester);
    await tester.pumpAndSettle();

    await testInstallationTypePage(
      tester,
      type: InstallationType.erase,
      advancedFeature: AdvancedFeature.lvm,
      useEncryption: true,
    );
    await tester.pumpAndSettle();

    await testChooseSecurityKeyPage(tester, securityKey: 'password');
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(tester);
    await tester.pumpAndSettle();

    await testWhereAreYouPage(tester);
    await tester.pump();

    await testWhoAreYouPage(
      tester,
      identity: identity,
      password: 'password',
    );
    await tester.pump();

    await testChooseYourLookPage(tester);
    await tester.pump();

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testInstallationCompletePage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(
      identity: identity,
      useLvm: true,
      useEncryption: true,
    );
  });

  testWidgets('manual partitioning', (tester) async {
    final storage = [
      testDisk(
        path: '/dev/sda',
        partitions: [
          Partition(size: toBytes(6, DataUnit.gigabytes), mount: '/'),
          Partition(size: toBytes(2, DataUnit.gigabytes), mount: '/mnt/test'),
        ],
      ),
    ];

    await app.main(<String>[]);
    await tester.pumpAndSettle();

    await testWelcomePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(tester, mode: InstallationMode.normal);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.manual);
    await tester.pumpAndSettle();

    await testAllocateDiskSpacePage(tester, storage: storage);
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(tester);
    await tester.pumpAndSettle();

    await testWhereAreYouPage(tester);
    await tester.pump();

    await testWhoAreYouPage(
      tester,
      identity: IdentityData(realname: 'a', hostname: 'b', username: 'c'),
      password: 'password',
    );
    await tester.pumpAndSettle();

    await testChooseYourLookPage(tester);
    await tester.pump();

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testInstallationCompletePage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(storage: storage);
  });

  testWidgets('alongside windows', (tester) async {
    await app.main(<String>[
      '--machine-config=examples/win10-along-ubuntu.json',
      '--',
      '--bootloader=uefi',
    ]);
    await tester.pumpAndSettle();

    await testWelcomePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(tester, mode: InstallationMode.normal);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.alongside);
    await tester.pumpAndSettle();

    await testInstallAlongsidePage(tester, sizes: {'sda3 (ntfs)': 40000});
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(tester);
    await tester.pumpAndSettle();

    await testWhereAreYouPage(tester);
    await tester.pump();

    await testWhoAreYouPage(
      tester,
      identity: IdentityData(realname: 'a', hostname: 'b', username: 'c'),
      password: 'password',
    );
    await tester.pumpAndSettle();

    await testChooseYourLookPage(tester);
    await tester.pump();

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testInstallationCompletePage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(storage: [
      testDisk(
        path: '/dev/sda',
        partitions: [
          Partition(number: 3, size: toBytes(40000, DataUnit.megabytes)),
          Partition(number: 6, size: 43298848768, mount: '/'),
        ],
      ),
    ]);
  });

  testWidgets('turn off bitlocker', (tester) async {
    await app.main(<String>[
      '--machine-config',
      'examples/win10.json',
      '--initial-route',
      Routes.installationType,
    ]);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.bitlocker);
    await tester.pumpAndSettle();

    await testTurnOffBitLockerPage(tester);
    await tester.pumpAndSettle();
  });

  testWidgets('try-or-install', (tester) async {
    await app.main(<String>['--try-or-install']);
    await tester.pumpAndSettle();

    await testWelcomePage(tester);
    await tester.pumpAndSettle();

    await testTryOrInstallPage(tester, option: Option.installUbuntu);
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester);
    await tester.pumpAndSettle();
  });
}

Future<void> verifyConfig({
  IdentityData? identity,
  KeyboardSetting? keyboard,
  String? locale,
  String? timezone,
  List<Disk>? storage,
  bool? useLvm,
  bool? useEncryption,
}) async {
  final path = p.join(
    await subiquityPath,
    'var',
    'log',
    'installer',
    'autoinstall-user-data',
  );

  await waitForFile(path);

  final yaml = loadYaml(File(path).readAsStringSync());

  if (identity != null) {
    final actualIdentity = yaml['autoinstall']['identity'];
    expect(actualIdentity['hostname'], equals(identity.hostname));
    expect(actualIdentity['realname'], equals(identity.realname));
    expect(actualIdentity['username'], equals(identity.username));
  }

  if (keyboard != null) {
    final actualKeyboard = yaml['autoinstall']['keyboard'];
    if (keyboard.layout.isNotEmpty) {
      expect(actualKeyboard['layout'], equals(keyboard.layout));
    }
    if (keyboard.variant.isNotEmpty) {
      expect(actualKeyboard['variant'], equals(keyboard.variant));
    }
  }

  if (locale != null) {
    final actualLocale = yaml['autoinstall']['locale'];
    expect(actualLocale, equals(locale));
  }

  if (timezone != null) {
    final actualTimezone = yaml['autoinstall']['timezone'];
    expect(actualTimezone, equals(timezone));
  }

  final actualStorage = yaml['autoinstall']['storage']['config'] as YamlList;

  if (storage != null) {
    for (final disk in storage) {
      final actualDisk = actualStorage.firstWhereOrNull(
          (d) => d['type'] == 'disk' && d['path'] == disk.path);
      expect(actualDisk, isNotNull);

      for (final partition in disk.partitions.whereType<Partition>()) {
        final actualPartition = actualStorage.firstWhereOrNull(
            (d) => d['type'] == 'partition' && d['size'] == partition.size);
        expect(actualPartition, isNotNull);

        if (partition.mount != null) {
          final actualMount = actualStorage.firstWhereOrNull(
              (d) => d['type'] == 'mount' && d['path'] == partition.mount);
          expect(actualMount, isNotNull);
        }
      }
    }
  }

  if (useLvm != null) {
    expect(
        actualStorage
            .where((config) => config['type'] == 'lvm_volgroup')
            .isNotEmpty,
        useLvm);
  }

  if (useEncryption != null) {
    expect(
        actualStorage
            .where((config) => config['type'] == 'dm_crypt')
            .isNotEmpty,
        useEncryption);
  }
}

class FakeDesktopService implements DesktopService {
  @override
  Future<void> inhibit() async {}

  @override
  Future<void> setTheme(Brightness brightness) async {}

  @override
  Future<void> close() async {}
}
