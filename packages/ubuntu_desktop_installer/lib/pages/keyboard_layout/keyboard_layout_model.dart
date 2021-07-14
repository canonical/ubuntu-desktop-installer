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
    notifyListeners();
  }

  /// The index of the currently selected layout variant.
  //int get selectedVariantIndex => _selectedVariantIndex;
  int selectedVariantIndex = -1;

  KeyboardVariant? get selectedVariant => (selectedVariantIndex > -1)
      ? selectedLayout?.variants?.elementAt(selectedVariantIndex)
      : null;
}
