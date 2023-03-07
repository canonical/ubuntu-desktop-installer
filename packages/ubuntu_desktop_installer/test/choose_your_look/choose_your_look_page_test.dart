import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/choose_your_look_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'choose_your_look_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([DesktopService])
void main() {
  testWidgets('ChooseYourLookPage applies theme', (tester) async {
    final DesktopService desktop = MockDesktopService();
    registerMockService(desktop);

    await tester.pumpWidget(tester.buildApp(ChooseYourLookPage.create));

    final lightOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      AssetImage('assets/choose_your_look/light-theme.png'),
    );
    expect(lightOptionCard, findsOneWidget);
    await tester.tap(lightOptionCard);
    verify(desktop.setTheme(Brightness.light));

    final darkOptionCard = find.widgetWithImage(
      YaruSelectableContainer,
      AssetImage('assets/choose_your_look/dark-theme.png'),
    );
    expect(darkOptionCard, findsOneWidget);
    await tester.tap(darkOptionCard);
    verify(desktop.setTheme(Brightness.dark));
  });
}
