import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/select_guided_storage/select_guided_storage_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'select_guided_storage_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
void main() {
  const testStorages = <Disk>[Disk(id: 'a'), Disk(id: 'b')];

  test('load guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getGuidedStorage()).thenAnswer((_) async => testStorages);

    final model = SelectGuidedStorageModel(service);
    await model.loadGuidedStorage();
    verify(service.getGuidedStorage()).called(1);

    expect(model.storages, equals(testStorages));
  });

  test('save guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getGuidedStorage()).thenAnswer((_) async => testStorages);

    final model = SelectGuidedStorageModel(service);
    await model.loadGuidedStorage();

    model.selectStorage(0);
    await model.saveGuidedStorage();
    verify(service.setGuidedStorage(testStorages[0])).called(1);

    model.selectStorage(1);
    await model.saveGuidedStorage();
    verify(service.setGuidedStorage(testStorages[1])).called(1);
  });

  test('select guided storage', () async {
    final service = MockDiskStorageService();
    when(service.getGuidedStorage()).thenAnswer((_) async => testStorages);

    final model = SelectGuidedStorageModel(service);
    expect(model.selectedIndex, isZero);
    expect(model.selectedStorage, isNull);

    await model.loadGuidedStorage();

    expect(model.selectedIndex, isZero);
    expect(model.selectedStorage, equals(testStorages[0]));

    model.selectStorage(0);
    expect(model.selectedIndex, isZero);
    expect(model.selectedStorage, equals(testStorages[0]));

    model.selectStorage(1);
    expect(model.selectedIndex, equals(1));
    expect(model.selectedStorage, equals(testStorages[1]));
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
