// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/updates_other_software_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:ui' as _i4;

import 'package:file/file.dart' as _i6;
import 'package:file/local.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart'
    as _i2;
import 'package:ubuntu_desktop_installer/services/telemetry_service.dart'
    as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [UpdateOtherSoftwareModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateOtherSoftwareModel extends _i1.Mock
    implements _i2.UpdateOtherSoftwareModel {
  MockUpdateOtherSoftwareModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.InstallationMode get installationMode =>
      (super.noSuchMethod(Invocation.getter(#installationMode),
          returnValue: _i2.InstallationMode.normal) as _i2.InstallationMode);
  @override
  bool get installThirdParty =>
      (super.noSuchMethod(Invocation.getter(#installThirdParty),
          returnValue: false) as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void setInstallationMode(_i2.InstallationMode? mode) =>
      super.noSuchMethod(Invocation.method(#setInstallationMode, [mode]),
          returnValueForMissingStub: null);
  @override
  void setInstallThirdParty(bool? installThirdParty) => super.noSuchMethod(
      Invocation.method(#setInstallThirdParty, [installThirdParty]),
      returnValueForMissingStub: null);
  @override
  _i3.Future<void> selectInstallationSource() =>
      (super.noSuchMethod(Invocation.method(#selectInstallationSource, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void addListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
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
  _i3.Future<void> done({_i6.FileSystem? fs = const _i7.LocalFileSystem()}) =>
      (super.noSuchMethod(Invocation.method(#done, [], {#fs: fs}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  String toString() => super.toString();
}
