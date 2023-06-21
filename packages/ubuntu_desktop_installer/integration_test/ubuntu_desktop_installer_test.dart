import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/main.dart' as app;
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaml/yaml.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_pages.dart';

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
    const identity = Identity(
      realname: 'User',
      hostname: 'ubuntu',
      username: 'user',
    );

    await tester.runApp(() => app.main(<String>[]));
    await tester.pumpAndSettle();

    await testLocalePage(tester, language: language);
    await tester.pumpAndSettle();

    await testKeyboardPage(tester, keyboard: keyboardLayout);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testSourcePage(tester, sourceId: kMinimalSourceId);
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.erase);
    await tester.pumpAndSettle();

    await testConfirmPage(tester);
    await tester.pumpAndSettle();

    await testTimezonePage(tester, timezone: timezone);
    await tester.pump();

    await testIdentityPage(
      tester,
      identity: identity,
      password: 'password',
    );
    await tester.pumpAndSettle();

    await testThemePage(tester);
    await tester.pump();

    await testInstallPage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(
      identity: identity,
      keyboard: keyboardSetting,
      locale: locale,
      timezone: timezone,
    );
  });

  testWidgets('guided lvm + encryption', (tester) async {
    const identity = Identity(
      realname: 'User',
      hostname: 'ubuntu',
      username: 'user',
    );

    await tester.runApp(() => app.main(<String>[]));
    await tester.pumpAndSettle();

    await testLocalePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testSourcePage(tester);
    await tester.pumpAndSettle();

    await testStoragePage(
      tester,
      type: StorageType.erase,
      advancedFeature: AdvancedFeature.lvm,
      useEncryption: true,
    );
    await tester.pumpAndSettle();

    await testSecurityKeyPage(tester, securityKey: 'password');
    await tester.pumpAndSettle();

    await testConfirmPage(tester);
    await tester.pumpAndSettle();

    await testTimezonePage(tester);
    await tester.pump();

    await testIdentityPage(
      tester,
      identity: identity,
      password: 'password',
    );
    await tester.pump();

    await testThemePage(tester);
    await tester.pump();

    await testInstallPage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(
      identity: identity,
      useLvm: true,
      useEncryption: true,
    );
  });

  testWidgets('manual partitioning', (tester) async {
    final storage = [
      fakeDisk(
        path: '/dev/sda',
        partitions: [
          Partition(size: toBytes(6, DataUnit.gigabytes), mount: '/'),
          Partition(size: toBytes(2, DataUnit.gigabytes), mount: '/mnt/test'),
        ],
      ),
    ];

    await tester.runApp(() => app.main(<String>[]));
    await tester.pumpAndSettle();

    await testLocalePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testSourcePage(tester, sourceId: kNormalSourceId);
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.manual);
    await tester.pumpAndSettle();

    await testManualStoragePage(tester, storage: storage);
    await tester.pumpAndSettle();

    await testConfirmPage(tester);
    await tester.pumpAndSettle();

    await testTimezonePage(tester);
    await tester.pump();

    await testIdentityPage(
      tester,
      identity: const Identity(realname: 'a', hostname: 'b', username: 'c'),
      password: 'password',
    );
    await tester.pumpAndSettle();

    await testThemePage(tester);
    await tester.pump();

    await testInstallPage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(storage: storage);
  });

  testWidgets('alongside windows', (tester) async {
    await tester.runApp(() => app.main(<String>[
          '--machine-config=examples/win10-along-ubuntu.json',
          '--',
          '--bootloader=uefi',
        ]));
    await tester.pumpAndSettle();

    await testLocalePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testSourcePage(tester, sourceId: kNormalSourceId);
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.alongside);
    await tester.pumpAndSettle();

    await testGuidedResizePage(tester, sizes: {'sda3 (ntfs)': 40000});
    await tester.pumpAndSettle();

    await testConfirmPage(tester);
    await tester.pumpAndSettle();

    await testTimezonePage(tester);
    await tester.pump();

    await testIdentityPage(
      tester,
      identity: const Identity(realname: 'a', hostname: 'b', username: 'c'),
      password: 'password',
    );
    await tester.pumpAndSettle();

    await testThemePage(tester);
    await tester.pump();

    await testInstallPage(tester);
    await tester.pumpAndSettle();

    await verifyConfig(storage: [
      fakeDisk(
        path: '/dev/sda',
        partitions: [
          Partition(number: 3, size: toBytes(40000, DataUnit.megabytes)),
          const Partition(number: 6, size: 43298848768, mount: '/'),
        ],
      ),
    ]);
  });

  testWidgets('turn off bitlocker', (tester) async {
    await tester.runApp(() => app.main(<String>[
          '--machine-config',
          'examples/win10.json',
        ]));
    await tester.pumpAndSettle();

    await testLocalePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardPage(tester);
    await tester.pumpAndSettle();

    await testNetworkPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testSourcePage(tester, sourceId: kNormalSourceId);
    await tester.pumpAndSettle();

    await testStoragePage(tester, type: StorageType.alongside);
    await tester.pumpAndSettle();

    await testBitLockerPage(tester);
    await tester.pumpAndSettle();
  });

  testWidgets('welcome', (tester) async {
    await tester.runApp(() => app.main(<String>['--welcome']));
    await tester.pumpAndSettle();

    await testLocalePage(tester);
    await tester.pumpAndSettle();

    await testWelcomePage(tester, option: Option.installUbuntu);
    await tester.pumpAndSettle();

    await testKeyboardPage(tester);
    await tester.pumpAndSettle();
  });

  testWidgets('semi-automated autoinstall', (tester) async {
    await tester.runApp(() => app.main(<String>[
          '--',
          '--autoinstall=examples/autoinstall-interactive.yaml',
        ]));
    await tester.pumpAndSettle();

    await testNetworkPage(tester);
    await tester.pumpAndSettle();

    await testConfirmPage(tester);
    await tester.pumpAndSettle();

    await testInstallPage(tester);
    await tester.pumpAndSettle();
  });
}

Future<void> verifyConfig({
  Identity? identity,
  KeyboardSetting? keyboard,
  String? locale,
  String? timezone,
  List<Disk>? storage,
  bool? useLvm,
  bool? useEncryption,
}) async {
  final path = await getSubiquityLogFile('autoinstall-user-data');
  await expectLater(path, existsLater);

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
