import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/ubuntu_bootstrap.dart';
import 'package:ubuntu_desktop_installer/main.dart' as app;
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_provision_test/ubuntu_provision_test.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:yaml/yaml.dart';
import 'package:yaru_test/yaru_test.dart';

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
    const keyboard = KeyboardSetting(layout: 'fr', variant: 'latin9');
    const timezone = 'Europe/Paris';
    const identity = Identity(
      realname: 'User',
      hostname: 'ubuntu',
      username: 'user',
    );

    await tester.runApp(() => app.main(<String>[]));
    await tester.pumpAndSettle();

    await tester.testLocalePage(language: language);
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectLocale(locale);

    await tester.testKeyboardPage(layout: language);
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectKeyboard(keyboard);

    await tester.testNetworkPage(mode: ConnectMode.none);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testRefreshPage();
    await tester.tapSkip();
    await tester.pumpAndSettle();

    await tester.testSourcePage(sourceId: kMinimalSourceId);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.erase);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testConfirmPage();
    await tester.tapConfirm();
    await tester.pumpAndSettle();

    await tester.testTimezonePage(timezone: timezone);
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectTimezone(timezone);

    await tester.testIdentityPage(identity: identity, password: 'password');
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectIdentity(identity);

    await tester.testThemePage();
    await tester.tapNext();
    await tester.pump();

    await tester.testInstallPage();
    await tester.pumpAndSettle();

    final windowClosed = YaruTestWindow.waitForClosed();
    await tester.tapContinueTesting();
    await expectLater(windowClosed, completes);

    await verifySubiquityConfig(
      identity: identity,
      keyboard: keyboard,
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

    await tester.testLocalePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testKeyboardPage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testNetworkPage(mode: ConnectMode.none);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testRefreshPage();
    await tester.tapSkip();
    await tester.pumpAndSettle();

    await tester.testSourcePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testStoragePage(
      type: StorageType.erase,
      guidedCapability: GuidedCapability.LVM_LUKS,
    );
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testSecurityKeyPage(securityKey: 'password');
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testConfirmPage();
    await tester.tapConfirm();
    await tester.pumpAndSettle();

    await tester.testTimezonePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testIdentityPage(identity: identity, password: 'password');
    await tester.tapNext();
    await tester.pumpAndSettle();
    await expectIdentity(identity);

    await tester.testThemePage();
    await tester.tapNext();
    await tester.pump();

    await tester.testInstallPage();
    await tester.pumpAndSettle();

    final windowClosed = YaruTestWindow.waitForClosed();
    await tester.tapContinueTesting();
    await expectLater(windowClosed, completes);

    await verifySubiquityConfig(
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

    await tester.testLocalePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testKeyboardPage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testNetworkPage(mode: ConnectMode.none);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testRefreshPage();
    await tester.tapSkip();
    await tester.pumpAndSettle();

    await tester.testSourcePage(sourceId: kNormalSourceId);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.manual);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testManualStoragePage(storage: storage);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testConfirmPage();
    await tester.tapConfirm();
    await tester.pumpAndSettle();

    await tester.testTimezonePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testIdentityPage(
      identity: const Identity(realname: 'a', hostname: 'b', username: 'c'),
      password: 'password',
    );
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testThemePage();
    await tester.tapNext();
    await tester.pump();

    await tester.testInstallPage();
    await tester.pumpAndSettle();

    final windowClosed = YaruTestWindow.waitForClosed();
    await tester.tapContinueTesting();
    await expectLater(windowClosed, completes);

    await verifySubiquityConfig(storage: storage);
  });

  testWidgets('alongside windows', (tester) async {
    await tester.runApp(() => app.main(<String>[
          '--machine-config=examples/machines/win10-along-ubuntu.json',
          '--',
          '--bootloader=uefi',
        ]));
    await tester.pumpAndSettle();

    await tester.testLocalePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testKeyboardPage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testNetworkPage(mode: ConnectMode.none);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testRefreshPage();
    await tester.tapSkip();
    await tester.pumpAndSettle();

    await tester.testSourcePage(sourceId: kNormalSourceId);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.alongside);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testGuidedResizePage(sizes: {'sda3 (ntfs)': 40000});
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testConfirmPage();
    await tester.tapConfirm();
    await tester.pumpAndSettle();

    await tester.testTimezonePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testIdentityPage(
      identity: const Identity(realname: 'a', hostname: 'b', username: 'c'),
      password: 'password',
    );
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testThemePage();
    await tester.tapNext();
    await tester.pump();

    await tester.testInstallPage();
    await tester.pumpAndSettle();

    final windowClosed = YaruTestWindow.waitForClosed();
    await tester.tapContinueTesting();
    await expectLater(windowClosed, completes);

    await verifySubiquityConfig(storage: [
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
          '--machine-config=examples/machines/win10.json',
        ]));
    await tester.pumpAndSettle();

    await tester.testLocalePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testKeyboardPage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testNetworkPage(mode: ConnectMode.none);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testRefreshPage();
    await tester.tapSkip();
    await tester.pumpAndSettle();

    await tester.testSourcePage(sourceId: kNormalSourceId);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testStoragePage(type: StorageType.alongside);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testBitLockerPage();
    await tester.pumpAndSettle();

    final windowClosed = YaruTestWindow.waitForClosed();
    await tester.tapRestart();
    await expectLater(windowClosed, completes);
  });

  testWidgets('welcome', (tester) async {
    await tester.runApp(() => app.main(<String>['--welcome']));
    await tester.pumpAndSettle();

    await tester.testLocalePage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testWelcomePage(option: Option.welcomeInstallOption);
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testKeyboardPage();
    await tester.pumpAndSettle();
  });

  testWidgets('semi-automated autoinstall', (tester) async {
    await tester.runApp(() => app.main(<String>[
          '--',
          '--autoinstall=examples/autoinstall/interactive.yaml',
        ]));
    await tester.pumpAndSettle();

    await tester.testNetworkPage();
    await tester.tapNext();
    await tester.pumpAndSettle();

    await tester.testConfirmPage();
    await tester.tapConfirm();
    await tester.pump();

    await tester.testInstallPage();
    await tester.pumpAndSettle();

    final windowClosed = YaruTestWindow.waitForClosed();
    await tester.tapRestartNow();
    await expectLater(windowClosed, completes);
  });
}

Future<void> verifySubiquityConfig({
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
  Future<void> close() async {}
}
