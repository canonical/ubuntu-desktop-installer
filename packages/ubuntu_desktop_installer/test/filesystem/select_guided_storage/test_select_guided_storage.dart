import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/select_guided_storage/select_guided_storage_model.dart';

import 'test_select_guided_storage.mocks.dart';
export '../../test_utils.dart';
export 'test_select_guided_storage.mocks.dart';

@GenerateMocks([SelectGuidedStorageModel])
SelectGuidedStorageModel buildSelectGuidedStorageModel({
  List<Disk>? disks,
  List<GuidedStorageTargetReformat>? storages,
  int? selectedIndex,
  Disk? selectedDisk,
  GuidedStorageTargetReformat? selectedStorage,
  bool? isDone,
}) {
  final model = MockSelectGuidedStorageModel();
  when(model.storages).thenReturn(storages ?? <GuidedStorageTargetReformat>[]);
  when(model.selectedIndex).thenReturn(selectedIndex ?? 0);
  when(model.selectedDisk).thenReturn(selectedDisk);
  when(model.selectedStorage).thenReturn(selectedStorage);
  when(model.getDisk(any))
      .thenAnswer((i) => disks?.elementAtOrNull(i.positionalArguments.first));
  when(model.getStorage(any)).thenAnswer(
      (i) => storages?.elementAtOrNull(i.positionalArguments.first));
  when(model.isDone).thenReturn(isDone ?? false);
  return model;
}
