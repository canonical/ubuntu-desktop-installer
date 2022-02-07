// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/connect_to_internet/wifi_view_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart'
    as _i6;
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart'
    as _i3;
import 'package:ubuntu_desktop_installer/services.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeNetworkManagerAccessPoint_0 extends _i1.Fake
    implements _i2.NetworkManagerAccessPoint {}

class _FakeNetworkService_1 extends _i1.Fake implements _i2.NetworkService {}

class _FakeWifiDevice_2 extends _i1.Fake implements _i3.WifiDevice {}

class _FakeNetworkManagerDevice_3 extends _i1.Fake
    implements _i2.NetworkManagerDevice {}

/// A class which mocks [AccessPoint].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccessPoint extends _i1.Mock implements _i3.AccessPoint {
  MockAccessPoint() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NetworkManagerAccessPoint get accessPoint =>
      (super.noSuchMethod(Invocation.getter(#accessPoint),
              returnValue: _FakeNetworkManagerAccessPoint_0())
          as _i2.NetworkManagerAccessPoint);
  @override
  List<int> get ssid =>
      (super.noSuchMethod(Invocation.getter(#ssid), returnValue: <int>[])
          as List<int>);
  @override
  String get hwAddress =>
      (super.noSuchMethod(Invocation.getter(#hwAddress), returnValue: '')
          as String);
  @override
  String get name =>
      (super.noSuchMethod(Invocation.getter(#name), returnValue: '') as String);
  @override
  int get strength =>
      (super.noSuchMethod(Invocation.getter(#strength), returnValue: 0) as int);
  @override
  bool get isOpen =>
      (super.noSuchMethod(Invocation.getter(#isOpen), returnValue: false)
          as bool);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void init() => super.noSuchMethod(Invocation.method(#init, []),
      returnValueForMissingStub: null);
  @override
  void cleanup() => super.noSuchMethod(Invocation.method(#cleanup, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
  @override
  void setProperties(_i4.Stream<List<String>>? properties) =>
      super.noSuchMethod(Invocation.method(#setProperties, [properties]),
          returnValueForMissingStub: null);
  @override
  void addPropertyListener(String? property, _i5.VoidCallback? onChanged) =>
      super.noSuchMethod(
          Invocation.method(#addPropertyListener, [property, onChanged]),
          returnValueForMissingStub: null);
  @override
  void enablePropertyListeners() =>
      super.noSuchMethod(Invocation.method(#enablePropertyListeners, []),
          returnValueForMissingStub: null);
  @override
  void disablePropertyListeners() =>
      super.noSuchMethod(Invocation.method(#disablePropertyListeners, []),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  void addListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
}

/// A class which mocks [WifiModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockWifiModel extends _i1.Mock implements _i3.WifiModel {
  MockWifiModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get canConnect =>
      (super.noSuchMethod(Invocation.getter(#canConnect), returnValue: false)
          as bool);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  bool get hasActiveConnection =>
      (super.noSuchMethod(Invocation.getter(#hasActiveConnection),
          returnValue: false) as bool);
  @override
  bool get isConnecting =>
      (super.noSuchMethod(Invocation.getter(#isConnecting), returnValue: false)
          as bool);
  @override
  bool get isEnabled =>
      (super.noSuchMethod(Invocation.getter(#isEnabled), returnValue: false)
          as bool);
  @override
  _i6.ConnectMode get connectMode =>
      (super.noSuchMethod(Invocation.getter(#connectMode),
          returnValue: _i6.ConnectMode.none) as _i6.ConnectMode);
  @override
  _i2.NetworkService get service =>
      (super.noSuchMethod(Invocation.getter(#service),
          returnValue: _FakeNetworkService_1()) as _i2.NetworkService);
  @override
  List<_i3.WifiDevice> get devices =>
      (super.noSuchMethod(Invocation.getter(#devices),
          returnValue: <_i3.WifiDevice>[]) as List<_i3.WifiDevice>);
  @override
  _i4.Stream<dynamic> get onAvailabilityChanged =>
      (super.noSuchMethod(Invocation.getter(#onAvailabilityChanged),
          returnValue: Stream<dynamic>.empty()) as _i4.Stream<dynamic>);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void onSelected() => super.noSuchMethod(Invocation.method(#onSelected, []),
      returnValueForMissingStub: null);
  @override
  void onDeselected() =>
      super.noSuchMethod(Invocation.method(#onDeselected, []),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> cleanup() =>
      (super.noSuchMethod(Invocation.method(#cleanup, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  _i4.Future<void> enable() =>
      (super.noSuchMethod(Invocation.method(#enable, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> connect() =>
      (super.noSuchMethod(Invocation.method(#connect, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  List<_i2.NetworkManagerDevice> getDevices() =>
      (super.noSuchMethod(Invocation.method(#getDevices, []),
              returnValue: <_i2.NetworkManagerDevice>[])
          as List<_i2.NetworkManagerDevice>);
  @override
  _i3.WifiDevice createDevice(_i2.NetworkManagerDevice? device) =>
      (super.noSuchMethod(Invocation.method(#createDevice, [device]),
          returnValue: _FakeWifiDevice_2()) as _i3.WifiDevice);
  @override
  void startPeriodicScanning() =>
      super.noSuchMethod(Invocation.method(#startPeriodicScanning, []),
          returnValueForMissingStub: null);
  @override
  void stopPeriodicScanning() =>
      super.noSuchMethod(Invocation.method(#stopPeriodicScanning, []),
          returnValueForMissingStub: null);
  @override
  _i4.Future<dynamic> requestScan({String? ssid}) =>
      (super.noSuchMethod(Invocation.method(#requestScan, [], {#ssid: ssid}),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  void updateDevices() =>
      super.noSuchMethod(Invocation.method(#updateDevices, []),
          returnValueForMissingStub: null);
  @override
  bool isSelectedDevice(_i3.WifiDevice? device) =>
      (super.noSuchMethod(Invocation.method(#isSelectedDevice, [device]),
          returnValue: false) as bool);
  @override
  void selectDevice(_i3.WifiDevice? device) =>
      super.noSuchMethod(Invocation.method(#selectDevice, [device]),
          returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  void setProperties(_i4.Stream<List<String>>? properties) =>
      super.noSuchMethod(Invocation.method(#setProperties, [properties]),
          returnValueForMissingStub: null);
  @override
  void addPropertyListener(String? property, _i5.VoidCallback? onChanged) =>
      super.noSuchMethod(
          Invocation.method(#addPropertyListener, [property, onChanged]),
          returnValueForMissingStub: null);
  @override
  void enablePropertyListeners() =>
      super.noSuchMethod(Invocation.method(#enablePropertyListeners, []),
          returnValueForMissingStub: null);
  @override
  void disablePropertyListeners() =>
      super.noSuchMethod(Invocation.method(#disablePropertyListeners, []),
          returnValueForMissingStub: null);
  @override
  void addListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [WifiDevice].
///
/// See the documentation for Mockito's code generation for more information.
class MockWifiDevice extends _i1.Mock implements _i3.WifiDevice {
  MockWifiDevice() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isActive =>
      (super.noSuchMethod(Invocation.getter(#isActive), returnValue: false)
          as bool);
  @override
  List<_i3.AccessPoint> get accessPoints =>
      (super.noSuchMethod(Invocation.getter(#accessPoints),
          returnValue: <_i3.AccessPoint>[]) as List<_i3.AccessPoint>);
  @override
  bool get scanning =>
      (super.noSuchMethod(Invocation.getter(#scanning), returnValue: false)
          as bool);
  @override
  int get lastScan =>
      (super.noSuchMethod(Invocation.getter(#lastScan), returnValue: 0) as int);
  @override
  _i2.NetworkManagerDevice get device => (super.noSuchMethod(
      Invocation.getter(#device),
      returnValue: _FakeNetworkManagerDevice_3()) as _i2.NetworkManagerDevice);
  @override
  String get interface =>
      (super.noSuchMethod(Invocation.getter(#interface), returnValue: '')
          as String);
  @override
  _i2.NetworkManagerDeviceState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _i2.NetworkManagerDeviceState.unknown)
          as _i2.NetworkManagerDeviceState);
  @override
  bool get isConnecting =>
      (super.noSuchMethod(Invocation.getter(#isConnecting), returnValue: false)
          as bool);
  @override
  bool get isAvailable =>
      (super.noSuchMethod(Invocation.getter(#isAvailable), returnValue: false)
          as bool);
  @override
  bool get isDisconnected => (super
          .noSuchMethod(Invocation.getter(#isDisconnected), returnValue: false)
      as bool);
  @override
  bool get isUnmanaged =>
      (super.noSuchMethod(Invocation.getter(#isUnmanaged), returnValue: false)
          as bool);
  @override
  String get hwAddress =>
      (super.noSuchMethod(Invocation.getter(#hwAddress), returnValue: '')
          as String);
  @override
  List<_i2.NetworkManagerSettingsConnection> get availableConnections =>
      (super.noSuchMethod(Invocation.getter(#availableConnections),
              returnValue: <_i2.NetworkManagerSettingsConnection>[])
          as List<_i2.NetworkManagerSettingsConnection>);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void init() => super.noSuchMethod(Invocation.method(#init, []),
      returnValueForMissingStub: null);
  @override
  void cleanup() => super.noSuchMethod(Invocation.method(#cleanup, []),
      returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void updateDevice(_i2.NetworkManagerDevice? device) =>
      super.noSuchMethod(Invocation.method(#updateDevice, [device]),
          returnValueForMissingStub: null);
  @override
  bool isActiveAccessPoint(_i3.AccessPoint? accessPoint) => (super.noSuchMethod(
      Invocation.method(#isActiveAccessPoint, [accessPoint]),
      returnValue: false) as bool);
  @override
  bool isSelectedAccessPoint(_i3.AccessPoint? accessPoint) => (super
      .noSuchMethod(Invocation.method(#isSelectedAccessPoint, [accessPoint]),
          returnValue: false) as bool);
  @override
  void selectAccessPoint(_i3.AccessPoint? accessPoint) =>
      super.noSuchMethod(Invocation.method(#selectAccessPoint, [accessPoint]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> requestScan({String? ssid}) =>
      (super.noSuchMethod(Invocation.method(#requestScan, [], {#ssid: ssid}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i3.AccessPoint? findAccessPoint(String? ssid) =>
      (super.noSuchMethod(Invocation.method(#findAccessPoint, [ssid]))
          as _i3.AccessPoint?);
  @override
  _i4.Future<void> disconnect() =>
      (super.noSuchMethod(Invocation.method(#disconnect, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
  @override
  void setProperties(_i4.Stream<List<String>>? properties) =>
      super.noSuchMethod(Invocation.method(#setProperties, [properties]),
          returnValueForMissingStub: null);
  @override
  void addPropertyListener(String? property, _i5.VoidCallback? onChanged) =>
      super.noSuchMethod(
          Invocation.method(#addPropertyListener, [property, onChanged]),
          returnValueForMissingStub: null);
  @override
  void enablePropertyListeners() =>
      super.noSuchMethod(Invocation.method(#enablePropertyListeners, []),
          returnValueForMissingStub: null);
  @override
  void disablePropertyListeners() =>
      super.noSuchMethod(Invocation.method(#disablePropertyListeners, []),
          returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  void addListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
}
