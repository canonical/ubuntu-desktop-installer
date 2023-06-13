import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_welcome/services/xdg_locale_service.dart';
import 'package:xdg_locale/xdg_locale.dart';

import 'xdg_locale_service_test.mocks.dart';

@GenerateMocks([XdgLocaleClient])
void main() {
  test('get locale', () async {
    final client = MockXdgLocaleClient();
    when(client.locale).thenAnswer((_) => {'LANG': 'en_US.UTF-8'});

    final service = XdgLocaleService(client);
    expect(await service.getLocale(), equals('en_US.UTF-8'));
  });

  test('set locale', () async {
    final client = MockXdgLocaleClient();
    when(client.locale).thenAnswer((_) => {
          'LANG': 'en_US.UTF-8',
          'LC_MESSAGES': 'en_US.UTF-8',
        });

    final service = XdgLocaleService(client);
    await service.setLocale('en_GB.UTF-8');

    verify(client.setLocale({
      'LANG': 'en_GB.UTF-8',
      'LC_MESSAGES': 'en_GB.UTF-8',
    }, false))
        .called(1);
  });
}
