import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/services/keyboard_service.dart';

void main() {
  const keyboardSetup = KeyboardSetup(
    setting: KeyboardSetting(layout: 'us', variant: 'altgr-intl'),
    layouts: [
      KeyboardLayout(
        code: 'us',
        name: 'English (US)',
        variants: [
          KeyboardVariant(
            code: '',
            name: 'English (US)',
          ),
          KeyboardVariant(
            code: 'altgr-intl',
            name: 'English (US) - English (intl., with AltGr dead keys)',
          ),
        ],
      ),
      KeyboardLayout(
        code: 'de',
        name: 'German',
        variants: [KeyboardVariant(code: '', name: 'German')],
      ),
    ],
  );
  test('get keyboard', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboard()).thenAnswer((_) async => keyboardSetup);

    final service = SubiquityKeyboardService(client);
    expect(await service.getKeyboard(), equals(keyboardSetup));

    verify(client.getKeyboard()).called(1);
  });

  test('set keyboard', () async {
    final client = MockSubiquityClient();
    when(client.setKeyboard(keyboardSetup.setting)).thenAnswer((_) async {});

    final service = SubiquityKeyboardService(client);
    await service.setKeyboard(keyboardSetup.setting);

    verify(client.setKeyboard(keyboardSetup.setting)).called(1);
  });

  test('set input source', () async {
    final client = MockSubiquityClient();
    when(client.setInputSource(keyboardSetup.setting, user: 'ubuntu'))
        .thenAnswer((_) async {});

    final service = SubiquityKeyboardService(client);
    await service.setInputSource(keyboardSetup.setting, user: 'ubuntu');

    verify(client.setInputSource(keyboardSetup.setting, user: 'ubuntu'))
        .called(1);
  });

  test('get keyboard step', () async {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep(any)).thenAnswer(
        (_) async => const AnyStep.stepPressKey(keycodes: {}, symbols: []));

    final service = SubiquityKeyboardService(client);
    await service.getKeyboardStep('1');

    verify(client.getKeyboardStep('1')).called(1);
  });
}
