import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test/test_utils.dart';

Future<void> testLocalePage(
  WidgetTester tester, {
  String? language,
  String? screenshot,
}) async {
  await expectPage(
      tester, LocalePage, (lang) => lang.welcomePageTitle('Ubuntu'));

  await tester.pumpAndSettle(); // auto-scroll

  if (language != null) {
    final tile = find.widgetWithText(ListTile, language, skipOffstage: false);
    await tester.ensureVisible(tile);
    await tester.pump();
    await tester.tap(tile);
    await tester.pump();
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testTryOrInstallPage(
  WidgetTester tester, {
  Option? option,
  String? screenshot,
}) async {
  await expectPage(
      tester, TryOrInstallPage, (lang) => lang.tryOrInstallPageTitle('Ubuntu'));

  if (option != null) {
    final labels = {
      Option.repairUbuntu: tester.lang.repairInstallation,
      Option.tryUbuntu: tester.lang.tryUbuntu('Ubuntu'),
      Option.installUbuntu: tester.lang.installUbuntu('Ubuntu'),
    };
    await tester
        .tap(find.widgetWithText(YaruRadioButton<Option>, labels[option]!));
    await tester.pump();
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testKeyboardLayoutPage(
  WidgetTester tester, {
  KeyboardSetting? keyboard,
  String? screenshot,
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

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);

    await tester.tapButton(tester.lang.detectButtonText);
    await tester.pumpAndSettle();

    await takeScreenshot(tester, '$screenshot-detect');

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
  }

  await tester.tapContinue();
}

Future<void> testNetworkPage(
  WidgetTester tester, {
  ConnectMode? mode,
  String? screenshot,
}) async {
  await expectPage(
      tester, NetworkPage, (lang) => lang.connectToInternetPageTitle);

  if (mode != null) {
    await tester.tapRadioButton<ConnectMode>(mode);
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testUpdatesOtherSoftwarePage(
  WidgetTester tester, {
  String? sourceId,
  String? screenshot,
}) async {
  await expectPage(tester, UpdatesOtherSoftwarePage,
      (lang) => lang.updatesOtherSoftwarePageTitle);

  if (sourceId != null) {
    await tester.tapRadioButton<String>(sourceId);
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testNotEnoughDiskSpacePage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await expectPage(
      tester, NotEnoughDiskSpacePage, (lang) => lang.notEnoughDiskSpaceTitle);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  final windowClosed = YaruTestWindow.waitForClosed();
  await tester.tapButton(tester.lang.quitButtonText);
  await expectLater(windowClosed, completes);
}

Future<void> testInstallationTypePage(
  WidgetTester tester, {
  InstallationType? type,
  AdvancedFeature? advancedFeature,
  bool? useEncryption,
  String? screenshot,
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

    await tester.pumpAndSettle();

    if (screenshot != null) {
      await takeScreenshot(tester, screenshot);
    }

    await tester.tapButton(tester.lang.okButtonText);
  }

  await tester.pumpAndSettle();

  if (advancedFeature == null && screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testChooseSecurityKeyPage(
  WidgetTester tester, {
  required String securityKey,
  String? screenshot,
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

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testAllocateDiskSpacePage(
  WidgetTester tester, {
  List<Disk>? storage,
  String? screenshot,
}) async {
  await expectPage(
      tester, AllocateDiskSpacePage, (lang) => lang.allocateDiskSpace);

  await tester.tapButton(tester.lang.newPartitionTable);
  await tester.pumpAndSettle();

  for (final disk in storage ?? const <Disk>[]) {
    for (final partition in disk.partitions.whereType<Partition>()) {
      // TODO: find the correct "free space" slot when there are multiple disks
      await tester.tap(find.text(tester.lang.freeDiskSpace).last);
      await tester.pump();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      if (partition.size != null) {
        final size = fromBytes(partition.size!, DataUnit.megabytes);
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

      await tester.pumpAndSettle();

      if (screenshot != null) {
        await takeScreenshot(tester, '$screenshot-${partition.sysname}');
      }

      await tester.tapButton(tester.lang.okButtonText);
      await tester.pumpAndSettle();
    }
    await tester.pumpAndSettle();
  }

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testSelectGuidedStoragePage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await expectPage(tester, SelectGuidedStoragePage,
      (lang) => lang.selectGuidedStoragePageTitle('Ubuntu'));

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.selectGuidedStorageInstallNow);
}

Future<void> testInstallAlongsidePage(
  WidgetTester tester, {
  Map<String, int> sizes = const {},
  String? screenshot,
}) async {
  final productInfo = getService<ProductService>().getProductInfo();
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

    if (screenshot != null) {
      await takeScreenshot(tester, '$screenshot-${entry.key.split(' ').first}');
    }

    await tester.tapButton(tester.lang.okButtonText);
    await tester.pumpAndSettle();
  }

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.selectGuidedStorageInstallNow);
}

Future<void> testWriteChangesToDiskPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await expectPage(
      tester, WriteChangesToDiskPage, (lang) => lang.writeChangesToDisk);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.startInstallingButtonText);
}

Future<void> testBitLockerPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await expectPage(tester, BitLockerPage, (lang) => lang.turnOffBitlockerTitle);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.restartIntoWindows);
  expect(find.byType(AlertDialog), findsOneWidget);
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, '$screenshot-confirm');
  }

  final windowClosed = YaruTestWindow.waitForClosed();
  await tester.tapButton(tester.lang.restartButtonText);
  await expectLater(windowClosed, completes);
}

Future<void> testRstPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await expectPage(tester, RstPage, (lang) => lang.turnOffRST);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.restartIntoWindows);
  expect(find.byType(AlertDialog), findsOneWidget);
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, '$screenshot-confirm');
  }

  final windowClosed = YaruTestWindow.waitForClosed();
  await tester.tapButton(tester.lang.restartButtonText);
  await expectLater(windowClosed, completes);
}

Future<void> testTimezonePage(
  WidgetTester tester, {
  String? location,
  String? timezone,
  String? screenshot,
}) async {
  await expectPage(tester, TimezonePage, (lang) => lang.whereAreYouPageTitle);

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

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testIdentityPage(
  WidgetTester tester, {
  IdentityData? identity,
  String? password,
  String? screenshot,
}) async {
  await expectPage(tester, IdentityPage, (lang) => lang.whoAreYouPageTitle);

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

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testActiveDirectoryPage(
  WidgetTester tester, {
  String? domainName,
  String? adminName,
  String? password,
  String? screenshot,
}) async {
  await expectPage(
      tester, ActiveDirectoryPage, (lang) => lang.activeDirectoryTitle);

  if (domainName != null) {
    await tester.enterTextValue(
      label: tester.lang.activeDirectoryDomainLabel,
      value: domainName,
    );
  }
  if (adminName != null) {
    await tester.enterTextValue(
      label: tester.lang.activeDirectoryAdminLabel,
      value: adminName,
    );
  }
  if (password != null) {
    await tester.enterTextValue(
      label: tester.lang.activeDirectoryPasswordLabel,
      value: password,
    );
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testThemePage(
  WidgetTester tester, {
  Brightness? theme,
  String? screenshot,
}) async {
  await expectPage(tester, ThemePage, (lang) => lang.chooseYourLookPageTitle);

  if (theme != null) {
    final asset = find.asset('assets/theme/${theme.name}-theme.png');
    expect(asset, findsOneWidget);
    await tester.tap(asset);
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapContinue();
}

Future<void> testInstallationSlidesPage(WidgetTester tester) async {
  await tester.pumpUntil(find.byType(InstallationSlidesPage));
  expect(find.byType(InstallationSlidesPage), findsOneWidget);
}

Future<void> testInstallationCompletePage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await expectPage(tester, InstallationCompletePage,
      (lang) => lang.installationCompleteTitle);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  final windowClosed = YaruTestWindow.waitForClosed();
  await tester.tapButton(tester.lang.continueTesting);
  await expectLater(windowClosed, completes);
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

Future<void> takeScreenshot(WidgetTester tester, String screenshot) async {
  // avoid blinking cursors to keep the screenshots deterministic
  primaryFocus?.unfocus();
  await tester.pumpAndSettle();

  await expectLater(
    find.byType(UbuntuDesktopInstallerApp),
    matchesGoldenFile('screenshots/$screenshot.png'),
  );
}
