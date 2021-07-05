import 'package:flutter/foundation.dart';

import 'connect_model.dart';

class ConnectToInternetModel extends ChangeNotifier implements ConnectModel {
  @override
  bool get canConnect => _connectModel?.canConnect ?? false;

  @override
  bool get canContinue => _connectModel?.canContinue ?? false;

  @override
  bool get isBusy => _connectModel?.isBusy ?? false;

  @override
  ConnectMode? get connectMode => _connectModel?.connectMode;

  ConnectModel? _connectModel;
  void select(ConnectModel model) {
    if (_connectModel == model) {
      return;
    }
    _connectModel?.removeListener(notifyListeners);
    model.addListener(notifyListeners);
    model.init();
    _connectModel = model;
    notifyListeners();
  }

  @override
  void init() => _connectModel?.init();

  @override
  Future<void> connect({OnAuthenticate? onAuthenticate}) async {
    _connectModel!.connect(onAuthenticate: onAuthenticate);
  }
}
