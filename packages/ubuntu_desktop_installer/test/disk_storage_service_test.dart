import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services/disk_storage_service.dart';
import 'package:ubuntu_test/mocks.dart';

void main() {
  const testDisks = <Disk>[Disk(id: 'a'), Disk(id: 'b')];

  late SubiquityClient client;

  setUp(() {
    client = MockSubiquityClient();
    when(client.isOpen).thenAnswer((_) async => true);
    when(client.getGuidedStorage())
        .thenAnswer((_) async => GuidedStorageResponse(disks: testDisks));
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
    when(client.setGuidedStorageV2(choice))
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    final service = DiskStorageService(client);
    await service.setGuidedStorage(testDisks.last);
    expect(service.storage, equals(testDisks));
    verify(client.setGuidedStorageV2(choice)).called(1);
  });

  test('use LVM', () async {
    final choice = GuidedChoice(diskId: testDisks.last.id, useLvm: true);
    when(client.setGuidedStorageV2(choice))
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

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

    when(client.getGuidedStorage()).thenAnswer(
        (_) async => GuidedStorageResponse(disks: [testDisks.first]));
    when(client.resetStorageV2()).thenAnswer((_) async => StorageResponseV2());

    await service.resetGuidedStorage();
    expect(service.hasMultipleDisks, isFalse);
  });

  test('get storage', () async {
    when(client.getStorageV2())
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    final service = DiskStorageService(client);
    expect(await service.getStorage(), equals(testDisks));
    expect(service.storage, equals(testDisks));
    verify(client.getStorageV2()).called(1);
  });

  test('set storage', () async {
    when(client.setStorageV2())
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    final service = DiskStorageService(client);
    expect(await service.setStorage(testDisks), equals(testDisks));
    expect(service.storage, equals(testDisks));
    verify(client.setStorageV2()).called(1);
  });

  test('reset storage', () async {
    when(client.resetStorageV2())
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    final service = DiskStorageService(client);
    expect(await service.resetStorage(), equals(testDisks));
    expect(service.storage, equals(testDisks));
    verify(client.resetStorageV2()).called(1);
  });

  test('needs', () async {
    when(client.getStorageV2()).thenAnswer(
        (_) async => StorageResponseV2(needRoot: true, needBoot: false));

    final service = DiskStorageService(client);
    await service.getStorage();

    expect(service.needRoot, isTrue);
    expect(service.needBoot, isFalse);

    when(client.resetStorageV2()).thenAnswer(
        (_) async => StorageResponseV2(needRoot: false, needBoot: true));

    await service.resetStorage();

    expect(service.needRoot, isFalse);
    expect(service.needBoot, isTrue);
  });

  test('add/edit/remove partition', () async {
    final disk = Disk(id: 'tst');
    final partition = Partition(number: 1);
    final service = DiskStorageService(client);

    when(client.addPartitionV2(disk, partition))
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    await service.addPartition(disk, partition);
    expect(service.storage, equals(testDisks));
    verify(client.addPartitionV2(disk, partition)).called(1);

    when(client.editPartitionV2(disk, partition)).thenAnswer(
        (_) async => StorageResponseV2(disks: testDisks.reversed.toList()));

    await service.editPartition(disk, partition);
    expect(service.storage, equals(testDisks.reversed.toList()));
    verify(client.editPartitionV2(disk, partition)).called(1);

    when(client.deletePartitionV2(disk, partition))
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    await service.deletePartition(disk, partition);
    expect(service.storage, equals(testDisks));
    verify(client.deletePartitionV2(disk, partition)).called(1);
  });

  test('add boot partition', () async {
    final disk = Disk(id: 'tst');
    final service = DiskStorageService(client);

    when(client.addBootPartitionV2(disk))
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    await service.addBootPartition(disk);
    expect(service.storage, equals(testDisks));
    verify(client.addBootPartitionV2(disk)).called(1);
  });

  test('reformat disk', () async {
    final disk = Disk(id: 'tst');
    final service = DiskStorageService(client);

    when(client.reformatDiskV2(disk))
        .thenAnswer((_) async => StorageResponseV2(disks: testDisks));

    await service.reformatDisk(disk);
    expect(service.storage, equals(testDisks));
    verify(client.reformatDiskV2(disk)).called(1);
  });
}
