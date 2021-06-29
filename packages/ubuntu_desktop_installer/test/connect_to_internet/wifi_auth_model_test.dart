import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_auth_model.dart';

void main() {
  test('show password', () {
    final model = WifiAuthModel();
    expect(model.showPassword, isFalse);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);
    model.showPassword = true;
    expect(model.showPassword, isTrue);
    expect(wasNotified, isTrue);
  });

  test('store password', () {
    final model = WifiAuthModel();
    expect(model.storePassword, equals(StorePassword.allUsers));

    var wasNotified = false;
    model.addListener(() => wasNotified = true);
    model.storePassword = StorePassword.thisUser;
    expect(model.storePassword, equals(StorePassword.thisUser));
    expect(wasNotified, isTrue);
  });

  test('wifi security', () {
    final model = WifiAuthModel();
    expect(model.wifiSecurity, equals(WifiSecurity.wpa2Personal));

    var wasNotified = false;
    model.addListener(() => wasNotified = true);
    model.wifiSecurity = WifiSecurity.wpa3Personal;
    expect(model.wifiSecurity, equals(WifiSecurity.wpa3Personal));
    expect(wasNotified, isTrue);
  });
}
