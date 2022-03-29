import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

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

KeyboardSetup testSetup({required String? layout, required String? variant}) {
  final setting = KeyboardSetting(layout: layout, variant: variant);
  return KeyboardSetup(setting: setting);
}

@GenerateMocks([KeyboardService])
void main() {
  group('detect layout and variant when', () {
    late MockSubiquityClient client;
    late MockKeyboardService keyboard;
    late KeyboardLayoutModel model;

    setUp(() {
      client = MockSubiquityClient();
      keyboard = MockKeyboardService();
      model = KeyboardLayoutModel(
        client: client,
        keyboardService: keyboard,
      );
    });

    test('layouts=[]', () async {
      when(keyboard.layouts).thenReturn([]);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'with-variants', variant: 'variant1');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('layout=null and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: null, variant: null);
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('layout=unknown and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'unknown', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=null and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'null-variants', variant: null);
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=null and variant=unknown', () async {
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'null-variants', variant: 'unknown');
      });
      when(keyboard.layouts).thenReturn(testLayouts);

      await model.init();
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[] and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'empty-variants', variant: null);
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[] and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'empty-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[null] and variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'with-null-variants', variant: null);
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(2));
      expect(model.selectedVariantIndex, equals(0));
    });

    test('variants=[null] and variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'with-null-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(2));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variant=null', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'with-variants', variant: null);
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(3));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variant=unknown', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'with-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(3));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('all ok', () async {
      when(keyboard.layouts).thenReturn(testLayouts);
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(layout: 'with-variants', variant: 'variant2');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(3));
      expect(model.selectedVariantIndex, equals(1));
    });
  });

  group('layout and variant', () {
    late MockKeyboardService keyboard;
    late KeyboardLayoutModel model;
    late SubiquityClient client;

    setUp(() {
      keyboard = MockKeyboardService();
      when(keyboard.layouts).thenReturn([
        KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
        KeyboardLayout(code: 'bar', name: 'Bar', variants: [
          KeyboardVariant(code: 'baz', name: 'Baz'),
          KeyboardVariant(code: 'qux', name: 'Qux'),
        ]),
      ]);

      client = MockSubiquityClient();

      model = KeyboardLayoutModel(
        client: client,
        keyboardService: keyboard,
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

    test('selection applies keyboard settings', () {
      model.selectLayout(0);
      verify(client.setKeyboard(KeyboardSetting(layout: 'foo'))).called(1);

      model.selectLayout(1);
      verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'baz')))
          .called(1);

      model.selectVariant(1);
      verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'qux')))
          .called(1);
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

    test('try selecting by codes', () async {
      model.trySelectLayoutVariant('bar', 'qux');
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));
      await expectLater(model.onLayoutSelected, emits(1));
    });

    test('try selecting by invalid codes', () async {
      model.trySelectLayoutVariant('invalid', 'none');
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });
  });

  test('apply the system settings', () async {
    final client = MockSubiquityClient();

    final keyboard = MockKeyboardService();
    when(keyboard.layouts).thenReturn([
      KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
      KeyboardLayout(code: 'bar', name: 'Bar', variants: [
        KeyboardVariant(code: 'baz', name: 'Baz'),
        KeyboardVariant(code: 'qux', name: 'Qux'),
      ]),
    ]);

    final model = KeyboardLayoutModel(
      client: client,
      keyboardService: keyboard,
    );

    model.selectLayout(1);
    model.selectVariant(1);
    reset(client);

    await model.applyKeyboardSettings();
    verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'qux')))
        .called(1);
  });
}
