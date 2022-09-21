// Mocks generated by Mockito 5.3.0 from annotations
// in ubuntu_wsl_setup/test/installation_slides_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i2;
import 'package:ubuntu_wsl_setup/pages/installation_slides/installation_slides_model.dart'
    as _i3;
import 'package:ubuntu_wsl_setup/services/journal.dart' as _i6;

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

class _FakeSubiquityStatusMonitor_0 extends _i1.SmartFake
    implements _i2.SubiquityStatusMonitor {
  _FakeSubiquityStatusMonitor_0(
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
  _i2.SubiquityStatusMonitor get monitor => (super.noSuchMethod(
        Invocation.getter(#monitor),
        returnValue: _FakeSubiquityStatusMonitor_0(
          this,
          Invocation.getter(#monitor),
        ),
      ) as _i2.SubiquityStatusMonitor);
  @override
  _i3.InstallationState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i3.InstallationState.registering,
      ) as _i3.InstallationState);
  @override
  _i4.Stream<String> get journal => (super.noSuchMethod(
        Invocation.getter(#journal),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
  @override
  bool get hasError => (super.noSuchMethod(
        Invocation.getter(#hasError),
        returnValue: false,
      ) as bool);
  @override
  bool get isRegistering => (super.noSuchMethod(
        Invocation.getter(#isRegistering),
        returnValue: false,
      ) as bool);
  @override
  bool get isLogVisible => (super.noSuchMethod(
        Invocation.getter(#isLogVisible),
        returnValue: false,
      ) as bool);
  @override
  bool get isServerUp => (super.noSuchMethod(
        Invocation.getter(#isServerUp),
        returnValue: false,
      ) as bool);
  @override
  bool get isDisposed => (super.noSuchMethod(
        Invocation.getter(#isDisposed),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void init({void Function()? onServerUp}) => super.noSuchMethod(
        Invocation.method(
          #init,
          [],
          {#onServerUp: onServerUp},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toggleLogVisibility() => super.noSuchMethod(
        Invocation.method(
          #toggleLogVisibility,
          [],
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
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [JournalService].
///
/// See the documentation for Mockito's code generation for more information.
class MockJournalService extends _i1.Mock implements _i6.JournalService {
  MockJournalService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<String> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<String>.empty(),
      ) as _i4.Stream<String>);
  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
