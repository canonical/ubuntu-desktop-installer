import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:platform/platform.dart';
import 'package:ubuntu_provision/src/keyboard/keyboard_model.dart';
import 'package:ubuntu_provision/src/services/keyboard_service.dart';

import 'test_keyboard.dart';

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
    late MockKeyboardService service;
    late KeyboardModel model;

    setUp(() {
      service = MockKeyboardService();
      model = KeyboardModel(service);
    });

    test('layouts=[]', () async {
      when(service.getKeyboard()).thenAnswer((_) async {
        return testSetup([], layout: 'with-variants', variant: 'variant1');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('layout=unknown and variant=unknown', () async {
      when(service.getKeyboard()).thenAnswer((_) async {
        return testSetup(testLayouts, layout: 'unknown', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variants=[] and variant=unknown', () async {
      when(service.getKeyboard()).thenAnswer((_) async {
        return testSetup(testLayouts,
            layout: 'empty-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(0));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('variant=unknown', () async {
      when(service.getKeyboard()).thenAnswer((_) async {
        return testSetup(testLayouts,
            layout: 'with-variants', variant: 'unknown');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(-1));
    });

    test('all ok', () async {
      when(service.getKeyboard()).thenAnswer((_) async {
        return testSetup(testLayouts,
            layout: 'with-variants', variant: 'variant2');
      });

      await model.init();
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));
    });
  });

  group('layout and variant', () {
    late KeyboardModel model;
    late KeyboardService service;

    setUp(() async {
      service = MockKeyboardService();
      when(service.getKeyboard()).thenAnswer((_) async {
        return testSetup([
          const KeyboardLayout(code: 'bar', name: 'Bar', variants: []),
          const KeyboardLayout(code: 'foo', name: 'Foo', variants: [
            KeyboardVariant(code: 'baz', name: 'Baz'),
            KeyboardVariant(code: 'qux', name: 'Qux'),
          ]),
        ], layout: '', variant: '');
      });

      model = KeyboardModel(service,
          platform: FakePlatform(environment: {'USERNAME': 'usr'}));
      await model.init();
    });

    test('names are correct', () async {
      expect(model.layoutCount, equals(2));
      expect(model.layoutName(0), equals('Bar'));
      expect(model.layoutName(1), equals('Foo'));
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

    test('selection updates input source', () async {
      await model.selectLayout(0);
      verify(service.setInputSource(const KeyboardSetting(layout: 'bar'),
              user: 'usr'))
          .called(1);

      await model.selectLayout(1);
      verify(service.setInputSource(
              const KeyboardSetting(layout: 'foo', variant: 'baz'),
              user: 'usr'))
          .called(1);

      await model.selectVariant(1);
      verify(service.setInputSource(
              const KeyboardSetting(layout: 'foo', variant: 'qux'),
              user: 'usr'))
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
      await model.trySelectLayoutVariant('foo', 'qux');
      expect(model.selectedLayoutIndex, equals(1));
      expect(model.selectedVariantIndex, equals(1));
    });

    test('try selecting by invalid codes', () async {
      await model.trySelectLayoutVariant('invalid', 'none');
      expect(model.selectedLayoutIndex, equals(-1));
      expect(model.selectedVariantIndex, equals(-1));
    });
  });

  test('apply the system settings', () async {
    final service = MockKeyboardService();
    when(service.getKeyboard()).thenAnswer((_) async {
      return testSetup([
        const KeyboardLayout(code: 'bar', name: 'Bar', variants: []),
        const KeyboardLayout(code: 'foo', name: 'Foo', variants: [
          KeyboardVariant(code: 'baz', name: 'Baz'),
          KeyboardVariant(code: 'qux', name: 'Qux'),
        ]),
      ], layout: '', variant: '');
    });

    final model = KeyboardModel(service);

    await model.init();
    await model.selectLayout(1);
    await model.selectVariant(1);
    reset(service);

    await model.save();
    verify(service
            .setKeyboard(const KeyboardSetting(layout: 'foo', variant: 'qux')))
        .called(1);
  });

  test('sort layouts', () async {
    final service = MockKeyboardService();
    when(service.getKeyboard()).thenAnswer((_) async {
      return testSetup([
        const KeyboardLayout(code: 'bbb', name: 'BBB', variants: []),
        const KeyboardLayout(code: 'aaa', name: 'AAA', variants: []),
        const KeyboardLayout(code: 'äää', name: 'ÄÄÄ', variants: []),
      ], layout: '', variant: '');
    });

    final model = KeyboardModel(service);

    await model.init();
    expect(model.layoutCount, equals(3));
    expect(model.layoutName(0), equals('AAA'));
    expect(model.layoutName(1), equals('ÄÄÄ'));
    expect(model.layoutName(2), equals('BBB'));
  });

  test('search layout', () async {
    final service = MockKeyboardService();
    when(service.getKeyboard()).thenAnswer((_) async {
      return testSetup([
        const KeyboardLayout(code: 'bar', name: 'Bar', variants: []),
        const KeyboardLayout(code: 'foo', name: 'Foo', variants: [
          KeyboardVariant(code: 'baz', name: 'Baz'),
          KeyboardVariant(code: 'qux', name: 'Qux'),
        ]),
      ], layout: '', variant: '');
    });

    final model = KeyboardModel(service);
    await model.init();

    // case-insensitive
    final foo = model.searchLayout('fOO');
    expect(model.layoutName(foo), equals('Foo'));
    model.selectLayout(foo);
    expect(model.searchLayout('foo'), foo);

    // wrap around
    final bar = model.searchLayout('B');
    expect(model.layoutName(bar), equals('Bar'));

    // no match
    expect(model.searchLayout('none'), isNegative);
  });
}
