import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_reformat/guided_reformat_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_reformat/guided_reformat_page.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import 'test_guided_reformat.dart';

void main() {
  final testDisks = <Disk>[
    fakeDisk(path: '/dev/sda', size: 12, model: 'SDA', vendor: 'ATA'),
    fakeDisk(path: '/dev/sdb', size: 23, model: 'SDB', vendor: 'ATA'),
  ];
  final testStorages = testDisks
      .map((disk) => GuidedStorageTargetReformat(diskId: disk.id))
      .toList();

  Widget buildPage(GuidedReformatModel model) {
    return ProviderScope(
      overrides: [guidedReformatModelProvider.overrideWith((_) => model)],
      child: const GuidedReformatPage(),
    );
  }

  testWidgets('list of guided storages', (tester) async {
    final model = buildGuidedReformatModel(
      storages: testStorages,
      disks: testDisks,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(MenuButtonBuilder<int>));
    await tester.pumpAndSettle();

    for (final disk in testDisks) {
      expect(
        find.descendant(
          of: find.byType(MenuItemButton),
          matching: find.textContaining(disk.sysname),
        ),
        findsOneWidget,
      );
    }
  });

  testWidgets('select a guided storage', (tester) async {
    final model = buildGuidedReformatModel(
      storages: testStorages,
      disks: testDisks,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(MenuButtonBuilder<int>));
    await tester.pumpAndSettle();
    await tester.pump();

    final dropdownItem = find.descendant(
      of: find.byType(MenuItemButton),
      matching: find.byKey(const ValueKey(1)),
    );
    await tester.ensureVisible(dropdownItem.last);
    await tester.tap(dropdownItem.last);
    verify(model.selectStorage(1)).called(1);
  });

  testWidgets('selected guided storage', (tester) async {
    final selectedDisk = testDisks.last;
    final selectedStorage = testStorages.last;
    final model = buildGuidedReformatModel(
      disks: testDisks,
      storages: testStorages,
      selectedDisk: selectedDisk,
      selectedStorage: selectedStorage,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    expect(find.text(selectedDisk.sysname), findsOneWidget);
    final context = tester.element(find.byType(GuidedReformatPage));
    expect(
        find.text(context.formatByteSize(selectedDisk.size)), findsOneWidget);
  });

  testWidgets('saves guided storage', (tester) async {
    final model = buildGuidedReformatModel(
      storages: testStorages,
      disks: testDisks,
      selectedStorage: testStorages.first,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tapNext();
    verify(model.saveGuidedStorage()).called(1);
  });
}
