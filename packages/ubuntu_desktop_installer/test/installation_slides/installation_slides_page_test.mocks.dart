// Mocks generated by Mockito 5.3.2 from annotations
// in ubuntu_desktop_installer/test/installation_slides/installation_slides_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i6;

import 'package:flutter/widgets.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i2;
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_model.dart'
    as _i3;
import 'package:ubuntu_desktop_installer/services.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSubiquityClient_0 extends _i1.SmartFake
    implements _i2.SubiquityClient {
  _FakeSubiquityClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [InstallationSlidesModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockInstallationSlidesModel extends _i1.Mock
    implements _i3.InstallationSlidesModel {
  MockInstallationSlidesModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SubiquityClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeSubiquityClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.SubiquityClient);
  @override
  bool get isDone => (super.noSuchMethod(
        Invocation.getter(#isDone),
        returnValue: false,
      ) as bool);
  @override
  bool get hasError => (super.noSuchMethod(
        Invocation.getter(#hasError),
        returnValue: false,
      ) as bool);
  @override
  bool get isInstalling => (super.noSuchMethod(
        Invocation.getter(#isInstalling),
        returnValue: false,
      ) as bool);
  @override
  _i4.Stream<String> get log => (super.noSuchMethod(
        Invocation.getter(#log),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
  @override
  bool get isLogVisible => (super.noSuchMethod(
        Invocation.getter(#isLogVisible),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  bool get isDisposed => (super.noSuchMethod(
        Invocation.getter(#isDisposed),
        returnValue: false,
      ) as bool);
  @override
  void toggleLogVisibility() => super.noSuchMethod(
        Invocation.method(
          #toggleLogVisibility,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> precacheSlideImages(_i5.BuildContext? context) =>
      (super.noSuchMethod(
        Invocation.method(
          #precacheSlideImages,
          [context],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> reboot({bool? immediate = true}) => (super.noSuchMethod(
        Invocation.method(
          #reboot,
          [],
          {#immediate: immediate},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<void> shutdown({required bool? immediate}) => (super.noSuchMethod(
        Invocation.method(
          #shutdown,
          [],
          {#immediate: immediate},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [JournalService].
///
/// See the documentation for Mockito's code generation for more information.
class MockJournalService extends _i1.Mock implements _i7.JournalService {
  MockJournalService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<String> start(
    String? id, {
    _i7.JournalOutput? output = _i7.JournalOutput.short,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #start,
          [id],
          {#output: output},
        ),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
}
