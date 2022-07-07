import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services/disk_storage_service.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';

// ignore_for_file: type=lint

void main() {
  final testDisks = <Disk>[testDisk(id: 'a'), testDisk(id: 'b')];

  late SubiquityClient client;

  setUp(() {
    client = MockSubiquityClient();
    when(client.isOpen).thenAnswer((_) async => true);
    when(client.getGuidedStorage()).thenAnswer((_) async =>
        GuidedStorageResponse(disks: testDisks, status: ProbeStatus.DONE));
    when(client.getStorageV2()).thenAnswer((_) async => StorageResponseV2(
        disks: testDisks,
        needBoot: false,
        needRoot: false,
        installMinimumSize: 0));
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
  });

  test('get guided storage', () async {
    final service = DiskStorageService(client);
    expect(await service.getGuidedStorage(), equals(testDisks));
    verify(client.getGuidedStorage()).called(1);
  });

  test('set guided storage', () async {
    final choice = GuidedChoice(diskId: testDisks.last.id, useLvm: false);
    when(client.setGuidedStorage(choice))
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    final service = DiskStorageService(client);
    await service.setGuidedStorage(testDisks.last);
    verify(client.setGuidedStorage(choice)).called(1);
  });

  test('use LVM', () async {
    final choice = GuidedChoice(diskId: testDisks.last.id, useLvm: true);
    when(client.setGuidedStorage(choice))
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    final service = DiskStorageService(client);
    service.useLvm = true;

    await service.setGuidedStorage(testDisks.last);
    verify(client.setGuidedStorage(choice)).called(1);
  });

  test('reset guided storage', () async {
    final service = DiskStorageService(client);
    expect(service.hasMultipleDisks, isFalse);
    await untilCalled(client.getStorageV2());

    await service.getGuidedStorage();
    expect(service.hasMultipleDisks, isTrue);

    when(client.getGuidedStorage()).thenAnswer((_) async =>
        GuidedStorageResponse(
            disks: [testDisks.first], status: ProbeStatus.DONE));
    when(client.resetStorageV2())
        .thenAnswer((_) async => testStorageResponse(disks: []));

    await service.resetStorage();
    expect(service.hasMultipleDisks, isFalse);
  });

  test('get storage', () async {
    when(client.getStorageV2())
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    final service = DiskStorageService(client);
    await untilCalled(client.getStorageV2());
    verify(client.getStorageV2()).called(1);

    expect(await service.getStorage(), equals(testDisks));
    verify(client.getStorageV2()).called(1);
  });

  test('set storage', () async {
    when(client.setStorageV2())
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    final service = DiskStorageService(client);
    expect(await service.setStorage(testDisks), equals(testDisks));
    verify(client.setStorageV2()).called(1);
  });

  test('reset storage', () async {
    when(client.resetStorageV2())
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    final service = DiskStorageService(client);
    expect(await service.resetStorage(), equals(testDisks));
    verify(client.resetStorageV2()).called(1);
  });

  test('needs', () async {
    when(client.getStorageV2())
        .thenAnswer((_) async => testStorageResponse(needRoot: true));

    final service = DiskStorageService(client);
    await service.getStorage();

    expect(service.needRoot, isTrue);
    expect(service.needBoot, isFalse);

    when(client.resetStorageV2()).thenAnswer((_) async => testStorageResponse(
        needRoot: false, needBoot: true, disks: [], installMinimumSize: 0));

    await service.resetStorage();

    expect(service.needRoot, isFalse);
    expect(service.needBoot, isTrue);
  });

  test('add/edit/remove partition', () async {
    final disk = testDisk(id: 'tst');
    final gap = Gap(offset: 2, size: 3);
    final partition = Partition(number: 1);
    final service = DiskStorageService(client);

    when(client.addPartitionV2(disk, gap, partition))
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    expect(await service.addPartition(disk, gap, partition), equals(testDisks));
    verify(client.addPartitionV2(disk, gap, partition)).called(1);

    when(client.editPartitionV2(disk, partition)).thenAnswer(
        (_) async => testStorageResponse(disks: testDisks.reversed.toList()));

    expect(await service.editPartition(disk, partition),
        equals(testDisks.reversed.toList()));
    verify(client.editPartitionV2(disk, partition)).called(1);

    when(client.deletePartitionV2(disk, partition))
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    expect(await service.deletePartition(disk, partition), equals(testDisks));
    verify(client.deletePartitionV2(disk, partition)).called(1);
  });

  test('add boot partition', () async {
    final disk = testDisk(id: 'tst');
    final service = DiskStorageService(client);

    when(client.addBootPartitionV2(disk))
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    expect(await service.addBootPartition(disk), equals(testDisks));
    verify(client.addBootPartitionV2(disk)).called(1);
  });

  test('reformat disk', () async {
    final disk = testDisk(id: 'tst');
    final service = DiskStorageService(client);

    when(client.reformatDiskV2(disk))
        .thenAnswer((_) async => testStorageResponse(disks: testDisks));

    expect(await service.reformatDisk(disk), equals(testDisks));
    verify(client.reformatDiskV2(disk)).called(1);
  });

  test('has RST', () async {
    final service = DiskStorageService(client);

    when(client.hasRst()).thenAnswer((_) async => true);
    await untilCalled(client.hasRst());
    verify(client.hasRst()).called(1);
    expect(service.hasRst, isTrue);

    when(client.hasRst()).thenAnswer((_) async => false);
    await service.init();
    verify(client.hasRst()).called(1);
    expect(service.hasRst, isFalse);
  });

  test('has BitLocker', () async {
    final service = DiskStorageService(client);

    when(client.hasBitLocker()).thenAnswer((_) async => true);
    await untilCalled(client.hasBitLocker());
    expect(service.hasBitLocker, isTrue);
    verify(client.hasBitLocker()).called(1);

    when(client.hasBitLocker()).thenAnswer((_) async => false);
    await service.init();
    verify(client.hasBitLocker()).called(1);
    expect(service.hasBitLocker, isFalse);
  });

  test('existing OS', () async {
    const win10 = OsProber(
      long: 'Windows 10',
      label: 'Windows',
      version: '10',
      type: 'windows',
    );
    const ubuntu2110 = OsProber(
      long: 'Ubuntu 21.10',
      label: 'Ubuntu',
      version: '21.10',
      type: 'linux',
    );
    const ubuntu2204 = OsProber(
      long: 'Ubuntu 22.04 LTS',
      label: 'Ubuntu',
      version: '22.04 LTS',
      type: 'linux',
    );

    when(client.getStorageV2()).thenAnswer(
      (_) async => StorageResponseV2(
        disks: [
          testDisk(
            partitions: [
              Partition(os: win10),
            ],
          ),
          testDisk(
            partitions: [
              Partition(os: ubuntu2110),
              Partition(os: ubuntu2204),
            ],
          ),
        ],
        needRoot: false,
        needBoot: false,
        installMinimumSize: 0,
      ),
    );

    final service = DiskStorageService(client);

    await service.init();
    expect(service.existingOS, equals([win10, ubuntu2110, ubuntu2204]));
  });
}

StorageResponseV2 testStorageResponse({
  List<Disk> disks = const [],
  bool needBoot = false,
  bool needRoot = false,
  int installMinimumSize = 0,
}) {
  return StorageResponseV2(
    disks: disks,
    needBoot: needBoot,
    needRoot: needRoot,
    installMinimumSize: installMinimumSize,
  );
}
