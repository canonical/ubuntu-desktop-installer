import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
  ];

  final nonPreservedDisks = <Disk>[testDisks.first, testDisks.last];

  test('get storage', () async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);

    final model = WriteChangesToDiskModel(client, service);
    await model.init();
    verify(service.getStorage()).called(1);

    expect(model.disks, equals(nonPreservedDisks));
    expect(
      model.partitions,
      equals({
        'sda': [Partition(number: 1, preserve: false)],
        'sdb': [Partition(number: 2, preserve: false)],
        'sdc': [Partition(number: 3, preserve: false)],
      }),
    );
  });

  test('start installation', () async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.setStorage(any)).thenAnswer((_) async => nonPreservedDisks);

    final model = WriteChangesToDiskModel(client, service);
    await model.init();
    await model.startInstallation();

    verify(service.setStorage(nonPreservedDisks)).called(1);
    verify(client.confirm('/dev/tty1')).called(1);
  });
}
