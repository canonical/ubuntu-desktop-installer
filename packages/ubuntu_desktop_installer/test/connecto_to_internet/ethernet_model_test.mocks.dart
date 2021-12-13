// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/connecto_to_internet/ethernet_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:dbus/dbus.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nm/nm.dart' as _i2;
import 'package:ubuntu_desktop_installer/services/network_service.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeNetworkManagerDeviceStateAndReason_0 extends _i1.Fake
    implements _i2.NetworkManagerDeviceStateAndReason {}

class _FakeNetworkManagerSettings_1 extends _i1.Fake
    implements _i2.NetworkManagerSettings {}

class _FakeNetworkManagerDnsManager_2 extends _i1.Fake
    implements _i2.NetworkManagerDnsManager {}

class _FakeNetworkManagerActiveConnection_3 extends _i1.Fake
    implements _i2.NetworkManagerActiveConnection {}

/// A class which mocks [NetworkManagerActiveConnection].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkManagerActiveConnection extends _i1.Mock
    implements _i2.NetworkManagerActiveConnection {
  MockNetworkManagerActiveConnection() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
      Invocation.getter(#propertiesChanged),
      returnValue: Stream<List<String>>.empty()) as _i3.Stream<List<String>>);
  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  String get uuid =>
      (super.noSuchMethod(Invocation.getter(#uuid), returnValue: '') as String);
  @override
  String get type =>
      (super.noSuchMethod(Invocation.getter(#type), returnValue: '') as String);
  @override
  _i2.NetworkManagerActiveConnectionState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _i2.NetworkManagerActiveConnectionState.unknown)
          as _i2.NetworkManagerActiveConnectionState);
  @override
  List<_i2.NetworkManagerActivationStateFlag> get stateFlags =>
      (super.noSuchMethod(Invocation.getter(#stateFlags),
              returnValue: <_i2.NetworkManagerActivationStateFlag>[])
          as List<_i2.NetworkManagerActivationStateFlag>);
  @override
  bool get default4 =>
      (super.noSuchMethod(Invocation.getter(#default4), returnValue: false)
          as bool);
  @override
  bool get default6 =>
      (super.noSuchMethod(Invocation.getter(#default6), returnValue: false)
          as bool);
  @override
  bool get vpn =>
      (super.noSuchMethod(Invocation.getter(#vpn), returnValue: false) as bool);
  @override
  List<_i2.NetworkManagerDevice> get devices =>
      (super.noSuchMethod(Invocation.getter(#devices),
              returnValue: <_i2.NetworkManagerDevice>[])
          as List<_i2.NetworkManagerDevice>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkManagerDevice].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkManagerDevice extends _i1.Mock
    implements _i2.NetworkManagerDevice {
  MockNetworkManagerDevice() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
      Invocation.getter(#propertiesChanged),
      returnValue: Stream<List<String>>.empty()) as _i3.Stream<List<String>>);
  @override
  String get udi =>
      (super.noSuchMethod(Invocation.getter(#udi), returnValue: '') as String);
  @override
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);
  @override
  String get interface =>
      (super.noSuchMethod(Invocation.getter(#interface), returnValue: '')
          as String);
  @override
  String get ipInterface =>
      (super.noSuchMethod(Invocation.getter(#ipInterface), returnValue: '')
          as String);
  @override
  String get driver =>
      (super.noSuchMethod(Invocation.getter(#driver), returnValue: '')
          as String);
  @override
  String get driverVersion =>
      (super.noSuchMethod(Invocation.getter(#driverVersion), returnValue: '')
          as String);
  @override
  String get firmwareVersion =>
      (super.noSuchMethod(Invocation.getter(#firmwareVersion), returnValue: '')
          as String);
  @override
  List<_i2.NetworkManagerDeviceCapability> get capabilities =>
      (super.noSuchMethod(Invocation.getter(#capabilities),
              returnValue: <_i2.NetworkManagerDeviceCapability>[])
          as List<_i2.NetworkManagerDeviceCapability>);
  @override
  _i2.NetworkManagerDeviceState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _i2.NetworkManagerDeviceState.unknown)
          as _i2.NetworkManagerDeviceState);
  @override
  _i2.NetworkManagerDeviceStateAndReason get stateReason =>
      (super.noSuchMethod(Invocation.getter(#stateReason),
              returnValue: _FakeNetworkManagerDeviceStateAndReason_0())
          as _i2.NetworkManagerDeviceStateAndReason);
  @override
  bool get managed =>
      (super.noSuchMethod(Invocation.getter(#managed), returnValue: false)
          as bool);
  @override
  bool get autoconnect =>
      (super.noSuchMethod(Invocation.getter(#autoconnect), returnValue: false)
          as bool);
  @override
  bool get firmwareMissing => (super
          .noSuchMethod(Invocation.getter(#firmwareMissing), returnValue: false)
      as bool);
  @override
  bool get nmPluginMissing => (super
          .noSuchMethod(Invocation.getter(#nmPluginMissing), returnValue: false)
      as bool);
  @override
  _i2.NetworkManagerDeviceType get deviceType =>
      (super.noSuchMethod(Invocation.getter(#deviceType),
              returnValue: _i2.NetworkManagerDeviceType.unknown)
          as _i2.NetworkManagerDeviceType);
  @override
  List<_i2.NetworkManagerSettingsConnection> get availableConnections =>
      (super.noSuchMethod(Invocation.getter(#availableConnections),
              returnValue: <_i2.NetworkManagerSettingsConnection>[])
          as List<_i2.NetworkManagerSettingsConnection>);
  @override
  String get physicalPortId =>
      (super.noSuchMethod(Invocation.getter(#physicalPortId), returnValue: '')
          as String);
  @override
  int get mtu =>
      (super.noSuchMethod(Invocation.getter(#mtu), returnValue: 0) as int);
  @override
  _i2.NetworkManagerMetered get metered =>
      (super.noSuchMethod(Invocation.getter(#metered),
              returnValue: _i2.NetworkManagerMetered.unknown)
          as _i2.NetworkManagerMetered);
  @override
  bool get real =>
      (super.noSuchMethod(Invocation.getter(#real), returnValue: false)
          as bool);
  @override
  _i2.NetworkManagerConnectivityState get ip4Connectivity =>
      (super.noSuchMethod(Invocation.getter(#ip4Connectivity),
              returnValue: _i2.NetworkManagerConnectivityState.unknown)
          as _i2.NetworkManagerConnectivityState);
  @override
  _i2.NetworkManagerConnectivityState get ip6Connectivity =>
      (super.noSuchMethod(Invocation.getter(#ip6Connectivity),
              returnValue: _i2.NetworkManagerConnectivityState.unknown)
          as _i2.NetworkManagerConnectivityState);
  @override
  List<_i2.NetworkManagerDeviceInterfaceFlag> get interfaceFlags =>
      (super.noSuchMethod(Invocation.getter(#interfaceFlags),
              returnValue: <_i2.NetworkManagerDeviceInterfaceFlag>[])
          as List<_i2.NetworkManagerDeviceInterfaceFlag>);
  @override
  String get hwAddress =>
      (super.noSuchMethod(Invocation.getter(#hwAddress), returnValue: '')
          as String);
  @override
  _i3.Future<void> disconnect() =>
      (super.noSuchMethod(Invocation.method(#disconnect, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> setManaged(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setManaged, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> setAutoconnect(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setAutoconnect, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkManagerSettingsConnection].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkManagerSettingsConnection extends _i1.Mock
    implements _i2.NetworkManagerSettingsConnection {
  MockNetworkManagerSettingsConnection() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
      Invocation.getter(#propertiesChanged),
      returnValue: Stream<List<String>>.empty()) as _i3.Stream<List<String>>);
  @override
  bool get unsaved =>
      (super.noSuchMethod(Invocation.getter(#unsaved), returnValue: false)
          as bool);
  @override
  List<_i2.NetworkManagerConnectionFlag> get flags =>
      (super.noSuchMethod(Invocation.getter(#flags),
              returnValue: <_i2.NetworkManagerConnectionFlag>[])
          as List<_i2.NetworkManagerConnectionFlag>);
  @override
  String get filename =>
      (super.noSuchMethod(Invocation.getter(#filename), returnValue: '')
          as String);
  @override
  _i3.Future<void> update(
          Map<String, Map<String, _i4.DBusValue>>? properties) =>
      (super.noSuchMethod(Invocation.method(#update, [properties]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> updateUnsaved(
          Map<String, Map<String, _i4.DBusValue>>? properties) =>
      (super.noSuchMethod(Invocation.method(#updateUnsaved, [properties]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<Map<String, Map<String, _i4.DBusValue>>> getSettings() =>
      (super.noSuchMethod(Invocation.method(#getSettings, []),
          returnValue: Future<Map<String, Map<String, _i4.DBusValue>>>.value(
              <String, Map<String, _i4.DBusValue>>{})) as _i3
          .Future<Map<String, Map<String, _i4.DBusValue>>>);
  @override
  _i3.Future<Map<String, Map<String, _i4.DBusValue>>> getSecrets(
          [String? settingName = r'']) =>
      (super.noSuchMethod(Invocation.method(#getSecrets, [settingName]),
          returnValue: Future<Map<String, Map<String, _i4.DBusValue>>>.value(
              <String, Map<String, _i4.DBusValue>>{})) as _i3
          .Future<Map<String, Map<String, _i4.DBusValue>>>);
  @override
  _i3.Future<void> clearSecrets() =>
      (super.noSuchMethod(Invocation.method(#clearSecrets, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> save() => (super.noSuchMethod(Invocation.method(#save, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkService extends _i1.Mock implements _i5.NetworkService {
  MockNetworkService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  List<_i2.NetworkManagerDevice> get wiredDevices =>
      (super.noSuchMethod(Invocation.getter(#wiredDevices),
              returnValue: <_i2.NetworkManagerDevice>[])
          as List<_i2.NetworkManagerDevice>);
  @override
  List<_i2.NetworkManagerDevice> get wirelessDevices =>
      (super.noSuchMethod(Invocation.getter(#wirelessDevices),
              returnValue: <_i2.NetworkManagerDevice>[])
          as List<_i2.NetworkManagerDevice>);
  @override
  _i3.Stream<_i2.NetworkManagerDevice> get deviceAdded =>
      (super.noSuchMethod(Invocation.getter(#deviceAdded),
              returnValue: Stream<_i2.NetworkManagerDevice>.empty())
          as _i3.Stream<_i2.NetworkManagerDevice>);
  @override
  _i3.Stream<_i2.NetworkManagerDevice> get deviceRemoved =>
      (super.noSuchMethod(Invocation.getter(#deviceRemoved),
              returnValue: Stream<_i2.NetworkManagerDevice>.empty())
          as _i3.Stream<_i2.NetworkManagerDevice>);
  @override
  _i3.Stream<_i2.NetworkManagerActiveConnection> get activeConnectionAdded =>
      (super.noSuchMethod(Invocation.getter(#activeConnectionAdded),
              returnValue: Stream<_i2.NetworkManagerActiveConnection>.empty())
          as _i3.Stream<_i2.NetworkManagerActiveConnection>);
  @override
  _i3.Stream<_i2.NetworkManagerActiveConnection> get activeConnectionRemoved =>
      (super.noSuchMethod(Invocation.getter(#activeConnectionRemoved),
              returnValue: Stream<_i2.NetworkManagerActiveConnection>.empty())
          as _i3.Stream<_i2.NetworkManagerActiveConnection>);
  @override
  _i3.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
      Invocation.getter(#propertiesChanged),
      returnValue: Stream<List<String>>.empty()) as _i3.Stream<List<String>>);
  @override
  List<_i2.NetworkManagerDevice> get devices =>
      (super.noSuchMethod(Invocation.getter(#devices),
              returnValue: <_i2.NetworkManagerDevice>[])
          as List<_i2.NetworkManagerDevice>);
  @override
  List<_i2.NetworkManagerDevice> get allDevices =>
      (super.noSuchMethod(Invocation.getter(#allDevices),
              returnValue: <_i2.NetworkManagerDevice>[])
          as List<_i2.NetworkManagerDevice>);
  @override
  bool get networkingEnabled =>
      (super.noSuchMethod(Invocation.getter(#networkingEnabled),
          returnValue: false) as bool);
  @override
  bool get wirelessEnabled => (super
          .noSuchMethod(Invocation.getter(#wirelessEnabled), returnValue: false)
      as bool);
  @override
  bool get wirelessHardwareEnabled =>
      (super.noSuchMethod(Invocation.getter(#wirelessHardwareEnabled),
          returnValue: false) as bool);
  @override
  bool get wwanEnabled =>
      (super.noSuchMethod(Invocation.getter(#wwanEnabled), returnValue: false)
          as bool);
  @override
  bool get wwanHardwareEnabled =>
      (super.noSuchMethod(Invocation.getter(#wwanHardwareEnabled),
          returnValue: false) as bool);
  @override
  List<_i2.NetworkManagerActiveConnection> get activeConnections =>
      (super.noSuchMethod(Invocation.getter(#activeConnections),
              returnValue: <_i2.NetworkManagerActiveConnection>[])
          as List<_i2.NetworkManagerActiveConnection>);
  @override
  String get primaryConnectionType =>
      (super.noSuchMethod(Invocation.getter(#primaryConnectionType),
          returnValue: '') as String);
  @override
  _i2.NetworkManagerMetered get metered =>
      (super.noSuchMethod(Invocation.getter(#metered),
              returnValue: _i2.NetworkManagerMetered.unknown)
          as _i2.NetworkManagerMetered);
  @override
  bool get startup =>
      (super.noSuchMethod(Invocation.getter(#startup), returnValue: false)
          as bool);
  @override
  String get version =>
      (super.noSuchMethod(Invocation.getter(#version), returnValue: '')
          as String);
  @override
  _i2.NetworkManagerConnectivityState get connectivity =>
      (super.noSuchMethod(Invocation.getter(#connectivity),
              returnValue: _i2.NetworkManagerConnectivityState.unknown)
          as _i2.NetworkManagerConnectivityState);
  @override
  bool get connectivityCheckAvailable =>
      (super.noSuchMethod(Invocation.getter(#connectivityCheckAvailable),
          returnValue: false) as bool);
  @override
  bool get connectivityCheckEnabled =>
      (super.noSuchMethod(Invocation.getter(#connectivityCheckEnabled),
          returnValue: false) as bool);
  @override
  String get connectivityCheckUri =>
      (super.noSuchMethod(Invocation.getter(#connectivityCheckUri),
          returnValue: '') as String);
  @override
  _i2.NetworkManagerSettings get settings =>
      (super.noSuchMethod(Invocation.getter(#settings),
              returnValue: _FakeNetworkManagerSettings_1())
          as _i2.NetworkManagerSettings);
  @override
  _i2.NetworkManagerDnsManager get dnsManager =>
      (super.noSuchMethod(Invocation.getter(#dnsManager),
              returnValue: _FakeNetworkManagerDnsManager_2())
          as _i2.NetworkManagerDnsManager);
  @override
  _i3.Future<void> connect() =>
      (super.noSuchMethod(Invocation.method(#connect, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> setWirelessEnabled(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setWirelessEnabled, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> setWwanEnabled(bool? value) =>
      (super.noSuchMethod(Invocation.method(#setWwanEnabled, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> setConnectivityCheckEnabled(bool? value) => (super
      .noSuchMethod(Invocation.method(#setConnectivityCheckEnabled, [value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<_i2.NetworkManagerActiveConnection> addAndActivateConnection(
          {Map<String, Map<String, _i4.DBusValue>>? connection = const {},
          _i2.NetworkManagerDevice? device,
          _i2.NetworkManagerAccessPoint? accessPoint}) =>
      (super.noSuchMethod(
              Invocation.method(#addAndActivateConnection, [], {
                #connection: connection,
                #device: device,
                #accessPoint: accessPoint
              }),
              returnValue: Future<_i2.NetworkManagerActiveConnection>.value(
                  _FakeNetworkManagerActiveConnection_3()))
          as _i3.Future<_i2.NetworkManagerActiveConnection>);
  @override
  _i3.Future<_i2.NetworkManagerActiveConnection> activateConnection(
          {_i2.NetworkManagerDevice? device,
          _i2.NetworkManagerSettingsConnection? connection,
          _i2.NetworkManagerAccessPoint? accessPoint}) =>
      (super.noSuchMethod(
              Invocation.method(#activateConnection, [], {
                #device: device,
                #connection: connection,
                #accessPoint: accessPoint
              }),
              returnValue: Future<_i2.NetworkManagerActiveConnection>.value(
                  _FakeNetworkManagerActiveConnection_3()))
          as _i3.Future<_i2.NetworkManagerActiveConnection>);
  @override
  _i3.Future<void> deactivateConnection(
          _i2.NetworkManagerActiveConnection? connection) =>
      (super.noSuchMethod(
          Invocation.method(#deactivateConnection, [connection]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}
