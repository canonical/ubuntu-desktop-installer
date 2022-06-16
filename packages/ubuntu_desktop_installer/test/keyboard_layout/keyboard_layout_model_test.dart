import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_model.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

const testLayouts = <KeyboardLayout>[
  KeyboardLayout(code: 'empty-variants', name: 'Empty variants', variants: []),
  KeyboardLayout(
    code: 'with-variants',
    name: 'With variants',
    variants: [
      KeyboardVariant(code: 'variant1', name: 'V1'),
      KeyboardVariant(code: 'variant2', name: 'V2'),
    ],
  ),
];

KeyboardSetup testSetup(
  List<KeyboardLayout> layouts, {
  required String layout,
  required String variant,
}) {
  final setting = KeyboardSetting(layout: layout, variant: variant);
  return KeyboardSetup(setting: setting, layouts: layouts);
}

void main() {
  group('detect layout and variant when', () {
    late MockSubiquityClient client;
    late KeyboardLayoutModel model;

    setUp(() {
      client = MockSubiquityClient();
      model = KeyboardLayoutModel(client);
    });

    test('layouts=[]', () async {
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup([], layout: 'with-variants', variant: 'variant1');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('layout=unknown and variant=unknown', () async {
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(testLayouts, layout: 'unknown', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[] and variant=unknown', () async {
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(testLayouts,
            layout: 'empty-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variant=unknown', () async {
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(testLayouts,
            layout: 'with-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('all ok', () async {
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup(testLayouts,
            layout: 'with-variants', variant: 'variant2');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));
    });
  });

  group('layout and variant', () {
    late KeyboardLayoutModel model;
    late SubiquityClient client;

    setUp(() async {
      client = MockSubiquityClient();
      when(client.keyboard()).thenAnswer((_) async {
        return testSetup([
          KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
          KeyboardLayout(code: 'bar', name: 'Bar', variants: [
            KeyboardVariant(code: 'baz', name: 'Baz'),
            KeyboardVariant(code: 'qux', name: 'Qux'),
          ]),
        ], layout: '', variant: '');
      });

      model = KeyboardLayoutModel(client);
      await model.init();
    });

    test('names are correct', () async {
      expect(model.layoutCount, equals(2));
      expect(model.layoutName(0), equals('Foo'));
      expect(model.layoutName(1), equals('Bar'));
      expect(model.variantCount, equals(0));

      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));

      await model.selectLayout(1);
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(0));
      expect(model.variantCount, equals(2));
      expect(model.variantName(0), equals('Baz'));
      expect(model.variantName(1), equals('Qux'));

      await model.selectVariant(1);
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));

      await model.selectLayout(0);
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('selection changes are notified', () async {
      var wasNotified = false;
      model.addListener(() => wasNotified = true);

      // select layout -> notify
      expect(model.selectedLayoutIndex, isNot(equals(1)));
      await model.selectLayout(1);
      expect(wasNotified, isTrue);

      // no change -> no notification
      wasNotified = false;
      expect(model.selectedLayoutIndex, equals(1));
      await model.selectLayout(1);
      expect(wasNotified, isFalse);

      // select variant -> notify
      wasNotified = false;
      expect(model.selectedVariantIndex, isNot(equals(1)));
      await model.selectVariant(1);
      expect(wasNotified, isTrue);

      // no change -> no notification
      wasNotified = false;
      expect(model.selectedVariantIndex, equals(1));
      await model.selectVariant(1);
      expect(wasNotified, isFalse);
    });

    test('selection applies keyboard settings', () async {
      await model.selectLayout(0);
      verify(client.setKeyboard(KeyboardSetting(layout: 'foo'))).called(1);

      await model.selectLayout(1);
      verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'baz')))
          .called(1);

      await model.selectVariant(1);
      verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'qux')))
          .called(1);
    });

    test('invalid selection throws', () {
      expect(() async => await model.selectLayout(-1), throwsAssertionError);
      expect(() async => await model.selectLayout(model.layoutCount),
          throwsAssertionError);

      expect(() async => await model.selectVariant(-1), throwsAssertionError);
      expect(() async => await model.selectVariant(model.variantCount),
          throwsAssertionError);
    });

    test('selection is valid', () async {
      expect(model.isValid, isFalse);

      await model.selectLayout(0);
      expect(model.isValid, isFalse);

      await model.selectLayout(1);
      expect(model.isValid, isTrue);
    });

    test('try selecting by codes', () async {
      await model.trySelectLayoutVariant('bar', 'qux');
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));
      await expectLater(model.onLayoutSelected, emits(1));
    });

    test('try selecting by invalid codes', () async {
      await model.trySelectLayoutVariant('invalid', 'none');
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });
  });

  test('apply the system settings', () async {
    final client = MockSubiquityClient();
    when(client.keyboard()).thenAnswer((_) async {
      return testSetup([
        KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
        KeyboardLayout(code: 'bar', name: 'Bar', variants: [
          KeyboardVariant(code: 'baz', name: 'Baz'),
          KeyboardVariant(code: 'qux', name: 'Qux'),
        ]),
      ], layout: '', variant: '');
    });

    final model = KeyboardLayoutModel(client);

    await model.init();
    await model.selectLayout(1);
    await model.selectVariant(1);
    reset(client);

    await model.applyKeyboardSettings();
    verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'qux')))
        .called(1);
  });
}
