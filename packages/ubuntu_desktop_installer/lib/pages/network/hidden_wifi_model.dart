import 'package:collection/collection.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'connect_model.dart';
import 'network_device.dart';
import 'wifi_model.dart';

class HiddenWifiModel extends NetworkDeviceModel<WifiDevice> {
  HiddenWifiModel(super.service, [super.udev]);

  @override
  bool get canConnect => _ssid.isNotEmpty && !isConnected;

  @override
  bool get isConnected =>
      selectedDevice?.isActive == true &&
      selectedDevice?.activeAccessPoint?.name == ssid;

  @override
  bool get hasActiveConnection => false;

  @override
  bool get isConnecting => selectedDevice?.isConnecting == true;

  @override
  bool get isEnabled => service.wirelessEnabled;

  @override
  ConnectMode get connectMode => ConnectMode.hiddenWifi;

  @override
  Future connect() async {
    final wifi = service.getWifiSettings(ssid: _ssid);
    return service.addAndActivateConnection(
      connection: wifi,
      device: selectedDevice!.device,
    );
  }

  String _ssid = '';
  String get ssid => _ssid;
  void setSsid(String ssid) {
    if (_ssid == ssid) return;
    _ssid = ssid;
    notifyListeners();
  }

  @override
  Future<void> enable() async {}

  @override
  void onDeselected() {}

  @override
  void onSelected() {}

  @override
  List<NetworkManagerDevice> getDevices() => service.wirelessDevices;

  @override
  WifiDevice createDevice(NetworkManagerDevice device) {
    return WifiDevice(device, udev);
  }

  @override
  WifiDevice? findActiveDevice() {
    return devices.firstWhereOrNull((device) {
      return device.isAvailable && !device.isUnmanaged;
    });
  }
}
