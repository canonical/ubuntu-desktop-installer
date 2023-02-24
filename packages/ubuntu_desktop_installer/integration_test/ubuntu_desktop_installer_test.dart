import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/main.dart' as app;
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaml/yaml.dart';

import '../test/test_utils.dart';

// ignore_for_file: type=lint

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async => await cleanUpSubiquity());
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

    await testConnectToInternetPage(tester, mode: ConnectMode.none);
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

    await testConnectToInternetPage(tester, mode: ConnectMode.none);
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

    await testConnectToInternetPage(tester, mode: ConnectMode.none);
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
      '--bootloader=uefi',
    ]);
    await tester.pumpAndSettle();

    await testWelcomePage(tester);
    await tester.pumpAndSettle();

    await testKeyboardLayoutPage(tester);
    await tester.pumpAndSettle();

    await testConnectToInternetPage(tester, mode: ConnectMode.none);
    await tester.pumpAndSettle();

    await testUpdatesOtherSoftwarePage(tester, mode: InstallationMode.normal);
    await tester.pumpAndSettle();

    await testInstallationTypePage(tester, type: InstallationType.alongside);
    await tester.pumpAndSettle();

    await testInstallAlongsidePage(tester, sizes: {'/dev/sda3 (ntfs)': 40000});
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
      Routes.writeChangesToDisk,
    ]);
    await tester.pumpAndSettle();

    await testWriteChangesToDiskPage(tester);
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

Future<void> testWelcomePage(
  WidgetTester tester, {
  String? language,
}) async {
  await expectPage(tester, WelcomePage, (lang) => lang.welcome);

  await tester.pumpAndSettle(); // auto-scroll

  if (language != null) {
    final tile = find.widgetWithText(ListTile, language, skipOffstage: false);
    await tester.ensureVisible(tile);
    await tester.pump();
    await tester.tap(tile);
    await tester.pump();
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testTryOrInstallPage(
  WidgetTester tester, {
  Option? option,
}) async {
  await expectPage(
      tester, TryOrInstallPage, (lang) => lang.tryOrInstallPageTitle);

  if (option != null) {
    const assets = {
      Option.repairUbuntu: 'repair-wrench',
      Option.tryUbuntu: 'steering-wheel',
      Option.installUbuntu: 'hard-drive',
    };
    await tester.tap(find.widgetWithImage(
        OptionCard, AssetImage('assets/try_or_install/${assets[option]}.png')));
    await tester.pump();
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testKeyboardLayoutPage(
  WidgetTester tester, {
  KeyboardSetting? keyboard,
}) async {
  await expectPage(
      tester, KeyboardLayoutPage, (lang) => lang.keyboardLayoutPageTitle);

  await tester.pumpAndSettle(); // auto-scroll

  if (keyboard != null) {
    if (keyboard.layout.isNotEmpty) {
      final tile =
          find.widgetWithText(ListTile, keyboard.layout, skipOffstage: false);
      await tester.ensureVisible(tile.last);
      await tester.pump();
      await tester.tap(tile.last);
      await tester.pump();
    }
    if (keyboard.variant.isNotEmpty) {
      final tile =
          find.widgetWithText(ListTile, keyboard.variant, skipOffstage: false);
      await tester.ensureVisible(tile.first);
      await tester.pump();
      await tester.tap(tile.first);
      await tester.pump();
    }
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testConnectToInternetPage(
  WidgetTester tester, {
  ConnectMode? mode,
}) async {
  await expectPage(
      tester, ConnectToInternetPage, (lang) => lang.connectToInternetPageTitle);

  if (mode != null) {
    await tester.tapRadioButton<ConnectMode>(mode);
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testUpdatesOtherSoftwarePage(
  WidgetTester tester, {
  InstallationMode? mode,
}) async {
  await expectPage(tester, UpdatesOtherSoftwarePage,
      (lang) => lang.updatesOtherSoftwarePageTitle);

  if (mode != null) {
    await tester.tapRadioButton<InstallationMode>(mode);
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testInstallationTypePage(
  WidgetTester tester, {
  InstallationType? type,
  AdvancedFeature? advancedFeature,
  bool? useEncryption,
}) async {
  await expectPage(
      tester, InstallationTypePage, (lang) => lang.installationTypeTitle);

  if (type != null) {
    await tester.tapRadioButton<InstallationType>(type);
  }
  if (advancedFeature != null) {
    await tester.tapButton(tester.lang.installationTypeAdvancedLabel);
    await tester.pumpAndSettle();

    await tester.tapRadioButton<AdvancedFeature>(advancedFeature);
    await tester.pump();

    if (useEncryption != null) {
      await tester.toggleCheckbox(
        label: tester.lang.installationTypeEncrypt('Ubuntu'),
        value: true,
      );
    }

    await tester.tapButton(tester.lang.okButtonText);
  }

  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testChooseSecurityKeyPage(
  WidgetTester tester, {
  required String securityKey,
}) async {
  await expectPage(
      tester, ChooseSecurityKeyPage, (lang) => lang.chooseSecurityKeyTitle);

  await tester.enterTextValue(
    label: tester.lang.chooseSecurityKey,
    value: securityKey,
  );
  await tester.enterTextValue(
    label: tester.lang.confirmSecurityKey,
    value: securityKey,
  );

  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testAllocateDiskSpacePage(
  WidgetTester tester, {
  List<Disk>? storage,
}) async {
  await expectPage(
      tester, AllocateDiskSpacePage, (lang) => lang.allocateDiskSpace);

  await tester.tapButton(tester.lang.newPartitionTable);
  await tester.pumpAndSettle();

  for (final disk in storage ?? []) {
    for (final partition in disk.partitions ?? const <Partition>[]) {
      // TODO: find the correct "free space" slot when there are multiple disks
      await tester.tap(find.text(tester.lang.freeDiskSpace).last);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      if (partition.size != null) {
        final size = fromBytes(partition.size, DataUnit.megabytes);
        await tester.tap(find.byType(SpinBox));
        await tester.enterText(find.byType(SpinBox), '${size.round()}');
        await tester.pump();
      }

      if (partition.mount != null) {
        await tester.tap(find.byType(TextFormField));
        await tester.enterText(find.byType(TextFormField), partition.mount!);
        await tester.pump();
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
      }

      await tester.tapButton(tester.lang.okButtonText);
      await tester.pumpAndSettle();
    }
    await tester.pumpAndSettle();
  }

  await tester.tapContinue();
}

Future<void> testInstallAlongsidePage(
  WidgetTester tester, {
  Map<String, int> sizes = const {},
}) async {
  final productInfo = ProductInfoExtractor().getProductInfo();
  await expectPage(tester, InstallAlongsidePage,
      (lang) => lang.installationTypeAlongsideUnknown(productInfo));

  for (final entry in sizes.entries) {
    await tester.tap(find.ancestor(
      of: find.textContaining(entry.key),
      matching: find.byType(OutlinedButton),
    ));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(SpinBox), entry.value.toString());
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pumpAndSettle();
  }

  await tester.tapButton(tester.lang.selectGuidedStorageInstallNow);
}

Future<void> testWriteChangesToDiskPage(WidgetTester tester) async {
  await expectPage(
      tester, WriteChangesToDiskPage, (lang) => lang.writeChangesToDisk);

  await tester.tapButton(tester.lang.startInstallingButtonText);
}

Future<void> testTurnOffBitLockerPage(WidgetTester tester) async {
  await expectPage(
      tester, TurnOffBitLockerPage, (lang) => lang.turnOffBitlockerTitle);

  final windowClosed = waitForWindowClosed();
  await tester.tapButton(tester.lang.restartIntoWindows);
  await expectLater(windowClosed, completion(isTrue));
}

Future<void> testWhereAreYouPage(
  WidgetTester tester, {
  String? location,
  String? timezone,
}) async {
  await expectPage(
      tester, WhereAreYouPage, (lang) => lang.whereAreYouPageTitle);

  await tester.pumpAndSettle(); // progress indicator

  if (location != null) {
    await tester.enterText(
      find.widgetWithText(TextField, tester.lang.whereAreYouLocationLabel),
      location,
    );
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  if (timezone != null) {
    await tester.enterText(
      find.widgetWithText(TextField, tester.lang.whereAreYouTimezoneLabel),
      timezone,
    );
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testWhoAreYouPage(
  WidgetTester tester, {
  IdentityData? identity,
  String? password,
}) async {
  await expectPage(tester, WhoAreYouPage, (lang) => lang.whoAreYouPageTitle);

  if (identity?.realname != null) {
    await tester.enterTextValue(
      label: tester.lang.whoAreYouPageRealNameLabel,
      value: identity!.realname,
    );
  }
  if (identity?.hostname != null) {
    await tester.enterTextValue(
      label: tester.lang.whoAreYouPageComputerNameLabel,
      value: identity!.hostname,
    );
  }
  if (identity?.username != null) {
    await tester.enterTextValue(
      label: tester.lang.whoAreYouPageUsernameLabel,
      value: identity!.username,
    );
  }
  if (password != null) {
    await tester.enterTextValue(
      label: tester.lang.whoAreYouPagePasswordLabel,
      value: password,
    );
    await tester.enterTextValue(
      label: tester.lang.whoAreYouPageConfirmPasswordLabel,
      value: password,
    );
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testChooseYourLookPage(
  WidgetTester tester, {
  Brightness? theme,
}) async {
  await expectPage(
      tester, ChooseYourLookPage, (lang) => lang.chooseYourLookPageTitle);

  if (theme != null) {
    final asset = find.asset('assets/choose_your_look/${theme.name}-theme.png');
    expect(asset, findsOneWidget);
    await tester.tap(asset);
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testInstallationSlidesPage(WidgetTester tester) async {
  await tester.pumpUntil(find.byType(InstallationSlidesPage));
  expect(find.byType(InstallationSlidesPage), findsOneWidget);
}

Future<void> testInstallationCompletePage(WidgetTester tester) async {
  await expectPage(tester, InstallationCompletePage,
      (lang) => lang.installationCompleteTitle);

  final windowClosed = waitForWindowClosed();
  await tester.tapButton(tester.lang.continueTesting);
  await expectLater(windowClosed, completion(isTrue));
}

Future<void> expectPage(
  WidgetTester tester,
  Type page,
  String Function(AppLocalizations lang) title,
) async {
  await tester.pumpUntil(find.byType(page));
  expect(find.byType(page), findsOneWidget);
  expect(find.widgetWithText(AppBar, title(tester.lang)), findsOneWidget);
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
