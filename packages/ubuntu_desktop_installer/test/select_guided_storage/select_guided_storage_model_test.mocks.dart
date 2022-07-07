// Mocks generated by Mockito 5.1.0 from annotations
// in ubuntu_desktop_installer/test/select_guided_storage/select_guided_storage_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i4;
import 'package:ubuntu_desktop_installer/services/disk_storage_service.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [DiskStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDiskStorageService extends _i1.Mock
    implements _i2.DiskStorageService {
  MockDiskStorageService() {
    _i1.throwOnMissingStub(this);
  }

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
  bool get hasRst =>
      (super.noSuchMethod(Invocation.getter(#hasRst), returnValue: false)
          as bool);
  @override
  bool get hasBitLocker =>
      (super.noSuchMethod(Invocation.getter(#hasBitLocker), returnValue: false)
          as bool);
  @override
  bool get hasEncryption =>
      (super.noSuchMethod(Invocation.getter(#hasEncryption), returnValue: false)
          as bool);
  @override
  bool get hasSecureBoot =>
      (super.noSuchMethod(Invocation.getter(#hasSecureBoot), returnValue: false)
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
  _i3.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<List<_i4.Disk>> getGuidedStorage() =>
      (super.noSuchMethod(Invocation.method(#getGuidedStorage, []),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<void> setGuidedStorage([_i4.Disk? disk]) =>
      (super.noSuchMethod(Invocation.method(#setGuidedStorage, [disk]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<List<_i4.Disk>> getStorage() =>
      (super.noSuchMethod(Invocation.method(#getStorage, []),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> addPartition(
          _i4.Disk? disk, _i4.Gap? gap, _i4.Partition? partition) =>
      (super.noSuchMethod(
              Invocation.method(#addPartition, [disk, gap, partition]),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> editPartition(
          _i4.Disk? disk, _i4.Partition? partition) =>
      (super.noSuchMethod(Invocation.method(#editPartition, [disk, partition]),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> deletePartition(
          _i4.Disk? disk, _i4.Partition? partition) =>
      (super.noSuchMethod(
              Invocation.method(#deletePartition, [disk, partition]),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> setStorage(List<_i4.Disk>? disks) =>
      (super.noSuchMethod(Invocation.method(#setStorage, [disks]),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> resetStorage() =>
      (super.noSuchMethod(Invocation.method(#resetStorage, []),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> addBootPartition(_i4.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#addBootPartition, [disk]),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
  @override
  _i3.Future<List<_i4.Disk>> reformatDisk(_i4.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#reformatDisk, [disk]),
              returnValue: Future<List<_i4.Disk>>.value(<_i4.Disk>[]))
          as _i3.Future<List<_i4.Disk>>);
}
