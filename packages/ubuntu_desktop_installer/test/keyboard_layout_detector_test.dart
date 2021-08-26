import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_detector.dart';

import 'keyboard_layout_detector_test.mocks.dart';

@GenerateMocks([SubiquityClient])
void main() {
  test('init', () async {
    final client = MockSubiquityClient();
    final detector = KeyboardLayoutDetector(client);

    when(client.getKeyboardStep(null)).thenAnswer((_) async {
      return KeyboardStep.pressKey(symbols: ['a', 'b', 'c']);
    });

    await detector.init();
    verify(client.getKeyboardStep(null)).called(1);

    expect(detector.value, isA<StepPressKey>());
    expect(detector.pressKey, equals(['a', 'b', 'c']));
  });

  test('key press', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('12')).thenAnswer((_) async {
      return KeyboardStep.keyPresent(symbol: '3');
    });

    final detector = KeyboardLayoutDetector(client);

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.press(12);
    verify(client.getKeyboardStep('12')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepKeyPresent>());
    expect(detector.keyPresent, equals('3'));
  });

  test('key present', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('45')).thenAnswer((_) async {
      return KeyboardStep.result(layout: 'is', variant: 'present');
    });

    late KeyboardStep result;
    final detector = KeyboardLayoutDetector(
      client,
      value: KeyboardStep.keyPresent(symbol: 'y', yes: '45'),
      onResult: (value) => result = value,
    );

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.yes();
    verify(client.getKeyboardStep('45')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepResult>());
    expect(result, equals(StepResult(layout: 'is', variant: 'present')));
  });

  test('key not present', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('67')).thenAnswer((_) async {
      return KeyboardStep.result(layout: 'not', variant: 'present');
    });

    late KeyboardStep result;
    final detector = KeyboardLayoutDetector(
      client,
      value: KeyboardStep.keyPresent(symbol: 'n', no: '67'),
      onResult: (value) => result = value,
    );

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.no();
    verify(client.getKeyboardStep('67')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepResult>());
    expect(result, equals(StepResult(layout: 'not', variant: 'present')));
  });
}
