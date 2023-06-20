import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_reformat/guided_reformat_model.dart';

import 'test_guided_reformat.dart';

void main() {
  final testDisks = <Disk>[fakeDisk(id: 'a'), fakeDisk(id: 'b')];
  final testTargets = testDisks
      .map((disk) => GuidedStorageTargetReformat(diskId: disk.id))
      .toList();

  test('load guided storage', () async {
    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: testTargets));

    final model = GuidedReformatModel(service);
    await model.loadGuidedStorage();
    verify(service.getGuidedStorage()).called(1);

    expect(model.storages, equals(testTargets));
  });

  test('save guided storage', () async {
    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: testTargets));

    final model = GuidedReformatModel(service);
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
    final sda = fakeDisk(id: 'sda', partitions: [sda1, sda2]);

    const sdb1 = Partition(number: 1, size: 3);
    final sdb = fakeDisk(id: 'sdb', partitions: [sdb1]);

    const storage0 = GuidedStorageTargetReformat(diskId: 'sda');
    const storage1 = GuidedStorageTargetReformat(diskId: 'sdb');

    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => [sda, sdb]);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: [storage0, storage1]));

    final model = GuidedReformatModel(service);
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
    final service = MockStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: testTargets));

    final model = GuidedReformatModel(service);
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
    final service = MockStorageService();
    when(service.resetStorage()).thenAnswer((_) async => testDisks);

    final model = GuidedReformatModel(service);
    await model.resetGuidedStorage();
    verify(service.resetStorage()).called(1);
  });

  test('notify changes', () {
    final model = GuidedReformatModel(MockStorageService());
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
