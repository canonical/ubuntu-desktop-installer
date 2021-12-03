import '../../services.dart';
import 'connect_model.dart';
import 'network_model.dart';

/// "Use wired connection"
class EthernetModel extends NetworkModel<EthernetDevice> {
  EthernetModel(NetworkService service, [UdevService? udev])
      : super(service, udev);

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
  Future<void> enable() async {
    log.debug('Enable wired networking');
    devices.where((device) => device.isDisconnected).forEach((device) {
      if (device.availableConnections.isNotEmpty) {
        service.activateConnection(device: device.device);
      } else if (!device.isUnmanaged) {
        service.addAndActivateConnection(device: device.device);
      }
    });
  }

  @override
  Future<void> connect() async {
    assert(false);
  }

  @override
  List<EthernetDevice> getDevices() {
    final devices = service.wiredDevices.map((device) {
      final model = EthernetDevice(device, udev);
      model.addListener(notifyListeners);
      return model;
    }).toList();
    log.debug(() => 'Update ethernet devices: $devices');
    return devices;
  }
}

class EthernetDevice extends NetworkDevice {
  EthernetDevice(NetworkManagerDevice device, UdevService? udev)
      : super(device, udev);
}
