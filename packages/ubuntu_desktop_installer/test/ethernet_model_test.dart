import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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

  setUp(() async {
    service = MockNetworkService();
    serviceChanged = StreamController<List<String>>.broadcast(sync: true);
    when(service.propertiesChanged).thenAnswer((_) => serviceChanged.stream);
    when(service.wiredDevices).thenReturn([]);

    device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');
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

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    serviceChanged.add(['Devices']);
    await expectLater(wasNotified.future, completes);

    expect(model.devices.map((model) => model.device), [device]);
  });

  test('state', () {
    expect(model.connectMode, equals(ConnectMode.ethernet));

    when(service.wiredDevices).thenReturn([device]);
    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);

    expect(model.canConnect, isFalse);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isFalse);
    expect(model.isActive, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.config);

    expect(model.canConnect, isFalse);
    expect(model.canContinue, isFalse);
    expect(model.isBusy, isFalse);
    expect(model.isActive, isFalse);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);

    expect(model.isActive, isTrue);
    expect(model.canConnect, isFalse);
    expect(model.canContinue, isTrue);
    expect(model.isBusy, isFalse);
  });

  test('disabled', () async {
    when(service.wiredDevices).thenReturn([device]);

    when(device.state).thenReturn(NetworkManagerDeviceState.activated);
    expect(model.isEnabled, isTrue);

    serviceChanged.add(['Devices']);

    when(device.state).thenReturn(NetworkManagerDeviceState.disconnected);
    expect(model.isEnabled, isFalse);
  });

  test('unmanaged', () async {
    when(service.wiredDevices).thenReturn([device]);

    when(device.state).thenReturn(NetworkManagerDeviceState.unmanaged);
    expect(model.devices, isEmpty);
  });

  test('unavailable', () async {
    when(service.wiredDevices).thenReturn([device]);

    when(device.state).thenReturn(NetworkManagerDeviceState.unavailable);
    expect(model.devices, isEmpty);
  });
}
