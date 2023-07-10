import 'package:dbus/dbus.dart';
import 'package:nm/nm.dart';

export 'package:nm/nm.dart';

/// Extends [NetworkManagerClient] with convenience properties and methods.
class NetworkService extends NetworkManagerClient {
  /// `true` if there is a full network connection.
  bool get isConnected {
    return connectivity == NetworkManagerConnectivityState.full;
  }

  /// `true` if there is a limited site-wide connectivity.
  bool get isConnectedSite {
    return state == NetworkManagerState.connectedSite;
  }

  /// The list of wired network devices.
  List<NetworkManagerDevice> get wiredDevices {
    return devices.where((device) => device.wired != null).toList();
  }

  /// The list of wireless network devices.
  List<NetworkManagerDevice> get wirelessDevices {
    return devices.where((device) => device.wireless != null).toList();
  }

  /// Returns Wi-Fi connection settings for the specified attributes.
  Map<String, Map<String, DBusValue>> getWifiSettings({required String ssid}) {
    return <String, Map<String, DBusValue>>{
      'connection': {
        'id': DBusString(ssid),
        'type': const DBusString('802-11-wireless'),
      },
      '802-11-wireless': {
        'ssid': DBusArray.byte(ssid.codeUnits),
      },
      '802-11-wireless-security': {
        'key-mgmt': const DBusString('wpa-psk'),
      },
    };
  }

  /// Marks network configured.
  Future<void> markConfigured() async {}
}
