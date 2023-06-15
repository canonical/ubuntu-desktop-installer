import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';
import 'write_changes_to_disk_model_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([DiskStorageService])
void main() {
  final testDisks = <Disk>[
    testDisk(
      path: '/dev/sda',
      preserve: false,
      partitions: [Partition(number: 1, preserve: false)],
    ),
    testDisk(
      path: '/dev/sdb',
      preserve: true,
      partitions: [
        Partition(number: 1),
        Partition(number: 2, preserve: false),
      ],
    ),
    testDisk(
      path: '/dev/sdc',
      preserve: false,
      partitions: [
        Partition(number: 3, preserve: false),
        Partition(number: 4, grubDevice: false),
      ],
    ),
    testDisk(
      path: '/dev/sdd',
      preserve: true,
      partitions: [
        Partition(number: 1, preserve: true),
        Partition(number: 2, mount: '/mnt'),
        Partition(number: 3, wipe: 'superblock'),
        Partition(number: 4, resize: true),
      ],
    ),
  ];

  final nonPreservedDisks = <Disk>[testDisks[0], testDisks[1], testDisks[2]];

  test('get storage', () async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(null);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);

    final model = WriteChangesToDiskModel(client, service);
    await model.init();
    verifyInOrder([
      service.getStorage(),
      service.getOriginalStorage(),
    ]);
    verifyNever(service.setGuidedStorage());

    expect(model.disks, equals(nonPreservedDisks));
    expect(
      model.partitions,
      equals({
        'sda': [Partition(number: 1, preserve: false)],
        'sdb': [Partition(number: 2, preserve: false)],
        'sdc': [Partition(number: 3, preserve: false)],
        'sdd': [
          Partition(number: 2, mount: '/mnt'),
          Partition(number: 3, wipe: 'superblock'),
          Partition(number: 4, resize: true),
        ],
      }),
    );
    expect(
      model.getOriginalPartition('sdd', 3),
      Partition(number: 3, wipe: 'superblock'),
    );
  });

  test('set guided storage', () async {
    final target = GuidedStorageTarget.reformat(diskId: 'sda', allowed: []);

    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(target);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(service.setGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse());

    final model = WriteChangesToDiskModel(client, service);
    await model.init();
    verify(service.setGuidedStorage()).called(1);
  });

  test('start installation', () async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(null);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(service.setStorage()).thenAnswer((_) async => nonPreservedDisks);

    final model = WriteChangesToDiskModel(client, service);
    await model.init();
    await model.startInstallation();

    verifyNever(service.setStorage());
    verify(service.securityKey = null).called(1);
    verify(client.confirm('/dev/tty1')).called(1);
  });
}
