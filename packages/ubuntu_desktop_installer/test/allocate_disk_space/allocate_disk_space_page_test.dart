import 'dart:async';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/storage_types.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'allocate_disk_space_model_test.mocks.dart';
import 'allocate_disk_space_page_test.mocks.dart';

// ignore_for_file: type=lint

final selection = StreamController.broadcast();

final testDisks = <Disk>[
  testDisk(
    path: '/dev/sda',
    size: 12,
    partitions: [
      Partition(
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'ext',
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
  testDisk(
    path: '/dev/sdb',
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
      expect(find.text(disk.path!), findsOneWidget);
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

    await tester.tap(find.text(testDisks.first.path!));
    await tester.pumpAndSettle();

    verify(model.selectStorage(0)).called(1);

    await tester.tap(find.text(testDisks.last.path!));
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

    final addButton = find.ancestor(
      of: find.byIcon(Icons.add),
      matching: find.byType(OutlinedButton),
    );
    expect(addButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(addButton).enabled, isFalse);

    final editButton = find.ancestor(
      of: find.text(tester.lang.changeButtonText),
      matching: find.byType(OutlinedButton),
    );
    expect(editButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(editButton).enabled, isFalse);

    final removeButton = find.ancestor(
      of: find.byIcon(Icons.remove),
      matching: find.byType(OutlinedButton),
    );
    expect(removeButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(removeButton).enabled, isFalse);

    final reformatButton = find.ancestor(
      of: find.text(tester.lang.newPartitionTable),
      matching: find.byType(OutlinedButton),
    );
    expect(reformatButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(reformatButton).enabled, isFalse);
  });

  testWidgets('can add', (tester) async {
    final model = buildModel(disks: testDisks, canAddPartition: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final addButton = find.ancestor(
      of: find.byIcon(Icons.add),
      matching: find.byType(OutlinedButton),
    );
    expect(addButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(addButton).enabled, isTrue);
  });

  testWidgets('can edit', (tester) async {
    final model = buildModel(disks: testDisks, canEditPartition: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final editButton = find.ancestor(
      of: find.text(tester.lang.changeButtonText),
      matching: find.byType(OutlinedButton),
    );
    expect(editButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(editButton).enabled, isTrue);
  });

  testWidgets('can format', (tester) async {
    final disk = testDisks.first;
    final partition = disk.partitions.whereType<Partition>().first;
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox = find.byType(Checkbox);
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

    final removeButton = find.ancestor(
      of: find.byIcon(Icons.remove),
      matching: find.byType(OutlinedButton),
    );
    expect(removeButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(removeButton).enabled, isTrue);

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

    final resetButton = find.ancestor(
      of: find.text(tester.lang.newPartitionTable),
      matching: find.byType(OutlinedButton),
    );
    expect(resetButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(resetButton).enabled, isTrue);

    await tester.tap(resetButton);
    verify(model.reformatDisk(disk)).called(1);
  });

  testWidgets('confirm new partition table', (tester) async {
    final disk = testDisk(ptable: 'gpt', path: '/dev/sda');
    final model = buildModel(
      disks: [disk],
      selectedDisk: disk,
      canReformatDisk: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final resetButton = find.ancestor(
      of: find.text(tester.lang.newPartitionTable),
      matching: find.byType(OutlinedButton),
    );
    expect(resetButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(resetButton).enabled, isTrue);

    await tester.tap(resetButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    verifyNever(model.reformatDisk(disk));

    final continueButton = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.text(tester.ulang.continueAction),
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    verify(model.reformatDisk(disk)).called(1);
  });

  testWidgets('revert', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final revertButton = find.ancestor(
      of: find.text(tester.lang.revertButtonText),
      matching: find.byType(OutlinedButton),
    );
    expect(revertButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(revertButton).enabled, isTrue);

    await tester.tap(revertButton);
    verify(model.resetStorage()).called(1);
  });

  testWidgets('boot disk', (tester) async {
    final model = buildModel(disks: testDisks, bootDiskIndex: 1);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.pump();

    final dropdownItem = find.descendant(
      of: find.byType(DropdownMenuItem<int>),
      matching: find.byKey(ValueKey(1)),
    );
    await tester.ensureVisible(dropdownItem.last);
    await tester.tap(dropdownItem.last);
    verify(model.selectBootDisk(1)).called(1);
  });

  testWidgets('set storage', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.setStorage()).called(1);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });

  testWidgets('creates a model', (tester) async {
    final storage = MockDiskStorageService();
    when(storage.getStorage()).thenAnswer((_) async => testDisks);
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
