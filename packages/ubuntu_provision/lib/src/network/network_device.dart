import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';

import 'connect_model.dart';

abstract class NetworkDeviceModel<T extends NetworkDevice>
    extends SafeChangeNotifier
    with PropertyStreamNotifier
    implements ConnectModel {
  NetworkDeviceModel(this.service, [this.udev]) {
    addPropertyListener('Devices', updateDevices);
  }

  @protected
  final NetworkService service;

  @protected
  final UdevService? udev;

  @override
  Future<void> init() async {
    setProperties(service.propertiesChanged);
    enablePropertyListeners();
    updateDevices();
  }

  @override
  @mustCallSuper
  Future<void> cleanup() async {
    for (final device in _devices) {
      device.cleanup();
    }
    disablePropertyListeners();
  }

  @override
  void dispose() {
    for (final device in _devices) {
      device.dispose();
    }
    super.dispose();
  }

  var _devices = <T>[];
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
    final previousSelected = _selectedDevice;
    _selectedDevice = null;
    final devices = <T>[];
    for (final device in getDevices()) {
      var model = _allDevices[device.hwAddress];
      if (model == null) {
        model = createDevice(device);
        model.addListener(updateDevices);
        _allDevices[device.hwAddress] = model;
      } else {
        model.updateDevice(device);
      }
      devices.add(model);
      if (model == previousSelected &&
          !model.isUnmanaged &&
          model.isAvailable) {
        _selectedDevice = model;
      }
    }
    _devices = devices;
    _selectedDevice ??= findActiveDevice();
    log.debug('Update devices: $_devices');
    notifyListeners();
  }

  T? _selectedDevice;
  T? get selectedDevice => _selectedDevice;
  bool isSelectedDevice(T device) => device == _selectedDevice;
  void selectDevice(T? device) {
    if (device == _selectedDevice) return;
    _selectedDevice = device;
    notifyListeners();
  }

  bool? _wasEnabled;
  bool? _hadActiveConnection;

  @override
  Stream get onAvailabilityChanged => _onAvailable.stream;
  final _onAvailable = StreamController();

  @override
  void notifyListeners() {
    super.notifyListeners();
    if (_wasEnabled != isEnabled ||
        _hadActiveConnection != hasActiveConnection) {
      _onAvailable.add(isEnabled && hasActiveConnection);
    }
    _wasEnabled = isEnabled;
    _hadActiveConnection = hasActiveConnection;
  }
}

class NetworkDevice extends SafeChangeNotifier with PropertyStreamNotifier {
  NetworkDevice(this._device, this._udev) {
    _setDevice(_device);
    addPropertyListener('ActiveConnection', notifyListeners);
    addPropertyListener('AvailableConnections', notifyListeners);
    addPropertyListener('State', notifyListeners);
    addPropertyListener('Udi', _updateUdi);
  }

  @mustCallSuper
  void init() => enablePropertyListeners();

  @mustCallSuper
  void cleanup() => disablePropertyListeners();

  void _setDevice(NetworkManagerDevice device) {
    _device = device;
    setProperties(_device.propertiesChanged);
    _updateUdi();
  }

  @protected
  void updateDevice(NetworkManagerDevice device) {
    if (_device == device) return;
    _setDevice(device);
    notifyListeners();
  }

  NetworkManagerDevice _device;
  NetworkManagerDevice get device => _device;

  String get interface => _device.interface;
  NetworkManagerDeviceState get state => _device.state;

  Future<void> disconnect() => _device.disconnect();

  bool get isActive => state == NetworkManagerDeviceState.activated;
  bool get isConnecting {
    switch (state) {
      case NetworkManagerDeviceState.needAuth:
      case NetworkManagerDeviceState.config:
      case NetworkManagerDeviceState.ipCheck:
      case NetworkManagerDeviceState.ipConfig:
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
      '$runtimeType(vendor: $vendor, model: $model, state: ${state.name})';

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
