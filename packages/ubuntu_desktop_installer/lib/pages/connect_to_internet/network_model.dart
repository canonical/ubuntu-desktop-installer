import 'package:flutter/foundation.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'property_stream_notifier.dart';

abstract class NetworkModel<T extends NetworkDevice>
    extends PropertyStreamNotifier implements ConnectModel {
  NetworkModel(this.service, [this.udev]) {
    addPropertyListener('Devices', updateDevices);
  }

  @protected
  final NetworkService service;

  @protected
  final UdevService? udev;

  @override
  Future<void> init() async {
    setProperties(service.propertiesChanged);
    updateDevices();
  }

  @override
  void dispose() {
    for (final device in _devices) {
      device.dispose();
    }
    super.dispose();
  }

  final _devices = <T>[];
  final _allDevices = <String, T>{};
  List<T> get devices => _devices
      .where((device) => !device.isUnmanaged && device.isAvailable)
      .toList();

  @protected
  List<NetworkManagerDevice> getDevices();

  @protected
  T createDevice(NetworkManagerDevice device);

  @protected
  T? findActiveDevice();

  @protected
  void updateDevices() {
    _devices.clear();
    final previousSelected = _selectedDevice;
    _selectedDevice = null;
    for (final device in getDevices()) {
      final model = _allDevices[device.hwAddress] ?? createDevice(device);
      model.setDevice(device);
      _devices.add(model);
      _allDevices[device.hwAddress] = model;
      if (model == previousSelected) {
        _selectedDevice = model;
      }
    }
    if (_selectedDevice == null) {
      selectDevice(findActiveDevice());
    }
    log.debug('Update devices: $_devices');
    notifyListeners();
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
    addPropertyListener('ActiveConnection', notifyListeners);
    addPropertyListener('AvailableConnections', notifyListeners);
    addPropertyListener('State', notifyListeners);
    addPropertyListener('Udi', _updateUdi);
    _updateUdi();
  }

  void setDevice(NetworkManagerDevice device) {
    _device = device;
    setProperties(_device.propertiesChanged);
    _updateUdi();
    notifyListeners();
  }

  NetworkManagerDevice _device;
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
  String get hwAddress => _device.hwAddress;

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
