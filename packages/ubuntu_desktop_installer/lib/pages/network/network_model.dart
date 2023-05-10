import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'connect_model.dart';

final networkModelProvider = ChangeNotifierProvider((_) {
  return NetworkModel(getService<NetworkService>());
});

/// A proxy model for the currently selected [ConnectModel] (eth, wifi, none).
class NetworkModel extends SafeChangeNotifier implements ConnectModel {
  NetworkModel(this._service);

  final NetworkService _service;

  @override
  bool get canConnect => _connectModel?.canConnect ?? false;

  @override
  bool get isConnected => _connectModel?.isConnected ?? false;

  @override
  bool get hasActiveConnection => _connectModel?.hasActiveConnection ?? false;

  @override
  bool get isConnecting => _connectModel?.isConnecting ?? false;

  @override
  bool get isEnabled => _connectModel?.isEnabled ?? false;

  @override
  Stream get onAvailabilityChanged =>
      _connectModel?.onAvailabilityChanged ?? const Stream.empty();

  @override
  ConnectMode get connectMode => _connectMode;

  var _connectMode = ConnectMode.none;
  ConnectModel? get _connectModel => _connectModels[_connectMode];
  final _connectModels = <ConnectMode, ConnectModel>{};

  ConnectMode? _preferredConnectMode;
  ConnectModel? get _preferredConnectModel =>
      _connectModels[_preferredConnectMode];

  void addConnectMode(ConnectModel model) {
    _connectModels[model.connectMode] ??= model
      ..onAvailabilityChanged.listen((_) => _updateConnectMode());
  }

  ConnectMode _findBestConnectMode() {
    if (_preferredConnectModel?.isEnabled == true) {
      return _preferredConnectMode!;
    }
    final best = _connectModels.keys.firstWhereOrNull((mode) {
      final model = _connectModels[mode];
      return model?.isEnabled == true && model?.hasActiveConnection == true;
    });
    return best ?? ConnectMode.none;
  }

  void _updateConnectMode() {
    if (_preferredConnectModel?.isEnabled == true) {
      // the preferred (previously selected) mode is available -> re-select
      selectConnectMode(_preferredConnectMode);
    } else if (_connectModel?.isEnabled == false ||
        _connectMode != _preferredConnectMode) {
      // the current mode is not available nor preferred -> select best
      selectConnectMode();
    }
  }

  void selectConnectMode([ConnectMode? mode]) {
    // keep track of the mode that was explicitly selected
    if (mode != null) _preferredConnectMode = mode;

    final oldModel = _connectModel;
    final newModel = _connectModels[mode ?? _findBestConnectMode()]!;
    if (oldModel == newModel) return;
    oldModel?.removeListener(notifyListeners);
    oldModel?.onDeselected();
    newModel.onSelected();
    newModel.addListener(notifyListeners);
    _connectMode = newModel.connectMode;
    log.debug(() => 'Selected connection mode: ${_connectMode.name}');
    notifyListeners();
  }

  @override
  void onSelected() {}

  @override
  void onDeselected() {}

  @override
  Future<void> init() async {
    await _service.connect();
    for (final model in _connectModels.values) {
      await model.init();
    }
  }

  Future<void> markConfigured() => _service.markConfigured();

  @override
  Future<void> cleanup() async {
    for (final model in _connectModels.values) {
      await model.cleanup();
    }
  }

  @override
  Future<void> enable() => _connectModel!.enable();

  @override
  Future<void> connect() => _connectModel!.connect();
}
