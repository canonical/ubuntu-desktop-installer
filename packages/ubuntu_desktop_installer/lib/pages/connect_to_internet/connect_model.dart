import 'package:flutter/foundation.dart';

import 'wifi_model.dart';

enum ConnectMode {
  none,
  ethernet,
  wifi,
  hiddenWifi,
}

typedef OnAuthenticate = Future<Authentication?> Function(
  WifiDeviceModel device,
  AccessPointModel accessPoint,
);

enum StorePassword { thisUser, allUsers, askAlways }
enum WifiSecurity { wpa2Personal, wpa3Personal }

class Authentication {
  const Authentication({
    required this.password,
    required this.storePassword,
    required this.wifiSecurity,
  });

  final String password;
  final StorePassword storePassword;
  final WifiSecurity? wifiSecurity;
}

abstract class ConnectModel extends ChangeNotifier {
  bool get canConnect;
  bool get canContinue;
  bool get isBusy;
  ConnectMode? get connectMode;
  void init();
  Future<void> connect({OnAuthenticate? onAuthenticate});
}

class NoConnectModel extends ConnectModel {
  @override
  bool get canConnect => false;

  @override
  bool get canContinue => true;

  @override
  bool get isBusy => false;

  @override
  ConnectMode? get connectMode => ConnectMode.none;

  @override
  void init() {}

  @override
  Future<void> connect({OnAuthenticate? onAuthenticate}) {
    throw UnsupportedError('Nothing to connect');
  }
}
