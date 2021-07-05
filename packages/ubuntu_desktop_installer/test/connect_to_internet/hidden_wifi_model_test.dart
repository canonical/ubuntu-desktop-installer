import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';

import 'hidden_wifi_model_test.mocks.dart';

const kTestSsid = [0x55, 0x62, 0x75, 0x6e, 0x74, 0x75];

@GenerateMocks([
  NetworkManagerAccessPoint,
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerDeviceWireless,
  NetworkManagerSettingsConnection,
  NetworkService,
])
void main() {
  late HiddenWifiModel model;
  late WifiDeviceModel wifi;
  late AccessPointModel accessPoint;
  late NetworkService service;
  late NetworkManagerDevice device;
  late NetworkManagerDeviceWireless wireless;
  late NetworkManagerAccessPoint ap;
  late StreamController<List<String>> serviceChanged;
  late StreamController<List<String>> deviceChanged;
  late StreamController<List<String>> wirelessChanged;
  late StreamController<List<String>> accessPointChanged;

  setUp(() {
    service = MockNetworkService();
    serviceChanged = StreamController<List<String>>();
    when(service.propertiesChanged).thenAnswer((_) => serviceChanged.stream);
    when(service.wirelessDevices).thenReturn([]);

    device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');
    deviceChanged = StreamController<List<String>>.broadcast();
    when(device.propertiesChanged).thenAnswer((_) => deviceChanged.stream);

    ap = MockNetworkManagerAccessPoint();
    accessPointChanged = StreamController<List<String>>.broadcast();
    when(ap.propertiesChanged).thenAnswer((_) => accessPointChanged.stream);
    when(ap.ssid).thenReturn(kTestSsid);

    wireless = MockNetworkManagerDeviceWireless();
    when(device.wireless).thenReturn(wireless);
    wirelessChanged = StreamController<List<String>>.broadcast();
    when(wireless.propertiesChanged).thenAnswer((_) => wirelessChanged.stream);
    when(wireless.accessPoints).thenReturn([]);

    model = HiddenWifiModel(service);
    wifi = WifiDeviceModel(device);
    accessPoint = AccessPointModel(ap);
  });

  tearDown(() {
    accessPoint.dispose();
    wifi.dispose();
    model.dispose();
    deviceChanged.close();
    serviceChanged.close();
    wirelessChanged.close();
    accessPointChanged.close();
  });

  test('mode', () {
    expect(model.connectMode, equals(ConnectMode.hiddenWifi));
  });

  test('ssid', () {
    expect(model.ssid, isEmpty);
    expect(model.canConnect, isFalse);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    model.setSsid('ssid');
    expect(model.canConnect, isTrue);
    expect(wasNotified, isTrue);
  });

  test('selection', () {
    model.selectDevice(wifi);
    expect(model.selectedDevice, equals(wifi));

    wifi.selectAccessPoint(accessPoint);
    expect(wifi.selectedAccessPoint, equals(accessPoint));

    model.setSsid('ssid');
    expect(model.selectedDevice, isNull);
    expect(wifi.selectedAccessPoint, isNull);
  });

  test('connect to active access point', () async {
    when(service.wirelessDevices).thenReturn([device]);
    when(wireless.activeAccessPoint).thenReturn(ap);
    when(wireless.accessPoints).thenReturn([ap]);
    when(wireless.requestScan(ssids: [kTestSsid]))
        .thenAnswer((_) async => null);

    expect(model.selectedDevice, isNull);

    model.setSsid(String.fromCharCodes(kTestSsid));
    await model.connect();
    expect(model.selectedDevice, isNotNull);
    expect(model.selectedDevice!.selectedAccessPoint, isNotNull);
    expect(model.selectedDevice!.selectedAccessPoint!.ssid, kTestSsid);
  });

  test('connect to scanned access point', () async {
    when(ap.ssid).thenReturn([]);
    when(ap.strength).thenReturn(100);

    when(service.wirelessDevices).thenReturn([device]);
    when(wireless.activeAccessPoint).thenReturn(null);
    when(wireless.accessPoints).thenReturn([ap]);
    when(wireless.requestScan(ssids: [kTestSsid])).thenAnswer((_) async {
      when(ap.ssid).thenReturn(kTestSsid);
      wirelessChanged.add(['AccessPoints']);
      when(wireless.lastScan).thenReturn(0);
      wirelessChanged.add(['LastScan']);
      return null;
    });

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([connection]);
    when(service.activateConnection(device: device, connection: connection))
        .thenAnswer((_) async => MockNetworkManagerActiveConnection());
    when(service.activateConnection(
      device: wifi.device,
      connection: connection,
      accessPoint: ap,
    )).thenAnswer((_) async => MockNetworkManagerActiveConnection());

    final settings = <String, Map<String, DBusValue>>{
      '802-11-wireless': <String, DBusValue>{
        'ssid': DBusArray.byte(kTestSsid),
      },
    };
    when(connection.getSettings()).thenAnswer((_) => Future.value(settings));
    when(ap.flags).thenReturn([]);

    expect(model.selectedDevice, isNull);

    model.setSsid(String.fromCharCodes(kTestSsid));
    await model.connect(onAuthenticate: (_, __) async => null);
    expect(model.selectedDevice, isNotNull);
    expect(model.selectedDevice!.selectedAccessPoint, isNotNull);
    expect(model.selectedDevice!.selectedAccessPoint!.ssid, kTestSsid);
  });
}
