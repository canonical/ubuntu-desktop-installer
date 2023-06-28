import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/theme_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';

void main() {
  testWidgets('ThemePage applies theme', (tester) async {
    final theme = MockThemeService();
    registerMockService<ThemeService>(theme);

    await tester.pumpWidget(tester.buildApp((_) => const ThemePage()));

    final lightOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      const AssetImage('assets/theme/light-theme.png'),
    );
    expect(lightOptionCard, findsOneWidget);
    await tester.tap(lightOptionCard);
    verify(theme.setBrightness(Brightness.light));

    final darkOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      const AssetImage('assets/theme/dark-theme.png'),
    );
    expect(darkOptionCard, findsOneWidget);
    await tester.tap(darkOptionCard);
    verify(theme.setBrightness(Brightness.dark));
  });
}
