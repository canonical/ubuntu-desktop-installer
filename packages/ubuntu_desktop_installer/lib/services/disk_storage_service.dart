import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// @internal
final log = Logger('disk_storage');

class DiskStorageService {
  DiskStorageService(this._client);

  final SubiquityClient _client;

  GuidedStorageResponse? _response;
  StorageResponse? _storageResponse;

  List<dynamic>? get storageConfig => _storageResponse?.config;

  Future<List<Disk>> getGuidedStorage() {
    return _client.getGuidedStorage(true).then((r) {
      log.debug(r.disks);
      _response = r;
      return r.disks ?? <Disk>[];
    });
  }

  Future<void> setGuidedStorage() async {
    final choice = GuidedChoice(diskId: _response!.disks![0].id, useLvm: false);
    _storageResponse = await _client.setGuidedStorage(choice);
  }
}
