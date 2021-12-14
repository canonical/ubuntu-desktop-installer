import 'package:nm/nm.dart';

export 'package:nm/nm.dart';

/// Extends [NetworkManagerClient] with convenience properties and methods.
class NetworkService extends NetworkManagerClient {
  /// `true` if there is a full network connection.
  bool get isConnected {
    return connectivity == NetworkManagerConnectivityState.full;
  }

  /// The list of wired network devices.
  List<NetworkManagerDevice> get wiredDevices {
    return devices.where((device) => device.wired != null).toList();
  }

  /// The list of wireless network devices.
  List<NetworkManagerDevice> get wirelessDevices {
    return devices.where((device) => device.wireless != null).toList();
  }
}
