import 'package:nm/nm.dart';

import '../../services.dart';
import 'property_stream_notifier.dart';

class NetworkDevice extends PropertyStreamNotifier {
  NetworkDevice(this._device, this._udev) {
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
  NetworkManagerDeviceStateReason get stateReason => _device.stateReason.reason;

  Future<void> disconnect() => _device.disconnect();

  bool get isActive => state == NetworkManagerDeviceState.activated;
  bool get isBusy {
    switch (state) {
      case NetworkManagerDeviceState.config:
      case NetworkManagerDeviceState.ip_check:
      case NetworkManagerDeviceState.ip_config:
      case NetworkManagerDeviceState.prepare:
        return true;
      default:
        return false;
    }
  }

  bool get isAvailable => state != NetworkManagerDeviceState.unavailable;

  String? _model;
  String? _vendor;
  String? get model => _model;
  String? get vendor => _vendor;

  String describe() {
    return '$this (${device.state.toString().split('.')[1]})';
  }

  @override
  String toString() =>
      '${vendor ?? '<unknown vendor>'} ${model ?? '<unknown model>'}';

  final UdevService? _udev;

  void _updateUdi() {
    _model = _udev?.bySyspath(_device.udi).modelName;
    _vendor = _udev?.bySyspath(_device.udi).vendorName;
    notifyListeners();
  }

  NetworkManagerActiveConnection? get activeConnection =>
      _device.activeConnection;
  List<NetworkManagerSettingsConnection> get availableConnections =>
      _device.availableConnections;
}

String describeDevices(List<NetworkDevice> devices) {
  return devices.map((d) => d.describe()).join(', ');
}
