// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/installation_type_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:file/file.dart' as _i6;
import 'package:file/local.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i3;
import 'package:ubuntu_desktop_installer/services/disk_storage_service.dart'
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

/// A class which mocks [DiskStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDiskStorageService extends _i1.Mock
    implements _i2.DiskStorageService {
  MockDiskStorageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set storage(List<_i3.Disk>? _storage) =>
      super.noSuchMethod(Invocation.setter(#storage, _storage),
          returnValueForMissingStub: null);
  @override
  set guidedStorage(List<_i3.Disk>? _guidedStorage) =>
      super.noSuchMethod(Invocation.setter(#guidedStorage, _guidedStorage),
          returnValueForMissingStub: null);
  @override
  bool get hasMultipleDisks =>
      (super.noSuchMethod(Invocation.getter(#hasMultipleDisks),
          returnValue: false) as bool);
  @override
  bool get needRoot =>
      (super.noSuchMethod(Invocation.getter(#needRoot), returnValue: false)
          as bool);
  @override
  bool get needBoot =>
      (super.noSuchMethod(Invocation.getter(#needBoot), returnValue: false)
          as bool);
  @override
  bool get hasEncryption =>
      (super.noSuchMethod(Invocation.getter(#hasEncryption), returnValue: false)
          as bool);
  @override
  _i4.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i3.Disk>> getGuidedStorage() =>
      (super.noSuchMethod(Invocation.method(#getGuidedStorage, []),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<void> setGuidedStorage([_i3.Disk? disk]) =>
      (super.noSuchMethod(Invocation.method(#setGuidedStorage, [disk]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> resetGuidedStorage() =>
      (super.noSuchMethod(Invocation.method(#resetGuidedStorage, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i3.Disk>> getStorage() =>
      (super.noSuchMethod(Invocation.method(#getStorage, []),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> addPartition(
          _i3.Disk? disk, _i3.Partition? partition) =>
      (super.noSuchMethod(Invocation.method(#addPartition, [disk, partition]),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> editPartition(
          _i3.Disk? disk, _i3.Partition? partition) =>
      (super.noSuchMethod(Invocation.method(#editPartition, [disk, partition]),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> deletePartition(
          _i3.Disk? disk, _i3.Partition? partition) =>
      (super.noSuchMethod(
              Invocation.method(#deletePartition, [disk, partition]),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> setStorage(List<_i3.Disk>? disks) =>
      (super.noSuchMethod(Invocation.method(#setStorage, [disks]),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> resetStorage() =>
      (super.noSuchMethod(Invocation.method(#resetStorage, []),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> addBootPartition(_i3.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#addBootPartition, [disk]),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
  @override
  _i4.Future<List<_i3.Disk>> reformatDisk(_i3.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#reformatDisk, [disk]),
              returnValue: Future<List<_i3.Disk>>.value(<_i3.Disk>[]))
          as _i4.Future<List<_i3.Disk>>);
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
  _i4.Future<void> done({_i6.FileSystem? fs = const _i7.LocalFileSystem()}) =>
      (super.noSuchMethod(Invocation.method(#done, [], {#fs: fs}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
}
