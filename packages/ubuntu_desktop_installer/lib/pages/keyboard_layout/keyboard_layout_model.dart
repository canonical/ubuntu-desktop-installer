import 'dart:io';

import 'package:flutter/foundation.dart';
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

  /// Applies the selected keyboard layout and variant to the system.
  Future<void> applyKeyboardSettings() {
    final keyboard = KeyboardSetting(
      layout: selectedLayout!.code!,
      variant: selectedVariant!.code!,
    );
    return _client.setKeyboard(keyboard);
  }
}
