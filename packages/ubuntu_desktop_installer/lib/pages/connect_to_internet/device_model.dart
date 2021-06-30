import 'package:nm/nm.dart';
import 'package:udev/udev.dart';

import 'property_stream_notifier.dart';

class DeviceModel extends PropertyStreamNotifier {
  DeviceModel(this._device) {
    addProperties(_device.propertiesChanged);
    addPropertyListener('ActiveConnection', notifyListeners);
    addPropertyListener('AvailableConnections', notifyListeners);
    addPropertyListener('State', notifyListeners);
    addPropertyListener('Udi', _updateUdi);
    _updateUdi();
  }

  final NetworkManagerDevice _device;
  NetworkManagerDevice get device => _device;

  String get interface => _device.interface;
  NetworkManagerDeviceState get state => _device.state;
  bool get isActive => state == NetworkManagerDeviceState.activated;
  bool get isBusy {
    switch (state) {
      case NetworkManagerDeviceState.config:
      case NetworkManagerDeviceState.deactivating:
      case NetworkManagerDeviceState.ip_check:
      case NetworkManagerDeviceState.ip_config:
      case NetworkManagerDeviceState.prepare:
        return true;
      default:
        return false;
    }
  }

  String? _model;
  String? _vendor;
  String? get model => _model;
  String? get vendor => _vendor;

  void _updateUdi() {
    final udev = Udev();
    final dev = udev.device(syspath: _device.udi);
    _model = dev?.model;
    _vendor = dev?.vendor;
    udev.dispose();
    notifyListeners();
  }

  NetworkManagerActiveConnection? get activeConnection =>
      _device.activeConnection;
  List<NetworkManagerSettingsConnection> get availableConnections =>
      _device.availableConnections;
}
