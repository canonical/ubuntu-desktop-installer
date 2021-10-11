import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// Models a disk.
class DiskModel extends ChangeNotifier {
  /// Creates a model for the given disk.
  DiskModel(this._disk)
      : _freeSpace = _calculateFreeSpace(_disk),
        _partitions = _createPartitions(_disk);

  final Disk _disk;
  final List<PartitionModel> _partitions;
  final int _freeSpace;

  /// The ID of the disk.
  String get id => _disk.id ?? '';

  /// The type of the disk, such as "USB".
  String get type => _disk.type ?? '';

  /// The size of the disk in bytes.
  int get size => _disk.size ?? 0;

  /// The list of partitions on the disk.
  List<PartitionModel> get partitions => _partitions;

  /// The available free space on the disk in bytes.
  int get freeSpace => _freeSpace;

  static int _calculateFreeSpace(Disk disk) {
    if (disk.size == null || disk.partitions == null) return 0;
    return disk.partitions!.fold(disk.size!, (remain, partition) {
      return remain - (partition.size ?? 0);
    });
  }

  static List<PartitionModel> _createPartitions(Disk disk) {
    if (disk.partitions == null) return [];
    return disk.partitions!
        .map((partition) => PartitionModel(partition))
        .toList();
  }

  @override
  void dispose() {
    for (final partition in _partitions) {
      partition.dispose();
    }
    super.dispose();
  }
}

/// Models a disk partition.
class PartitionModel extends ChangeNotifier {
  /// Creates a model for the given partition.
  PartitionModel(this._partition);

  final Partition _partition;

  /// The size of the partition in bytes.
  int get size => _partition.size ?? 0;

  /// The number of the partition.
  int get number => _partition.number ?? 0;

  /// Whether the partition should be formatted.
  bool get format => _format;
  var _format = true;
  set format(bool format) {
    if (_format == format) return;
    _format = format;
    notifyListeners();
  }
}

/// View model for [AllocateDiskSpacePage].
class AllocateDiskSpaceModel extends ChangeNotifier {
  /// Creates a new model with the given disk storage service.
  AllocateDiskSpaceModel(this._service);

  final DiskStorageService _service;

  var _disks = <DiskModel>[];
  var _selectedDiskIndex = -1;
  var _selectedPartitionIndex = -1;
  var _bootDiskIndex = 0;

  /// The list of all disks.
  List<DiskModel> get disks => _disks;

  /// Returns the selected disk, or null if no disk is selected.
  DiskModel? get selectedDisk => disks.elementAtOrNull(_selectedDiskIndex);

  /// The index of the selected disk, or -1 if no disk is selected.
  int get selectedDiskIndex => _selectedDiskIndex;

  /// The index of the selected disk's selected partition, or -1 if no partition
  /// is selected.
  int get selectedPartitionIndex => _selectedPartitionIndex;

  /// Returns true if the specified disk or its partition is selected.
  bool isStorageSelected(int diskIndex, [int partitionIndex = -1]) {
    return diskIndex == _selectedDiskIndex &&
        partitionIndex == _selectedPartitionIndex;
  }

  /// Selects the specified disk or its partition.
  void selectStorage(int diskIndex, [int partitionIndex = -1]) {
    if (isStorageSelected(diskIndex, partitionIndex)) return;

    _selectedDiskIndex = diskIndex;
    _selectedPartitionIndex = partitionIndex;
    notifyListeners();
  }

  /// The index of the selected boot disk.
  int get bootDiskIndex => _bootDiskIndex;

  /// Selects the specified boot disk.
  void selectBootDisk(int diskIndex) {
    if (_bootDiskIndex == diskIndex) return;
    _bootDiskIndex = diskIndex;
    notifyListeners();
  }

  /// Fetches guided storage from the service.
  Future<void> getGuidedStorage() {
    return _service.getGuidedStorage().then((disks) {
      _disks = disks.map((disk) => DiskModel(disk)).toList();
      notifyListeners();
    });
  }

  /// Applies guided storage via the service.
  Future<void> setGuidedStorage() => _service.setGuidedStorage();

  @override
  void dispose() {
    for (final disk in _disks) {
      disk.dispose();
    }
    super.dispose();
  }
}
