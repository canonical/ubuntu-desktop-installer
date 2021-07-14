import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:keyboard_info/keyboard_info.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../keyboard_model.dart';

/// Implements the business logic of the Keyboard Layout page.
class KeyboardLayoutModel extends ChangeNotifier {
  /// Creates a model with the specified [client] and [keyboardModel].
  KeyboardLayoutModel({
    required SubiquityClient client,
    required KeyboardModel keyboardModel,
  })  : _client = client,
        _keyboardModel = keyboardModel;

  final SubiquityClient _client;
  final KeyboardModel _keyboardModel;

  /// The number of available keyboard layouts.
  int get layoutCount => _keyboardModel.layouts.length;

  /// Returns the name of the keyboard layout at [index].
  String layoutName(int index) => _keyboardModel.layouts[index].name!;

  /// The index of the currently selected layout.
  //int get selectedLayoutIndex => _selectedLayoutIndex;
  int selectedLayoutIndex = -1;

  KeyboardLayout? get selectedLayout => (selectedLayoutIndex > -1)
      ? _keyboardModel.layouts[selectedLayoutIndex]
      : null;

  /// Selects the keyboard layout at [index].
  void selectLayout(int index) {
    if (selectedLayoutIndex == index) return;
    selectedLayoutIndex = index;
    selectedVariantIndex = 0;
    _setXkbMap();
    notifyListeners();
  }

  /// The number of available layout variants.
  int get variantCount => selectedLayout?.variants?.length ?? 0;

  /// Returns the name of the layout variant at [index].
  String variantName(int index) => selectedLayout!.variants![index].name!;

  /// The index of the currently selected layout variant.
  //int get selectedVariantIndex => _selectedVariantIndex;
  int selectedVariantIndex = -1;

  KeyboardVariant? get selectedVariant => (selectedVariantIndex > -1)
      ? selectedLayout?.variants?.elementAt(selectedVariantIndex)
      : null;

  /// Selects the keyboard layout variant at [index].
  void selectVariant(int index) {
    if (selectedVariantIndex == index) return;
    selectedVariantIndex = index;
    _setXkbMap();
    notifyListeners();
  }

  Future<void> _setXkbMap() async {
    return Process.run('setxkbmap', [
      '-layout',
      selectedLayout!.code!,
      '-variant',
      selectedVariant!.code!
    ]).then((result) {}).catchError((e) {
      print(e as ProcessException);
    });
  }

  /// Whether the layout and variant selections are valid.
  bool get isValid => selectedLayoutIndex > -1 && selectedVariantIndex > -1;

  /// Initializes the model and detects the current system keyboard layout and
  /// variant.
  Future<void> init() async {
    await getKeyboardInfo().then((info) {
      selectedLayoutIndex = _keyboardModel.layouts.indexWhere((layout) {
        return layout.code == info.layout;
      });
      if (selectedLayoutIndex > -1) {
        selectedVariantIndex = selectedLayout!.variants?.indexWhere((variant) {
              return variant.code == (info.variant ?? '');
            }) ??
            -1;
      }
    });
    notifyListeners();
  }

  /// Applies the selected keyboard layout and variant to the system.
  Future<void> applyKeyboardSettings() {
    final keyboard = KeyboardSetting(
      layout: selectedLayout!.code!,
      variant: selectedVariant!.code!,
    );
    return _client.setKeyboard(keyboard);
  }
}
