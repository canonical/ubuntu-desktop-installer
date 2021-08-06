import 'package:flutter/foundation.dart';

import '../../disk_storage_service.dart';

class AllocateDiskSpaceModel extends ChangeNotifier {
  AllocateDiskSpaceModel(this._service);

  final DiskStorageService _service;

  var _disks = <Disk>[];
  var _selectedDiskIndex = -1;
  var _selectedPartitionIndex = -1;
  var _bootDiskIndex = 0;

  List<Disk> get disks => _disks;

  int get selectedDiskIndex => _selectedDiskIndex;
  int get selectedPartitionIndex => _selectedPartitionIndex;

  bool isStorageSelected(int diskIndex, [int partitionIndex = -1]) {
    return diskIndex == _selectedDiskIndex &&
        partitionIndex == _selectedPartitionIndex;
  }

  void selectStorage(int diskIndex, [int partitionIndex = -1]) {
    if (isStorageSelected(diskIndex, partitionIndex)) return;

    _selectedDiskIndex = diskIndex;
    _selectedPartitionIndex = partitionIndex;
    notifyListeners();
  }

  Disk? get selectedDisk => disks.elementAtOrNull(_selectedDiskIndex);
  List<Partition>? get selectedPartitions => selectedDisk?.partitions;

  int get bootDiskIndex => _bootDiskIndex;
  void selectBootDisk(int diskIndex) {
    if (_bootDiskIndex == diskIndex) return;
    _bootDiskIndex = diskIndex;
    notifyListeners();
  }

  Future<void> getGuidedStorage() {
    return _service.getGuidedStorage().then((disks) {
      _disks = disks;
      notifyListeners();
    });
  }

  static int calculateFreeSpace(Disk? disk) {
    if (disk?.partitions == null) return disk?.size ?? 0;
    return disk!.partitions!.fold<int>(
      disk.size ?? 0,
      (remainingSize, partition) {
        return remainingSize - (partition.size ?? 0);
      },
    );
  }

  Future<void> setGuidedStorage() => _service.setGuidedStorage();
}

extension _ListOrNull<T> on List<T> {
  T? elementAtOrNull(int index) =>
      index < 0 || index >= length ? null : this[index];
}
