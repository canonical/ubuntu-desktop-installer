import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_device.dart';
import 'package:ubuntu_provision/services.dart';

import 'network_device_test.mocks.dart';
import 'test_network.dart';

@GenerateMocks([
  NetworkManagerActiveConnection,
  NetworkManagerDevice,
  NetworkManagerSettingsConnection,
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

    propertiesChanged = StreamController<List<String>>.broadcast(sync: true);
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

    bool? wasNotified;
    device.addListener(() => wasNotified = true);
    propertiesChanged.add(['Udi']);
    expect(wasNotified, isTrue);

    expect(device.model, equals('another model'));
    expect(device.vendor, equals('another vendor'));
  });

  test('state', () async {
    const connectingStates = {
      NetworkManagerDeviceState.needAuth,
      NetworkManagerDeviceState.prepare,
      NetworkManagerDeviceState.config,
      NetworkManagerDeviceState.ipCheck,
      NetworkManagerDeviceState.ipConfig,
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

    bool? wasNotified;
    device.addListener(() => wasNotified = true);
    propertiesChanged.add(['State']);
    expect(wasNotified, isTrue);
  });

  test('active connection', () async {
    final mock = device.device;
    when(mock.activeConnection).thenReturn(null);
    expect(device.activeConnection, isNull);

    final connection = MockNetworkManagerActiveConnection();
    when(mock.activeConnection).thenReturn(connection);
    expect(device.activeConnection, equals(connection));

    bool? wasNotified;
    device.addListener(() => wasNotified = true);
    propertiesChanged.add(['ActiveConnection']);
    expect(wasNotified, isTrue);
  });

  test('available connections', () async {
    final mock = device.device;
    when(mock.availableConnections).thenReturn([]);
    expect(device.availableConnections, isEmpty);

    final connection = MockNetworkManagerSettingsConnection();
    when(mock.availableConnections).thenReturn([connection]);
    expect(device.availableConnections, equals([connection]));

    bool? wasNotified;
    device.addListener(() => wasNotified = true);
    propertiesChanged.add(['AvailableConnections']);
    expect(wasNotified, isTrue);
  });

  test('interface', () async {
    final mock = device.device;
    when(mock.interface).thenReturn('test interface');
    expect(device.interface, equals('test interface'));
  });
}
