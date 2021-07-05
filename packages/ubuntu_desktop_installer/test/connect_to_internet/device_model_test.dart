import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/device_model.dart';
import 'package:udev/udev.dart';

import 'device_model_test.mocks.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
  Udev,
  UdevDevice,
])
void main() {
  late DeviceModel model;
  late MockUdevDevice udev;
  late StreamController<List<String>> propertiesChanged;

  setUpAll(() {
    udev = MockUdevDevice();
    when(udev.model).thenReturn('test model');
    when(udev.vendor).thenReturn('test vendor');

    final mock = MockUdev();
    when(mock.device(syspath: 'test udi')).thenReturn(udev);
    Udev.instance = mock;
  });

  setUp(() {
    final device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');

    propertiesChanged = StreamController<List<String>>();
    when(device.propertiesChanged).thenAnswer((_) => propertiesChanged.stream);

    model = DeviceModel(device);
  });

  tearDown(() {
    model.dispose();
    propertiesChanged.close();
  });

  test('model & vendor', () async {
    when(udev.model).thenReturn('another model');
    when(udev.vendor).thenReturn('another vendor');

    // model & vendor are cached
    expect(model.model, equals('test model'));
    expect(model.vendor, equals('test vendor'));

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['Udi']);
    await expectLater(wasNotified.future, completes);

    expect(model.model, equals('another model'));
    expect(model.vendor, equals('another vendor'));
  });

  test('state', () async {
    const activeStates = [
      NetworkManagerDeviceState.activated,
    ];

    const busyStates = [
      NetworkManagerDeviceState.prepare,
      NetworkManagerDeviceState.config,
      NetworkManagerDeviceState.ip_check,
      NetworkManagerDeviceState.ip_config,
      NetworkManagerDeviceState.deactivating,
    ];

    final device = model.device;
    for (final state in NetworkManagerDeviceState.values) {
      when(device.state).thenReturn(state);
      expect(model.isActive, activeStates.contains(state));
      expect(model.isBusy, busyStates.contains(state));
    }

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['State']);
    await expectLater(wasNotified.future, completes);
  });

  test('active connection', () async {
    final device = model.device;
    when(device.activeConnection).thenReturn(null);
    expect(model.activeConnection, isNull);

    final connection = MockNetworkManagerActiveConnection();
    when(device.activeConnection).thenReturn(connection);
    expect(model.activeConnection, equals(connection));

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['ActiveConnection']);
    await expectLater(wasNotified.future, completes);
  });

  test('available connections', () async {
    final device = model.device;
    when(device.availableConnections).thenReturn([]);
    expect(model.availableConnections, isEmpty);

    final connection = MockNetworkManagerSettingsConnection();
    when(device.availableConnections).thenReturn([connection]);
    expect(model.availableConnections, equals([connection]));

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['AvailableConnections']);
    await expectLater(wasNotified.future, completes);
  });

  test('interface', () async {
    final device = model.device;
    when(device.interface).thenReturn('test interface');
    expect(model.interface, equals('test interface'));
  });
}
