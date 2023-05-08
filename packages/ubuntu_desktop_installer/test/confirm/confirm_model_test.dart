import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'confirm_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
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
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(null);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);

    final model = ConfirmModel(client, service);
    await model.init();
    verifyInOrder([
      service.getStorage(),
      service.getOriginalStorage(),
    ]);
    verifyNever(service.setGuidedStorage());

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
    const target =
        GuidedStorageTarget.reformat(diskId: 'sda', capabilities: []);

    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(target);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(service.setGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());

    final model = ConfirmModel(client, service);
    await model.init();
    verify(service.setGuidedStorage()).called(1);
  });

  test('start installation', () async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.guidedTarget).thenReturn(null);
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getOriginalStorage()).thenAnswer((_) async => testDisks);
    when(service.setStorage()).thenAnswer((_) async => modifiedDisks);

    final model = ConfirmModel(client, service);
    await model.init();
    await model.startInstallation();

    verifyNever(service.setStorage());
    verify(service.securityKey = null).called(1);
    verify(client.confirm('/dev/tty1')).called(1);
  });
}
