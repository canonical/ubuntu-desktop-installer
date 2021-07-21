// Mocks generated by Mockito 5.0.14 from annotations
// in ubuntu_wsl_setup/test/profile_setup_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_wizard/utils.dart' as _i3;
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_model.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ProfileSetupModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileSetupModel extends _i1.Mock implements _i2.ProfileSetupModel {
  MockProfileSetupModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get username =>
      (super.noSuchMethod(Invocation.getter(#username), returnValue: '')
          as String);
  @override
  set username(String? username) =>
      super.noSuchMethod(Invocation.setter(#username, username),
          returnValueForMissingStub: null);
  @override
  String get password =>
      (super.noSuchMethod(Invocation.getter(#password), returnValue: '')
          as String);
  @override
  set password(String? password) =>
      super.noSuchMethod(Invocation.setter(#password, password),
          returnValueForMissingStub: null);
  @override
  String get confirmedPassword => (super
          .noSuchMethod(Invocation.getter(#confirmedPassword), returnValue: '')
      as String);
  @override
  set confirmedPassword(String? password) =>
      super.noSuchMethod(Invocation.setter(#confirmedPassword, password),
          returnValueForMissingStub: null);
  @override
  _i3.PasswordStrength get passwordStrength =>
      (super.noSuchMethod(Invocation.getter(#passwordStrength),
          returnValue: _i3.PasswordStrength.weak) as _i3.PasswordStrength);
  @override
  bool get showAdvancedOptions =>
      (super.noSuchMethod(Invocation.getter(#showAdvancedOptions),
          returnValue: false) as bool);
  @override
  set showAdvancedOptions(bool? value) =>
      super.noSuchMethod(Invocation.setter(#showAdvancedOptions, value),
          returnValueForMissingStub: null);
  @override
  bool get isValid =>
      (super.noSuchMethod(Invocation.getter(#isValid), returnValue: false)
          as bool);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i4.Future<void> loadProfileSetup() =>
      (super.noSuchMethod(Invocation.method(#loadProfileSetup, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> saveProfileSetup({String? salt}) => (super.noSuchMethod(
      Invocation.method(#saveProfileSetup, [], {#salt: salt}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  void addListener(_i5.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i5.VoidCallback? listener) =>
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
