// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/installation_complete_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:file/file.dart' as _i6;
import 'package:file/local.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i2;
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart'
    as _i3;
import 'package:ubuntu_desktop_installer/services/telemetry_service.dart'
    as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeSubiquityClient_0 extends _i1.Fake implements _i2.SubiquityClient {}

/// A class which mocks [InstallationCompleteModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockInstallationCompleteModel extends _i1.Mock
    implements _i3.InstallationCompleteModel {
  MockInstallationCompleteModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SubiquityClient get client =>
      (super.noSuchMethod(Invocation.getter(#client),
          returnValue: _FakeSubiquityClient_0()) as _i2.SubiquityClient);
  @override
  String toString() => super.toString();
  @override
  _i4.Future<void> reboot({bool? immediate}) => (super.noSuchMethod(
      Invocation.method(#reboot, [], {#immediate: immediate}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> shutdown({bool? immediate}) => (super.noSuchMethod(
      Invocation.method(#shutdown, [], {#immediate: immediate}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}

/// A class which mocks [TelemetryService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTelemetryService extends _i1.Mock implements _i5.TelemetryService {
  MockTelemetryService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addStage(String? name) =>
      super.noSuchMethod(Invocation.method(#addStage, [name]),
          returnValueForMissingStub: null);
  @override
  void setLanguage(String? language) =>
      super.noSuchMethod(Invocation.method(#setLanguage, [language]),
          returnValueForMissingStub: null);
  @override
  void setMinimal({bool? enabled}) => super.noSuchMethod(
      Invocation.method(#setMinimal, [], {#enabled: enabled}),
      returnValueForMissingStub: null);
  @override
  void setRestrictedAddons({bool? enabled}) => super.noSuchMethod(
      Invocation.method(#setRestrictedAddons, [], {#enabled: enabled}),
      returnValueForMissingStub: null);
  @override
  void setPartitionMethod(String? method) =>
      super.noSuchMethod(Invocation.method(#setPartitionMethod, [method]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<void> done({_i6.FileSystem? fs = const _i7.LocalFileSystem()}) =>
      (super.noSuchMethod(Invocation.method(#done, [], {#fs: fs}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
}
