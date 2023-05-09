import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// View model for [ConfirmPage].
class ConfirmModel extends SafeChangeNotifier {
  /// Creates a model with the given client and service.
  ConfirmModel(this._client, this._service);

  final SubiquityClient _client;
  final StorageService _service;
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
    if (_service.guidedTarget != null) {
      await _service.setGuidedStorage();
    }
    await _service.getStorage().then(_updateDisks);
    _originals = await _service.getOriginalStorage().then((disks) =>
        Map.fromEntries(disks.map((d) => MapEntry(
            d.sysname, d.partitions.whereType<Partition>().toList()))));
    notifyListeners();
  }

  /// Starts the installation process.
  Future<void> startInstallation() async {
    _service.securityKey = null; // no longer needed
    await _client.confirm('/dev/tty1');
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
