import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/storage_columns.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/storage_table.dart';

void main() {
  const sda = Disk(path: '/dev/sda', size: 11);
  const sdb = Disk(
    path: '/dev/sdb',
    size: 22,
    partitions: [Partition(number: 1, size: 2211)],
  );
  const sdc = Disk(
    path: '/dev/sdc',
    size: 33,
    partitions: [
      Partition(number: 1, size: 3311),
      Partition(number: 2, size: 3322)
    ],
  );

  final pathColumn = StorageColumn(
    titleBuilder: (_) => const Text('path'),
    diskBuilder: (_, disk) => Text(disk.path!),
    partitionBuilder: (_, disk, partition) {
      return Text('${disk.path}${partition.number}');
    },
  );

  final sizeColumn = StorageColumn(
    titleBuilder: (_) => const Text('size'),
    diskBuilder: (_, disk) => Text('${disk.size}b'),
    partitionBuilder: (_, disk, partition) => Text('${partition.size}b'),
  );

  Widget buildTable(
    List<StorageColumn> columns, {
    CanSelectStorage? canSelect,
    IsStorageSelected? isSelected,
    OnStorageSelected? onSelected,
  }) {
    return MaterialApp(
      home: StorageTable(
        columns: columns,
        storages: [sda, sdb, sdc],
        canSelect: canSelect,
        isSelected: isSelected,
        onSelected: onSelected,
      ),
    );
  }

  testWidgets('columns', (tester) async {
    await tester.pumpWidget(buildTable([pathColumn, sizeColumn]));

    expect(find.text('path'), findsOneWidget);
    expect(find.text('/dev/sda'), findsOneWidget);
    expect(find.text('/dev/sdb'), findsOneWidget);
    expect(find.text('/dev/sdb1'), findsOneWidget);
    expect(find.text('/dev/sdc'), findsOneWidget);
    expect(find.text('/dev/sdc1'), findsOneWidget);
    expect(find.text('/dev/sdc2'), findsOneWidget);

    expect(find.text('size'), findsOneWidget);
    expect(find.text('11b'), findsOneWidget);
    expect(find.text('22b'), findsOneWidget);
    expect(find.text('2211b'), findsOneWidget);
    expect(find.text('33b'), findsOneWidget);
    expect(find.text('3311b'), findsOneWidget);
    expect(find.text('3322b'), findsOneWidget);
  });

  testWidgets('selection', (tester) async {
    int? selectedDisk;
    int? selectedPartition;

    await tester.pumpWidget(buildTable(
      [pathColumn, sizeColumn],
      canSelect: (disk, [partition = -1]) {
        return disk == 1 || partition == 1;
      },
      isSelected: (disk, [partition = -1]) => disk == 2 || partition == 2,
      onSelected: (disk, [partition = -1]) {
        selectedDisk = disk;
        selectedPartition = partition;
      },
    ));

    // cannot select disk
    await tester.tap(find.text('/dev/sda'));
    await tester.pump();
    expect(selectedDisk, isNull);
    expect(selectedPartition, isNull);

    selectedDisk = null;
    selectedPartition = null;

    // can select disk
    await tester.tap(find.text('/dev/sdb'));
    await tester.pump();
    expect(selectedDisk, equals(1));
    expect(selectedPartition, equals(-1));

    selectedDisk = null;
    selectedPartition = null;

    // cannot unselect disk
    await tester.tap(find.text('/dev/sdc'));
    await tester.pump();
    expect(selectedDisk, isNull);
    expect(selectedPartition, isNull);

    // can select partition
    await tester.tap(find.text('/dev/sdb1'));
    await tester.pump();
    expect(selectedDisk, equals(1));
    expect(selectedPartition, isZero);

    selectedDisk = null;
    selectedPartition = null;

    // cannot select partition
    await tester.tap(find.text('/dev/sdc1'));
    await tester.pump();
    expect(selectedDisk, isNull);
    expect(selectedPartition, isNull);

    selectedDisk = null;
    selectedPartition = null;

    // cannot unselect partition
    await tester.tap(find.text('/dev/sdc2'));
    await tester.pump();
    expect(selectedDisk, isNull);
    expect(selectedPartition, isNull);
  });
}
