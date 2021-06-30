import 'package:collection/collection.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'device_model.dart';
import 'property_stream_notifier.dart';

class EthernetModel extends PropertyStreamNotifier implements ConnectModel {
  EthernetModel(this._service) {
    addProperties(_service.propertiesChanged);
    addPropertyListener('Devices', _resetDevices);
  }

  @override
  bool get canConnect => _selected?.isActive == false;

  @override
  bool get canContinue => _selected?.isActive == true;

  @override
  bool get isBusy => _selected?.isBusy == true;

  @override
  ConnectMode get connectMode => ConnectMode.ethernet;

  @override
  void init() => selectDevice(devices.firstWhereOrNull((d) => d.isActive));

  @override
  Future<void> connect({OnAuthenticate? onAuthenticate}) async {
    assert(onAuthenticate == null);
    if (_selected == null || _selected!.activeConnection != null) {
      return;
    }
    final connection = _selected!.availableConnections.firstOrNull ??
        await _service.addWiredConnection(device: _selected!.device);
    try {
      await _service.activateConnection(
          device: _selected!.device, connection: connection);
    } catch (e) {
      print('TODO: $e');
    }
  }

  final NetworkService _service;

  List<EthernetDeviceModel>? _devices;
  List<EthernetDeviceModel> get devices => _devices ??= _getDevices();

  List<EthernetDeviceModel> _getDevices() {
    return _service.wiredDevices
        .map((device) => EthernetDeviceModel(device))
        .toList();
  }

  void _resetDevices() {
    _devices = null;
    notifyListeners();
  }

  EthernetDeviceModel? _selected;
  EthernetDeviceModel? get selectedDevice => _selected;
  bool isSelectedDevice(EthernetDeviceModel device) => device == _selected;
  void selectDevice(EthernetDeviceModel? device) {
    _selected = device;
    notifyListeners();
  }
}

class EthernetDeviceModel extends DeviceModel {
  EthernetDeviceModel(NetworkManagerDevice device) : super(device);
}
