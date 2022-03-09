import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'write_changes_to_disk_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
void main() {
  const testDisks = <Disk>[
    Disk(
      id: 'a',
      preserve: false,
      objects: [Partition(number: 1, preserve: false)],
    ),
    Disk(
      id: 'b',
      preserve: true,
      objects: [
        Partition(number: 1),
        Partition(number: 2, grubDevice: true),
      ],
    ),
    Disk(
      id: 'c',
      preserve: false,
      objects: [
        Partition(number: 3, preserve: false),
        Partition(number: 4, grubDevice: false),
      ],
    ),
  ];

  const nonPreservedDisks = <Disk>[
    Disk(
      id: 'a',
      preserve: false,
      objects: [Partition(number: 1, preserve: false)],
    ),
    Disk(
      id: 'c',
      preserve: false,
      objects: [Partition(number: 3, preserve: false)],
    ),
  ];

  test('get storage', () async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);

    final model = WriteChangesToDiskModel(client, service);
    await model.init();
    verify(service.getStorage()).called(1);

    expect(model.disks, equals(nonPreservedDisks));
    expect(model.partitions(nonPreservedDisks.first),
        equals([Partition(number: 1, preserve: false)]));
    expect(model.partitions(nonPreservedDisks.last),
        equals([Partition(number: 3, preserve: false)]));
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
