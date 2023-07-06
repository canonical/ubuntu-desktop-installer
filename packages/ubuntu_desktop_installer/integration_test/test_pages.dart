import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test/test_utils.dart';

Future<void> testLocalePage(
  WidgetTester tester, {
  String? language,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(LocalePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.localePageTitle('Ubuntu')),
    findsOneWidget,
  );

  if (language != null) {
    final tile = find.listTile(language, skipOffstage: false);
    await tester.ensureVisible(tile);
    await tester.pump();
    await tester.tap(tile);
    await tester.pump();
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testWelcomePage(
  WidgetTester tester, {
  Option? option,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(WelcomePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.welcomePageTitle('Ubuntu')),
    findsOneWidget,
  );

  if (option != null) {
    await tester.tap(find.radio<Option>(option));
    await tester.pump();
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testKeyboardPage(
  WidgetTester tester, {
  KeyboardSetting? keyboard,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(KeyboardPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.keyboardTitle),
    findsOneWidget,
  );

  if (keyboard != null) {
    if (keyboard.layout.isNotEmpty) {
      final tile = find.listTile(keyboard.layout, skipOffstage: false);
      await tester.ensureVisible(tile.last);
      await tester.pump();
      await tester.tap(tile.last);
      await tester.pump();
    }
    if (keyboard.variant.isNotEmpty) {
      final tile = find.listTile(keyboard.variant, skipOffstage: false);
      await tester.ensureVisible(tile.first);
      await tester.pump();
      await tester.tap(tile.first);
      await tester.pump();
    }
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);

    await tester.tapButton(tester.lang.keyboardDetectButton);
    await tester.pumpAndSettle();

    await takeScreenshot(tester, '$screenshot-detect');

    await tester.tap(find.descendant(
        of: find.byType(AlertDialog),
        matching: find.byType(YaruWindowControl)));
    await tester.pumpAndSettle();
  }

  await tester.tapNext();
}

Future<void> testNetworkPage(
  WidgetTester tester, {
  ConnectMode? mode,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(NetworkPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.connectToInternetPageTitle),
    findsOneWidget,
  );

  if (mode != null) {
    await tester.tapRadio<ConnectMode>(mode);
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testSourcePage(
  WidgetTester tester, {
  String? sourceId,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(SourcePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.updatesOtherSoftwarePageTitle),
    findsOneWidget,
  );

  if (sourceId != null) {
    await tester.tapRadio<String>(sourceId);
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testNotEnoughDiskSpacePage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await tester.pumpUntilPage(NotEnoughDiskSpacePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.notEnoughDiskSpaceTitle),
    findsOneWidget,
  );

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  final windowClosed = YaruTestWindow.waitForClosed();
  await tester.tapButton(tester.lang.quitButtonText);
  await expectLater(windowClosed, completes);
}

Future<void> testStoragePage(
  WidgetTester tester, {
  StorageType? type,
  AdvancedFeature? advancedFeature,
  bool? useEncryption,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(StoragePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.installationTypeTitle),
    findsOneWidget,
  );

  if (type != null) {
    await tester.tapRadio<StorageType>(type);
    await tester.pump();
  }
  if (advancedFeature != null) {
    await tester.tapButton(tester.lang.installationTypeAdvancedLabel);
    await tester.pumpAndSettle();

    await tester.tapRadio<AdvancedFeature>(advancedFeature);
    await tester.pump();

    if (useEncryption != null) {
      await tester.toggleButton(
        tester.lang.installationTypeEncrypt('Ubuntu'),
        true,
      );
    }

    await tester.pumpAndSettle();

    if (screenshot != null) {
      await takeScreenshot(tester, screenshot);
    }

    await tester.tapOk();
  }

  await tester.pumpAndSettle();

  if (advancedFeature == null && screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testSecurityKeyPage(
  WidgetTester tester, {
  required String securityKey,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(SecurityKeyPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.chooseSecurityKeyTitle),
    findsOneWidget,
  );

  await tester.enterText(
    find.textField(tester.lang.chooseSecurityKey),
    securityKey,
  );
  await tester.enterText(
    find.textField(tester.lang.confirmSecurityKey),
    securityKey,
  );

  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testManualStoragePage(
  WidgetTester tester, {
  List<Disk>? storage,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(ManualStoragePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.allocateDiskSpace),
    findsOneWidget,
  );

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

      await tester.tapOk();
      await tester.pumpAndSettle();
    }
    await tester.pumpAndSettle();
  }

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testGuidedReformatPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await tester.pumpUntilPage(GuidedReformatPage);
  expect(
    find.title(
        (AppLocalizations l10n) => l10n.selectGuidedStoragePageTitle('Ubuntu')),
    findsOneWidget,
  );

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testGuidedResizePage(
  WidgetTester tester, {
  Map<String, int> sizes = const {},
  String? screenshot,
}) async {
  await tester.pumpUntilPage(GuidedResizePage);
  final productInfo = getService<ProductService>().getProductInfo();
  expect(
    find.title((AppLocalizations l10n) =>
        l10n.installationTypeAlongsideUnknown(productInfo)),
    findsOneWidget,
  );

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

    await tester.tapOk();
    await tester.pumpAndSettle();
  }

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testConfirmPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await tester.pumpUntilPage(ConfirmPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.confirmPageTitle),
    findsOneWidget,
  );

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.confirmInstallButton);
}

Future<void> testBitLockerPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await tester.pumpUntilPage(BitLockerPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.bitlockerTitle),
    findsOneWidget,
  );

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.restartIntoWindows);
  await tester.pumpAndSettle();
  expect(find.byType(AlertDialog), findsOneWidget);

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
  await tester.pumpUntilPage(RstPage);
  expect(find.title((AppLocalizations l10n) => l10n.rstTitle), findsOneWidget);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapButton(tester.lang.restartIntoWindows);
  await tester.pumpAndSettle();
  expect(find.byType(AlertDialog), findsOneWidget);

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
  await tester.pumpUntilPage(TimezonePage);

  final context = tester.element(find.byType(TimezonePage));
  final l10n = TimezoneLocalizations.of(context);
  expect(find.widgetWithText(YaruWindowTitleBar, l10n.timezonePageTitle),
      findsOneWidget);

  if (location != null) {
    await tester.enterText(
      find.textField(l10n.timezoneLocationLabel),
      location,
    );
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
  }

  if (timezone != null) {
    await tester.enterText(
      find.textField(l10n.timezoneTimezoneLabel),
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

  await tester.tapNext();
}

Future<void> testIdentityPage(
  WidgetTester tester, {
  Identity? identity,
  String? password,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(IdentityPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.identityPageTitle),
    findsOneWidget,
  );

  if (identity?.realname != null) {
    await tester.enterText(
      find.textField(tester.lang.identityRealNameLabel),
      identity!.realname,
    );
  }
  if (identity?.hostname != null) {
    await tester.enterText(
      find.textField(tester.lang.identityHostnameLabel),
      identity!.hostname,
    );
  }
  if (identity?.username != null) {
    await tester.enterText(
      find.textField(tester.lang.identityUsernameLabel),
      identity!.username,
    );
  }
  if (password != null) {
    await tester.enterText(
      find.textField(tester.lang.identityPasswordLabel),
      password,
    );
    await tester.enterText(
      find.textField(tester.lang.identityConfirmPasswordLabel),
      password,
    );
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testActiveDirectoryPage(
  WidgetTester tester, {
  String? domainName,
  String? adminName,
  String? password,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(ActiveDirectoryPage);
  expect(
    find.title((AppLocalizations l10n) => l10n.activeDirectoryTitle),
    findsOneWidget,
  );

  if (domainName != null) {
    await tester.enterText(
      find.textField(tester.lang.activeDirectoryDomainLabel),
      domainName,
    );
  }
  if (adminName != null) {
    await tester.enterText(
      find.textField(tester.lang.activeDirectoryAdminLabel),
      adminName,
    );
  }
  if (password != null) {
    await tester.enterText(
      find.textField(tester.lang.activeDirectoryPasswordLabel),
      password,
    );
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testThemePage(
  WidgetTester tester, {
  Brightness? theme,
  String? screenshot,
}) async {
  await tester.pumpUntilPage(ThemePage);
  expect(
    find.title((AppLocalizations l10n) => l10n.themePageTitle),
    findsOneWidget,
  );

  if (theme != null) {
    final asset = find.asset('assets/theme/${theme.name}-theme.png');
    expect(asset, findsOneWidget);
    await tester.tap(asset);
  }
  await tester.pumpAndSettle();

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.tapNext();
}

Future<void> testInstallPage(
  WidgetTester tester, {
  String? screenshot,
}) async {
  await tester.pumpUntilPage(InstallPage);

  if (screenshot != null) {
    await takeScreenshot(tester, screenshot);
  }

  await tester.pumpUntil(find.button(tester.lang.continueTesting));

  final windowClosed = YaruTestWindow.waitForClosed();
  await tester.tapButton(tester.lang.continueTesting);
  await expectLater(windowClosed, completes);
}

extension on WidgetTester {
  Future<void> pumpUntilPage(Type page) async {
    await pumpUntil(find.byType(page));
    await pumpAndSettle();
  }
}

extension on CommonFinders {
  Finder title<T>(LocalizationFunction<T> tr) {
    return find.ancestor(
      of: find.l10n<T>(tr),
      matching: find.byType(YaruWindowTitleBar),
    );
  }
}

Future<void> takeScreenshot(WidgetTester tester, String screenshot) async {
  // avoid blinking cursors to keep the screenshots deterministic
  primaryFocus?.unfocus();
  await tester.pumpAndSettle();

  await expectLater(
    find.byType(WizardApp),
    matchesGoldenFile('screenshots/$screenshot.png'),
  );
}
