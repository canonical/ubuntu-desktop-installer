import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_model.dart';
import 'package:ubuntu_provision/services.dart';

import 'hidden_wifi_model_test.mocks.dart';
import 'test_network.dart';

@GenerateMocks([
  NetworkManagerAccessPoint,
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerDeviceWireless,
  NetworkManagerSettingsConnection,
])
void main() {
  late HiddenWifiModel model;
  late WifiDevice wifi;
  late NetworkService service;
  late NetworkManagerDevice device;
  late NetworkManagerDeviceWireless wireless;
  late NetworkManagerAccessPoint ap;
  late StreamController<List<String>> serviceChanged;
  late StreamController<List<String>> deviceChanged;
  late StreamController<List<String>> wirelessChanged;
  late StreamController<List<String>> accessPointChanged;

  setUp(() async {
    service = MockNetworkService();
    serviceChanged = StreamController<List<String>>(sync: true);
    when(service.propertiesChanged).thenAnswer((_) => serviceChanged.stream);
    when(service.wirelessDevices).thenReturn([]);
    when(service.wirelessEnabled).thenReturn(true);

    device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');
    when(device.hwAddress).thenReturn('test address');
    deviceChanged = StreamController<List<String>>.broadcast(sync: true);
    when(device.propertiesChanged).thenAnswer((_) => deviceChanged.stream);
    when(device.state).thenReturn(NetworkManagerDeviceState.activated);

    ap = MockNetworkManagerAccessPoint();
    accessPointChanged = StreamController<List<String>>.broadcast(sync: true);
    when(ap.propertiesChanged).thenAnswer((_) => accessPointChanged.stream);
    when(ap.ssid).thenReturn('foo'.codeUnits);
    when(ap.hwAddress).thenReturn('test address');

    wireless = MockNetworkManagerDeviceWireless();
    when(device.wireless).thenReturn(wireless);
    wirelessChanged = StreamController<List<String>>.broadcast(sync: true);
    when(wireless.propertiesChanged).thenAnswer((_) => wirelessChanged.stream);
    when(wireless.accessPoints).thenReturn([]);
    when(wireless.activeAccessPoint).thenReturn(null);

    model = HiddenWifiModel(service);
    await model.init();
    wifi = WifiDevice(device);
  });

  tearDown(() {
    wifi.dispose();
    model.dispose();
    deviceChanged.close();
    serviceChanged.close();
    wirelessChanged.close();
    accessPointChanged.close();
  });

  test('devices', () async {
    when(service.wirelessDevices).thenReturn([device]);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);
    serviceChanged.add(['Devices']);
    expect(wasNotified, isTrue);

    expect(model.devices.single.device, equals(device));
  });

  test('disabled', () async {
    when(service.wirelessEnabled).thenReturn(true);
    expect(model.isEnabled, isTrue);

    when(service.wirelessEnabled).thenReturn(false);
    expect(model.isEnabled, isFalse);
  });

  test('mode', () {
    expect(model.connectMode, equals(ConnectMode.hiddenWifi));
  });

  test('state', () {
    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);

    model.selectDevice(wifi);

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);

    model.setSsid('foo');

    expect(model.canConnect, isTrue);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    expect(model.canConnect, isTrue);
    expect(model.isConnecting, isTrue);
    expect(model.isConnected, isFalse);

    when(wireless.accessPoints).thenReturn([ap]);
    when(wireless.activeAccessPoint).thenReturn(ap);
    wirelessChanged.add(['AccessPoints']);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isTrue);
  });

  test('ssid', () {
    expect(model.ssid, isEmpty);
    expect(model.canConnect, isFalse);
    model.selectDevice(wifi);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    model.setSsid('ssid');
    expect(model.canConnect, isTrue);
    expect(wasNotified, isTrue);

    wasNotified = false;

    model.setSsid('');
    expect(model.canConnect, isFalse);
    expect(wasNotified, isTrue);
  });

  test('add and activate connection', () async {
    model.selectDevice(wifi);
    model.setSsid('foo');

    when(service.getWifiSettings(ssid: 'foo')).thenReturn({});
    when(service.addAndActivateConnection(device: device))
        .thenAnswer((_) async => MockNetworkManagerActiveConnection());

    await model.connect();
    verify(service.getWifiSettings(ssid: 'foo')).called(1);
    verify(service.addAndActivateConnection(device: device)).called(1);
  });
}
