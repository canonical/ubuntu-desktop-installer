import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/install_alongside/install_alongside_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_install_alongside.dart';

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

const windows10 = OsProber(
  long: 'Windows 10',
  label: 'WIN10',
  version: '10',
  type: 'chain',
);

void main() {
  test('init guided storage', () async {
    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => [fakeDisk()]);
    when(service.getGuidedStorage()).thenAnswer((_) async =>
        fakeGuidedStorageResponse(possible: [fakeGuidedStorageTargetResize()]));

    final model = InstallAlongsideModel(service, MockProductService());
    expect(model.selectedIndex, isNull);

    await model.init();
    expect(model.selectedIndex, 0);

    verify(service.getStorage()).called(1);
    verify(service.getGuidedStorage()).called(1);
  });

  test('save guided storage', () async {
    const partition1 = Partition(number: 1, size: 100);
    const partition2 = Partition(number: 2, size: 200);
    final disk = fakeDisk(id: 'id', partitions: [partition1, partition2]);
    final resize1 =
        fakeGuidedStorageTargetResize(diskId: disk.id, partitionNumber: 1);
    final resize2 = fakeGuidedStorageTargetResize(
        diskId: disk.id, partitionNumber: 2, maximum: 200);

    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => [disk]);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(possible: [resize1, resize2]));

    final model = InstallAlongsideModel(service, MockProductService());
    await model.init();

    model.selectStorage(1);
    model.resizeStorage(500);
    expect(model.selectedIndex, 1);

    await model.save();
    verify(service.guidedTarget = resize2.copyWith(newSize: 200)).called(1);
    verifyNever(service.setGuidedStorage());
  });

  test('reset storage', () async {
    final service = MockStorageService();
    when(service.resetStorage()).thenAnswer((_) async => []);
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());

    final model = InstallAlongsideModel(service, MockProductService());
    await model.reset();
    verifyInOrder([service.resetStorage(), service.getGuidedStorage()]);
  });

  test('existing OS', () async {
    final service = MockStorageService();
    when(service.existingOS).thenReturn([ubuntu2110, ubuntu2204]);

    final model = InstallAlongsideModel(service, MockProductService());
    expect(model.existingOS, equals([ubuntu2110, ubuntu2204]));
  });

  test('product info', () {
    final service = MockProductService();
    when(service.getProductInfo()).thenReturn(ProductInfo(name: 'Foo'));

    final model = InstallAlongsideModel(MockStorageService(), service);
    expect(model.productInfo.name, 'Foo');
  });

  test('get storage', () async {
    const sda1 = Partition(number: 1, size: 1, os: ubuntu2110);
    const sda2 = Partition(number: 2, size: 2);
    final sda = fakeDisk(id: 'sda', partitions: [sda1, sda2]);

    const sdb1 = Partition(number: 1, size: 3, os: ubuntu2204);
    final sdb = fakeDisk(id: 'sdb', partitions: [sdb1]);

    final storage1 =
        fakeGuidedStorageTargetResize(diskId: 'sda', partitionNumber: 2);
    final storage2 =
        fakeGuidedStorageTargetResize(diskId: 'sdb', partitionNumber: 1);

    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => [sda, sdb]);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(possible: [storage1, storage2]));

    final model = InstallAlongsideModel(service, MockProductService());
    expect(model.storageCount, isZero);
    expect(model.getDisk(0), isNull);
    expect(model.getDisk(1), isNull);
    expect(model.getPartition(0), isNull);
    expect(model.getPartition(1), isNull);
    expect(model.getAllPartitions(0), isNull);
    expect(model.getAllPartitions(1), isNull);
    expect(model.getOS(0), isNull);
    expect(model.getOS(1), isNull);

    await model.init();
    expect(model.storageCount, equals(2));
    expect(model.getDisk(0), equals(sda));
    expect(model.getDisk(1), equals(sdb));
    expect(model.getPartition(0), equals(sda2));
    expect(model.getPartition(1), equals(sdb1));
    expect(model.getAllPartitions(0), [sda1, sda2]);
    expect(model.getAllPartitions(1), [sdb1]);
    expect(model.getOS(0), ubuntu2110);
    expect(model.getOS(1), ubuntu2204);
  });

  test('select storage', () async {
    const sda1 = Partition(number: 1, size: 1, os: ubuntu2110);
    const sda2 = Partition(number: 2, size: 2);
    final sda = fakeDisk(id: 'sda', partitions: [sda1, sda2]);

    const sdb1 = Partition(number: 1, size: 3, os: ubuntu2204);
    final sdb = fakeDisk(id: 'sdb', partitions: [sdb1]);

    final storage1 =
        fakeGuidedStorageTargetResize(diskId: 'sda', partitionNumber: 2);
    final storage2 =
        fakeGuidedStorageTargetResize(diskId: 'sdb', partitionNumber: 1);

    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => [sda, sdb]);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(possible: [storage1, storage2]));

    final model = InstallAlongsideModel(service, MockProductService());
    expect(model.storageCount, isZero);
    expect(model.selectedIndex, isNull);
    expect(model.selectedStorage, isNull);
    expect(model.selectedDisk, isNull);
    expect(model.selectedPartition, isNull);
    expect(model.selectedOS, isNull);

    await model.init();
    expect(model.selectedIndex, equals(0));
    expect(model.selectedStorage, equals(storage1));
    expect(model.selectedDisk, equals(sda));
    expect(model.selectedPartition, sda2);
    expect(model.selectedOS, ubuntu2110);

    var notified = 0;
    model.addListener(() => ++notified);

    model.selectStorage(1);
    expect(model.selectedIndex, equals(1));
    expect(model.selectedStorage, equals(storage2));
    expect(model.selectedDisk, equals(sdb));
    expect(model.selectedPartition, sdb1);
    expect(model.selectedOS, ubuntu2204);
    expect(notified, equals(1));

    model.selectStorage(1);
    expect(notified, equals(1));

    model.selectStorage(null);
    expect(notified, equals(2));
    expect(model.selectedIndex, isNull);
    expect(model.selectedStorage, isNull);
    expect(model.selectedDisk, isNull);
    expect(model.selectedPartition, isNull);
    expect(model.selectedOS, isNull);
  });

  test('resize storage', () async {
    const partition1 = Partition(number: 1, size: 11111);
    const partition2 = Partition(number: 2, size: 22222);
    final disk = fakeDisk(id: 'id', partitions: [partition1, partition2]);

    const storage1 = GuidedStorageTargetResize(
      diskId: 'id',
      partitionNumber: 1,
      newSize: 0,
      minimum: 111,
      recommended: 122,
      maximum: 133,
      capabilities: [GuidedCapability.DIRECT],
    );

    const storage2 = GuidedStorageTargetResize(
      diskId: 'id',
      partitionNumber: 2,
      newSize: 0,
      minimum: 211,
      recommended: 222,
      maximum: 233,
      capabilities: [GuidedCapability.DIRECT],
    );

    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => [disk]);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(possible: [storage1, storage2]));

    final model = InstallAlongsideModel(service, MockProductService());
    await model.init();
    expect(model.selectedIndex, equals(0));

    expect(model.currentSize, equals(storage1.recommended));
    expect(model.minimumSize, equals(storage1.minimum));
    expect(model.maximumSize, equals(storage1.maximum));
    expect(model.totalSize, equals(partition1.size));

    model.resizeStorage(123);
    expect(model.currentSize, equals(123));

    model.selectStorage(1);
    expect(model.selectedIndex, equals(1));
    expect(model.currentSize, equals(storage2.recommended));
    expect(model.minimumSize, equals(storage2.minimum));
    expect(model.maximumSize, equals(storage2.maximum));
    expect(model.totalSize, equals(partition2.size));

    model.resizeStorage(223);
    expect(model.currentSize, equals(223));

    model.selectStorage(0);
    expect(model.selectedIndex, equals(0));
    expect(model.currentSize, equals(storage1.recommended));
  });
}
