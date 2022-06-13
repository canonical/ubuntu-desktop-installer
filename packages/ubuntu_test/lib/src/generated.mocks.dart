// Mocks generated by Mockito 5.1.0 from annotations
// in ubuntu_test/src/generated.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:dbus/dbus.dart' as _i2;
import 'package:gsettings/src/gsettings.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/src/client.dart' as _i7;
import 'package:subiquity_client/src/endpoint.dart' as _i4;
import 'package:subiquity_client/src/server.dart' as _i8;
import 'package:subiquity_client/src/server/common.dart' as _i9;
import 'package:subiquity_client/src/types.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDBusValue_0 extends _i1.Fake implements _i2.DBusValue {}

class _FakeUri_1 extends _i1.Fake implements Uri {}

class _FakeSourceSelectionAndSetting_2 extends _i1.Fake
    implements _i3.SourceSelectionAndSetting {}

class _FakeKeyboardSetup_3 extends _i1.Fake implements _i3.KeyboardSetup {}

class _FakeIdentityData_4 extends _i1.Fake implements _i3.IdentityData {}

class _FakeTimeZoneInfo_5 extends _i1.Fake implements _i3.TimeZoneInfo {}

class _FakeSSHData_6 extends _i1.Fake implements _i3.SSHData {}

class _FakeApplicationStatus_7 extends _i1.Fake
    implements _i3.ApplicationStatus {}

class _FakeGuidedStorageResponse_8 extends _i1.Fake
    implements _i3.GuidedStorageResponse {}

class _FakeStorageResponseV2_9 extends _i1.Fake
    implements _i3.StorageResponseV2 {}

class _FakeWSLConfigurationBase_10 extends _i1.Fake
    implements _i3.WSLConfigurationBase {}

class _FakeWSLConfigurationAdvanced_11 extends _i1.Fake
    implements _i3.WSLConfigurationAdvanced {}

class _FakeAnyStep_12 extends _i1.Fake implements _i3.AnyStep {}

class _FakeEndpoint_13 extends _i1.Fake implements _i4.Endpoint {}

/// A class which mocks [GSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockGSettings extends _i1.Mock implements _i5.GSettings {
  MockGSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get schemaName =>
      (super.noSuchMethod(Invocation.getter(#schemaName), returnValue: '')
          as String);
  @override
  _i6.Stream<List<String>> get keysChanged => (super.noSuchMethod(
      Invocation.getter(#keysChanged),
      returnValue: Stream<List<String>>.empty()) as _i6.Stream<List<String>>);
  @override
  _i6.Future<List<String>> list() =>
      (super.noSuchMethod(Invocation.method(#list, []),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i6.Future<List<String>>);
  @override
  _i6.Future<_i2.DBusValue> get(String? name) =>
      (super.noSuchMethod(Invocation.method(#get, [name]),
              returnValue: Future<_i2.DBusValue>.value(_FakeDBusValue_0()))
          as _i6.Future<_i2.DBusValue>);
  @override
  _i6.Future<_i2.DBusValue> getDefault(String? name) =>
      (super.noSuchMethod(Invocation.method(#getDefault, [name]),
              returnValue: Future<_i2.DBusValue>.value(_FakeDBusValue_0()))
          as _i6.Future<_i2.DBusValue>);
  @override
  _i6.Future<bool> isSet(String? name) =>
      (super.noSuchMethod(Invocation.method(#isSet, [name]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<void> set(String? name, _i2.DBusValue? value) =>
      (super.noSuchMethod(Invocation.method(#set, [name, value]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> unset(String? name) =>
      (super.noSuchMethod(Invocation.method(#unset, [name]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setAll(Map<String, _i2.DBusValue?>? values) =>
      (super.noSuchMethod(Invocation.method(#setAll, [values]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [SubiquityClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubiquityClient extends _i1.Mock implements _i7.SubiquityClient {
  MockSubiquityClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isOpen => (super.noSuchMethod(Invocation.getter(#isOpen),
      returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  Uri url(String? unencodedPath, [Map<String, dynamic>? queryParameters]) =>
      (super.noSuchMethod(
          Invocation.method(#url, [unencodedPath, queryParameters]),
          returnValue: _FakeUri_1()) as Uri);
  @override
  void open(_i4.Endpoint? endpoint) =>
      super.noSuchMethod(Invocation.method(#open, [endpoint]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i7.Variant> variant() =>
      (super.noSuchMethod(Invocation.method(#variant, []),
              returnValue: Future<_i7.Variant>.value(_i7.Variant.SERVER))
          as _i6.Future<_i7.Variant>);
  @override
  _i6.Future<void> setVariant(_i7.Variant? variant) =>
      (super.noSuchMethod(Invocation.method(#setVariant, [variant]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.SourceSelectionAndSetting> source() =>
      (super.noSuchMethod(Invocation.method(#source, []),
              returnValue: Future<_i3.SourceSelectionAndSetting>.value(
                  _FakeSourceSelectionAndSetting_2()))
          as _i6.Future<_i3.SourceSelectionAndSetting>);
  @override
  _i6.Future<void> setSource(String? sourceId) =>
      (super.noSuchMethod(Invocation.method(#setSource, [sourceId]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> locale() =>
      (super.noSuchMethod(Invocation.method(#locale, []),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<void> setLocale(String? locale) =>
      (super.noSuchMethod(Invocation.method(#setLocale, [locale]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.KeyboardSetup> keyboard() => (super.noSuchMethod(
          Invocation.method(#keyboard, []),
          returnValue: Future<_i3.KeyboardSetup>.value(_FakeKeyboardSetup_3()))
      as _i6.Future<_i3.KeyboardSetup>);
  @override
  _i6.Future<void> setKeyboard(_i3.KeyboardSetting? setting) =>
      (super.noSuchMethod(Invocation.method(#setKeyboard, [setting]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> proxy() =>
      (super.noSuchMethod(Invocation.method(#proxy, []),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<void> setProxy(String? proxy) =>
      (super.noSuchMethod(Invocation.method(#setProxy, [proxy]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> mirror() =>
      (super.noSuchMethod(Invocation.method(#mirror, []),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<void> setMirror(String? mirror) =>
      (super.noSuchMethod(Invocation.method(#setMirror, [mirror]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<bool> freeOnly() =>
      (super.noSuchMethod(Invocation.method(#freeOnly, []),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<void> setFreeOnly(bool? enable) =>
      (super.noSuchMethod(Invocation.method(#setFreeOnly, [enable]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.IdentityData> identity() => (super.noSuchMethod(
          Invocation.method(#identity, []),
          returnValue: Future<_i3.IdentityData>.value(_FakeIdentityData_4()))
      as _i6.Future<_i3.IdentityData>);
  @override
  _i6.Future<void> setIdentity(_i3.IdentityData? identity) =>
      (super.noSuchMethod(Invocation.method(#setIdentity, [identity]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.UsernameValidation> validateUsername(String? username) =>
      (super.noSuchMethod(Invocation.method(#validateUsername, [username]),
              returnValue: Future<_i3.UsernameValidation>.value(
                  _i3.UsernameValidation.OK))
          as _i6.Future<_i3.UsernameValidation>);
  @override
  _i6.Future<_i3.TimeZoneInfo> timezone() => (super.noSuchMethod(
          Invocation.method(#timezone, []),
          returnValue: Future<_i3.TimeZoneInfo>.value(_FakeTimeZoneInfo_5()))
      as _i6.Future<_i3.TimeZoneInfo>);
  @override
  _i6.Future<void> setTimezone(String? timezone) =>
      (super.noSuchMethod(Invocation.method(#setTimezone, [timezone]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.SSHData> ssh() =>
      (super.noSuchMethod(Invocation.method(#ssh, []),
              returnValue: Future<_i3.SSHData>.value(_FakeSSHData_6()))
          as _i6.Future<_i3.SSHData>);
  @override
  _i6.Future<void> setSsh(_i3.SSHData? ssh) =>
      (super.noSuchMethod(Invocation.method(#setSsh, [ssh]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.ApplicationStatus> status({_i3.ApplicationState? current}) =>
      (super.noSuchMethod(Invocation.method(#status, [], {#current: current}),
              returnValue: Future<_i3.ApplicationStatus>.value(
                  _FakeApplicationStatus_7()))
          as _i6.Future<_i3.ApplicationStatus>);
  @override
  _i6.Future<void> markConfigured(List<String>? endpointNames) =>
      (super.noSuchMethod(Invocation.method(#markConfigured, [endpointNames]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> confirm(String? tty) =>
      (super.noSuchMethod(Invocation.method(#confirm, [tty]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<bool> hasRst() =>
      (super.noSuchMethod(Invocation.method(#hasRst, []),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> hasBitLocker() =>
      (super.noSuchMethod(Invocation.method(#hasBitLocker, []),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i3.GuidedStorageResponse> getGuidedStorage({bool? wait = true}) =>
      (super.noSuchMethod(
              Invocation.method(#getGuidedStorage, [], {#wait: wait}),
              returnValue: Future<_i3.GuidedStorageResponse>.value(
                  _FakeGuidedStorageResponse_8()))
          as _i6.Future<_i3.GuidedStorageResponse>);
  @override
  _i6.Future<_i3.StorageResponseV2> setGuidedStorageV2(
          _i3.GuidedChoice? choice) =>
      (super.noSuchMethod(Invocation.method(#setGuidedStorageV2, [choice]),
              returnValue: Future<_i3.StorageResponseV2>.value(
                  _FakeStorageResponseV2_9()))
          as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> getStorageV2() => (super.noSuchMethod(
          Invocation.method(#getStorageV2, []),
          returnValue:
              Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_9()))
      as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> setStorageV2() => (super.noSuchMethod(
          Invocation.method(#setStorageV2, []),
          returnValue:
              Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_9()))
      as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> resetStorageV2() => (super.noSuchMethod(
          Invocation.method(#resetStorageV2, []),
          returnValue:
              Future<_i3.StorageResponseV2>.value(_FakeStorageResponseV2_9()))
      as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> addPartitionV2(
          _i3.Disk? disk, _i3.Gap? gap, _i3.Partition? partition) =>
      (super.noSuchMethod(
              Invocation.method(#addPartitionV2, [disk, gap, partition]),
              returnValue: Future<_i3.StorageResponseV2>.value(
                  _FakeStorageResponseV2_9()))
          as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> editPartitionV2(
          _i3.Disk? disk, _i3.Partition? partition) =>
      (super.noSuchMethod(
              Invocation.method(#editPartitionV2, [disk, partition]),
              returnValue: Future<_i3.StorageResponseV2>.value(
                  _FakeStorageResponseV2_9()))
          as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> deletePartitionV2(
          _i3.Disk? disk, _i3.Partition? partition) =>
      (super.noSuchMethod(
              Invocation.method(#deletePartitionV2, [disk, partition]),
              returnValue: Future<_i3.StorageResponseV2>.value(
                  _FakeStorageResponseV2_9()))
          as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> addBootPartitionV2(_i3.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#addBootPartitionV2, [disk]),
              returnValue: Future<_i3.StorageResponseV2>.value(
                  _FakeStorageResponseV2_9()))
          as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<_i3.StorageResponseV2> reformatDiskV2(_i3.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#reformatDiskV2, [disk]),
              returnValue: Future<_i3.StorageResponseV2>.value(
                  _FakeStorageResponseV2_9()))
          as _i6.Future<_i3.StorageResponseV2>);
  @override
  _i6.Future<void> reboot({bool? immediate = false}) => (super.noSuchMethod(
      Invocation.method(#reboot, [], {#immediate: immediate}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> shutdown({bool? immediate = false}) => (super.noSuchMethod(
      Invocation.method(#shutdown, [], {#immediate: immediate}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.WSLConfigurationBase> wslConfigurationBase() =>
      (super.noSuchMethod(Invocation.method(#wslConfigurationBase, []),
              returnValue: Future<_i3.WSLConfigurationBase>.value(
                  _FakeWSLConfigurationBase_10()))
          as _i6.Future<_i3.WSLConfigurationBase>);
  @override
  _i6.Future<void> setWslConfigurationBase(_i3.WSLConfigurationBase? conf) =>
      (super.noSuchMethod(Invocation.method(#setWslConfigurationBase, [conf]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.WSLConfigurationAdvanced> wslConfigurationAdvanced() =>
      (super.noSuchMethod(Invocation.method(#wslConfigurationAdvanced, []),
              returnValue: Future<_i3.WSLConfigurationAdvanced>.value(
                  _FakeWSLConfigurationAdvanced_11()))
          as _i6.Future<_i3.WSLConfigurationAdvanced>);
  @override
  _i6.Future<void> setWslConfigurationAdvanced(
          _i3.WSLConfigurationAdvanced? conf) =>
      (super.noSuchMethod(
          Invocation.method(#setWslConfigurationAdvanced, [conf]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.AnyStep> getKeyboardStep([String? step = r'0']) =>
      (super.noSuchMethod(Invocation.method(#getKeyboardStep, [step]),
              returnValue: Future<_i3.AnyStep>.value(_FakeAnyStep_12()))
          as _i6.Future<_i3.AnyStep>);
}

/// A class which mocks [SubiquityServer].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubiquityServer extends _i1.Mock implements _i8.SubiquityServer {
  MockSubiquityServer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Endpoint> start(_i9.ServerMode? serverMode,
          {List<String>? args, Map<String, String>? environment}) =>
      (super.noSuchMethod(
              Invocation.method(#start, [serverMode],
                  {#args: args, #environment: environment}),
              returnValue: Future<_i4.Endpoint>.value(_FakeEndpoint_13()))
          as _i6.Future<_i4.Endpoint>);
  @override
  _i6.Future<void> stop() => (super.noSuchMethod(Invocation.method(#stop, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}
