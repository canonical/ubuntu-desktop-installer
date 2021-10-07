import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// @internal
final log = Logger('disk_storage');

class DiskStorageService {
  DiskStorageService(this._client) {
    _client.isOpen.then((_) => init());
  }

  final SubiquityClient _client;

  var _hasMultipleDisks = false;
  GuidedStorageResponse? _response;
  StorageResponse? _storageResponse;

  bool get hasMultipleDisks => _hasMultipleDisks;
  List<dynamic>? get storageConfig => _storageResponse?.config;

  Future<void> init() => getGuidedStorage();

  void _updateHasMultipleDisks() {
    final hasMultipleDisks = (_response?.disks ?? []).length > 1;
    if (_hasMultipleDisks == hasMultipleDisks) return;
    _hasMultipleDisks = hasMultipleDisks;
  }

  Future<List<Disk>> getGuidedStorage() async {
    if (_response == null) {
      _response = await _client.getGuidedStorage(true);
      _updateHasMultipleDisks();
      log.debug(_response!.disks);
    }
    return _response!.disks ?? const <Disk>[];
  }

  Future<void> setGuidedStorage([Disk? disk]) async {
    final choice = GuidedChoice(
      diskId: disk?.id ?? _response!.disks![0].id,
      useLvm: false,
    );
    _storageResponse = await _client.setGuidedStorage(choice);
  }

  Future<void> resetGuidedStorage() async {
    _storageResponse = await _client.resetStorage();
  }
}
