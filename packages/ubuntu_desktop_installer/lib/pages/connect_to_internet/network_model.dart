import 'package:flutter/foundation.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'property_stream_notifier.dart';

abstract class NetworkModel<T extends NetworkDevice>
    extends PropertyStreamNotifier implements ConnectModel {
  NetworkModel(this.service, [this.udev]);

  @protected
  final NetworkService service;

  @protected
  final UdevService? udev;

  @override
  Future<void> init() async {
    addProperties(service.propertiesChanged);
    addPropertyListener('Devices', updateDevices);
    updateDevices();
  }

  @override
  void dispose() {
    resetDevices();
    super.dispose();
  }

  List<T>? _devices;
  List<T> get devices => allDevices
      .where((device) => !device.isUnmanaged && device.isAvailable)
      .toList();
  List<T> get allDevices => _devices ??= getDevices();

  @protected
  List<T> getDevices();

  @protected
  void updateDevices() {
    resetDevices();
    notifyListeners();
  }

  @protected
  void resetDevices() {
    if (_devices == null) return;
    for (final device in _devices!) {
      device.dispose();
    }
    _devices = null;
  }

  T? _selectedDevice;
  T? get selectedDevice => _selectedDevice;
  bool isSelectedDevice(T device) => device == _selectedDevice;
  void selectDevice(T? device) {
    if (device == _selectedDevice) return;
    selectedDevice?.removeListener(notifyListeners);
    device?.addListener(notifyListeners);
    _selectedDevice = device;
    notifyListeners();
  }
}

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
  bool get isConnecting {
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
  bool get isDisconnected => state == NetworkManagerDeviceState.disconnected;
  bool get isUnmanaged => state == NetworkManagerDeviceState.unmanaged;

  String? _model;
  String? _vendor;
  String? get model => _model;
  String? get vendor => _vendor;

  @override
  String toString() =>
      '$runtimeType(vendor: $vendor, model: $model, state: ${describeEnum(state)})';

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
