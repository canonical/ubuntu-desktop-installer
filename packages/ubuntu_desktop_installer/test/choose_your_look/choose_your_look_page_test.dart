import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/choose_your_look_page.dart';
import 'package:ubuntu_desktop_installer/settings.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'choose_your_look_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([Settings])
void main() {
  testWidgets('ChooseYourLookPage applies theme', (tester) async {
    final Settings settings = MockSettings();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: settings,
        child: tester.buildApp(ChooseYourLookPage.create),
      ),
    );

    final lightOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      AssetImage('assets/choose_your_look/light-theme.png'),
    );
    expect(lightOptionCard, findsOneWidget);
    await tester.tap(lightOptionCard);
    verify(settings.applyTheme(Brightness.light));

    final darkOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      AssetImage('assets/choose_your_look/dark-theme.png'),
    );
    expect(darkOptionCard, findsOneWidget);
    await tester.tap(darkOptionCard);
    verify(settings.applyTheme(Brightness.dark));
  });
}
