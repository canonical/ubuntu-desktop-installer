import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/keyboard_service.dart';
import 'package:xdg_locale/xdg_locale.dart';

import 'desktop_service_test.mocks.dart';
import 'locale_service_test.mocks.dart';

@GenerateMocks([XdgLocaleClient, GSettings])
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
    ],
  );
  group('subiquity', () {
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
  });

  group('xdg', () {
    test('get keyboard', () async {
      final client = MockXdgLocaleClient();
      when(client.x11Layout).thenReturn('us');
      when(client.x11Variant).thenReturn('altgr-intl');
      when(client.vConsoleKeymapToggle).thenReturn('');

      final service = XdgKeyboardService(client, MockGSettings());
      expect(
        await service.getKeyboard(),
        equals(const KeyboardSetup(
          setting: KeyboardSetting(layout: 'us', variant: 'altgr-intl'),
          layouts: [],
        )),
      );
    });

    test('set keyboard', () async {
      final client = MockXdgLocaleClient();
      when(client.setX11Keyboard(any, any, any, any, any, any))
          .thenAnswer((_) async {});
      when(client.x11Model).thenReturn('pc105');
      when(client.x11Options).thenReturn('terminate:ctrl_alt_bksp');

      final service = XdgKeyboardService(client, MockGSettings());
      await service.setKeyboard(keyboardSetup.setting);

      verify(client.setX11Keyboard(
        'us',
        'pc105',
        'altgr-intl',
        'terminate:ctrl_alt_bksp',
        false,
        false,
      )).called(1);
    });

    test('set input source', () async {
      final gsettings = MockGSettings();
      when(gsettings.set('sources', any)).thenAnswer((_) async {});

      final service = XdgKeyboardService(MockXdgLocaleClient(), gsettings);
      await service.setInputSource(keyboardSetup.setting);

      verify(gsettings.set(
        'sources',
        DBusArray(
          DBusSignature.struct([DBusSignature.string, DBusSignature.string]),
          [
            DBusStruct(const [DBusString('xkb'), DBusString('us+altgr-intl')])
          ],
        ),
      )).called(1);
    });
  });
}
