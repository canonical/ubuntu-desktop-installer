import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/storage_columns.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/storage_table.dart';

// ignore_for_file: type=lint

void main() {
  final sda = fakeDisk(path: '/dev/sda', size: 11);
  final sdb = fakeDisk(
    path: '/dev/sdb',
    size: 22,
    partitions: [
      Partition(
        number: 1,
        size: 2211,
        os: OsProber(long: 'Ubuntu 18.04', label: '', type: ''),
      ),
      Gap(offset: 2211, size: 2222, usable: GapUsable.YES),
    ],
  );
  final sdc = fakeDisk(
    path: '/dev/sdc',
    size: 33,
    partitions: [
      Partition(number: 1, size: 3311),
      Partition(number: 2, size: 3322),
      Gap(offset: 3322, size: 3333, usable: GapUsable.YES),
    ],
  );
  final sdd = fakeDisk(
    path: '/dev/sdd',
    size: 44,
    partitions: [
      Partition(number: 1, size: 4411),
      Partition(number: 2, size: 4422),
      Partition(number: 3, size: 4433),
      Gap(offset: 4433, size: 4444, usable: GapUsable.YES),
    ],
  );

  final pathColumn = StorageColumn(
    titleBuilder: (_) => const Text('path'),
    diskBuilder: (_, disk) => Text(disk.path!),
    gapBuilder: (_, disk, gap) => SizedBox.shrink(),
    partitionBuilder: (_, disk, partition) {
      return Text('${disk.path}${partition.number}');
    },
  );

  final sizeColumn = StorageColumn(
    titleBuilder: (_) => const Text('size'),
    diskBuilder: (_, disk) => Text('${disk.size}b'),
    gapBuilder: (_, disk, gap) => Text('${gap.size}b'),
    partitionBuilder: (_, disk, partition) => Text('${partition.size}b'),
  );

  Widget buildTable(
    List<StorageColumn> columns, {
    CanSelectStorage? canSelect,
    IsStorageSelected? isSelected,
    OnStorageSelected? onSelected,
  }) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: StorageTable(
        columns: columns,
        storages: [sda, sdb, sdc, sdd],
        canSelect: canSelect,
        isSelected: isSelected,
        onSelected: onSelected,
      ),
    );
  }

  testWidgets('columns', (tester) async {
    await tester.pumpWidget(buildTable([pathColumn, sizeColumn]));

    expect(find.text('path'), findsOneWidget);
    // sda
    expect(find.text('/dev/sda'), findsOneWidget);
    // sdb
    expect(find.text('/dev/sdb'), findsOneWidget);
    expect(find.text('/dev/sdb1'), findsOneWidget);
    // sdc
    expect(find.text('/dev/sdc'), findsOneWidget);
    expect(find.text('/dev/sdc1'), findsOneWidget);
    expect(find.text('/dev/sdc2'), findsOneWidget);
    // sdd
    expect(find.text('/dev/sdd'), findsOneWidget);
    expect(find.text('/dev/sdd1'), findsOneWidget);
    expect(find.text('/dev/sdd2'), findsOneWidget);
    expect(find.text('/dev/sdd3'), findsOneWidget);

    expect(find.text('size'), findsOneWidget);
    // sda
    expect(find.text('11b'), findsOneWidget);
    // sdb
    expect(find.text('22b'), findsOneWidget);
    expect(find.text('2211b'), findsOneWidget);
    expect(find.text('2222b'), findsOneWidget);
    // sdc
    expect(find.text('33b'), findsOneWidget);
    expect(find.text('3311b'), findsOneWidget);
    expect(find.text('3322b'), findsOneWidget);
    expect(find.text('3333b'), findsOneWidget);
    // sdd
    expect(find.text('44b'), findsOneWidget);
    expect(find.text('4411b'), findsOneWidget);
    expect(find.text('4422b'), findsOneWidget);
    expect(find.text('4433b'), findsOneWidget);
    expect(find.text('4444b'), findsOneWidget);
  });

  testWidgets('disk selection', (tester) async {
    int? selectedDisk;

    await tester.pumpWidget(buildTable(
      [pathColumn, sizeColumn],
      canSelect: (disk, [partition = -1]) => disk == 1, // sdb
      isSelected: (disk, [partition = -1]) => disk == 2, // sdc
      onSelected: (disk, [partition = -1]) => selectedDisk = disk,
    ));

    // cannot select
    await tester.tap(find.text('/dev/sda'));
    await tester.pump();
    expect(selectedDisk, isNull);

    // can select
    await tester.tap(find.text('/dev/sdb'));
    await tester.pump();
    expect(selectedDisk, equals(1));

    selectedDisk = null;

    // cannot unselect
    await tester.tap(find.text('/dev/sdc'));
    await tester.pump();
    expect(selectedDisk, isNull);

    // cannot select
    await tester.tap(find.text('/dev/sdd'));
    await tester.pump();
    expect(selectedDisk, isNull);
  });

  testWidgets('partition selection', (tester) async {
    int? selectedDisk;
    int? selectedPartition;

    await tester.pumpWidget(buildTable(
      [pathColumn, sizeColumn],
      canSelect: (disk, [partition = -1]) =>
          disk == 1 || partition == 1, // sdb1, sdc2, sdd2
      isSelected: (disk, [partition = -1]) => partition == 2, // sdd3
      onSelected: (disk, [partition = -1]) {
        selectedDisk = disk;
        selectedPartition = partition;
      },
    ));

    // can select
    await tester.ensureVisible(find.text('/dev/sdb1'));
    await tester.pump();
    await tester.tap(find.text('/dev/sdb1'));
    await tester.pump();
    expect(selectedDisk, equals(1));
    expect(selectedPartition, isZero);

    selectedDisk = null;
    selectedPartition = null;

    // cannot select
    await tester.ensureVisible(find.text('/dev/sdc1'));
    await tester.pump();
    await tester.tap(find.text('/dev/sdc1'));
    await tester.pump();
    expect(selectedDisk, isNull);
    expect(selectedPartition, isNull);

    // can select
    await tester.ensureVisible(find.text('/dev/sdc2'));
    await tester.pump();
    await tester.tap(find.text('/dev/sdc2'));
    await tester.pump();
    expect(selectedDisk, equals(2));
    expect(selectedPartition, equals(1));

    selectedDisk = null;
    selectedPartition = null;

    // cannot unselect
    await tester.ensureVisible(find.text('/dev/sdd3'));
    await tester.pump();
    await tester.tap(find.text('/dev/sdd3'));
    await tester.pump();
    expect(selectedDisk, isNull);
    expect(selectedPartition, isNull);
  });

  testWidgets('existing os', (tester) async {
    await tester.pumpWidget(buildTable([StorageSystemColumn()]));

    expect(find.text('Ubuntu 18.04'), findsOneWidget);
  });
}
