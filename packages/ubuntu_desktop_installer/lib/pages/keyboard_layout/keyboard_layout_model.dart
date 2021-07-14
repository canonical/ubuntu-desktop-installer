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
    @visibleForTesting ProcessRunner processRunner = const ProcessRunner(),
  })  : _client = client,
        _keyboardModel = keyboardModel,
        _processRunner = processRunner;

  final SubiquityClient _client;
  final KeyboardModel _keyboardModel;
  final ProcessRunner _processRunner;

  /// The number of available keyboard layouts.
  int get layoutCount => _keyboardModel.layouts.length;

  /// Returns the name of the keyboard layout at [index].
  ///
  /// Note: the index must be valid.
  String layoutName(int index) {
    assert(index >= 0 && index < layoutCount);
    return _keyboardModel.layouts[index].name!;
  }

  /// The index of the currently selected layout.
  int get selectedLayoutIndex => _selectedLayoutIndex;
  int _selectedLayoutIndex = -1;

  KeyboardLayout? get _selectedLayout => (_selectedLayoutIndex > -1)
      ? _keyboardModel.layouts[_selectedLayoutIndex]
      : null;

  /// Selects the keyboard layout at [index].
  void selectLayout(int index) {
    assert(index > -1 && index < layoutCount);
    if (_selectedLayoutIndex == index) return;
    _selectedLayoutIndex = index;
    _selectedVariantIndex =
        _selectedLayout!.variants?.isNotEmpty == true ? 0 : -1;
    _setXkbMap();
    notifyListeners();
  }

  /// The number of available layout variants.
  int get variantCount => _selectedLayout?.variants?.length ?? 0;

  /// Returns the name of the layout variant at [index].
  ///
  /// Note: the index must be valid.
  String variantName(int index) {
    assert(index >= 0 && index < variantCount);
    return _selectedLayout!.variants![index].name!;
  }

  /// The index of the currently selected layout variant.
  int get selectedVariantIndex => _selectedVariantIndex;
  int _selectedVariantIndex = -1;

  KeyboardVariant? get _selectedVariant =>
      _selectedLayout?.variants?.elementAtOrNull(_selectedVariantIndex);

  /// Selects the keyboard layout variant at [index].
  void selectVariant(int index) {
    assert(index > -1 && index < variantCount);
    if (_selectedVariantIndex == index) return;
    _selectedVariantIndex = index;
    _setXkbMap();
    notifyListeners();
  }

  Future<void> _setXkbMap() async {
    final arguments = <String>[
      '-layout',
      _selectedLayout!.code!,
      if (_selectedVariant != null) '-variant',
      if (_selectedVariant != null) _selectedVariant!.code!,
    ];
    return _processRunner
        .run('setxkbmap', arguments)
        .then((result) {})
        .catchError((e) {
      print(e as ProcessException);
    });
  }

  /// Whether the layout and variant selections are valid.
  bool get isValid => _selectedLayoutIndex > -1 && _selectedVariantIndex > -1;

  /// Initializes the model and detects the current system keyboard layout and
  /// variant.
  Future<void> init() async {
    final detectedLayout = await detectKeyboardLayout();
    _selectedLayoutIndex = _keyboardModel.layouts.indexWhere((layout) {
      return layout.code == detectedLayout;
    });
    if (_selectedLayoutIndex > -1) {
      final detectedVariant = await detectLayoutVariant();
      _selectedVariantIndex = _selectedLayout!.variants?.indexWhere((variant) {
            return (variant.code ?? '') == (detectedVariant ?? '');
          }) ??
          -1;
    }
    notifyListeners();
  }

  KeyboardInfo? __info;
  Future<KeyboardInfo> _getKeyboardInfo() async {
    return __info ??= await getKeyboardInfo();
  }

  /// Detects the current system keyboard layout.
  @visibleForTesting
  Future<String?> detectKeyboardLayout() async {
    return _getKeyboardInfo().then((info) => info.layout);
  }

  /// Detects the current system keyboard layout variant.
  @visibleForTesting
  Future<String?> detectLayoutVariant() {
    return _getKeyboardInfo().then((info) => info.variant);
  }

  /// Applies the selected keyboard layout and variant to the system.
  Future<void> applyKeyboardSettings() {
    final keyboard = KeyboardSetting(
      layout: _selectedLayout!.code!,
      variant: _selectedVariant?.code!,
    );
    return _client.setKeyboard(keyboard);
  }
}

/// Runs a process in a way that it can be mocked for testing.
@visibleForTesting
class ProcessRunner {
  /// Creates a process runner.
  const ProcessRunner();

  /// Runs a process. See [Process.run].
  Future<ProcessResult> run(String executable, List<String> arguments) {
    return Process.run(executable, arguments);
  }
}

extension _ListOrNull<T> on List<T> {
  T? elementAtOrNull(int index) =>
      index < 0 || index >= length ? null : this[index];
}
