import 'package:mockito/annotations.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';
import 'package:udev/udev.dart';

import 'connect_to_internet_test.mocks.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
  NetworkService,
  Udev,
  UdevDevice,
])
void main() {}
