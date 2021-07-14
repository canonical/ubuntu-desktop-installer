import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_model.dart';

import 'keyboard_layout_model_test.mocks.dart';

@GenerateMocks([KeyboardModel, SubiquityClient])
void main() {
  test('detect system keyboard layout and variant', () async {
    final keyboard = MockKeyboardModel();
    when(keyboard.layouts).thenReturn([
      KeyboardLayout(code: 'foo', variants: []),
      KeyboardLayout(code: 'bar', variants: [
        KeyboardVariant(code: null),
        KeyboardVariant(code: 'baz'),
      ]),
    ]);

    final model = TestKeyboardLayoutModel(
      client: MockSubiquityClient(),
      keyboardModel: keyboard,
    );

    model.layout = 'unknown';
    model.variant = 'unknown';
    await model.init();
    expect(model.selectedLayoutIndex, equals(-1));
    expect(model.selectedVariantIndex, equals(0));

    model.layout = 'foo';
    model.variant = 'bar';
    await model.init();
    expect(model.selectedLayoutIndex, equals(0));
    expect(model.selectedVariantIndex, equals(0));

    model.layout = 'bar';
    model.variant = 'baz';
    await model.init();
    expect(model.selectedLayoutIndex, equals(1));
    expect(model.selectedVariantIndex, equals(1));
  });

  test('keyboard layouts and variants', () {
    final keyboard = MockKeyboardModel();
    when(keyboard.layouts).thenReturn([
      KeyboardLayout(code: 'foo', name: 'Foo', variants: []),
      KeyboardLayout(code: 'bar', name: 'Bar', variants: [
        KeyboardVariant(code: 'baz', name: 'Baz'),
        KeyboardVariant(code: 'qux', name: 'Qux'),
      ]),
    ]);

    final model = TestKeyboardLayoutModel(
      client: MockSubiquityClient(),
      keyboardModel: keyboard,
    );

    expect(model.layoutCount, equals(2));
    expect(model.layoutName(0), equals('Foo'));
    expect(model.layoutName(1), equals('Bar'));
    expect(model.variantCount, equals(0));

    expect(model.selectedLayoutIndex, equals(0));
    expect(model.selectedVariantIndex, equals(0));

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
    expect(model.selectedVariantIndex, equals(0));
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
    );

    model.selectLayout(1);
    model.selectVariant(1);

    await model.applyKeyboardSettings();
    verify(client.setKeyboard(KeyboardSetting(layout: 'bar', variant: 'qux')))
        .called(1);
  });
}

class TestKeyboardLayoutModel extends KeyboardLayoutModel {
  TestKeyboardLayoutModel({
    required SubiquityClient client,
    required KeyboardModel keyboardModel,
  }) : super(client: client, keyboardModel: keyboardModel);

  String? layout;
  String? variant;

  @override
  Future<String?> detectKeyboardLayout() async => layout;

  @override
  Future<String?> detectLayoutVariant() async => variant;
}
