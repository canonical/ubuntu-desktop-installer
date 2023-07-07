import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_provision/keyboard.dart';

import 'test_keyboard.mocks.dart';
export '../test_utils.dart';
export 'test_keyboard.mocks.dart';

@GenerateMocks([KeyboardModel, KeyboardService])
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
