import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_provision/services.dart';

import 'ethernet_model_test.mocks.dart';
import 'test_network.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
])
void main() {
  late EthernetModel model;
  late NetworkService service;
  late NetworkManagerDevice device;
  late StreamController<List<String>> serviceChanged;
  late StreamController<List<String>> deviceChanged;

  setUp(() async {
    service = MockNetworkService();
    serviceChanged = StreamController<List<String>>.broadcast(sync: true);
    when(service.propertiesChanged).thenAnswer((_) => serviceChanged.stream);
    when(service.wiredDevices).thenReturn([]);

    device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');
    when(device.hwAddress).thenReturn('test address');
    when(device.interface).thenReturn('test interface');
    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    deviceChanged = StreamController<List<String>>.broadcast(sync: true);
    when(device.propertiesChanged).thenAnswer((_) => deviceChanged.stream);

    model = EthernetModel(service);
    await model.init();
  });

  tearDown(() {
    model.dispose();
    deviceChanged.close();
    serviceChanged.close();
  });

  test('devices', () async {
    when(service.wiredDevices).thenReturn([device]);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);
    serviceChanged.add(['Devices']);
    expect(wasNotified, isTrue);

    expect(model.devices.single.device, equals(device));
  });

  test('connect', () {
    expect(model.connect(), throwsAssertionError);
  });

  test('state', () {
    expect(model.connectMode, equals(ConnectMode.ethernet));

    when(service.wiredDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);
    expect(model.hasActiveConnection, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isFalse);
    expect(model.hasActiveConnection, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);

    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
    expect(model.isConnected, isTrue);
    expect(model.hasActiveConnection, isTrue);
  });

  test('disabled', () async {
    when(service.wiredDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    expect(model.isEnabled, isTrue);

    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);
    expect(model.isEnabled, isFalse);
  });

  test('unmanaged', () async {
    when(service.wiredDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.unmanaged);
    expect(model.devices, isEmpty);
  });

  test('unavailable', () async {
    when(service.wiredDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.unavailable);
    expect(model.devices, isEmpty);
  });

  test('enable', () async {
    when(service.addAndActivateConnection(device: device))
        .thenAnswer((_) async => MockNetworkManagerActiveConnection());
    when(service.activateConnection(device: device))
        .thenAnswer((_) async => MockNetworkManagerActiveConnection());

    when(service.wiredDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);

    when(device.availableConnections).thenReturn([]);
    model.enable();
    verify(service.addAndActivateConnection(device: device)).called(1);

    when(device.availableConnections)
        .thenReturn([MockNetworkManagerSettingsConnection()]);
    model.enable();
    verify(service.activateConnection(device: device)).called(1);
  });

  test('keep track by hwaddress', () {
    when(service.wiredDevices).thenReturn([device]);
    serviceChanged.add(['Devices']);

    expect(model.devices, hasLength(1));
    final originalDevice = model.devices.single;

    final mock = MockNetworkManagerDevice();
    when(mock.udi).thenReturn('test udi');
    when(mock.hwAddress).thenReturn('test address');
    when(mock.interface).thenReturn('changed interface');

    when(mock.state).thenReturn(NetworkManagerDeviceState.activated);
    when(mock.propertiesChanged).thenAnswer((_) => deviceChanged.stream);

    when(service.wiredDevices).thenReturn([mock]);
    serviceChanged.add(['Devices']);

    expect(model.devices, hasLength(1));
    final changedDevice = model.devices.single;
    expect(changedDevice.hwAddress, equals(originalDevice.hwAddress));
    expect(changedDevice.interface, equals('changed interface'));
    expect(identical(originalDevice, changedDevice), isTrue);
  });
}
