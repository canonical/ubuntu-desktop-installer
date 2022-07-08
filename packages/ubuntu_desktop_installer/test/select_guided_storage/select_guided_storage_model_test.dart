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
      .map((disk) => GuidedStorageTargetReformat(diskId: disk.id))
      .toList();

  test('load guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => GuidedStorageResponseV2(possible: testTargets));

    final model = SelectGuidedStorageModel(service);
    await model.loadGuidedStorage();
    verify(service.getGuidedStorage()).called(1);

    expect(model.storages, equals(testTargets));
  });

  test('save guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => GuidedStorageResponseV2(possible: testTargets));
    when(service.setGuidedStorage(any)).thenAnswer(
        (_) async => GuidedStorageResponseV2(possible: testTargets));

    final model = SelectGuidedStorageModel(service);
    await model.loadGuidedStorage();

    model.selectStorage(0);
    await model.saveGuidedStorage();
    verify(service.setGuidedStorage(testTargets[0])).called(1);

    model.selectStorage(1);
    await model.saveGuidedStorage();
    verify(service.setGuidedStorage(testTargets[1])).called(1);
  });

  test('select guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => GuidedStorageResponseV2(possible: testTargets));

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
