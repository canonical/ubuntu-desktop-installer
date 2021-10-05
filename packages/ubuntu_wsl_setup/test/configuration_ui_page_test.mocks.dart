// Mocks generated by Mockito 5.0.16 from annotations
// in ubuntu_wsl_setup/test/configuration_ui_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:ui' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_wsl_setup/pages/configuration_ui/configuration_ui_model.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ConfigurationUIModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockConfigurationUIModel extends _i1.Mock
    implements _i2.ConfigurationUIModel {
  MockConfigurationUIModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get legacyGUI =>
      (super.noSuchMethod(Invocation.getter(#legacyGUI), returnValue: false)
          as bool);
  @override
  set legacyGUI(bool? value) =>
      super.noSuchMethod(Invocation.setter(#legacyGUI, value),
          returnValueForMissingStub: null);
  @override
  bool get legacyAudio =>
      (super.noSuchMethod(Invocation.getter(#legacyAudio), returnValue: false)
          as bool);
  @override
  set legacyAudio(bool? value) =>
      super.noSuchMethod(Invocation.setter(#legacyAudio, value),
          returnValueForMissingStub: null);
  @override
  bool get advancedIPDetection =>
      (super.noSuchMethod(Invocation.getter(#advancedIPDetection),
          returnValue: false) as bool);
  @override
  set advancedIPDetection(bool? value) =>
      super.noSuchMethod(Invocation.setter(#advancedIPDetection, value),
          returnValueForMissingStub: null);
  @override
  bool get wslMotdNews =>
      (super.noSuchMethod(Invocation.getter(#wslMotdNews), returnValue: false)
          as bool);
  @override
  set wslMotdNews(bool? value) =>
      super.noSuchMethod(Invocation.setter(#wslMotdNews, value),
          returnValueForMissingStub: null);
  @override
  bool get automount =>
      (super.noSuchMethod(Invocation.getter(#automount), returnValue: false)
          as bool);
  @override
  set automount(bool? value) =>
      super.noSuchMethod(Invocation.setter(#automount, value),
          returnValueForMissingStub: null);
  @override
  bool get mountFstab =>
      (super.noSuchMethod(Invocation.getter(#mountFstab), returnValue: false)
          as bool);
  @override
  set mountFstab(bool? value) =>
      super.noSuchMethod(Invocation.setter(#mountFstab, value),
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
  _i3.Future<void> loadConfiguration() =>
      (super.noSuchMethod(Invocation.method(#loadConfiguration, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> saveConfiguration() =>
      (super.noSuchMethod(Invocation.method(#saveConfiguration, []),
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
