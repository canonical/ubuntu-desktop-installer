import 'package:flutter/foundation.dart';

import '../../disk_storage_service.dart';

class DiskModel extends ChangeNotifier {
  DiskModel(this._disk)
      : _partitions = _disk.partitions
                ?.map((partition) => PartitionModel(partition))
                .toList() ??
            [];

  final Disk _disk;
  final List<PartitionModel> _partitions;

  String get id => _disk.id ?? '';
  String get type => _disk.type ?? '';
  int get size => _disk.size ?? 0;
  List<PartitionModel> get partitions => _partitions;

  int calculateFreeSpace() =>
      _partitions.fold(size, (remain, partition) => remain - partition.size);

  @override
  void dispose() {
    for (final partition in _partitions) {
      partition.dispose();
    }
    super.dispose();
  }
}

class PartitionModel extends ChangeNotifier {
  PartitionModel(this._partition);

  final Partition _partition;

  int get size => _partition.size ?? 0;
  int get number => _partition.number ?? 0;
}

class AllocateDiskSpaceModel extends ChangeNotifier {
  AllocateDiskSpaceModel(this._service);

  final DiskStorageService _service;

  var _disks = <DiskModel>[];
  var _selectedDiskIndex = -1;
  var _selectedPartitionIndex = -1;
  var _bootDiskIndex = 0;

  List<DiskModel> get disks => _disks;

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

  DiskModel? get selectedDisk => disks.elementAtOrNull(_selectedDiskIndex);
  List<PartitionModel>? get selectedPartitions => selectedDisk?.partitions;

  int get bootDiskIndex => _bootDiskIndex;
  void selectBootDisk(int diskIndex) {
    if (_bootDiskIndex == diskIndex) return;
    _bootDiskIndex = diskIndex;
    notifyListeners();
  }

  Future<void> getGuidedStorage() {
    return _service.getGuidedStorage().then((disks) {
      _disks = disks.map((disk) => DiskModel(disk)).toList();
      notifyListeners();
    });
  }

  Future<void> setGuidedStorage() => _service.setGuidedStorage();

  @override
  void dispose() {
    for (final disk in _disks) {
      disk.dispose();
    }
    super.dispose();
  }
}

extension _ListOrNull<T> on List<T> {
  T? elementAtOrNull(int index) =>
      index < 0 || index >= length ? null : this[index];
}
