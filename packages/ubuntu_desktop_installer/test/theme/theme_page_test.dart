import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/theme/theme_model.dart';
import 'package:ubuntu_desktop_installer/pages/theme/theme_page.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'test_theme.dart';

void main() {
  Widget buildPage(ThemeModel model) {
    return ProviderScope(
      overrides: [
        themeModelProvider.overrideWith((_) => model),
      ],
      child: const ThemePage(),
    );
  }

  testWidgets('brightness', (tester) async {
    final model = buildThemeModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final lightOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      const AssetImage('assets/theme/light-theme.png'),
    );
    expect(lightOptionCard, findsOneWidget);
    await tester.tap(lightOptionCard);
    verify(model.setBrightness(Brightness.light)).called(1);

    final darkOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      const AssetImage('assets/theme/dark-theme.png'),
    );
    expect(darkOptionCard, findsOneWidget);
    await tester.tap(darkOptionCard);
    verify(model.setBrightness(Brightness.dark)).called(1);
  });

  testWidgets('yaru accent', (tester) async {
    final model = buildThemeModel();
    await tester.pumpWidget(tester.buildApp(
        (_) => YaruTheme(builder: (context, yaru, child) => buildPage(model))));

    for (final variant in YaruVariant.values.take(10)) {
      final colorDisk = find.byWidgetPredicate((widget) {
        return widget is YaruColorDisk && widget.color == variant.color;
      });
      expect(colorDisk, findsOneWidget);

      await tester.tap(colorDisk);
      verify(model.setAccent(variant.name)).called(1);
    }
  });

  testWidgets('non-yaru theme', (tester) async {
    final model = buildThemeModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(YaruColorDisk), findsNothing);
  });
}
