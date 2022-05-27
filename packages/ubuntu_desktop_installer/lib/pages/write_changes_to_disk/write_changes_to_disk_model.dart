import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// View model for [WriteChangesToDiskPage].
class WriteChangesToDiskModel extends SafeChangeNotifier {
  /// Creates a model with the given client and service.
  WriteChangesToDiskModel(this._client, this._service);

  final SubiquityClient _client;
  final DiskStorageService _service;
  Map<Disk, List<Partition>>? _partitions;

  /// The list of non-preserved disks.
  List<Disk> get disks => _partitions?.keys.toList() ?? [];

  /// Returns the list of non-preserved partitions fro the given disk.
  List<Partition> partitions(Disk disk) => _partitions?[disk] ?? [];

  /// Initializes the model.
  Future<void> init() => _service.getStorage().then(_updateDisks);

  /// Starts the installation process.
  Future<void> startInstallation() async {
    await _service.setStorage(disks.toList());
    await _client.confirm('/dev/tty1');
  }

  void _updateDisks(List<Disk> disks) {
    final changes = disks.where((d) => d.preserve == false);
    _partitions = Map.fromEntries(
      changes.map((disk) {
        final partitions = disk.partitions
            .whereType<Partition>()
            .where((p) => p.preserve == false)
            .toList();
        return MapEntry(
          disk.copyWith(partitions: partitions),
          partitions,
        );
      }),
    );
    notifyListeners();
  }
}
