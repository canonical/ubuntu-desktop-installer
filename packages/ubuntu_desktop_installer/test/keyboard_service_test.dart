import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/keyboard_service.dart';

class SubiquityClientMock extends SubiquityClient {
  // ignore: type_annotate_public_apis
  var lang = '';

  @override
  Future<KeyboardSetup> keyboard() async {
    // ignore: omit_local_variable_types
    List<KeyboardLayout> layouts = [];
    switch (lang) {
      case 'fr':
        layouts.add(KeyboardLayout(code: 'fr', name: 'Français', variants: [
          KeyboardVariant(code: '', name: 'Français'),
          KeyboardVariant(
              code: 'bepo',
              name: 'Français - Français (Bépo, ergonomique, façon Dvorak)'),
          KeyboardVariant(code: 'bre', name: 'Français - Français (breton)')
        ]));
        layouts.add(KeyboardLayout(code: 'es', name: 'Espagnol', variants: [
          KeyboardVariant(code: '', name: 'Espagnol'),
          KeyboardVariant(
              code: 'cat',
              name: 'Espagnol - Catalan (Espagne, avec L point médian)'),
        ]));
        break;
      default:
    }
    return KeyboardSetup(layouts: layouts, setting: null);
  }
}

void main() {
  late SubiquityClientMock clientMock;
  late KeyboardService model;

  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  setUp(() {
    clientMock = SubiquityClientMock();
    model = KeyboardService();
  });

  test('model should be initially empty', () {
    expect(model.layouts, isEmpty);
  });

  test('model should load mock data', () async {
    clientMock.lang = 'fr';
    await model.load(clientMock);
    final langcodes = ['fr', 'es'];
    expect(model.layouts.length, langcodes.length);
    for (final langcode in langcodes) {
      expect(model.layouts.indexWhere((layout) => layout.code == langcode),
          greaterThan(-1));
    }
  });

  test('model should be empty', () async {
    clientMock.lang = 'fr';
    await model.load(clientMock);
    expect(model.layouts, isNotEmpty);

    clientMock.lang = 'invalid';
    await model.load(clientMock);
    expect(model.layouts, isEmpty);
  });

  test('loading again should work', () async {
    clientMock.lang = 'fr';
    for (var i = 0; i < 3; ++i) {
      await model.load(clientMock);
      expect(model.layouts.length, 2);
    }
  });
}
