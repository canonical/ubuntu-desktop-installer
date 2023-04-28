import 'dart:math' as math;

import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('disk_storage');

/// Provides means to read and modify the storage configuration.
class DiskStorageService {
  /// Creates the service with the given [client].
  DiskStorageService(this._client);

  final SubiquityClient _client;

  /// Initializes the service.
  Future<void> init() => _client.getStorageV2().then(_updateStorage);

  bool? _needRoot;
  bool? _needBoot;
  bool? _useLvm;
  bool? _useEncryption;
  bool? _hasMultipleDisks;
  int? _installMinimumSize;
  int? _largestDiskSize;
  List<OsProber>? _existingOS;
  GuidedStorageTarget? _guidedTarget;
  String? _securityKey;

  /// Whether the system has multiple disks available for guided partitioning.
  bool get hasMultipleDisks => _hasMultipleDisks ?? false;

  /// Whether the storage configuration is missing a root partition.
  bool get needRoot => _needRoot ?? true;

  /// Whether the storage configuration is missing a boot partition.
  bool get needBoot => _needBoot ?? true;

  /// Whether FDE (Full Disk Encryption) should be used.
  bool get useEncryption => _useEncryption ?? false;
  set useEncryption(bool useEncryption) {
    log.debug('use encryption: $useEncryption');
    _useEncryption = useEncryption;
  }

  /// Whether Secure Boot is enabled.
  bool get hasSecureBoot => false; // TODO: add support for it

  /// Whether the storage configuration should use LVM.
  bool get useLvm => _useLvm ?? false;
  set useLvm(bool useLvm) {
    log.debug('use LVM: $useLvm');
    _useLvm = useLvm;
  }

  /// A security key for full disk encryption.
  String? get securityKey => _securityKey;
  set securityKey(String? securityKey) {
    if (securityKey != null) {
      final hiddenKey = '*' * securityKey.length;
      log.debug('set security key: $hiddenKey');
    }
    _securityKey = securityKey;
  }

  /// A guided storage target.
  GuidedStorageTarget? get guidedTarget => _guidedTarget;
  set guidedTarget(GuidedStorageTarget? target) {
    log.debug('select guided target: $target');
    _guidedTarget = target;
  }

  /// A list of existing OS installations or null if not detected.
  List<OsProber>? get existingOS => _existingOS;

  /// The minimum size required for the installation.
  int get installMinimumSize => _installMinimumSize ?? 0;

  /// The size of the largest disk.
  int get largestDiskSize => _largestDiskSize ?? 0;

  /// Returns whether the system has enough disk space to install.
  bool get hasEnoughDiskSpace => installMinimumSize <= largestDiskSize;

  /// Fetches whether the system has BitLocker enabled.
  Future<bool> hasBitLocker() => _client.hasBitLocker();

  /// Fetches the current guided storage configuration.
  Future<GuidedStorageResponseV2> getGuidedStorage() async {
    return _client.getGuidedStorageV2();
  }

  /// Sets the selected target for guided partitioning.
  Future<void> setGuidedStorage() async {
    await _client.setGuidedStorageV2(
      GuidedChoiceV2(
        target: guidedTarget!,
        password: securityKey,
        capability: useEncryption
            ? GuidedCapability.LVM_LUKS
            : useLvm
                ? GuidedCapability.LVM
                : GuidedCapability.DIRECT,
        sizingPolicy: SizingPolicy.ALL,
      ),
    );
    await _client.setStorageV2();
  }

  List<Disk> _updateStorage(StorageResponseV2 response) {
    log.debug('Update storage: $response');
    _needRoot = response.needRoot;
    _needBoot = response.needBoot;
    _hasMultipleDisks = response.disks.length > 1;
    _installMinimumSize = response.installMinimumSize;
    _largestDiskSize = response.disks.map((d) => d.size).fold<int>(0, math.max);
    _existingOS = response.disks
        .expand((d) => d.partitions
            .whereType<Partition>()
            .map((p) => p.os)
            .whereType<OsProber>())
        .toList();
    return response.disks;
  }

  /// Fetches the current storage configuration.
  Future<List<Disk>> getStorage() {
    return _client.getStorageV2().then(_updateStorage);
  }

  /// Fetches the original storage configuration.
  Future<List<Disk>> getOriginalStorage() {
    return _client.getOriginalStorageV2().then((r) => r.disks);
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

  /// Applies the current storage configuration on the system.
  Future<List<Disk>> setStorage() {
    return _client.setStorageV2().then(_updateStorage);
  }

  /// Resets the current storage configuration to allow reverting back to the
  /// original configuration.
  Future<List<Disk>> resetStorage() {
    _guidedTarget = null;
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
