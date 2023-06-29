import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'test_keyboard.mocks.dart';
export '../test_utils.dart';
export 'test_keyboard.mocks.dart';

MockKeyboardModel buildKeyboardModel({
  bool? isValid,
  List<String>? layouts,
  int? selectedLayoutIndex,
  List<String>? variants,
  int? selectedVariantIndex,
  bool? canDetectLayout,
}) {
  final model = MockKeyboardModel();
  when(model.isValid).thenReturn(isValid ?? true);
  when(model.layoutCount).thenReturn(layouts?.length ?? 0);
  for (var i = 0; i < (layouts?.length ?? 0); ++i) {
    when(model.layoutName(i)).thenReturn(layouts![i]);
  }
  when(model.selectedLayoutIndex).thenReturn(selectedLayoutIndex ?? 0);
  when(model.variantCount).thenReturn(variants?.length ?? 0);
  for (var i = 0; i < (variants?.length ?? 0); ++i) {
    when(model.variantName(i)).thenReturn(variants![i]);
  }
  when(model.selectedVariantIndex).thenReturn(selectedVariantIndex ?? 0);
  when(model.canDetectLayout).thenReturn(canDetectLayout ?? true);
  return model;
}

@GenerateMocks([KeyboardModel])
Widget buildKeyboardPage(KeyboardModel model) {
  final service = MockKeyboardService();
  when(service.getKeyboardStep(any)).thenAnswer(
      (_) async => const AnyStep.stepPressKey(keycodes: {}, symbols: []));
  registerMockService<KeyboardService>(service);

  return ProviderScope(
    overrides: [keyboardModelProvider.overrideWith((_) => model)],
    child: const KeyboardPage(),
  );
}
