import 'dart:io';

import 'package:dbus/dbus.dart';
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

  /// Adds a wired network connection for the specified [device].
  Future<NetworkManagerSettingsConnection> addWiredConnection({
    required NetworkManagerDevice device,
  }) async {
    final properties = <String, Map<String, DBusValue>>{
      'connection': <String, DBusValue>{
        'id': DBusString(device.interface),
        'type': DBusString('802-3-ethernet'),
      },
    };
    return settings.addConnection(properties);
  }

  /// Adds a wireless network connection with the specified properties.
  Future<NetworkManagerSettingsConnection> addWirelessConnection({
    required List<int> ssid,
    String? bssid,
    bool private = false,
    bool hidden = false,
    String? password,
  }) async {
    final properties = <String, Map<String, DBusValue>>{
      'connection': <String, DBusValue>{
        'id': DBusString(String.fromCharCodes(ssid)),
        if (private) 'user': DBusString(Platform.environment['USERNAME'] ?? ''),
      },
      '802-11-wireless': <String, DBusValue>{
        'ssid': DBusArray.byte(ssid),
        if (hidden) 'hidden': DBusBoolean(hidden),
        if (bssid != null) 'bssid': DBusString(bssid),
      },
      if (password != null)
        '802-11-wireless-security': <String, DBusValue>{
          'key-mgmt': DBusString('wpa-psk'),
          'auth-alg': DBusString('open'),
          'psk': DBusString(password),
        },
    };
    return settings.addConnection(properties);
  }
}
