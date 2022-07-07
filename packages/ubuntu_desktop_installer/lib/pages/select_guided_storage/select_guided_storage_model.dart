import 'package:dartx/dartx.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../services.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

/// View model for [SelectGuidedStoragePage].
class SelectGuidedStorageModel extends SafeChangeNotifier {
  /// Creates a new model with the given service.
  SelectGuidedStorageModel(this._service);

  final DiskStorageService _service;
  var _storages = <Disk>[];
  var _selectedIndex = 0;

  /// Available storages for guided partitioning.
  List<Disk> get storages => _storages;

  /// The index of the currently selected storage.
  int get selectedIndex => _selectedIndex;

  /// The currently selected storage.
  Disk? get selectedStorage => _storages.elementAtOrNull(_selectedIndex);

  /// Selects a guided storage.
  void selectStorage(int index) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    notifyListeners();
  }

  /// Loads the storages available for guided partitioning.
  Future<void> loadGuidedStorage() {
    return _service.getGuidedStorage().then((storages) {
      _storages = storages;
      notifyListeners();
    });
  }

  /// Saves the guided storage selection.
  Future<void> saveGuidedStorage() {
    return _service.setGuidedStorage(selectedStorage);
  }

  /// Resets the guided storage selection.
  Future<void> resetGuidedStorage() {
    return _service.resetStorage();
  }
}
