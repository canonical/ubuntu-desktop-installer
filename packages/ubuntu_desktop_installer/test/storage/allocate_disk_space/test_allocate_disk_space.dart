import 'package:collection/collection.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/storage/allocate_disk_space/allocate_disk_space_model.dart';

import 'test_allocate_disk_space.mocks.dart';
export '../../test_utils.dart';
export 'test_allocate_disk_space.mocks.dart';

@GenerateMocks([AllocateDiskSpaceModel])
AllocateDiskSpaceModel buildAllocateDiskSpaceModel({
  bool? isValid,
  List<Disk>? disks,
  Gap? selectedGap,
  Disk? selectedDisk,
  int? selectedDiskIndex,
  Partition? selectedPartition,
  int? selectedObjectIndex,
  bool? canAddPartition,
  bool? canRemovePartition,
  bool? canEditPartition,
  bool? canReformatDisk,
  int? bootDiskIndex,
}) {
  final model = MockAllocateDiskSpaceModel();
  when(model.isValid).thenReturn(isValid ?? false);
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.originalConfig(any)).thenAnswer((i) {
    return disks
        ?.expand((d) => d.partitions.whereType<Partition>())
        .firstWhereOrNull((p) => p.path == i.positionalArguments[0].path);
  });

  when(model.selectedGap).thenReturn(selectedGap);
  when(model.selectedDisk).thenReturn(selectedDisk);
  when(model.selectedDiskIndex).thenReturn(selectedDiskIndex ?? 0);
  when(model.selectedPartition).thenReturn(selectedPartition);
  when(model.selectedObjectIndex).thenReturn(selectedObjectIndex ?? 0);
  when(model.onSelectionChanged).thenAnswer((_) => const Stream.empty());
  when(model.isStorageSelected(any, any)).thenReturn(false);
  when(model.canSelectStorage(any, any)).thenReturn(true);

  when(model.canAddPartition).thenReturn(canAddPartition ?? false);
  when(model.canRemovePartition).thenReturn(canRemovePartition ?? false);
  when(model.canEditPartition).thenReturn(canEditPartition ?? false);
  when(model.canReformatDisk).thenReturn(canReformatDisk ?? false);

  when(model.bootDiskIndex).thenReturn(bootDiskIndex);
  return model;
}
