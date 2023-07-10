import 'dart:convert';

import 'package:dbus/dbus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gsettings/gsettings.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:ubuntu_welcome/services/xdg_keyboard_service.dart';
import 'package:xdg_locale/xdg_locale.dart';

import 'xdg_keyboard_service_test.mocks.dart';

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
      KeyboardLayout(
        code: 'de',
        name: 'German',
        variants: [KeyboardVariant(code: '', name: 'German')],
      ),
    ],
  );
  test('get keyboard', () async {
    final client = MockXdgLocaleClient();
    when(client.x11Layout).thenReturn('us');
    when(client.x11Variant).thenReturn('altgr-intl');
    when(client.vConsoleKeymapToggle).thenReturn('');
    when(client.locale).thenReturn({'LANG': 'en_US.UTF-8'});

    final fakeAssetBundle = FakeAssetBundle(
      {
        'assets/kbds/en.jsonl': '["us", "English (US)", [["", "English (US)"],'
            '["altgr-intl", "English (US) - English (intl., with AltGr dead keys)"]]]\n'
            '["de", "German", [["", "German"]]]'
      },
    );

    final service = XdgKeyboardService(
      client,
      MockGSettings(),
      fakeAssetBundle,
    );
    expect(await service.getKeyboard(), equals(keyboardSetup));
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
}

class FakeAssetBundle extends CachingAssetBundle {
  FakeAssetBundle(this._fakeAssets);

  final Map<String, String> _fakeAssets;

  @override
  Future<ByteData> load(String key) async {
    var bytes = Uint8List(0);
    final fakes = Map.fromEntries(_fakeAssets.keys.map((e) => MapEntry(e, [
          {'asset': e, 'dpr': 1.0}
        ])));
    switch (key) {
      case 'AssetManifest.bin': // 3.10.0
      case 'AssetManifest.smcbin': // 3.10.1+
        return const StandardMessageCodec().encodeMessage(fakes)!;
      case 'AssetManifest.json':
        bytes = Uint8List.fromList(jsonEncode(fakes).codeUnits);
        break;
      default:
        if (_fakeAssets.containsKey(key)) {
          bytes = utf8.encoder.convert(_fakeAssets[key]!);
        }
        break;
    }
    return ByteData.view(bytes.buffer);
  }
}
