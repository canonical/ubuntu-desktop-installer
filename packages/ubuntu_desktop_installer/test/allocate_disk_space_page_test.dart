import 'dart:async';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'allocate_disk_space_model_test.mocks.dart';
import 'allocate_disk_space_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

final selection = StreamController.broadcast();

const testDisks = <Disk>[
  Disk(
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
  Disk(
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
  int? selectedPartitionIndex,
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
  when(model.selectedPartitionIndex).thenReturn(selectedPartitionIndex ?? 0);
  when(model.onSelectionChanged).thenAnswer((_) => selection.stream);
  when(model.isStorageSelected(any, any)).thenReturn(false);

  when(model.canAddPartition).thenReturn(canAddPartition ?? false);
  when(model.canRemovePartition).thenReturn(canRemovePartition ?? false);
  when(model.canEditPartition).thenReturn(canEditPartition ?? false);
  when(model.canReformatDisk).thenReturn(canReformatDisk ?? false);

  when(model.bootDiskIndex).thenReturn(bootDiskIndex);
  return model;
}

@GenerateMocks([AllocateDiskSpaceModel, UdevService])
void main() {
  Widget buildPage(AllocateDiskSpaceModel model) {
    final udev = MockUdevService();
    when(udev.fullName('sda')).thenReturn('SDA');
    when(udev.fullName('sdb')).thenReturn('SDB');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllocateDiskSpaceModel>.value(value: model),
        Provider<UdevService>.value(value: udev),
      ],
      child: const AllocateDiskSpacePage(),
    );
  }

  Widget buildApp(WidgetTester tester, AllocateDiskSpaceModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('list of disks and partitions', (tester) async {
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(buildApp(tester, model));

    for (final disk in testDisks) {
      expect(find.text(disk.path!), findsOneWidget);
      expect(find.text(filesize(disk.size!)), findsOneWidget);

      for (final partition in disk.partitions!) {
        expect(find.text(partition.format!), findsOneWidget);
        expect(find.text(partition.mount!), findsOneWidget);
        expect(find.text(filesize(partition.size!)), findsOneWidget);
      }
    }
  });

  testWidgets('select storage', (tester) async {
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(buildApp(tester, model));

    await tester.tap(find.text(testDisks.first.path!));
    await tester.pumpAndSettle();

    verify(model.selectStorage(0)).called(1);

    await tester.tap(find.text(testDisks.last.path!));
    await tester.pumpAndSettle();

    verify(model.selectStorage(1)).called(1);

    await tester.tap(find.text(testDisks.first.partitions!.last.mount!));
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
    await tester.pumpWidget(buildApp(tester, model));

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
    await tester.pumpWidget(buildApp(tester, model));

    final addButton = find.ancestor(
      of: find.byIcon(Icons.add),
      matching: find.byType(OutlinedButton),
    );
    expect(addButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(addButton).enabled, isTrue);
  });

  testWidgets('can edit', (tester) async {
    final model = buildModel(disks: testDisks, canEditPartition: true);
    await tester.pumpWidget(buildApp(tester, model));

    final editButton = find.ancestor(
      of: find.text(tester.lang.changeButtonText),
      matching: find.byType(OutlinedButton),
    );
    expect(editButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(editButton).enabled, isTrue);
  });

  testWidgets('can format', (tester) async {
    final disk = testDisks.first;
    final partition = disk.partitions!.first;
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.byType(Checkbox);
    expect(checkbox, findsWidgets);

    await tester.tap(checkbox.first);
    verify(model.editPartition(disk, partition, wipe: true)).called(1);
  });

  testWidgets('can remove', (tester) async {
    final disk = testDisks.first;
    final partition = disk.partitions!.first;
    final model = buildModel(
      disks: testDisks,
      selectedDisk: disk,
      selectedPartition: partition,
      canRemovePartition: true,
    );
    await tester.pumpWidget(buildApp(tester, model));

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
    await tester.pumpWidget(buildApp(tester, model));

    final resetButton = find.ancestor(
      of: find.text(tester.lang.newPartitionTable),
      matching: find.byType(OutlinedButton),
    );
    expect(resetButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(resetButton).enabled, isTrue);

    await tester.tap(resetButton);
    verify(model.reformatDisk(disk)).called(1);
  });

  testWidgets('revert', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));

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
    await tester.pumpWidget(buildApp(tester, model));

    await tester.tap(find.byTypeOf<DropdownButton<int>>());
    await tester.pumpAndSettle();
    await tester.pump();

    final dropdownItem = find.descendant(
      of: find.byTypeOf<DropdownMenuItem<int>>(),
      matching: find.byKey(ValueKey(1)),
    );
    await tester.ensureVisible(dropdownItem.last);
    await tester.tap(dropdownItem.last);
    verify(model.selectBootDisk(1)).called(1);
  });

  testWidgets('set storage', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

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
    await tester.pumpWidget(buildApp(tester, model));

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

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: MultiProvider(
        providers: [
          Provider<DiskStorageService>.value(value: storage),
          Provider<UdevService>(create: (_) => MockUdevService()),
        ],
        child: Wizard(
          routes: {'/': AllocateDiskSpacePage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(AllocateDiskSpacePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<AllocateDiskSpaceModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
