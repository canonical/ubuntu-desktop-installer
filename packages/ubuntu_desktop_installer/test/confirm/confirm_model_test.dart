import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_model.dart';

import 'test_confirm.dart';

void main() {
  final testDisks = <Disk>[
    fakeDisk(
      path: '/dev/sda',
      preserve: false,
      partitions: [const Partition(number: 1, preserve: false)],
    ),
    fakeDisk(
      path: '/dev/sdb',
      preserve: true,
      partitions: [
        const Partition(number: 1),
        const Partition(number: 2, preserve: false),
      ],
    ),
    fakeDisk(
      path: '/dev/sdc',
      preserve: false,
      partitions: [
        const Partition(number: 3, preserve: false),
        const Partition(number: 4, grubDevice: false),
      ],
    ),
    fakeDisk(
      path: '/dev/sdd',
      preserve: true,
      partitions: [
        const Partition(number: 1, preserve: true),
        const Partition(number: 2, mount: '/mnt'),
        const Partition(number: 3, wipe: 'superblock'),
        const Partition(number: 4, resize: true),
      ],
    ),
    fakeDisk(
      path: '/dev/sde',
      preserve: true,
      partitions: [
        const Partition(number: 1, preserve: true),
      ],
    ),
  ];

  final modifiedDisks = <Disk>[
    testDisks[0],
    testDisks[1],
    testDisks[2],
    testDisks[3],
  ];

  test('get storage', () async {
    final installer = MockInstallerService();
    final storage = MockStorageService();
    when(storage.guidedTarget).thenReturn(null);
    when(storage.getStorage()).thenAnswer((_) async => testDisks);
    when(storage.getOriginalStorage()).thenAnswer((_) async => testDisks);

    final model = ConfirmModel(installer, storage);
    await model.init();
    verifyInOrder([
      storage.getStorage(),
      storage.getOriginalStorage(),
    ]);
    verifyNever(storage.setGuidedStorage());

    expect(model.disks, equals(modifiedDisks));
    expect(
      model.partitions,
      equals({
        'sda': [const Partition(number: 1, preserve: false)],
        'sdb': [const Partition(number: 2, preserve: false)],
        'sdc': [const Partition(number: 3, preserve: false)],
        'sdd': [
          const Partition(number: 2, mount: '/mnt'),
          const Partition(number: 3, wipe: 'superblock'),
          const Partition(number: 4, resize: true),
        ],
      }),
    );
    expect(
      model.getOriginalPartition('sdd', 3),
      const Partition(number: 3, wipe: 'superblock'),
    );
  });

  test('set guided storage', () async {
    const target = GuidedStorageTarget.reformat(diskId: 'sda', allowed: []);

    final installer = MockInstallerService();
    final storage = MockStorageService();
    when(storage.guidedTarget).thenReturn(target);
    when(storage.getStorage()).thenAnswer((_) async => testDisks);
    when(storage.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(storage.setGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());

    final model = ConfirmModel(installer, storage);
    await model.init();
    verify(storage.setGuidedStorage()).called(1);
  });

  test('start installation', () async {
    final installer = MockInstallerService();
    final storage = MockStorageService();
    when(storage.guidedTarget).thenReturn(null);
    when(storage.getStorage()).thenAnswer((_) async => testDisks);
    when(storage.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(storage.setStorage()).thenAnswer((_) async => modifiedDisks);

    final model = ConfirmModel(installer, storage);
    await model.init();
    await model.startInstallation();

    verifyNever(storage.setStorage());
    verify(storage.securityKey = null).called(1);
    verify(installer.start()).called(1);
  });
}
