// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_desktop_installer/test/installation_slides/installation_slides_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_desktop_installer/services/journal_service.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [JournalService].
///
/// See the documentation for Mockito's code generation for more information.
class MockJournalService extends _i1.Mock implements _i2.JournalService {
  MockJournalService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<String> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
          returnValue: Stream<String>.empty()) as _i3.Stream<String>);
  @override
  _i3.Future<void> start() => (super.noSuchMethod(Invocation.method(#start, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void stop() => super.noSuchMethod(Invocation.method(#stop, []),
      returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
