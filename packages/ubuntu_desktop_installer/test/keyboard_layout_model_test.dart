import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_model.dart';

import 'keyboard_layout_model_test.mocks.dart';

const testLayouts = <KeyboardLayout>[
  KeyboardLayout(code: 'null-variants', name: 'Null variants', variants: null),
  KeyboardLayout(code: 'empty-variants', name: 'Empty variants', variants: []),
  KeyboardLayout(
    code: 'with-null-variants',
    name: 'With null variants',
    variants: [KeyboardVariant(code: null)],
  ),
  KeyboardLayout(
    code: 'with-variants',
    name: 'With variants',
    variants: [
      KeyboardVariant(code: 'variant1'),
      KeyboardVariant(code: 'variant2'),
    ],
  ),
];

@GenerateMocks([KeyboardModel, ProcessRunner, SubiquityClient])
void main() {
  late MockProcessRunner processRunner;
  setUp(() {
    processRunner = MockProcessRunner();
    when(processRunner.run('setxkbmap', any)).thenAnswer((_) async {
      return ProcessResult(0, 0, null, null);
    });
  });

  group('detect layout and variant when', () {
    late MockKeyboardModel keyboard;
    late TestKeyboardLayoutModel model;

    setUp(() {
      keyboard = MockKeyboardModel();
      model = TestKeyboardLayoutModel(
        client: MockSubiquityClient(),
        keyboardModel: keyboard,
        processRunner: MockProcessRunner(),
      );
    });

    test('layouts=[]', () async {
      when(keyboard.layouts).thenReturn([]);

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('layout=null and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = null;
      model.variant = null;
      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('layout=unknown and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'unknown';
      model.variant = 'unknown';
      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=null and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'null-variants';
      model.variant = null;
      await model.init();
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=null and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'null-variants';
      model.variant = 'unknown';
      await model.init();
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[] and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'empty-variants';
      model.variant = null;
      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[] and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'empty-variants';
      model.variant = 'unknown';
      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[null] and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'with-null-variants';
      model.variant = null;
      await model.init();
      expect(model.selectedLayoutIndex, equals(2));
      expect(model.selectedVariantIndex, equals(0));
    });

    test('variants=[null] and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'with-null-variants';
      model.variant = 'unknown';
      await model.init();
      expect(model.selectedLayoutIndex, equals(2));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'with-variants';
      model.variant = null;
      await model.init();
      expect(model.selectedLayoutIndex, equals(3));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'with-variants';
      model.variant = 'unknown';
      await model.init();
      expect(model.selectedLayoutIndex, equals(3));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('all ok', () async {
      when(keyboard.layouts).thenReturn(testLayouts);

      model.layout = 'with-variants';
      model.variant = 'variant2';
      await model.init();
      expect(model.selectedLayoutIndex, equals(3));
      expect(model.selectedVariantIndex, equals(1));
    });
  });

  group('layout and variant', () {
    late MockKeyboardModel keyboard;
    late TestKeyboardLayoutModel model;

    setUp(() {
      keyboard = MockKeyboardModel();
      when(keyboard.layouts).thenReturn([
        KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
        KeyboardLayout(code: 'bar', name: 'Bar', variants: [
          KeyboardVariant(code: 'baz', name: 'Baz'),
          KeyboardVariant(code: 'qux', name: 'Qux'),
        ]),
      ]);

      model = TestKeyboardLayoutModel(
        client: MockSubiquityClient(),
        keyboardModel: keyboard,
        processRunner: processRunner,
      );
    });

    test('names are correct', () {
      expect(model.layoutCount, equals(2));
      expect(model.layoutName(0), equals('Foo'));
      expect(model.layoutName(1), equals('Bar'));
      expect(model.variantCount, equals(0));

      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));

      model.selectLayout(1);
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(0));
      expect(model.variantCount, equals(2));
      expect(model.variantName(0), equals('Baz'));
      expect(model.variantName(1), equals('Qux'));

      model.selectVariant(1);
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));

      model.selectLayout(0);
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('selection changes are notified', () {
      var wasNotified = false;
      model.addListener(() => wasNotified = true);

      // select layout -> notify
      expect(model.selectedLayoutIndex, isNot(equals(1)));
      model.selectLayout(1);
      expect(wasNotified, isTrue);

      // no change -> no notification
      wasNotified = false;
      expect(model.selectedLayoutIndex, equals(1));
      model.selectLayout(1);
      expect(wasNotified, isFalse);

      // select variant -> notify
      wasNotified = false;
      expect(model.selectedVariantIndex, isNot(equals(1)));
      model.selectVariant(1);
      expect(wasNotified, isTrue);

      // no change -> no notification
      wasNotified = false;
      expect(model.selectedVariantIndex, equals(1));
      model.selectVariant(1);
      expect(wasNotified, isFalse);
    });

    test('selection runs setxkbmap', () {
      model.selectLayout(0);
      verify(processRunner.run('setxkbmap', ['-layout', 'foo'])).called(1);

      model.selectLayout(1);
      verify(processRunner
          .run('setxkbmap', ['-layout', 'bar', '-variant', 'baz'])).called(1);

      model.selectVariant(1);
      verify(processRunner
          .run('setxkbmap', ['-layout', 'bar', '-variant', 'qux'])).called(1);
    });

    test('invalid selection throws', () {
      expect(() => model.selectLayout(-1), throwsAssertionError);
      expect(() => model.selectLayout(model.layoutCount), throwsAssertionError);

      expect(() => model.selectVariant(-1), throwsAssertionError);
      expect(
          () => model.selectVariant(model.variantCount), throwsAssertionError);
    });

    test('selection is valid', () {
      expect(model.isValid, isFalse);

      model.selectLayout(0);
      expect(model.isValid, isFalse);

      model.selectLayout(1);
      expect(model.isValid, isTrue);
    });
  });

  test('apply the system settings', () async {
    final client = MockSubiquityClient();

    final keyboard = MockKeyboardModel();
    when(keyboard.layouts).thenReturn([
      KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
      KeyboardLayout(code: 'bar', name: 'Bar', variants: [
        KeyboardVariant(code: 'baz', name: 'Baz'),
        KeyboardVariant(code: 'qux', name: 'Qux'),
      ]),
    ]);

    final model = TestKeyboardLayoutModel(
      client: client,
      keyboardModel: keyboard,
      processRunner: processRunner,
    );

    model.selectLayout(1);
    model.selectVariant(1);

    await model.applyKeyboardSettings();
    verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'qux')))
        .called(1);
  });
}

// A normal KeyboardLayoutModel with overridden detectFoo() methods to eliminate
// the keyboard_info dependency and to return specific values for testing.
class TestKeyboardLayoutModel extends KeyboardLayoutModel {
  TestKeyboardLayoutModel({
    required SubiquityClient client,
    required KeyboardModel keyboardModel,
    required ProcessRunner processRunner,
  }) : super(
            client: client,
            keyboardModel: keyboardModel,
            processRunner: processRunner);

  String? layout;
  String? variant;

  @override
  Future<String?> detectKeyboardLayout() async => layout;

  @override
  Future<String?> detectLayoutVariant() async => variant;
}
