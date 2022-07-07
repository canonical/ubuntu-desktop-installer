import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('disk_storage');

/// Provides means to read and modify the storage configuration.
class DiskStorageService {
  /// Creates the service with the given [client].
  DiskStorageService(this._client) {
    _client.isOpen.then((_) => init());
  }

  final SubiquityClient _client;

  /// Initializes the service.
  Future<void> init() {
    return Future.wait([
      _client.getStorageV2().then(_updateStorage),
      _client.hasRst().then((value) => _hasRst = value),
      _client.hasBitLocker().then((value) => _hasBitLocker = value),
    ]);
  }

  bool? _needRoot;
  bool? _needBoot;
  bool? _useLvm;
  bool? _hasRst;
  bool? _hasBitLocker;
  bool? _hasMultipleDisks;

  /// Whether the system has multiple disks available for guided partitioning.
  bool get hasMultipleDisks => _hasMultipleDisks ?? false;

  /// Whether the storage configuration is missing a root partition.
  bool get needRoot => _needRoot ?? true;

  /// Whether the storage configuration is missing a boot partition.
  bool get needBoot => _needBoot ?? true;

  bool get hasRst => _hasRst ?? false;

  bool get hasBitLocker => _hasBitLocker ?? false;

  /// Whether FDE (Full Disk Encryption) is enabled.
  bool get hasEncryption => false; // TODO: add support for it

  /// Whether Secure Boot is enabled.
  bool get hasSecureBoot => false; // TODO: add support for it

  /// Whether the storage configuration should use LVM.
  bool get useLvm => _useLvm ?? false;
  set useLvm(bool useLvm) => _useLvm = useLvm;

  /// Fetches the current guided storage configuration.
  Future<List<Disk>> getGuidedStorage() {
    return _client.getGuidedStorage().then((response) => response.disks ?? []);
  }

  /// Selects the specified disk for guided partitioning.
  Future<void> setGuidedStorage([Disk? disk]) async {
    final response = await _client.getGuidedStorage();
    final choice = GuidedChoice(
      diskId: disk?.id ?? response.disks![0].id,
      useLvm: useLvm,
    );
    return _client.setGuidedStorage(choice).then(_updateStorage);
  }

  List<Disk> _updateStorage(StorageResponseV2 response) {
    log.debug('Update storage: $response');
    _needRoot = response.needRoot;
    _needBoot = response.needBoot;
    _hasMultipleDisks = response.disks.length > 1;
    return response.disks;
  }

  /// Fetches the current storage configuration.
  Future<List<Disk>> getStorage() {
    return _client.getStorageV2().then(_updateStorage);
  }

  /// Adds a [partition] in the specified [gap] on the [disk], and returns the
  /// new storage configuration.
  ///
  /// NOTE: The new partition is allowed to specify the following attributes:
  /// - [Partition.size]
  /// - [Partition.format]
  /// - [Partition.mount]
  Future<List<Disk>> addPartition(Disk disk, Gap gap, Partition partition) {
    return _client.addPartitionV2(disk, gap, partition).then(_updateStorage);
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
