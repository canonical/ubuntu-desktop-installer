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
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'ext',
        preserve: false,
      ),
      Partition(
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
        number: 3,
        size: 33,
        mount: '/mnt/3',
        format: 'ext3',
        preserve: false,
      ),
      Partition(
        number: 4,
        size: 44,
        format: 'ext4',
        preserve: false,
      )
    ],
  ),
];

WriteChangesToDiskModel buildModel({List<Disk>? disks}) {
  final model = MockWriteChangesToDiskModel();
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.partitions(testDisks.first))
      .thenReturn(testDisks.first.partitions.whereType<Partition>().toList());
  when(model.partitions(testDisks.last))
      .thenReturn(testDisks.last.partitions.whereType<Partition>().toList());
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
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    for (final disk in testDisks) {
      expect(find.byKey(ValueKey(disk)), findsOneWidget);

      for (final partition in disk.partitions.whereType<Partition>()) {
        expect(find.byKey(ValueKey(partition)), findsOneWidget);
      }
    }
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
    verify(model.startInstallation()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    registerMockService<SubiquityClient>(client);

    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    registerMockService<DiskStorageService>(service);

    await tester.pumpWidget(tester.buildApp(WriteChangesToDiskPage.create));

    final page = find.byType(WriteChangesToDiskPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<WriteChangesToDiskModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
