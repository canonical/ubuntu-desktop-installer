import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_resize/guided_resize_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_guided_resize.mocks.dart';
export '../../test_utils.dart';
export 'test_guided_resize.mocks.dart';

@GenerateMocks([GuidedResizeModel])
GuidedResizeModel buildGuidedResizeModel({
  int? storageCount,
  int? selectedIndex,
  GuidedStorageTargetResize? selectedStorage,
  Disk? selectedDisk,
  Partition? selectedPartition,
  OsProber? selectedOS,
  ProductInfo? productInfo,
  List<Disk>? allDisks,
  Map<int, List<Partition>>? allPartitions,
  List<OsProber>? existingOs,
  int? currentSize,
  int? minimumSize,
  int? maximumSize,
  int? totalSize,
}) {
  final model = MockGuidedResizeModel();
  when(model.storageCount).thenReturn(storageCount ?? 0);
  when(model.selectedIndex).thenReturn(selectedIndex);
  when(model.selectedStorage).thenReturn(selectedStorage);
  when(model.selectedDisk).thenReturn(selectedDisk);
  when(model.selectedPartition).thenReturn(selectedPartition);
  when(model.selectedOS).thenReturn(selectedOS);
  when(model.productInfo).thenReturn(productInfo ?? ProductInfo(name: ''));
  when(model.existingOS).thenReturn(existingOs ?? []);
  when(model.getDisk(any))
      .thenAnswer((i) => allDisks?[i.positionalArguments.single as int]);
  when(model.getPartition(any)).thenAnswer(
      (i) => allPartitions?[i.positionalArguments.single as int]?.firstOrNull);
  when(model.getAllPartitions(any))
      .thenAnswer((i) => allPartitions?[i.positionalArguments.single as int]);
  when(model.getOS(any)).thenAnswer((i) =>
      allPartitions?[i.positionalArguments.single as int]?.singleOrNull?.os);
  when(model.currentSize).thenReturn(currentSize ?? 0);
  when(model.minimumSize).thenReturn(minimumSize ?? 0);
  when(model.maximumSize).thenReturn(maximumSize ?? 1);
  when(model.totalSize).thenReturn(totalSize ?? 0);
  return model;
}
