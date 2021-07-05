import 'package:flutter/foundation.dart';

import 'connect_model.dart';

class WifiAuthModel extends ChangeNotifier {
  WifiAuthModel() {
    Listenable.merge([
      _showPassword,
      _storePassword,
      _wifiSecurity,
    ]).addListener(notifyListeners);
  }

  final _showPassword = ValueNotifier<bool>(false);
  bool get showPassword => _showPassword.value;
  set showPassword(bool value) => _showPassword.value = value;

  final _storePassword = ValueNotifier<StorePassword>(StorePassword.allUsers);
  StorePassword get storePassword => _storePassword.value;
  set storePassword(StorePassword value) => _storePassword.value = value;

  final _wifiSecurity = ValueNotifier<WifiSecurity>(WifiSecurity.wpa2Personal);
  WifiSecurity get wifiSecurity => _wifiSecurity.value;
  set wifiSecurity(WifiSecurity value) => _wifiSecurity.value = value;
}
