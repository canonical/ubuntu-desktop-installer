import 'package:collection/collection.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

import '../../services.dart';
import 'connect_model.dart';

/// A proxy model for the currently selected [ConnectModel] (eth, wifi, none).
class ConnectToInternetModel extends SafeChangeNotifier
    implements ConnectModel {
  ConnectToInternetModel(this._service);

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
  ConnectMode get connectMode => _connectMode;

  var _connectMode = ConnectMode.none;
  ConnectModel? get _connectModel => _connectModels[_connectMode];
  final _connectModels = <ConnectMode, ConnectModel>{};

  void addConnectMode(ConnectModel model) =>
      _connectModels[model.connectMode] = model;

  ConnectMode get _defaultConnectMode {
    return _connectModels.keys.firstWhereOrNull(
            (mode) => _connectModels[mode]?.hasActiveConnection == true) ??
        ConnectMode.none;
  }

  void selectConnectMode([ConnectMode? mode]) {
    final model = _connectModels[mode ?? _defaultConnectMode]!;
    if (_connectModel == model) {
      return;
    }
    _connectModel?.onDeselected();
    _connectModel?.removeListener(notifyListeners);
    model.addListener(notifyListeners);
    model.onSelected();
    _connectMode = model.connectMode;
    log.debug(() =>
        'Selected connection mode: ${_connectMode.toString().split('.')[1]}');
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

  @override
  Future<void> enable() => _connectModel!.enable();

  @override
  Future<void> connect() => _connectModel!.connect();
}
