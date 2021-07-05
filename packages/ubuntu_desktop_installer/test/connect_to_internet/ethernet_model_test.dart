import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';

import 'ethernet_model_test.mocks.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
  NetworkService,
])
void main() {
  late EthernetModel model;
  late NetworkService service;
  late NetworkManagerDevice device;
  late StreamController<List<String>> serviceChanged;
  late StreamController<List<String>> deviceChanged;

  setUp(() {
    service = MockNetworkService();
    serviceChanged = StreamController<List<String>>();
    when(service.propertiesChanged).thenAnswer((_) => serviceChanged.stream);
    when(service.wiredDevices).thenReturn([]);

    device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');
    deviceChanged = StreamController<List<String>>();
    when(device.propertiesChanged).thenAnswer((_) => deviceChanged.stream);

    model = EthernetModel(service);
  });

  tearDown(() {
    model.dispose();
    deviceChanged.close();
    serviceChanged.close();
  });

  test('devices', () async {
    when(service.wiredDevices).thenReturn([device]);

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    serviceChanged.add(['Devices']);
    await expectLater(wasNotified.future, completes);

    expect(model.devices.map((model) => model.device), [device]);
  });

  test('init', () async {
    when(service.wiredDevices).thenReturn([device]);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);
    model.init();
    expect(model.selectedDevice, isNull);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    model.init();
    expect(model.selectedDevice, isNotNull);
    expect(model.selectedDevice!.device, equals(device));
  });

  test('select', () async {
    expect(model.selectedDevice, isNull);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    final ethernet = EthernetDeviceModel(device);
    model.selectDevice(ethernet);
    expect(model.selectedDevice, isNotNull);
    expect(model.isSelectedDevice(ethernet), isTrue);
    expect(model.selectedDevice, equals(ethernet));
    expect(wasNotified, isTrue);

    wasNotified = false;

    model.selectDevice(null);
    expect(model.selectedDevice, isNull);
    expect(wasNotified, isTrue);

    ethernet.dispose();
  });

  test('state', () {
    expect(model.connectMode, equals(ConnectMode.ethernet));

    expect(model.canConnect, isFalse);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isFalse);

    final ethernet = EthernetDeviceModel(device);
    model.selectDevice(ethernet);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);

    expect(model.canConnect, isTrue);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    expect(model.canConnect, isTrue);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isTrue);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);

    expect(model.canConnect, isFalse);
    expect(model.canContinue, isTrue);
    expect(model.isBusy, isFalse);
  });

  test('available connection', () async {
    when(device.activeConnection).thenReturn(null);

    final ethernet = EthernetDeviceModel(device);
    model.selectDevice(ethernet);

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([connection]);
    when(service.activateConnection(
            device: ethernet.device, connection: connection))
        .thenAnswer((_) async => MockNetworkManagerActiveConnection());

    await model.connect();
    verify(service.activateConnection(
        device: ethernet.device, connection: connection));

    ethernet.dispose();
  });

  test('add connection', () async {
    when(device.activeConnection).thenReturn(null);

    final ethernet = EthernetDeviceModel(device);
    model.selectDevice(ethernet);

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([]);
    when(service.addWiredConnection(device: ethernet.device))
        .thenAnswer((_) async => connection);

    when(service.activateConnection(
            device: ethernet.device, connection: connection))
        .thenAnswer((_) async => MockNetworkManagerActiveConnection());

    await model.connect();
    verify(service.activateConnection(
        device: ethernet.device, connection: connection));

    ethernet.dispose();
  });
}
