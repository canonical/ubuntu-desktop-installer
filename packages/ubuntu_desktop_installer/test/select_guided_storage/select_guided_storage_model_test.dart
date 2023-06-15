import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/select_guided_storage/select_guided_storage_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'select_guided_storage_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
void main() {
  final testDisks = <Disk>[testDisk(id: 'a'), testDisk(id: 'b')];
  final testTargets = testDisks
      .map((disk) => GuidedStorageTargetReformat(diskId: disk.id, allowed: []))
      .toList();

  test('load guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(targets: testTargets));

    final model = SelectGuidedStorageModel(service);
    await model.loadGuidedStorage();
    verify(service.getGuidedStorage()).called(1);

    expect(model.storages, equals(testTargets));
  });

  test('save guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(targets: testTargets));

    final model = SelectGuidedStorageModel(service);
    await model.loadGuidedStorage();

    model.selectStorage(0);
    await model.saveGuidedStorage();
    verify(service.guidedTarget = testTargets[0]).called(1);
    verifyNever(service.setGuidedStorage());

    model.selectStorage(1);
    await model.saveGuidedStorage();
    verify(service.guidedTarget = testTargets[1]).called(1);
    verifyNever(service.setGuidedStorage());
  });

  test('get storage', () async {
    const sda1 = Partition(number: 1, size: 1);
    const sda2 = Partition(number: 2, size: 2);
    final sda = testDisk(id: 'sda', partitions: [sda1, sda2]);

    const sdb1 = Partition(number: 1, size: 3);
    final sdb = testDisk(id: 'sdb', partitions: [sdb1]);

    const storage0 = GuidedStorageTargetReformat(diskId: 'sda', allowed: []);
    const storage1 = GuidedStorageTargetReformat(diskId: 'sdb', allowed: []);

    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => [sda, sdb]);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(targets: [storage0, storage1]));

    final model = SelectGuidedStorageModel(service);
    expect(model.getStorage(0), isNull);
    expect(model.getStorage(1), isNull);
    expect(model.getDisk(0), isNull);
    expect(model.getDisk(1), isNull);

    await model.loadGuidedStorage();
    expect(model.getStorage(0), storage0);
    expect(model.getStorage(1), storage1);
    expect(model.getDisk(0), equals(sda));
    expect(model.getDisk(1), equals(sdb));

    expect(model.getStorage(-1), isNull);
    expect(model.getStorage(123), isNull);
  });

  test('select guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(targets: testTargets));

    final model = SelectGuidedStorageModel(service);
    expect(model.selectedIndex, isZero);
    expect(model.selectedDisk, isNull);

    await model.loadGuidedStorage();

    expect(model.selectedIndex, isZero);
    expect(model.selectedDisk, equals(testDisks[0]));

    model.selectStorage(0);
    expect(model.selectedIndex, isZero);
    expect(model.selectedDisk, equals(testDisks[0]));

    model.selectStorage(1);
    expect(model.selectedIndex, equals(1));
    expect(model.selectedDisk, equals(testDisks[1]));
  });

  test('reset guided storage', () async {
    final service = MockDiskStorageService();
    when(service.resetStorage()).thenAnswer((_) async => testDisks);

    final model = SelectGuidedStorageModel(service);
    await model.resetGuidedStorage();
    verify(service.resetStorage()).called(1);
  });

  test('notify changes', () {
    final model = SelectGuidedStorageModel(MockDiskStorageService());
    expect(model.selectedIndex, isZero);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    model.selectStorage(0);
    expect(model.selectedIndex, isZero);
    expect(wasNotified, isFalse);

    wasNotified = false;
    model.selectStorage(1);
    expect(model.selectedIndex, equals(1));
    expect(wasNotified, isTrue);
  });
}
