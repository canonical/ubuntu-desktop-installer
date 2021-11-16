// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/write_changes_to_disk_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i3;
import 'package:ubuntu_desktop_installer/services/disk_storage_service.dart'
    as _i2;

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
  bool get useLvm =>
      (super.noSuchMethod(Invocation.getter(#useLvm), returnValue: false)
          as bool);
  @override
  set useLvm(bool? useLvm) =>
      super.noSuchMethod(Invocation.setter(#useLvm, useLvm),
          returnValueForMissingStub: null);
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
