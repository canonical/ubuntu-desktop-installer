import 'package:flutter/foundation.dart';
import 'package:ubuntu_desktop_installer/disk_storage_service.dart';

class AllocateDiskSpaceModel extends ChangeNotifier {
  AllocateDiskSpaceModel(this._service);

  final DiskStorageService _service;
  var _disksAndPartitions = <DiskOrPartition>[];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  void selectIndex(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }

  DiskOrPartition? get selectedDisk {
    final diskIndex = _findDisk(_selectedIndex);
    if (!_isDisk(diskIndex)) return null;
    return _disksAndPartitions[_selectedIndex];
  }

  Future<void> getGuidedStorage() {
    return _service.getGuidedStorage().then((disksAndPartitions) {
      _disksAndPartitions = disksAndPartitions;
      notifyListeners();
    });
  }

  int get diskAndPartitionCount => _disksAndPartitions.length;

  DiskOrPartition diskAndPartition(int index) => _disksAndPartitions[index];

  bool _isValidIndex(int index) {
    return index >= 0 && index < _disksAndPartitions.length;
  }

  bool _isDisk(int index) {
    return _isValidIndex(index) && _disksAndPartitions[index].partition == null;
  }

  int _findDisk(int index) {
    var diskIndex = index;
    while (_isValidIndex(diskIndex) && !_isDisk(diskIndex)) {
      --diskIndex;
    }
    return diskIndex;
  }

  List<DiskOrPartition> findPartitions(int index) {
    var partitions = <DiskOrPartition>[];
    var partitionIndex = _findDisk(index) + 1;
    while (_isValidIndex(partitionIndex) && !_isDisk(partitionIndex)) {
      partitions.add(_disksAndPartitions[partitionIndex]);
      ++partitionIndex;
    }
    return partitions;
  }

  Future<void> setGuidedStorage() => _service.setGuidedStorage();
}
