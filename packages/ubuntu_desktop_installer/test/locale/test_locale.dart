import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_model.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_locale.mocks.dart';
export 'test_locale.mocks.dart';

@GenerateMocks([LocaleService, SoundService])
LocaleModel buildLocaleModel() {
  final locale = MockLocaleService();
  when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');

  return LocaleModel(
    locale: locale,
    sound: MockSoundService(),
  );
}

@GenerateMocks([TelemetryService])
Widget buildLocalePage(LocaleModel model) {
  registerMockService<TelemetryService>(MockTelemetryService());

  return ProviderScope(
    overrides: [
      localeModelProvider.overrideWith((_) => model),
    ],
    child: const LocalePage(),
  );
}
