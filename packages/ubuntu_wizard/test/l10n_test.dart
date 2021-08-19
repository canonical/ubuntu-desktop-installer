import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/l10n.dart';

void main() {
  test('load localized languages', () async {
    const testLocales = [
      Locale('fr', 'FR'),
      Locale('es', 'ES'),
      Locale('en', 'US'),
      Locale('ru'),
    ];

    expect(
      await loadLocalizedLanguages(testLocales),
      equals([
        LocalizedLanguage('English', Locale('en', 'US')),
        LocalizedLanguage('Español', Locale('es', 'ES')),
        LocalizedLanguage('Français', Locale('fr', 'FR')),
      ]),
    );
  });
}
