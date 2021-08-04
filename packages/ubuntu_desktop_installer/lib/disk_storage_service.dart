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

class DiskStorageService {
  DiskStorageService(this._client);

  final SubiquityClient _client;

  GuidedStorageResponse? _response;
  StorageResponse? _storageResponse;

  List<dynamic>? get storageConfig => _storageResponse?.config;

  Future<List<DiskOrPartition>> getGuidedStorage() {
    return _client.getGuidedStorage(0, true).then((r) {
      _response = r;

      final disksAndPartitions = <DiskOrPartition>[];
      for (var disk in r.disks!) {
        disksAndPartitions.add(DiskOrPartition(disk: disk));
        for (var partition in disk.partitions!) {
          disksAndPartitions
              .add(DiskOrPartition(disk: disk, partition: partition));
        }
      }
      return disksAndPartitions;
    });
  }

  Future<void> setGuidedStorage() async {
    final choice = GuidedChoice(diskId: _response!.disks![0].id, useLvm: false);
    _storageResponse = await _client.setGuidedStorage(choice);
  }
}
