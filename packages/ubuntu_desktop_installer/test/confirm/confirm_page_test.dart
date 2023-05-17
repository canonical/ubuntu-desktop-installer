import 'package:collection/collection.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_model.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';

import '../test_utils.dart';
import 'confirm_page_test.mocks.dart';

final testDisks = <Disk>[
  fakeDisk(
    path: '/dev/sda',
    size: 12,
    preserve: false,
    partitions: [
      const Partition(
        path: '/dev/sda1',
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'ext',
        preserve: false,
      ),
      const Partition(
        path: '/dev/sda2',
        number: 2,
        size: 22,
        mount: '/mnt/2',
        format: 'ext2',
        preserve: false,
      )
    ],
  ),
  fakeDisk(
    path: '/dev/sdb',
    size: 23,
    preserve: false,
    partitions: [
      const Partition(
        path: '/dev/sdb3',
        number: 3,
        size: 33,
        wipe: 'superblock',
        mount: '/mnt/3',
        format: 'ext3',
      ),
      const Partition(
        path: '/dev/sdb4',
        number: 4,
        size: 44,
        wipe: 'superblock',
        format: 'ext4',
      ),
      const Partition(
        path: '/dev/sdb5',
        number: 5,
        size: 55,
        mount: '/mnt/5',
      ),
      const Partition(
        path: '/dev/sdb6',
        number: 6,
        size: 66,
        resize: true,
      ),
      const Partition(
        path: '/dev/sdb7',
        number: 7,
        preserve: false,
        wipe: 'superblock',
      ),
    ],
  ),
];

ConfirmModel buildModel({
  List<Disk>? disks,
  Map<String, List<Partition>>? partitions,
  Map<String, List<Partition>>? originals,
}) {
  final model = MockConfirmModel();
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.partitions).thenReturn(partitions ?? <String, List<Partition>>{});
  when(model.getOriginalPartition(any, any)).thenAnswer((i) =>
      originals?[i.positionalArguments.first]?.firstWhereOrNull(
          (p) => p.number == i.positionalArguments.last as int));
  return model;
}

@GenerateMocks([UdevDeviceInfo, UdevService, ConfirmModel])
void main() {
  Widget buildPage(ConfirmModel model) {
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

    return ProviderScope(
      overrides: [
        confirmModelProvider.overrideWith((_) => model),
      ],
      child: const ConfirmPage(),
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
      'sdb': [const Partition(number: 6, size: 123)],
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

    final installButton = find.button(tester.lang.startInstallingButtonText);
    expect(installButton, findsOneWidget);

    await tester.tap(installButton);
    verifyNever(model.startInstallation());

    await tester.pumpAndSettle(kThemeAnimationDuration);
    verify(model.startInstallation()).called(1);
  });
}
