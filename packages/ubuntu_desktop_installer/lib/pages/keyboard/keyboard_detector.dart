import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('keyboard');

/// Detects keyboard layout with help of subiquity's keyboard API.
class KeyboardDetector extends ValueNotifier<AnyStep?> {
  /// Creates a keyboard layout detector with the given client. Optionally, the
  /// initial step and a result listener can be provided.
  KeyboardDetector(
    this._client, {
    AnyStep? value,
    ValueChanged<StepResult>? onResult,
  })  : _onResult = onResult,
        super(value);

  final SubiquityClient _client;
  final ValueChanged<StepResult>? _onResult;

  /// Returns the list of keys to be pressed.
  List<String>? get pressKey => _pressKeyStep?.symbols;
  StepPressKey? get _pressKeyStep =>
      value is StepPressKey ? value as StepPressKey : null;

  /// Returns the key to be presented.
  String? get keyPresent => _keyPresentStep?.symbol;
  StepKeyPresent? get _keyPresentStep =>
      value is StepKeyPresent ? value as StepKeyPresent : null;

  void _updateCurrentStep(AnyStep? step) {
    if (step is StepResult) {
      log.info('Detected ${step.layout} (${step.variant}) keyboard layout');
      _onResult?.call(step);
    }
    value = step;
  }

  /// Initializes the detector.
  Future<void> init() => _getKeyboardStep();

  /// Delivers a key press from the user. The detector proceeds to the next step
  /// if possible.
  void press(int keycode) {
    final step = _pressKeyStep?.keycodes[keycode];
    if (step != null) {
      _getKeyboardStep(step);
    }
  }

  /// Answers "yes" to whether a key is present. The detector proceeds to the
  /// next step if possible.
  void yes() => _getKeyboardStep(_keyPresentStep!.yes);

  /// Answers "no" to whether a key is present. The detector proceeds to the
  /// next step if possible.
  void no() => _getKeyboardStep(_keyPresentStep!.no);

  Future<void> _getKeyboardStep([String step = '0']) {
    return _client.getKeyboardStep(step).then(_updateCurrentStep);
  }
}
