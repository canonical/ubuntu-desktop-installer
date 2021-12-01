// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/ethernet_view_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart'
    as _i4;
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_model.dart'
    as _i3;
import 'package:ubuntu_desktop_installer/services.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeNetworkManagerDevice_0 extends _i1.Fake
    implements _i2.NetworkManagerDevice {}

/// A class which mocks [EthernetModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockEthernetModel extends _i1.Mock implements _i3.EthernetModel {
  MockEthernetModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get canConnect =>
      (super.noSuchMethod(Invocation.getter(#canConnect), returnValue: false)
          as bool);
  @override
  bool get canContinue =>
      (super.noSuchMethod(Invocation.getter(#canContinue), returnValue: false)
          as bool);
  @override
  bool get isBusy =>
      (super.noSuchMethod(Invocation.getter(#isBusy), returnValue: false)
          as bool);
  @override
  bool get isActive =>
      (super.noSuchMethod(Invocation.getter(#isActive), returnValue: false)
          as bool);
  @override
  bool get isEnabled =>
      (super.noSuchMethod(Invocation.getter(#isEnabled), returnValue: false)
          as bool);
  @override
  _i4.ConnectMode get connectMode =>
      (super.noSuchMethod(Invocation.getter(#connectMode),
          returnValue: _i4.ConnectMode.none) as _i4.ConnectMode);
  @override
  List<_i3.EthernetDevice> get devices =>
      (super.noSuchMethod(Invocation.getter(#devices),
          returnValue: <_i3.EthernetDevice>[]) as List<_i3.EthernetDevice>);
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
  _i5.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> enable() =>
      (super.noSuchMethod(Invocation.method(#enable, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> connect() =>
      (super.noSuchMethod(Invocation.method(#connect, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void addProperties(_i5.Stream<List<String>>? properties) =>
      super.noSuchMethod(Invocation.method(#addProperties, [properties]),
          returnValueForMissingStub: null);
  @override
  void addPropertyListener(String? property, _i6.VoidCallback? onChanged) =>
      super.noSuchMethod(
          Invocation.method(#addPropertyListener, [property, onChanged]),
          returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  void addListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [EthernetDevice].
///
/// See the documentation for Mockito's code generation for more information.
class MockEthernetDevice extends _i1.Mock implements _i3.EthernetDevice {
  MockEthernetDevice() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isDisabled =>
      (super.noSuchMethod(Invocation.getter(#isDisabled), returnValue: false)
          as bool);
  @override
  bool get isUnmanaged =>
      (super.noSuchMethod(Invocation.getter(#isUnmanaged), returnValue: false)
          as bool);
  @override
  bool get isUnavailable =>
      (super.noSuchMethod(Invocation.getter(#isUnavailable), returnValue: false)
          as bool);
  @override
  _i2.NetworkManagerDevice get device => (super.noSuchMethod(
      Invocation.getter(#device),
      returnValue: _FakeNetworkManagerDevice_0()) as _i2.NetworkManagerDevice);
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
  _i2.NetworkManagerDeviceStateReason get stateReason =>
      (super.noSuchMethod(Invocation.getter(#stateReason),
              returnValue: _i2.NetworkManagerDeviceStateReason.none)
          as _i2.NetworkManagerDeviceStateReason);
  @override
  bool get isActive =>
      (super.noSuchMethod(Invocation.getter(#isActive), returnValue: false)
          as bool);
  @override
  bool get isBusy =>
      (super.noSuchMethod(Invocation.getter(#isBusy), returnValue: false)
          as bool);
  @override
  bool get isAvailable =>
      (super.noSuchMethod(Invocation.getter(#isAvailable), returnValue: false)
          as bool);
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
  _i5.Future<void> disconnect() =>
      (super.noSuchMethod(Invocation.method(#disconnect, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  String describe() =>
      (super.noSuchMethod(Invocation.method(#describe, []), returnValue: '')
          as String);
  @override
  String toString() => super.toString();
  @override
  void addProperties(_i5.Stream<List<String>>? properties) =>
      super.noSuchMethod(Invocation.method(#addProperties, [properties]),
          returnValueForMissingStub: null);
  @override
  void addPropertyListener(String? property, _i6.VoidCallback? onChanged) =>
      super.noSuchMethod(
          Invocation.method(#addPropertyListener, [property, onChanged]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  void addListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
}
