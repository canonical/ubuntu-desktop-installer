import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_widgets.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test_utils.dart';
import 'welcome_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([UrlLauncher, NetworkService])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  late MaterialApp app;
  late WelcomeModel model;

  Future<void> setUpApp(WidgetTester tester, {bool isConnected = false}) async {
    final client = MockSubiquityClient();
    when(client.hasRst()).thenAnswer((_) async => false);
    final network = MockNetworkService();
    when(network.isConnected).thenReturn(isConnected);
    when(network.propertiesChanged).thenAnswer((_) => Stream.empty());
    model = WelcomeModel(client: client, network: network);

    app = MaterialApp(
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      locale: Locale('en'),
      home: InheritedLocale(
        child: Flavor(
          data: const FlavorData(name: 'Ubuntu'),
          child: Wizard(
            routes: {
              Routes.welcome: WizardRoute(
                builder: (_) => WelcomePage(),
                onNext: (settings) {
                  switch (model.option) {
                    case Option.repairUbuntu:
                      return Routes.repairUbuntu;
                    case Option.installUbuntu:
                      return Routes.keyboard;
                    default:
                      return null;
                  }
                },
              ),
              Routes.repairUbuntu: WizardRoute(
                builder: (context) => Text(Routes.repairUbuntu),
              ),
              Routes.keyboard: WizardRoute(
                builder: (context) => Text(Routes.keyboard),
              ),
            },
          ),
        ),
      ),
    );

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: model, child: app),
      ],
      child: InheritedLocale(child: app),
    ));

    expect(find.byType(WelcomePage), findsOneWidget);
  }

  testWidgets('should open release notes', (tester) async {
    await setUpApp(tester, isConnected: true);

    final label = find.byType(Html);
    expect(label, findsOneWidget);

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl(any)).thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.tapLink('release notes');

    const urlPattern = 'https://wiki.ubuntu.com/[A-Za-z]+/ReleaseNotes';
    verify(urlLauncher.launchUrl(argThat(matches(urlPattern)))).called(1);
  });

  testWidgets('should not find link to open release notes', (tester) async {
    await setUpApp(tester);

    final label = find.byType(Html).hitTestable();
    expect(label, findsNothing);
  });

  testWidgets('selecting an option should enable continuing', (tester) async {
    await setUpApp(tester);

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(nextButton).enabled, false);

    final options = find.byType(OptionButton);
    expect(options, findsWidgets);

    await tester.tap(options.first);
    await tester.pump();

    expect((nextButton.evaluate().single.widget as ButtonStyleButton).enabled,
        true);
  });

  testWidgets('install ubuntu', (tester) async {
    await setUpApp(tester);

    final option =
        find.widgetWithText(OptionButton, tester.lang.installUbuntu('Ubuntu'));
    expect(option, findsOneWidget);

    await tester.tap(option);
    await tester.pump();

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsNothing);
    expect(find.text(Routes.keyboard), findsOneWidget);
  });

  testWidgets('try ubuntu', (tester) async {
    await setUpApp(tester);

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(nextButton).enabled, isFalse);

    final option =
        find.widgetWithText(OptionButton, tester.lang.tryUbuntu('Ubuntu'));
    expect(option, findsOneWidget);

    await tester.tap(option);
    await tester.pump();

    expect(tester.widget<ButtonStyleButton>(nextButton).enabled, isTrue);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(nextButton);
    await tester.pump();

    await expectLater(windowClosed, completes);
  });
}
