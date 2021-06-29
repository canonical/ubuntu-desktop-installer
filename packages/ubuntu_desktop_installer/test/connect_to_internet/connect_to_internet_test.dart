import 'package:mockito/annotations.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';
import 'package:udev/udev.dart';

@GenerateMocks([
  ConnectModel,
  NetworkManagerAccessPoint,
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerDeviceWired,
  NetworkManagerDeviceWireless,
  NetworkManagerSettingsConnection,
  NetworkService,
  Udev,
  UdevDevice,
])
void main() {}
