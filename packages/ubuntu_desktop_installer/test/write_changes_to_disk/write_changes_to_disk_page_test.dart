import 'package:collection/collection.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_model.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';
import 'write_changes_to_disk_model_test.mocks.dart';
import 'write_changes_to_disk_page_test.mocks.dart';

// ignore_for_file: type=lint

final testDisks = <Disk>[
  testDisk(
    path: '/dev/sda',
    size: 12,
    preserve: false,
    partitions: [
      Partition(
        path: '/dev/sda1',
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'ext',
        preserve: false,
      ),
      Partition(
        path: '/dev/sda2',
        number: 2,
        size: 22,
        mount: '/mnt/2',
        format: 'ext2',
        preserve: false,
      )
    ],
  ),
  testDisk(
    path: '/dev/sdb',
    size: 23,
    preserve: false,
    partitions: [
      Partition(
        path: '/dev/sdb3',
        number: 3,
        size: 33,
        wipe: 'superblock',
        mount: '/mnt/3',
        format: 'ext3',
      ),
      Partition(
        path: '/dev/sdb4',
        number: 4,
        size: 44,
        wipe: 'superblock',
        format: 'ext4',
      ),
      Partition(
        path: '/dev/sdb5',
        number: 5,
        size: 55,
        mount: '/mnt/5',
      ),
      Partition(
        path: '/dev/sdb6',
        number: 6,
        size: 66,
        resize: true,
      ),
      Partition(
        path: '/dev/sdb7',
        number: 7,
        preserve: false,
        wipe: 'superblock',
      ),
    ],
  ),
];

WriteChangesToDiskModel buildModel({
  List<Disk>? disks,
  Map<String, List<Partition>>? partitions,
  Map<String, List<Partition>>? originals,
}) {
  final model = MockWriteChangesToDiskModel();
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.partitions).thenReturn(partitions ?? <String, List<Partition>>{});
  when(model.getOriginalPartition(any, any)).thenAnswer((i) =>
      originals?[i.positionalArguments.first]?.firstWhereOrNull(
          (p) => p.number == i.positionalArguments.last as int));
  return model;
}

@GenerateMocks([UdevDeviceInfo, UdevService, WriteChangesToDiskModel])
void main() {
  Widget buildPage(WriteChangesToDiskModel model) {
    final udev = MockUdevService();
    final sda = MockUdevDeviceInfo();
    when(sda.modelName).thenReturn('SDA');
    when(sda.vendorName).thenReturn('ATA');
    when(udev.bySysname('sda')).thenReturn(sda);
    final sdb = MockUdevDeviceInfo();
    when(sdb.modelName).thenReturn('SDB');
    when(sdb.vendorName).thenReturn('ATA');
    when(udev.bySysname('sdb')).thenReturn(sdb);
    registerMockService<UdevService>(udev);

    return ChangeNotifierProvider<WriteChangesToDiskModel>.value(
      value: model,
      child: const WriteChangesToDiskPage(),
    );
  }

  testWidgets('list of disks and partitions', (tester) async {
    final model = buildModel(disks: testDisks, partitions: {
      testDisks.first.sysname: testDisks.first.partitions.cast<Partition>(),
      testDisks.last.sysname: testDisks.last.partitions.cast<Partition>(),
    });
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    for (final disk in testDisks) {
      expect(find.byKey(ValueKey(disk)), findsOneWidget);

      for (final partition in disk.partitions.whereType<Partition>()) {
        expect(find.byKey(ValueKey(partition)), findsOneWidget);
      }
    }
  });

  testWidgets('partition change summary', (tester) async {
    final model = buildModel(disks: testDisks, partitions: {
      testDisks.first.sysname: testDisks.first.partitions.cast<Partition>(),
      testDisks.last.sysname: testDisks.last.partitions.cast<Partition>(),
    }, originals: {
      'sdb': [Partition(number: 6, size: 123)],
    });
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
        find.html(tester.lang.writeChangesPartitionFormattedMounted(
            '', 'sdb3', 'ext3', '/mnt/3')),
        findsOneWidget);
    expect(
        find.html(tester.lang.writeChangesPartitionFormatted('sdb', 4, 'ext4')),
        findsOneWidget);
    expect(
        find.html(tester.lang.writeChangesPartitionMounted('sdb', 5, '/mnt/5')),
        findsOneWidget);
    expect(
        find.html(tester.lang.writeChangesPartitionResized(
            'sdb', 6, filesize(123), filesize(66))),
        findsOneWidget);
    expect(find.html(tester.lang.writeChangesPartitionCreated('sdb', 7)),
        findsOneWidget);
  });

  testWidgets('starts installation', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      ElevatedButton,
      tester.lang.startInstallingButtonText,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verifyNever(model.startInstallation());

    await tester.pumpAndSettle(kThemeAnimationDuration);
    verify(model.startInstallation()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    registerMockService<SubiquityClient>(client);

    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(null);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);
    registerMockService<DiskStorageService>(service);

    await tester.pumpWidget(tester.buildApp(WriteChangesToDiskPage.create));

    final page = find.byType(WriteChangesToDiskPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<WriteChangesToDiskModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
