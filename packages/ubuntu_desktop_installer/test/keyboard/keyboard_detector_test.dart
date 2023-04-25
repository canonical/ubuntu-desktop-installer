import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_detector.dart';
import 'package:ubuntu_test/mocks.dart';

// ignore_for_file: type=lint

void main() {
  test('init', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('0')).thenAnswer((_) async {
      return AnyStep.stepPressKey(keycodes: {}, symbols: ['a', 'b', 'c']);
    });

    final detector = KeyboardDetector(client);
    await detector.init();
    verify(client.getKeyboardStep('0')).called(1);

    expect(detector.value, isA<StepPressKey>());
    expect(detector.pressKey, equals(['a', 'b', 'c']));
  });

  test('key press', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('0')).thenAnswer((_) async {
      return AnyStep.stepPressKey(
        symbols: ['a', 'b', 'c'],
        keycodes: {12: '34'},
      );
    });
    when(client.getKeyboardStep('34')).thenAnswer((_) async {
      return AnyStep.stepKeyPresent(symbol: '56', yes: '', no: '');
    });

    final detector = KeyboardDetector(client);
    await detector.init();

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.press(12);
    verify(client.getKeyboardStep('34')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepKeyPresent>());
    expect(detector.keyPresent, equals('56'));
  });

  test('key present', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('78')).thenAnswer((_) async {
      return AnyStep.stepResult(layout: 'is', variant: 'present');
    });

    late AnyStep result;
    final detector = KeyboardDetector(
      client,
      value: AnyStep.stepKeyPresent(symbol: 'y', yes: '78', no: ''),
      onResult: (value) => result = value,
    );

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.yes();
    verify(client.getKeyboardStep('78')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepResult>());
    expect(result, equals(StepResult(layout: 'is', variant: 'present')));
  });

  test('key not present', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep('90')).thenAnswer((_) async {
      return AnyStep.stepResult(layout: 'not', variant: 'present');
    });

    late AnyStep result;
    final detector = KeyboardDetector(
      client,
      value: AnyStep.stepKeyPresent(symbol: 'n', yes: '', no: '90'),
      onResult: (value) => result = value,
    );

    final waitNotify = Completer();
    detector.addListener(waitNotify.complete);

    detector.no();
    verify(client.getKeyboardStep('90')).called(1);

    await waitNotify.future;
    detector.removeListener(waitNotify.complete);

    expect(detector.value, isA<StepResult>());
    expect(result, equals(StepResult(layout: 'not', variant: 'present')));
  });
}
