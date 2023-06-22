import 'package:dartx/dartx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// Provider for [GuidedReformatModel].
final guidedReformatModelProvider = ChangeNotifierProvider(
    (_) => GuidedReformatModel(getService<StorageService>()));

/// View model for [GuidedReformatPage].
class GuidedReformatModel extends SafeChangeNotifier {
  /// Creates a new model with the given service.
  GuidedReformatModel(this._service);

  final StorageService _service;
  var _storages = <GuidedStorageTargetReformat>[];
  var _disks = <String, Disk>{};
  var _selectedIndex = 0;

  /// Available storages for guided partitioning.
  List<GuidedStorageTarget> get storages => _storages;

  /// The index of the currently selected storage.
  int get selectedIndex => _selectedIndex;

  /// The currently selected storage.
  GuidedStorageTargetReformat? get selectedStorage =>
      getStorage(_selectedIndex);

  /// The disk of the currently selected guided storage target.
  Disk? get selectedDisk => getDisk(_selectedIndex);

  /// Returns the guided storage target at the given index.
  GuidedStorageTargetReformat? getStorage(int index) =>
      _storages.elementAtOrNull(index);

  /// Returns the disk of the guided storage target at the given index.
  Disk? getDisk(int index) => _disks[getStorage(index)?.diskId ?? ''];

  /// Selects a guided storage.
  void selectStorage(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }

  /// Loads the targets available for guided reformatting and returns true if
  /// there are multiple to choose between.
  Future<bool> init() async {
    await loadGuidedStorage();
    if (_storages.length == 1) {
      _service.guidedTarget = _storages.single;
    }
    return _storages.length > 1;
  }

  /// Loads the storages available for guided partitioning.
  Future<void> loadGuidedStorage() async {
    await _service.getStorage().then((disks) {
      _disks = Map.fromIterable(disks, key: (d) => d.id);
    });
    return _service.getGuidedStorage().then(_updateGuidedStorage);
  }

  void _updateGuidedStorage(GuidedStorageResponseV2 response) {
    _storages = response.targets
        .whereType<GuidedStorageTargetReformat>()
        .where((t) => t.allowed.isNotEmpty)
        .toList();
    notifyListeners();
  }

  /// Saves the guided storage selection.
  Future<void> saveGuidedStorage() async {
    _service.guidedTarget = selectedStorage;
  }

  /// Resets the guided storage selection.
  Future<void> resetGuidedStorage() {
    return _service.resetStorage();
  }
}
