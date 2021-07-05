import 'package:collection/collection.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'wifi_model.dart';

class HiddenWifiModel extends WifiModel {
  HiddenWifiModel(NetworkService service) : super(service);

  @override
  bool get canConnect => _ssid.isNotEmpty;

  @override
  ConnectMode get connectMode => ConnectMode.hiddenWifi;

  @override
  void init() {}

  @override
  Future<void> connect({OnAuthenticate? onAuthenticate}) async {
    final device = devices.firstWhereOrNull((device) {
      return device.activeAccessPoint?.name == ssid;
    });
    if (device != null) {
      selectDevice(device);
      device.selectAccessPoint(device.activeAccessPoint);
      return;
    }

    for (final device in devices) {
      selectDevice(device);
      var accessPoint = device.findAccessPoint(ssid);
      if (accessPoint == null) {
        try {
          await device.requestScan(ssid: ssid);
        } on WifiDeviceModel catch (_) {
          continue;
        }
        accessPoint = device.findAccessPoint(ssid);
      }
      if (accessPoint != null) {
        device.selectAccessPoint(accessPoint);
        return super.connect(onAuthenticate: onAuthenticate);
      }
    }
    selectDevice(null);
    throw 'TODO: HiddenWifiModel.connect(): $ssid not found error...';
  }

  String _ssid = '';
  String get ssid => _ssid;
  void setSsid(String ssid) {
    if (_ssid == ssid) return;
    _ssid = ssid;
    _resetSelection();
    notifyListeners();
  }

  void _resetSelection() {
    selectedDevice?.selectAccessPoint(null);
    selectDevice(null);
  }
}
