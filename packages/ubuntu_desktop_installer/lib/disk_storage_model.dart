import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

class DiskOrPartition {
  final Disk disk;
  final Partition? partition;
  late String name;

  DiskOrPartition({required this.disk, this.partition}) {
    name = disk.id!;
    if (partition != null) {
      name += partition!.number.toString();
    }
  }
}

class DiskStorageModel extends ChangeNotifier {
  DiskStorageModel(this._client);

  final SubiquityClient _client;

  GuidedStorageResponse? _response;
  final List<DiskOrPartition> _disksAndPartitions = [];
  StorageResponse? _storageResponse;
  int _selectedIndex = -1;

  List<dynamic>? get storageConfig => _storageResponse?.config;

  int get diskAndPartitionCount => _disksAndPartitions.length;

  DiskOrPartition diskAndPartition(int index) => _disksAndPartitions[index];

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

  bool _isDisk(int index) {
    return index >= 0 &&
        index < _disksAndPartitions.length &&
        _disksAndPartitions[index].partition != null;
  }

  int _findDisk(int index) {
    var diskIndex = index;
    while (diskIndex >= 0 && !_isDisk(diskIndex)) {
      --diskIndex;
    }
    return diskIndex;
  }

  Future<void> initGuidedStorage() async {
    await _client.getGuidedStorage(0, true).then((r) {
      _response = r;
      _disksAndPartitions.clear();
      for (var disk in r.disks!) {
        _disksAndPartitions.add(DiskOrPartition(disk: disk));
        for (var partition in disk.partitions!) {
          _disksAndPartitions
              .add(DiskOrPartition(disk: disk, partition: partition));
        }
      }
    });
    notifyListeners();
  }

  Future<void> setGuidedStorage() async {
    final choice = GuidedChoice(diskId: _response!.disks![0].id, useLvm: false);
    _storageResponse = await _client.setGuidedStorage(choice);
  }
}
