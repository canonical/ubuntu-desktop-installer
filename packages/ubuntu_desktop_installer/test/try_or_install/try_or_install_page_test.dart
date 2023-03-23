import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/try_or_install/try_or_install_model.dart';
import 'package:ubuntu_desktop_installer/pages/try_or_install/try_or_install_page.dart';
import 'package:ubuntu_desktop_installer/pages/try_or_install/try_or_install_widgets.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test_utils.dart';
import 'try_or_install_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([UrlLauncher])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  late MaterialApp app;
  late TryOrInstallModel model;

  Future<void> setUpApp(WidgetTester tester) async {
    model = TryOrInstallModel();

    app = MaterialApp(
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      locale: Locale('en'),
      home: InheritedLocale(
        child: Flavor(
          data: const FlavorData(name: 'Ubuntu'),
          child: Wizard(
            routes: {
              Routes.tryOrInstall: WizardRoute(
                builder: (_) => TryOrInstallPage(),
                onNext: (settings) {
                  switch (model.option) {
                    case Option.repairUbuntu:
                      return Routes.repairUbuntu;
                    case Option.installUbuntu:
                      return Routes.keyboardLayout;
                    default:
                      return null;
                  }
                },
              ),
              Routes.repairUbuntu: WizardRoute(
                builder: (context) => Text(Routes.repairUbuntu),
              ),
              Routes.keyboardLayout: WizardRoute(
                builder: (context) => Text(Routes.keyboardLayout),
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

    expect(find.byType(TryOrInstallPage), findsOneWidget);
  }

  testWidgets('should open release notes', (tester) async {
    await setUpApp(tester);

    final label = find.byType(Html);
    expect(label, findsOneWidget);

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl(any)).thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.tapLink('release notes');

    const urlPattern = 'https://wiki.ubuntu.com/[A-Za-z]+/ReleaseNotes';
    verify(urlLauncher.launchUrl(argThat(matches(urlPattern)))).called(1);
  });

  testWidgets('selecting an option should enable continuing', (tester) async {
    await setUpApp(tester);

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);
    expect(
        (continueButton.evaluate().single.widget as ButtonStyleButton).enabled,
        false);

    final options = find.byType(OptionButton);
    expect(options, findsWidgets);

    await tester.tap(options.first);
    await tester.pump();

    expect(
        (continueButton.evaluate().single.widget as ButtonStyleButton).enabled,
        true);
  });

  testWidgets('install ubuntu', (tester) async {
    await setUpApp(tester);

    final option =
        find.widgetWithText(OptionButton, tester.lang.installUbuntu('Ubuntu'));
    expect(option, findsOneWidget);

    await tester.tap(option);
    await tester.pump();

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    expect(find.byType(TryOrInstallPage), findsNothing);
    expect(find.text(Routes.keyboardLayout), findsOneWidget);
  });

  testWidgets('try ubuntu', (tester) async {
    await setUpApp(tester);

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, isFalse);

    final option =
        find.widgetWithText(OptionButton, tester.lang.tryUbuntu('Ubuntu'));
    expect(option, findsOneWidget);

    await tester.tap(option);
    await tester.pump();

    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, isTrue);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(continueButton);
    await tester.pump();

    await expectLater(windowClosed, completes);
  });
}
