import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/network_device.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'network_device_test.mocks.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
  UdevDeviceInfo,
  UdevService,
])
void main() {
  late NetworkDevice model;
  late MockUdevService udev;
  late MockUdevDeviceInfo info;
  late StreamController<List<String>> propertiesChanged;

  setUpAll(() {
    udev = MockUdevService();
    info = MockUdevDeviceInfo();
    when(udev.bySyspath('test udi')).thenReturn(info);
    when(info.modelName).thenReturn('test model');
    when(info.vendorName).thenReturn('test vendor');
  });

  setUp(() {
    final device = MockNetworkManagerDevice();
    when(device.udi).thenReturn('test udi');

    propertiesChanged = StreamController<List<String>>();
    when(device.propertiesChanged).thenAnswer((_) => propertiesChanged.stream);

    model = NetworkDevice(device, udev);
  });

  tearDown(() {
    model.dispose();
    propertiesChanged.close();
  });

  test('model & vendor', () async {
    when(info.modelName).thenReturn('another model');
    when(info.vendorName).thenReturn('another vendor');

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
    ];

    final device = model.device;
    for (final state in NetworkManagerDeviceState.values) {
      when(device.state).thenReturn(state);
      expect(model.isActive, activeStates.contains(state));
      expect(model.isBusy, busyStates.contains(state));
      expect(model.isAvailable,
          equals(state != NetworkManagerDeviceState.unavailable));
      expect(model.isDisconnected,
          equals(state == NetworkManagerDeviceState.disconnected));
      expect(model.isUnmanaged,
          equals(state == NetworkManagerDeviceState.unmanaged));
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
