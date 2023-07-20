import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_bootstrap/services.dart';

final confirmModelProvider = ChangeNotifierProvider((_) =>
    ConfirmModel(getService<InstallerService>(), getService<StorageService>()));

/// View model for [ConfirmPage].
class ConfirmModel extends SafeChangeNotifier {
  /// Creates a model with the given installer and storage services.
  ConfirmModel(this._installer, this._storage);

  final InstallerService _installer;
  final StorageService _storage;
  List<Disk>? _disks;
  Map<String, List<Partition>>? _partitions;
  Map<String, List<Partition>>? _originals;

  /// The list of non-preserved disks, and preserved disks with any modified
  /// partitions.
  List<Disk> get disks => _disks ?? [];

  /// A map of changed partitions per each disk (sysname).
  Map<String, List<Partition>> get partitions => _partitions ?? {};

  /// Returns the original configuration of the specified partition.
  Partition? getOriginalPartition(String sysname, int number) {
    return _originals?[sysname]?.firstWhereOrNull((p) => p.number == number);
  }

  /// Initializes the model.
  Future<void> init() async {
    if (_storage.guidedTarget != null) {
      await _storage.setGuidedStorage();
    }
    await _storage.getStorage().then(_updateDisks);
    _originals = await _storage.getOriginalStorage().then((disks) =>
        Map.fromEntries(disks.map((d) => MapEntry(
            d.sysname, d.partitions.whereType<Partition>().toList()))));
    notifyListeners();
  }

  /// Starts the installation process.
  Future<void> startInstallation() async {
    _storage.securityKey = null; // no longer needed
    await _installer.start();
  }

  void _updateDisks(List<Disk> disks) {
    bool isPartitionModified(Partition p) {
      return p.wipe != null ||
          p.mount != null ||
          p.resize == true ||
          p.preserve == false;
    }

    _disks = disks
        .where((d) =>
            d.preserve == false ||
            d.partitions.whereType<Partition>().any(isPartitionModified))
        .toList();
    _partitions = Map.fromEntries(
      disks.map((disk) {
        final partitions = disk.partitions
            .whereType<Partition>()
            .where(isPartitionModified)
            .toList();
        return MapEntry(disk.sysname, partitions);
      }).where((entry) => entry.value.isNotEmpty),
    );
    notifyListeners();
  }
}
