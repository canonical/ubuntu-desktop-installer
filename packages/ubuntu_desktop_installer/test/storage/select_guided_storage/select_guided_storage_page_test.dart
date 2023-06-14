import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/select_guided_storage/select_guided_storage_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/select_guided_storage/select_guided_storage_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import 'test_select_guided_storage.dart';

void main() {
  final testDisks = <Disk>[
    fakeDisk(path: '/dev/sda', size: 12, model: 'SDA', vendor: 'ATA'),
    fakeDisk(path: '/dev/sdb', size: 23, model: 'SDB', vendor: 'ATA'),
  ];
  final testStorages = testDisks
      .map((disk) =>
          GuidedStorageTargetReformat(diskId: disk.id, capabilities: []))
      .toList();

  Widget buildPage(SelectGuidedStorageModel model) {
    return ProviderScope(
      overrides: [selectGuidedStorageModelProvider.overrideWith((_) => model)],
      child: const SelectGuidedStoragePage(),
    );
  }

  testWidgets('list of guided storages', (tester) async {
    final model = buildSelectGuidedStorageModel(
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
    final model = buildSelectGuidedStorageModel(
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
    final model = buildSelectGuidedStorageModel(
      disks: testDisks,
      storages: testStorages,
      selectedDisk: selectedDisk,
      selectedStorage: selectedStorage,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    expect(find.text(selectedDisk.sysname), findsOneWidget);
    expect(find.text(filesize(selectedDisk.size)), findsOneWidget);
  });

  testWidgets('saves guided storage', (tester) async {
    final model = buildSelectGuidedStorageModel(
      storages: testStorages,
      disks: testDisks,
      selectedStorage: testStorages.first,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tapNext();
    verify(model.saveGuidedStorage()).called(1);
  });
}
