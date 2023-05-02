import 'dart:async';

import 'package:collection/collection.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/allocate_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/allocate_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/storage_selector.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'allocate_disk_space_model_test.mocks.dart';
import 'allocate_disk_space_page_test.mocks.dart';

// ignore_for_file: type=lint

final selection = StreamController.broadcast();

final testDisks = <Disk>[
  fakeDisk(
    path: '/dev/sda',
    canBeBootDevice: false,
    size: 12,
    partitions: [
      Partition(
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'btrfs',
        preserve: true,
      ),
      Partition(
        number: 2,
        size: 22,
        mount: '/mnt/2',
        format: 'ext2',
      )
    ],
  ),
  fakeDisk(
    path: '/dev/sdb',
    canBeBootDevice: true,
    size: 23,
    partitions: [
      Partition(
        number: 3,
        size: 33,
        mount: '/mnt/3',
        format: 'ext3',
      ),
      Partition(
        number: 4,
        size: 44,
        mount: '/mnt/4',
        format: 'ext4',
      )
    ],
  ),
];

AllocateDiskSpaceModel buildModel({
  bool? isValid,
  List<Disk>? disks,
  Gap? selectedGap,
  Disk? selectedDisk,
  int? selectedDiskIndex,
  Partition? selectedPartition,
  int? selectedObjectIndex,
  bool? canAddPartition,
  bool? canRemovePartition,
  bool? canEditPartition,
  bool? canReformatDisk,
  int? bootDiskIndex,
}) {
  final model = MockAllocateDiskSpaceModel();
  when(model.isValid).thenReturn(isValid ?? false);
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.originalConfig(any)).thenAnswer((i) {
    return disks
        ?.expand((d) => d.partitions.whereType<Partition>())
        .firstWhereOrNull((p) => p.path == i.positionalArguments[0].path);
  });

  when(model.selectedGap).thenReturn(selectedGap);
  when(model.selectedDisk).thenReturn(selectedDisk);
  when(model.selectedDiskIndex).thenReturn(selectedDiskIndex ?? 0);
  when(model.selectedPartition).thenReturn(selectedPartition);
  when(model.selectedObjectIndex).thenReturn(selectedObjectIndex ?? 0);
  when(model.onSelectionChanged).thenAnswer((_) => selection.stream);
  when(model.isStorageSelected(any, any)).thenReturn(false);
  when(model.canSelectStorage(any, any)).thenReturn(true);

  when(model.canAddPartition).thenReturn(canAddPartition ?? false);
  when(model.canRemovePartition).thenReturn(canRemovePartition ?? false);
  when(model.canEditPartition).thenReturn(canEditPartition ?? false);
  when(model.canReformatDisk).thenReturn(canReformatDisk ?? false);

  when(model.bootDiskIndex).thenReturn(bootDiskIndex);
  return model;
}

@GenerateMocks([AllocateDiskSpaceModel, UdevDeviceInfo, UdevService])
void main() {
  Widget buildPage(AllocateDiskSpaceModel model) {
    final udev = MockUdevService();
    final sda = MockUdevDeviceInfo();
    when(sda.fullName).thenReturn('SDA');
    when(udev.bySysname('sda')).thenReturn(sda);
    final sdb = MockUdevDeviceInfo();
    when(sdb.fullName).thenReturn('SDB');
    when(udev.bySysname('sdb')).thenReturn(sdb);
    registerMockService<UdevService>(udev);

    return ChangeNotifierProvider<AllocateDiskSpaceModel>.value(
      value: model,
      child: const AllocateDiskSpacePage(),
    );
  }

  testWidgets('list of disks and partitions', (tester) async {
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    for (final disk in testDisks) {
      expect(find.text(disk.sysname), findsOneWidget);
      expect(find.text(filesize(disk.size)), findsOneWidget);

      for (final partition in disk.partitions.whereType<Partition>()) {
        expect(find.text(partition.format!), findsOneWidget);
        expect(find.text(partition.mount!), findsOneWidget);
        expect(find.text(filesize(partition.size!)), findsOneWidget);
      }
    }
  });

  testWidgets('select storage', (tester) async {
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.text(testDisks.first.sysname));
    await tester.pumpAndSettle();

    verify(model.selectStorage(0)).called(1);

    await tester.tap(find.text(testDisks.last.sysname));
    await tester.pumpAndSettle();

    verify(model.selectStorage(1)).called(1);

    await tester.tap(find
        .text(testDisks.first.partitions.whereType<Partition>().last.mount!));
    await tester.pumpAndSettle();

    verify(model.selectStorage(0, 1)).called(1);
  });

  testWidgets('cannot add/edit/remove/reformat', (tester) async {
    final model = buildModel(
        disks: testDisks,
        canAddPartition: false,
        canEditPartition: false,
        canRemovePartition: false,
        canReformatDisk: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final addButton = find.iconButton(Icons.add);
    expect(addButton, findsOneWidget);
    expect(addButton, isDisabled);

    final editButton = find.button(tester.lang.changeButtonText);
    expect(editButton, findsOneWidget);
    expect(editButton, isDisabled);

    final removeButton = find.iconButton(Icons.remove);
    expect(removeButton, findsOneWidget);
    expect(removeButton, isDisabled);

    final reformatButton = find.button(tester.lang.newPartitionTable);
    expect(reformatButton, findsOneWidget);
    expect(reformatButton, isDisabled);
  });

  testWidgets('can add', (tester) async {
    final model = buildModel(disks: testDisks, canAddPartition: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final addButton = find.iconButton(Icons.add);
    expect(addButton, findsOneWidget);
    expect(addButton, isEnabled);
  });

  testWidgets('can edit', (tester) async {
    final model = buildModel(disks: testDisks, canEditPartition: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final editButton = find.button(tester.lang.changeButtonText);
    expect(editButton, findsOneWidget);
    expect(editButton, isEnabled);
  });

  testWidgets('can format', (tester) async {
    final disk = testDisks.first;
    final partition = disk.partitions.whereType<Partition>().first;
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox = find.byType(YaruCheckbox);
    expect(checkbox, findsWidgets);

    await tester.tap(checkbox.first);
    verify(model.editPartition(disk, partition, wipe: true)).called(1);
  });

  testWidgets('can remove', (tester) async {
    final disk = testDisks.first;
    final partition = disk.partitions.whereType<Partition>().first;
    final model = buildModel(
      disks: testDisks,
      selectedDisk: disk,
      selectedPartition: partition,
      canRemovePartition: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final removeButton = find.iconButton(Icons.remove);
    expect(removeButton, findsOneWidget);
    expect(removeButton, isEnabled);

    await tester.tap(removeButton);
    verify(model.deletePartition(disk, partition)).called(1);
  });

  testWidgets('can reset', (tester) async {
    final disk = testDisks.first;
    final model = buildModel(
      disks: testDisks,
      selectedDisk: disk,
      canReformatDisk: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final resetButton = find.button(tester.lang.newPartitionTable);
    expect(resetButton, findsOneWidget);
    expect(resetButton, isEnabled);

    await tester.tap(resetButton);
    verify(model.reformatDisk(disk)).called(1);
  });

  testWidgets('confirm new partition table', (tester) async {
    final disk = fakeDisk(ptable: 'gpt', path: '/dev/sda');
    final model = buildModel(
      disks: [disk],
      selectedDisk: disk,
      canReformatDisk: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final resetButton = find.button(tester.lang.newPartitionTable);
    expect(resetButton, findsOneWidget);
    expect(resetButton, isEnabled);

    await tester.tap(resetButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    verifyNever(model.reformatDisk(disk));

    final okButton = find.button(tester.ulang.okLabel);
    expect(okButton, findsOneWidget);

    await tester.tap(okButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    verify(model.reformatDisk(disk)).called(1);
  });

  testWidgets('revert', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final revertButton = find.button(tester.lang.revertButtonText);
    expect(revertButton, findsOneWidget);
    expect(revertButton, isEnabled);

    await tester.tap(revertButton);
    verify(model.resetStorage()).called(1);
  });

  testWidgets('boot disk', (tester) async {
    final model = buildModel(disks: testDisks, bootDiskIndex: 1);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(StorageSelector));
    await tester.pumpAndSettle();
    await tester.pump();

    final menuItem0 = find.ancestor(
      of: find.byKey(ValueKey(0)),
      matching: find.byType(MenuItemButton),
    );
    expect(menuItem0, isDisabled);

    final menuItem1 = find.ancestor(
      of: find.byKey(ValueKey(1)),
      matching: find.byType(MenuItemButton),
    );
    expect(menuItem1, isEnabled);

    await tester.ensureVisible(menuItem1);
    await tester.tap(menuItem1);
    verify(model.selectBootDisk(1)).called(1);
  });

  testWidgets('set storage', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    verify(model.setStorage()).called(1);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    expect(nextButton, isDisabled);
  });

  testWidgets('too many primary partitions', (tester) async {
    final unusableGap = Gap(
      offset: 0,
      size: 1,
      usable: GapUsable.TOO_MANY_PRIMARY_PARTS,
    );
    final model = buildModel(selectedGap: unusableGap);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final addButton = find.iconButton(Icons.add);
    expect(addButton, isDisabled);
    expect(
      find.ancestor(
        of: addButton,
        matching: find.byWidgetPredicate((widget) =>
            widget is Tooltip &&
            widget.message == tester.lang.tooManyPrimaryPartitions),
      ),
      findsOneWidget,
    );
  });

  testWidgets('creates a model', (tester) async {
    final storage = MockDiskStorageService();
    when(storage.getStorage()).thenAnswer((_) async => testDisks);
    when(storage.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(storage.needRoot).thenReturn(false);
    when(storage.needBoot).thenReturn(false);
    registerMockService<DiskStorageService>(storage);
    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(tester.buildApp(AllocateDiskSpacePage.create));

    final page = find.byType(AllocateDiskSpacePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
