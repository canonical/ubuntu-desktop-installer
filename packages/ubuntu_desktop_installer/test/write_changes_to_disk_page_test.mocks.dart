// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/write_changes_to_disk_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:ui' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i4;
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_model.dart'
    as _i3;
import 'package:ubuntu_desktop_installer/services.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [UdevService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUdevService extends _i1.Mock implements _i2.UdevService {
  MockUdevService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  String fullName({String? sysname, String? syspath}) => (super.noSuchMethod(
      Invocation.method(#fullName, [], {#sysname: sysname, #syspath: syspath}),
      returnValue: '') as String);
  @override
  String toString() => super.toString();
}

/// A class which mocks [WriteChangesToDiskModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockWriteChangesToDiskModel extends _i1.Mock
    implements _i3.WriteChangesToDiskModel {
  MockWriteChangesToDiskModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i4.Disk> get disks =>
      (super.noSuchMethod(Invocation.getter(#disks), returnValue: <_i4.Disk>[])
          as List<_i4.Disk>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  List<_i4.Partition> partitions(_i4.Disk? disk) =>
      (super.noSuchMethod(Invocation.method(#partitions, [disk]),
          returnValue: <_i4.Partition>[]) as List<_i4.Partition>);
  @override
  _i5.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> startInstallation() =>
      (super.noSuchMethod(Invocation.method(#startInstallation, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  void addListener(_i6.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i6.VoidCallback? listener) =>
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
