import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_model.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';

import 'wifi_model_test.mocks.dart';

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
  late WifiModel model;
  late WifiDevice wifi;
  late AccessPoint accessPoint;
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
    serviceChanged = StreamController<List<String>>.broadcast(sync: true);
    when(service.propertiesChanged).thenAnswer((_) => serviceChanged.stream);
    when(service.wirelessDevices).thenReturn([]);
    when(service.wirelessEnabled).thenReturn(true);

    device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');
    when(device.hwAddress).thenReturn('test address');
    deviceChanged = StreamController<List<String>>.broadcast(sync: true);
    when(device.propertiesChanged).thenAnswer((_) => deviceChanged.stream);
    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    ap = MockNetworkManagerAccessPoint();
    accessPointChanged = StreamController<List<String>>.broadcast(sync: true);
    when(ap.propertiesChanged).thenAnswer((_) => accessPointChanged.stream);
    when(ap.ssid).thenReturn(kTestSsid);
    when(ap.hwAddress).thenReturn('test address');

    wireless = MockNetworkManagerDeviceWireless();
    when(device.wireless).thenReturn(wireless);
    wirelessChanged = StreamController<List<String>>.broadcast(sync: true);
    when(wireless.propertiesChanged).thenAnswer((_) => wirelessChanged.stream);
    when(wireless.accessPoints).thenReturn([]);
    when(wireless.activeAccessPoint).thenReturn(null);

    model = WifiModel(service);
    await model.init();
    wifi = WifiDevice(device);
    accessPoint = AccessPoint(ap);
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

  test('devices', () async {
    when(service.wirelessDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

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

  test('access points', () async {
    when(wireless.accessPoints).thenReturn([ap]);
    wirelessChanged.add(['AccessPoints']);

    bool? wasNotified;
    wifi.addListener(() => wasNotified = true);
    wirelessChanged.add(['AccessPoints']);
    expect(wasNotified, isTrue);

    expect(wifi.accessPoints.single.accessPoint, equals(ap));
  });

  test('select and deselect', () {
    when(service.wirelessDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(wireless.accessPoints).thenReturn([ap]);
    wirelessChanged.add(['AccessPoints']);
    when(wireless.activeAccessPoint).thenReturn(null);
    when(wireless.requestScan(ssids: [])).thenAnswer((_) async {});

    model.onSelected();
    verify(wireless.requestScan(ssids: [])).called(1);

    model.selectDevice(wifi);
    when(device.state).thenReturn(NetworkManagerDeviceState.prepare);
    expect(model.selectedDevice!.isConnecting, isTrue);

    model.onDeselected();
    verify(device.disconnect()).called(1);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    expect(model.selectedDevice!.isConnecting, isFalse);

    model.onDeselected();
    verifyNever(device.disconnect());
  });

  test('select', () {
    when(service.wirelessDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    expect(model.selectedDevice, isNull);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    model.selectDevice(wifi);
    expect(model.selectedDevice, isNotNull);
    expect(model.isSelectedDevice(wifi), isTrue);
    expect(model.selectedDevice, equals(wifi));
    expect(wasNotified, isTrue);

    wasNotified = false;
    wifi.addListener(() => wasNotified = true);

    wifi.selectAccessPoint(accessPoint);
    expect(wifi.selectedAccessPoint, isNotNull);
    expect(wifi.isSelectedAccessPoint(accessPoint), isTrue);
    expect(wifi.selectedAccessPoint, equals(accessPoint));
    expect(wasNotified, isTrue);

    wasNotified = false;

    wifi.selectAccessPoint(null);
    expect(wifi.selectedAccessPoint, isNull);
    expect(wasNotified, isTrue);

    wasNotified = false;

    model.selectDevice(null);
    expect(model.selectedDevice, isNull);
    expect(wasNotified, isTrue);
  });

  test('state', () {
    when(wireless.accessPoints).thenReturn([ap]);
    wirelessChanged.add(['AccessPoints']);

    expect(model.connectMode, equals(ConnectMode.wifi));

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);

    model.selectDevice(wifi);
    wifi.selectAccessPoint(wifi.accessPoints.first);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);

    expect(model.canConnect, isTrue);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    expect(model.canConnect, isTrue);
    expect(model.isConnecting, isTrue);
    expect(model.isConnected, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    when(wireless.activeAccessPoint).thenReturn(ap);

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isTrue);
  });

  test('available connection', () async {
    when(device.activeConnection).thenReturn(null);
    when(wireless.accessPoints).thenReturn([ap]);
    wirelessChanged.add(['AccessPoints']);

    model.selectDevice(wifi);
    wifi.selectAccessPoint(wifi.accessPoints.first);

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([connection]);
    when(service.addAndActivateConnection(
      device: wifi.device,
      connection: {},
      accessPoint: ap,
    )).thenAnswer((_) async => MockNetworkManagerActiveConnection());

    final settings = <String, Map<String, DBusValue>>{
      '802-11-wireless': <String, DBusValue>{
        'ssid': DBusArray.byte(kTestSsid),
      },
    };
    when(connection.getSettings()).thenAnswer((_) => Future.value(settings));

    // open
    when(ap.flags).thenReturn([]);
    await model.connect();
    verify(service.addAndActivateConnection(
      device: wifi.device,
      connection: {},
      accessPoint: ap,
    ));

    // closed
    when(ap.flags).thenReturn([NetworkManagerWifiAccessPointFlag.privacy]);
    await model.connect();
    verify(service.addAndActivateConnection(
      device: wifi.device,
      connection: {},
      accessPoint: ap,
    ));
  });

  test('periodic scanning', () async {
    when(service.wirelessDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(wireless.lastScan).thenReturn(1);
    when(wireless.requestScan(ssids: [])).thenAnswer((_) async => null);

    fakeAsync((async) {
      model.startPeriodicScanning();
      verify(wireless.requestScan(ssids: [])).called(1);

      for (var i = 0; i < 3; ++i) {
        async.elapse(kWifiScanInterval);
        verify(wireless.requestScan(ssids: [])).called(1);
      }

      model.stopPeriodicScanning();
      async.elapse(kWifiScanInterval);
      verifyNever(wireless.requestScan(ssids: []));
    });
  });

  test('request scan', () async {
    when(service.wirelessDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(wireless.lastScan).thenReturn(1);
    when(wireless.requestScan(ssids: [kTestSsid]))
        .thenAnswer((_) async => null);

    final ssid = String.fromCharCodes(kTestSsid);

    fakeAsync((async) async {
      final timeout = model.requestScan(ssid: ssid);
      expect(model.devices.first.lastScan, -1);
      expect(model.devices.first.scanning, isTrue);
      verify(wireless.lastScan).called(1);
      verify(wireless.requestScan(ssids: [kTestSsid])).called(1);

      async.elapse(kWifiScanTimeout);
      await timeout;
      expect(model.devices.first.lastScan, -1);
      expect(model.devices.first.scanning, isFalse);
      verify(wireless.lastScan).called(1);
      verify(wireless.requestScan(ssids: [kTestSsid])).called(1);
    });

    final scan = model.requestScan(ssid: ssid);
    wirelessChanged.add(['LastScan']);
    await scan;
    expect(model.devices.first.lastScan, 1);
    expect(model.devices.first.scanning, isFalse);
    verify(wireless.lastScan).called(2);
    verify(wireless.requestScan(ssids: [kTestSsid])).called(2);
  });

  test('access point properties', () async {
    when(ap.hwAddress).thenReturn('hw address');
    when(ap.flags).thenReturn([]);
    when(ap.strength).thenReturn(50);

    expect(accessPoint.hwAddress, equals('hw address'));
    expect(accessPoint.isOpen, isTrue);
    expect(accessPoint.strength, equals(50));

    bool? wasNotified;
    accessPoint.addListener(() => wasNotified = true);
    accessPointChanged.add(['Strength']);
    expect(wasNotified, isTrue);
  });

  test('active access point', () {
    when(wireless.accessPoints).thenReturn([ap]);
    wirelessChanged.add(['AccessPoints']);
    when(wireless.activeAccessPoint).thenReturn(null);
    expect(wifi.activeAccessPoint, isNull);
    expect(wifi.isActiveAccessPoint(accessPoint), isFalse);

    when(wireless.activeAccessPoint).thenReturn(ap);
    expect(wifi.activeAccessPoint, isNotNull);
    expect(wifi.isActiveAccessPoint(accessPoint), isTrue);
  });

  test('find access point', () {
    when(wireless.accessPoints).thenReturn([ap]);
    wirelessChanged.add(['AccessPoints']);

    final ap1 = wifi.findAccessPoint(String.fromCharCodes(kTestSsid.reversed));
    expect(ap1, isNull);

    final ap2 = wifi.findAccessPoint(String.fromCharCodes(kTestSsid));
    expect(ap2, isNotNull);
  });

  test('enable', () async {
    when(service.setWirelessEnabled(true)).thenAnswer((_) async {});

    model.enable();
    verify(service.setWirelessEnabled(true)).called(1);
  });

  test('cleanup model', () async {
    when(service.wirelessDevices).thenReturn([device]);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    serviceChanged.add(['Devices']);
    expect(wasNotified, isTrue);

    wasNotified = false;
    await model.cleanup();

    serviceChanged.add(['Devices']);
    expect(wasNotified, isFalse);

    wasNotified = false;
    await model.init();

    serviceChanged.add(['Devices']);
    expect(wasNotified, isTrue);
  });

  test('cleanup access point', () {
    var wasNotified = false;
    accessPoint.addListener(() => wasNotified = true);

    accessPointChanged.add(['Strength']);
    expect(wasNotified, isTrue);

    wasNotified = false;
    accessPoint.cleanup();

    accessPointChanged.add(['Strength']);
    expect(wasNotified, isFalse);

    wasNotified = false;
    accessPoint.init();

    accessPointChanged.add(['Strength']);
    expect(wasNotified, isTrue);
  });
}
