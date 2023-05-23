import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_detector.dart';
import 'package:ubuntu_desktop_installer/services/keyboard_service.dart';

import 'test_keyboard.dart';

void main() {
  test('init', () async {
    final service = MockKeyboardService();
    when(service.getKeyboardStep('0')).thenAnswer((_) async {
      return const AnyStep.stepPressKey(keycodes: {}, symbols: ['a', 'b', 'c']);
    });

    final detector = KeyboardDetector(service);
    await detector.init();
    verify(service.getKeyboardStep('0')).called(1);

    expect(detector.value, isA<StepPressKey>());
    expect(detector.pressKey, equals(['a', 'b', 'c']));
  });

  test('key press', () async {
    final service = MockKeyboardService();
    when(service.getKeyboardStep('0')).thenAnswer((_) async {
      return const AnyStep.stepPressKey(
        symbols: ['a', 'b', 'c'],
        keycodes: {12: '34'},
      );
    });
    when(service.getKeyboardStep('34')).thenAnswer((_) async {
      return const AnyStep.stepKeyPresent(symbol: '56', yes: '', no: '');
    });

    final detector = KeyboardDetector(service);
    await detector.init();

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.press(12);
    verify(service.getKeyboardStep('34')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepKeyPresent>());
    expect(detector.keyPresent, equals('56'));
  });

  test('key present', () async {
    final service = MockKeyboardService();
    when(service.getKeyboardStep('78')).thenAnswer((_) async {
      return const AnyStep.stepResult(layout: 'is', variant: 'present');
    });

    late AnyStep result;
    final detector = KeyboardDetector(
      service,
      value: const AnyStep.stepKeyPresent(symbol: 'y', yes: '78', no: ''),
      onResult: (value) => result = value,
    );

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.yes();
    verify(service.getKeyboardStep('78')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepResult>());
    expect(result, equals(const StepResult(layout: 'is', variant: 'present')));
  });

  test('key not present', () async {
    final service = MockKeyboardService();
    when(service.getKeyboardStep('90')).thenAnswer((_) async {
      return const AnyStep.stepResult(layout: 'not', variant: 'present');
    });

    late AnyStep result;
    final detector = KeyboardDetector(
      service,
      value: const AnyStep.stepKeyPresent(symbol: 'n', yes: '', no: '90'),
      onResult: (value) => result = value,
    );

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.no();
    verify(service.getKeyboardStep('90')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepResult>());
    expect(result, equals(const StepResult(layout: 'not', variant: 'present')));
  });
}
