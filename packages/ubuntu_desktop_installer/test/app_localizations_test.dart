import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ubuntu_desktop_installer/l10n/app_localizations.dart';

void main() {
  group('Occitan', () {
    LocalizationsDelegateOc delegate;

    setUp(() {
      delegate = LocalizationsDelegateOc();
      initializeDateFormatting('oc');
    });

    tearDown(() {
      delegate = null;
    });

    test('supported locales', () {
      expect(delegate.isSupported(Locale('en')), false);
      expect(delegate.isSupported(Locale('fr')), false);
      expect(delegate.isSupported(Locale('oc')), true);
      expect(delegate.isSupported(Locale('ca')), false);
    });

    test('loading', () async {
      expect(() => delegate.load(Locale('fr')), throwsAssertionError);
      await delegate.load(Locale('oc'));
    });

    test('should not reload', () {
      expect(delegate.shouldReload(delegate), false);
      expect(delegate.shouldReload(null), false);
    });
  });
}
