import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nm/nm.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/network_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'network_model_test.mocks.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
  UdevDeviceInfo,
  UdevService,
])
void main() {
  late NetworkDevice device;
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
    final mock = MockNetworkManagerDevice();
    when(mock.udi).thenReturn('test udi');

    propertiesChanged = StreamController<List<String>>();
    when(mock.propertiesChanged).thenAnswer((_) => propertiesChanged.stream);

    device = NetworkDevice(mock, udev);
  });

  tearDown(() {
    device.dispose();
    propertiesChanged.close();
  });

  test('model & vendor', () async {
    when(info.modelName).thenReturn('another model');
    when(info.vendorName).thenReturn('another vendor');

    // model & vendor are cached
    expect(device.model, equals('test model'));
    expect(device.vendor, equals('test vendor'));

    final wasNotified = Completer<bool>();
    device.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['Udi']);
    await expectLater(wasNotified.future, completes);

    expect(device.model, equals('another model'));
    expect(device.vendor, equals('another vendor'));
  });

  test('state', () async {
    const connectingStates = {
      NetworkManagerDeviceState.prepare,
      NetworkManagerDeviceState.config,
      NetworkManagerDeviceState.ip_check,
      NetworkManagerDeviceState.ip_config,
    };

    final mock = device.device;
    for (final state in NetworkManagerDeviceState.values) {
      when(mock.state).thenReturn(state);
      expect(device.isActive, state == NetworkManagerDeviceState.activated);
      expect(device.isConnecting, connectingStates.contains(state));
      expect(device.isAvailable,
          equals(state != NetworkManagerDeviceState.unavailable));
      expect(device.isDisconnected,
          equals(state == NetworkManagerDeviceState.disconnected));
      expect(device.isUnmanaged,
          equals(state == NetworkManagerDeviceState.unmanaged));
    }

    final wasNotified = Completer<bool>();
    device.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['State']);
    await expectLater(wasNotified.future, completes);
  });

  test('active connection', () async {
    final mock = device.device;
    when(mock.activeConnection).thenReturn(null);
    expect(device.activeConnection, isNull);

    final connection = MockNetworkManagerActiveConnection();
    when(mock.activeConnection).thenReturn(connection);
    expect(device.activeConnection, equals(connection));

    final wasNotified = Completer<bool>();
    device.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['ActiveConnection']);
    await expectLater(wasNotified.future, completes);
  });

  test('available connections', () async {
    final mock = device.device;
    when(mock.availableConnections).thenReturn([]);
    expect(device.availableConnections, isEmpty);

    final connection = MockNetworkManagerSettingsConnection();
    when(mock.availableConnections).thenReturn([connection]);
    expect(device.availableConnections, equals([connection]));

    final wasNotified = Completer<bool>();
    device.addListener(() => wasNotified.complete(true));
    propertiesChanged.add(['AvailableConnections']);
    await expectLater(wasNotified.future, completes);
  });

  test('interface', () async {
    final mock = device.device;
    when(mock.interface).thenReturn('test interface');
    expect(device.interface, equals('test interface'));
  });
}
