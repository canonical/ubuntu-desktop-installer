import '../../services.dart';
import 'connect_model.dart';
import 'network_device.dart';
import 'property_stream_notifier.dart';

/// "Use wired connection"
class EthernetModel extends PropertyStreamNotifier implements ConnectModel {
  EthernetModel(this._service, [this._udev]);

  @override
  bool get canConnect => false;

  @override
  bool get isConnected => hasActiveConnection;

  @override
  bool get isConnecting => false;

  @override
  bool get hasActiveConnection => devices.any((device) => device.isActive);

  @override
  bool get isEnabled => devices.any((device) => !device.isDisconnected);

  @override
  ConnectMode get connectMode => ConnectMode.ethernet;

  @override
  void onSelected() async {}

  @override
  void onDeselected() async {}

  @override
  Future<void> init() async {
    addProperties(_service.propertiesChanged);
    addPropertyListener('Devices', _updateDevices);
    _updateDevices();
  }

  @override
  Future<void> enable() async {
    log.debug('Enable wired networking');
    devices.where((device) => device.isDisconnected).forEach((device) {
      if (device.availableConnections.isNotEmpty) {
        _service.activateConnection(device: device.device);
      } else if (!device.isUnmanaged) {
        _service.addAndActivateConnection(device: device.device);
      }
    });
  }

  @override
  Future<void> connect() async {
    assert(false);
  }

  @override
  void dispose() {
    _resetDevices();
    super.dispose();
  }

  final NetworkService _service;
  final UdevService? _udev;

  List<EthernetDevice>? _devices;
  List<EthernetDevice> get devices => _allDevices
      .where((device) => !device.isUnmanaged && device.isAvailable)
      .toList();
  List<EthernetDevice> get _allDevices => _devices ??= _getDevices();

  List<EthernetDevice> _getDevices() {
    final devices = _service.wiredDevices.map((device) {
      final model = EthernetDevice(device, _udev);
      model.addListener(notifyListeners);
      return model;
    }).toList();
    log.debug(() => 'Update ethernet devices: ${describeDevices(devices)}');
    return devices;
  }

  void _resetDevices() {
    if (_devices == null) return;
    for (final device in _devices!) {
      device.removeListener(notifyListeners);
      device.dispose();
    }
    _devices = null;
  }

  void _updateDevices() {
    _resetDevices();
    notifyListeners();
  }
}

class EthernetDevice extends NetworkDevice {
  EthernetDevice(NetworkManagerDevice device, UdevService? udev)
      : super(device, udev);
}
