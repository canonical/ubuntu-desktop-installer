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
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
  });

  test('get guided storage', () async {
    final service = DiskStorageService(client);
    await untilCalled(client.getGuidedStorage());

    expect(await service.getGuidedStorage(), equals(testDisks));
    expect(service.guidedStorage, equals(testDisks));
    verify(client.getGuidedStorage()).called(2);
  });

  test('set guided storage', () async {
    final choice = GuidedChoice(diskId: testDisks.last.id, useLvm: false);
    when(client.setGuidedStorageV2(choice)).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    final service = DiskStorageService(client);
    await service.setGuidedStorage(testDisks.last);
    expect(service.storage, equals(testDisks));
    verify(client.setGuidedStorageV2(choice)).called(1);
  });

  test('use LVM', () async {
    final choice = GuidedChoice(diskId: testDisks.last.id, useLvm: true);
    when(client.setGuidedStorageV2(choice)).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    final service = DiskStorageService(client);
    service.useLvm = true;

    await service.setGuidedStorage(testDisks.last);
    expect(service.storage, equals(testDisks));
    verify(client.setGuidedStorageV2(choice)).called(1);
  });

  test('reset guided storage', () async {
    final service = DiskStorageService(client);
    expect(service.hasMultipleDisks, isFalse);
    await untilCalled(client.getGuidedStorage());

    await service.getGuidedStorage();
    expect(service.hasMultipleDisks, isTrue);

    when(client.getGuidedStorage()).thenAnswer((_) async =>
        GuidedStorageResponse(
            disks: [testDisks.first], status: ProbeStatus.DONE));
    when(client.resetStorageV2()).thenAnswer((_) async =>
        StorageResponseV2(disks: [], needBoot: false, needRoot: false));

    await service.resetGuidedStorage();
    expect(service.hasMultipleDisks, isFalse);
  });

  test('get storage', () async {
    when(client.getStorageV2()).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    final service = DiskStorageService(client);
    expect(await service.getStorage(), equals(testDisks));
    expect(service.storage, equals(testDisks));
    verify(client.getStorageV2()).called(1);
  });

  test('set storage', () async {
    when(client.setStorageV2()).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    final service = DiskStorageService(client);
    expect(await service.setStorage(testDisks), equals(testDisks));
    expect(service.storage, equals(testDisks));
    verify(client.setStorageV2()).called(1);
  });

  test('reset storage', () async {
    when(client.resetStorageV2()).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    final service = DiskStorageService(client);
    expect(await service.resetStorage(), equals(testDisks));
    expect(service.storage, equals(testDisks));
    verify(client.resetStorageV2()).called(1);
  });

  test('needs', () async {
    when(client.getStorageV2()).thenAnswer((_) async =>
        StorageResponseV2(needRoot: true, needBoot: false, disks: []));

    final service = DiskStorageService(client);
    await service.getStorage();

    expect(service.needRoot, isTrue);
    expect(service.needBoot, isFalse);

    when(client.resetStorageV2()).thenAnswer((_) async =>
        StorageResponseV2(needRoot: false, needBoot: true, disks: []));

    await service.resetStorage();

    expect(service.needRoot, isFalse);
    expect(service.needBoot, isTrue);
  });

  test('add/edit/remove partition', () async {
    final disk = testDisk(id: 'tst');
    final gap = Gap(offset: 2, size: 3);
    final partition = Partition(number: 1);
    final service = DiskStorageService(client);

    when(client.addPartitionV2(disk, gap, partition)).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    await service.addPartition(disk, gap, partition);
    expect(service.storage, equals(testDisks));
    verify(client.addPartitionV2(disk, gap, partition)).called(1);

    when(client.editPartitionV2(disk, partition)).thenAnswer((_) async =>
        StorageResponseV2(
            disks: testDisks.reversed.toList(),
            needBoot: false,
            needRoot: false));

    await service.editPartition(disk, partition);
    expect(service.storage, equals(testDisks.reversed.toList()));
    verify(client.editPartitionV2(disk, partition)).called(1);

    when(client.deletePartitionV2(disk, partition)).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    await service.deletePartition(disk, partition);
    expect(service.storage, equals(testDisks));
    verify(client.deletePartitionV2(disk, partition)).called(1);
  });

  test('add boot partition', () async {
    final disk = testDisk(id: 'tst');
    final service = DiskStorageService(client);

    when(client.addBootPartitionV2(disk)).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    await service.addBootPartition(disk);
    expect(service.storage, equals(testDisks));
    verify(client.addBootPartitionV2(disk)).called(1);
  });

  test('reformat disk', () async {
    final disk = testDisk(id: 'tst');
    final service = DiskStorageService(client);

    when(client.reformatDiskV2(disk)).thenAnswer((_) async =>
        StorageResponseV2(disks: testDisks, needBoot: false, needRoot: false));

    await service.reformatDisk(disk);
    expect(service.storage, equals(testDisks));
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
}
