import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';

/// @internal
final log = Logger('disk_storage');

/// Provides means to read and modify the storage configuration.
class DiskStorageService {
  /// Creates the service with the given [client].
  DiskStorageService(this._client) {
    _client.isOpen.then((_) => init());
  }

  final SubiquityClient _client;

  /// The list of disks for partitioning, only available for testing.
  @visibleForTesting
  List<Disk>? storage;

  /// The list of disks for guided partitioning, only available for testing.
  @visibleForTesting
  List<Disk>? guidedStorage;

  /// Initializes the service.
  Future<void> init() => getGuidedStorage();

  bool? _needRoot;
  bool? _needBoot;
  int get _diskCount => guidedStorage?.length ?? 0;

  /// Whether the system has multiple disks available for guided partitioning.
  bool get hasMultipleDisks => _diskCount > 1;

  /// Whether the storage configuration is missing a root partition.
  bool get needRoot => _needRoot ?? true;

  /// Whether the storage configuration is missing a boot partition.
  bool get needBoot => _needBoot ?? true;

  List<Disk> _updateGuidedStorage(GuidedStorageResponse response) {
    log.debug('Update guided storage: $response');
    guidedStorage = response.disks;
    return guidedStorage ?? const <Disk>[];
  }

  /// Fetches the current guided storage configuration.
  Future<List<Disk>> getGuidedStorage() async {
    if (guidedStorage == null) {
      await _client.getGuidedStorage().then(_updateGuidedStorage);
    }
    return guidedStorage ?? const <Disk>[];
  }

  /// Selects the specified disk for guided partitioning.
  Future<void> setGuidedStorage([Disk? disk]) {
    final choice = GuidedChoice(
      diskId: disk?.id ?? guidedStorage![0].id,
      useLvm: false,
    );
    return _client.setGuidedStorageV2(choice).then(_updateStorage);
  }

  /// Resets current guided storage configuration.
  Future<void> resetGuidedStorage() {
    guidedStorage = null;
    return _client.resetStorageV2().then(_updateStorage);
  }

  List<Disk> _updateStorage(StorageResponseV2 response) {
    log.debug('Update storage: $response');
    storage = response.disks;
    _needRoot = response.needRoot;
    _needBoot = response.needBoot;
    return storage ?? const <Disk>[];
  }

  /// Fetches the current storage configuration.
  Future<List<Disk>> getStorage() async {
    if (storage == null) {
      await _client.getStorageV2().then(_updateStorage);
    }
    return storage ?? const <Disk>[];
  }

  /// Adds a [partition] on the specified [disk] and returns the new storage
  /// configuration.
  ///
  /// NOTE: The new partition is allowed to specify the following attributes:
  /// - [Partition.size]
  /// - [Partition.format]
  /// - [Partition.mount]
  Future<List<Disk>> addPartition(Disk disk, Partition partition) {
    return _client.addPartitionV2(disk, partition).then(_updateStorage);
  }

  /// Edits a [partition] on the specified [disk] and returns the new storage
  /// configuration.
  ///
  /// NOTE: The edited partition is allowed to specify the following attributes:
  /// - [Partition.format]
  /// - [Partition.wipe]
  /// - [Partition.mount]
  Future<List<Disk>> editPartition(Disk disk, Partition partition) {
    return _client.editPartitionV2(disk, partition).then(_updateStorage);
  }

  /// Deletes a [partition] from the specified [disk] and returns the new
  /// storage configuration.
  Future<List<Disk>> deletePartition(Disk disk, Partition partition) {
    return _client.deletePartitionV2(disk, partition).then(_updateStorage);
  }

  /// Applies the given storage configuration on the system.
  Future<List<Disk>> setStorage(List<Disk> disks) {
    return _client.setStorageV2().then(_updateStorage);
  }

  /// Resets the current storage configuration to allow reverting back to the
  /// original configuration.
  Future<List<Disk>> resetStorage() {
    storage = null;
    return _client.resetStorageV2().then(_updateStorage);
  }

  /// Adds a boot partition on the specified [disk].
  Future<List<Disk>> addBootPartition(Disk disk) {
    return _client.addBootPartitionV2(disk).then(_updateStorage);
  }

  /// Reformats the specified [disk], to create a new partition table.
  Future<List<Disk>> reformatDisk(Disk disk) {
    return _client.reformatDiskV2(disk).then(_updateStorage);
  }
}

/// Disk data class extensions for the UI.
extension DiskExtension on Disk {
  /// Returns the sysname of the disk (e.g. "sda" for "/dev/sda").
  String get sysname => p.basename(path ?? '');
}
