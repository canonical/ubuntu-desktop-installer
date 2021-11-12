import 'package:safe_change_notifier/safe_change_notifier.dart';

import 'connect_model.dart';

class ConnectToInternetModel extends SafeChangeNotifier
    implements ConnectModel {
  @override
  bool get canConnect => _connectModel?.canConnect ?? false;

  @override
  bool get canContinue => _connectModel?.canContinue ?? false;

  @override
  bool get isActive => _connectModel?.isActive ?? false;

  @override
  bool get isBusy => _connectModel?.isBusy ?? false;

  @override
  bool get isEnabled => _connectModel?.isEnabled ?? false;

  @override
  ConnectMode? get connectMode => _connectModel?.connectMode;

  ConnectModel? _connectModel;
  void select(ConnectModel model) {
    if (_connectModel == model) {
      return;
    }
    _connectModel?.cleanup();
    _connectModel?.removeListener(notifyListeners);
    model.addListener(notifyListeners);
    model.init();
    log.debug(() =>
        'Selected connection mode: ${model.connectMode.toString().split('.')[1]}');
    _connectModel = model;
    notifyListeners();
  }

  @override
  void init() => _connectModel?.init();

  @override
  void cleanup() => _connectModel?.cleanup();

  @override
  Future<void> enable() => _connectModel!.enable();

  @override
  Future<void> connect() => _connectModel!.connect();
}
