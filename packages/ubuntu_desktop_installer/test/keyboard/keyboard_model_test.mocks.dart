// Mocks generated by Mockito 5.3.2 from annotations
// in ubuntu_desktop_installer/test/keyboard/keyboard_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i2;
import 'package:ubuntu_desktop_installer/services/keyboard_service.dart' as _i3;

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

class _FakeKeyboardSetup_0 extends _i1.SmartFake implements _i2.KeyboardSetup {
  _FakeKeyboardSetup_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [KeyboardService].
///
/// See the documentation for Mockito's code generation for more information.
class MockKeyboardService extends _i1.Mock implements _i3.KeyboardService {
  MockKeyboardService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.KeyboardSetup> getKeyboard() => (super.noSuchMethod(
        Invocation.method(
          #getKeyboard,
          [],
        ),
        returnValue: _i4.Future<_i2.KeyboardSetup>.value(_FakeKeyboardSetup_0(
          this,
          Invocation.method(
            #getKeyboard,
            [],
          ),
        )),
      ) as _i4.Future<_i2.KeyboardSetup>);
  @override
  _i4.Future<void> setKeyboard(_i2.KeyboardSetting? setting) =>
      (super.noSuchMethod(
        Invocation.method(
          #setKeyboard,
          [setting],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> setInputSource(
    _i2.KeyboardSetting? setting, {
    String? user,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInputSource,
          [setting],
          {#user: user},
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
