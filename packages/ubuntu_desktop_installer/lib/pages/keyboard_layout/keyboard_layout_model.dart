import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:keyboard_info/keyboard_info.dart';
import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../services.dart';

/// @internal
final log = Logger('keyboard_layout');

/// Implements the business logic of the Keyboard Layout page.
class KeyboardLayoutModel extends ChangeNotifier {
  /// Creates a model with the specified [client] and [keyboardService].
  KeyboardLayoutModel({
    required SubiquityClient client,
    required KeyboardService keyboardService,
    @visibleForTesting ProcessRunner processRunner = const ProcessRunner(),
  })  : _client = client,
        _keyboardService = keyboardService,
        _processRunner = processRunner;

  final SubiquityClient _client;
  final KeyboardService _keyboardService;
  final ProcessRunner _processRunner;

  /// The number of available keyboard layouts.
  int get layoutCount => _keyboardService.layouts.length;

  /// Returns the name of the keyboard layout at [index].
  ///
  /// Note: the index must be valid.
  String layoutName(int index) {
    assert(index >= 0 && index < layoutCount);
    return _keyboardService.layouts[index].name!;
  }

  /// The index of the currently selected layout.
  int get selectedLayoutIndex => _selectedLayoutIndex;
  int _selectedLayoutIndex = -1;

  KeyboardLayout? get _selectedLayout => (_selectedLayoutIndex > -1)
      ? _keyboardService.layouts[_selectedLayoutIndex]
      : null;

  /// Emits keyboard layout selection changes.
  Stream<int> get onLayoutSelected => _onLayoutSelected.stream;
  final _onLayoutSelected = StreamController<int>();

  /// Emits keyboard layout variant selection changes.
  Stream<int> get onVariantSelected => _onVariantSelected.stream;
  final _onVariantSelected = StreamController<int>();

  /// Selects the keyboard layout at [index].
  void selectLayout(int index, [int variant = 0]) {
    assert(index > -1 && index < layoutCount);
    if (_selectedLayoutIndex == index) return;
    _selectedLayoutIndex = index;
    _selectedVariantIndex =
        _selectedLayout!.variants?.isNotEmpty == true ? variant : -1;
    log.info(
        'Selected ${_selectedLayout?.code} (${_selectedVariant?.code}) keyboard layout');
    _setXkbMap();
    notifyListeners();
  }

  /// Tries to find and select a keyboard layout and variant.
  void trySelectLayoutVariant(String? layout, String? variant) {
    final layoutIndex =
        _keyboardService.layouts.indexWhere((l) => l.code == layout);
    if (layoutIndex != -1) {
      final variantIndex = _keyboardService.layouts[layoutIndex].variants
              ?.indexWhere((v) => v.code == variant) ??
          -1;
      selectLayout(layoutIndex, variantIndex);
      _onLayoutSelected.add(layoutIndex);
      _onVariantSelected.add(variantIndex);
    }
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
    log.info(
        'Selected ${_selectedLayout?.code} (${_selectedVariant?.code}) keyboard layout');
    _setXkbMap();
    notifyListeners();
  }

  Future<void> _setXkbMap() {
    final arguments = <String>[
      '-layout',
      _selectedLayout!.code!,
      if (_selectedVariant != null) '-variant',
      if (_selectedVariant != null) _selectedVariant!.code!,
    ];
    return _processRunner.run('setxkbmap', arguments);
  }

  /// Whether the layout and variant selections are valid.
  bool get isValid => _selectedLayoutIndex > -1 && _selectedVariantIndex > -1;

  /// Initializes the model and detects the current system keyboard layout and
  /// variant.
  Future<void> init() async {
    final detectedLayout = await detectKeyboardLayout();
    _selectedLayoutIndex = _keyboardService.layouts.indexWhere((layout) {
      return layout.code == detectedLayout;
    });
    if (_selectedLayoutIndex > -1) {
      final detectedVariant = await detectLayoutVariant();
      _selectedVariantIndex = _selectedLayout!.variants?.indexWhere((variant) {
            return (variant.code ?? '') == (detectedVariant ?? '');
          }) ??
          -1;
    }
    log.info(
        'Initialized ${_selectedLayout?.code} (${_selectedVariant?.code}) keyboard layout');
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
    final layout = _selectedLayout!.code!;
    final variant = _selectedVariant?.code;
    final keyboard = KeyboardSetting(layout: layout, variant: variant);
    log.info('Set $layout ($variant) as system keyboard layout');
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
