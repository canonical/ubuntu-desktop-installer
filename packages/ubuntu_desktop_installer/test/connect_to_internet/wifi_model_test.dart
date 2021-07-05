import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';
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

    model = WifiModel(service);
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

  test('devices', () async {
    when(service.wirelessDevices).thenReturn([device]);

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    serviceChanged.add(['Devices']);
    await expectLater(wasNotified.future, completes);

    expect(model.devices.map((model) => model.device), [device]);
  });

  test('access points', () async {
    when(wireless.accessPoints).thenReturn([ap]);

    final wasNotified = Completer<bool>();
    wifi.addListener(() => wasNotified.complete(true));
    wirelessChanged.add(['AccessPoints']);
    await expectLater(wasNotified.future, completes);

    expect(wifi.accessPoints.map((model) => model.accessPoint), [ap]);
  });

  test('init', () {
    when(service.wirelessDevices).thenReturn([device]);

    when(wireless.activeAccessPoint).thenReturn(null);
    model.init();
    expect(model.selectedDevice, isNull);

    when(wireless.activeAccessPoint).thenReturn(ap);
    model.init();
    expect(model.selectedDevice, isNotNull);
    expect(model.selectedDevice!.device, equals(device));
  });

  test('select', () {
    expect(model.selectedDevice, isNull);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    model.selectDevice(wifi);
    expect(model.selectedDevice, isNotNull);
    expect(model.isSelectedDevice(wifi), isTrue);
    expect(model.selectedDevice, equals(wifi));
    expect(wasNotified, isTrue);

    wasNotified = false;

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

    expect(model.connectMode, equals(ConnectMode.wifi));

    expect(model.canConnect, isFalse);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isFalse);

    model.selectDevice(wifi);
    wifi.selectAccessPoint(wifi.accessPoints.first);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);

    expect(model.canConnect, isTrue);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    expect(model.canConnect, isTrue);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isTrue);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    when(wireless.activeAccessPoint).thenReturn(ap);

    expect(model.canConnect, isFalse);
    expect(model.canContinue, isTrue);
    expect(model.isBusy, isFalse);
  });

  test('available connection', () async {
    when(device.activeConnection).thenReturn(null);
    when(wireless.accessPoints).thenReturn([ap]);

    model.selectDevice(wifi);
    wifi.selectAccessPoint(wifi.accessPoints.first);

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([connection]);
    when(service.activateConnection(
      device: wifi.device,
      connection: connection,
      accessPoint: ap,
    )).thenAnswer((_) async => MockNetworkManagerActiveConnection());

    var authenticated = false;

    Future<Authentication?> onAuthenticate(
      WifiDeviceModel device,
      AccessPointModel accessPoint,
    ) async {
      authenticated = true;
      return Authentication(
        password: '',
        storePassword: StorePassword.thisUser,
        wifiSecurity: WifiSecurity.wpa2Personal,
      );
    }

    final settings = <String, Map<String, DBusValue>>{
      '802-11-wireless': <String, DBusValue>{
        'ssid': DBusArray.byte(kTestSsid),
      },
    };
    when(connection.getSettings()).thenAnswer((_) => Future.value(settings));

    // open
    when(ap.flags).thenReturn([]);
    await model.connect(onAuthenticate: onAuthenticate);
    expect(authenticated, isFalse);
    verify(service.activateConnection(
      device: wifi.device,
      connection: connection,
      accessPoint: ap,
    ));

    // closed
    when(ap.flags).thenReturn([NetworkManagerWifiAccessPointFlag.privacy]);
    await model.connect(onAuthenticate: onAuthenticate);
    verify(service.activateConnection(
      device: wifi.device,
      connection: connection,
      accessPoint: ap,
    ));
    expect(authenticated, isTrue);
  });

  test('add connection', () async {
    when(device.activeConnection).thenReturn(null);
    when(wireless.accessPoints).thenReturn([ap]);

    model.selectDevice(wifi);
    wifi.selectAccessPoint(wifi.accessPoints.first);

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([]);
    when(service.addWirelessConnection(ssid: kTestSsid))
        .thenAnswer((_) async => connection);

    when(service.activateConnection(
      device: wifi.device,
      connection: connection,
      accessPoint: ap,
    )).thenAnswer((_) async => MockNetworkManagerActiveConnection());

    Future<Authentication?> onAuthenticate(
      WifiDeviceModel device,
      AccessPointModel accessPoint,
    ) async {
      return Authentication(
        password: '',
        storePassword: StorePassword.thisUser,
        wifiSecurity: WifiSecurity.wpa2Personal,
      );
    }

    when(ap.flags).thenReturn([]);
    await model.connect(onAuthenticate: onAuthenticate);
    verify(service.activateConnection(
      device: wifi.device,
      connection: connection,
      accessPoint: ap,
    ));
  });

  test('scan', () async {
    when(service.wirelessDevices).thenReturn([device]);

    when(wireless.lastScan).thenReturn(1);
    when(wireless.requestScan(ssids: [kTestSsid]))
        .thenAnswer((_) async => null);

    final timeout = model.requestScan(ssid: String.fromCharCodes(kTestSsid));
    expect(model.devices.first.lastScan, -1);
    expect(model.devices.first.scanning, isTrue);
    await timeout;
    expect(model.devices.first.lastScan, -1);
    expect(model.devices.first.scanning, isFalse);

    final scan = model.requestScan(ssid: String.fromCharCodes(kTestSsid));
    wirelessChanged.add(['LastScan']);
    await scan;
    expect(model.devices.first.lastScan, 1);
    expect(model.devices.first.scanning, isFalse);
  });

  test('strength', () async {
    when(ap.strength).thenReturn(50);

    final wasNotified = Completer<bool>();
    accessPoint.addListener(() => wasNotified.complete(true));
    accessPointChanged.add(['Strength']);
    await expectLater(wasNotified.future, completes);

    expect(accessPoint.strength, equals(50));
  });

  test('active access point', () {
    when(wireless.activeAccessPoint).thenReturn(null);
    expect(wifi.activeAccessPoint, isNull);
    expect(wifi.isActiveAccessPoint(accessPoint), isFalse);

    when(wireless.activeAccessPoint).thenReturn(ap);
    expect(wifi.activeAccessPoint, isNotNull);
    expect(wifi.isActiveAccessPoint(accessPoint), isTrue);
  });

  test('find access point', () {
    when(wireless.accessPoints).thenReturn([ap]);

    final ap1 = wifi.findAccessPoint(String.fromCharCodes(kTestSsid.reversed));
    expect(ap1, isNull);

    final ap2 = wifi.findAccessPoint(String.fromCharCodes(kTestSsid));
    expect(ap2, isNotNull);
  });
}
