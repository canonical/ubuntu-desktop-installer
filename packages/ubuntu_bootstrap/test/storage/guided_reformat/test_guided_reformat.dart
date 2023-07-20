import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_bootstrap/pages/storage/guided_reformat/guided_reformat_model.dart';

import 'test_guided_reformat.mocks.dart';
export '../../test_utils.dart';
export 'test_guided_reformat.mocks.dart';

@GenerateMocks([GuidedReformatModel])
GuidedReformatModel buildGuidedReformatModel({
  List<Disk>? disks,
  List<GuidedStorageTargetReformat>? storages,
  int? selectedIndex,
  Disk? selectedDisk,
  GuidedStorageTargetReformat? selectedStorage,
}) {
  final model = MockGuidedReformatModel();
  when(model.storages).thenReturn(storages ?? <GuidedStorageTargetReformat>[]);
  when(model.selectedIndex).thenReturn(selectedIndex ?? 0);
  when(model.selectedDisk).thenReturn(selectedDisk);
  when(model.selectedStorage).thenReturn(selectedStorage);
  when(model.getDisk(any))
      .thenAnswer((i) => disks?.elementAtOrNull(i.positionalArguments.first));
  when(model.getStorage(any)).thenAnswer(
      (i) => storages?.elementAtOrNull(i.positionalArguments.first));
  when(model.init()).thenAnswer((_) async => (storages?.length ?? 0) > 1);
  return model;
}
