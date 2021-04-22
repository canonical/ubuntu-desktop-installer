import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/keyboard_model.dart';

void main() {
  KeyboardModel model;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    ServicesBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) {
      var key = utf8.decode(message.buffer.asUint8List());
      expect(key, 'assets/kbdnames.txt');
      var data = '''C*layout*fr*French
C*variant*fr**French
C*variant*fr*bepo*French - French (Bepo, ergonomic, Dvorak way)
C*variant*fr*bre*French - French (Breton)
C*layout*es*Spanish
C*variant*es**Spanish
C*variant*es*cat*Spanish - Catalan (Spain, with middle-dot L)
fr*layout*fr*Français
fr*variant*fr**Français
fr*variant*fr*bepo*Français - Français (Bépo, ergonomique, façon Dvorak)
fr*variant*fr*bre*Français - Français (breton)
fr*layout*es*Espagnol
fr*variant*es**Espagnol
fr*variant*es*cat*Espagnol - Catalan (Espagne, avec L point médian)
es*layout*fr*Francés
es*variant*fr**Francés
es*variant*fr*bepo*Francés - Francés (bepo, ergonómico, forma Dvorak)
es*variant*fr*bre*Francés - Francés (bretón)
es*layout*es*Español
es*variant*es**Español
es*variant*es*cat*Español - Catalán (España, con L con punto medio)''';
      return Future.value(utf8.encoder.convert(data).buffer.asByteData());
    });
  });

  setUp(() {
    model = KeyboardModel();
  });

  tearDown(() {
    model = null;
  });

  test('model should be initially empty', () {
    expect(model.layouts.isEmpty, true);
    expect(model.variants.isEmpty, true);
  });

  test('model should load mock data', () async {
    await model.load(Locale('fr'));
    final langcodes = ['fr', 'es'];
    expect(model.layouts.length, langcodes.length);
    for (final langcode in langcodes) {
      expect(
          model.layouts.indexWhere((layout) => layout.item1 == langcode) > -1,
          true);
    }
    expect(model.variants.keys.contains('C'), false);
    expect(model.variants.keys.contains('fr'), true);
    expect(model.variants['fr'].length, 3);
    expect(
        model.variants['fr']
            .singleWhere((variant) => variant.item1 == 'bepo')
            .item2,
        'Français - Français (Bépo, ergonomique, façon Dvorak)');
    expect(model.variants.keys.contains('es'), true);
    expect(model.variants['es'].length, 2);
    expect(
        model.variants['es']
            .singleWhere((variant) => variant.item1 == 'cat')
            .item2,
        'Espagnol - Catalan (Espagne, avec L point médian)');
  });

  test('loading again should work', () async {
    for (final langcode in ['fr', 'fr', 'es', 'fr']) {
      await model.load(Locale(langcode));
      expect(model.layouts.length, 2);
      expect(model.variants.length, 2);
    }
  });

  test('invalid language code should fall back to C', () async {
    await model.load(Locale('foo'));
    expect(model.layouts.length, 2);
    expect(model.variants.length, 2);
    expect(
        model.variants['fr']
            .singleWhere((variant) => variant.item1 == 'bepo')
            .item2,
        'French - French (Bepo, ergonomic, Dvorak way)');
  });
}
