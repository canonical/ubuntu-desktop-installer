import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/try_or_install/try_or_install_model.dart';
import 'package:ubuntu_desktop_installer/pages/try_or_install/try_or_install_page.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'try_or_install_page_test.mocks.dart';

@GenerateMocks([Settings])
void main() {
  late MaterialApp app;
  late TryOrInstallModel model;

  Future<void> setUpApp(WidgetTester tester) async {
    model = TryOrInstallModel();
    final settings = MockSettings();
    when(settings.locale).thenReturn(Locale('en'));

    app = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: localizationsDelegates,
      locale: Locale('en'),
      home: Wizard(
        routes: {
          Routes.tryOrInstall: (_) => TryOrInstallPage(),
          Routes.repairUbuntu: (context) => Text(Routes.repairUbuntu),
          Routes.tryUbuntu: (context) => Text(Routes.tryUbuntu),
          Routes.keyboardLayout: (context) => Text(Routes.keyboardLayout),
        },
        onNext: (settings) {
          switch (settings.name) {
            case Routes.tryOrInstall:
              switch (model.option) {
                case Option.repairUbuntu:
                  return Routes.repairUbuntu;
                case Option.tryUbuntu:
                  return Routes.tryUbuntu;
                case Option.installUbuntu:
                  return Routes.keyboardLayout;
                default:
                  break;
              }
          }
        },
      ),
    );

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: model, child: app),
        ChangeNotifierProvider<Settings>.value(value: settings),
      ],
      child: app,
    ));

    expect(find.byType(TryOrInstallPage), findsOneWidget);
  }

  testWidgets('should open release notes', (tester) async {
    await setUpApp(tester);

    final label = find.byType(Html);
    expect(label, findsOneWidget);

    final launches = <MethodCall>[];
    var channel = const MethodChannel('plugins.flutter.io/url_launcher');
    channel.setMockMethodCallHandler((methodCall) async {
      launches.add(methodCall);
    });
    var found = false;
    expect(
        find.descendant(
            of: label,
            matching: find.byWidgetPredicate((widget) {
              if (widget is RichText) {
                if (!widget.text.visitChildren((visitor) {
                  if (visitor is TextSpan && visitor.text == 'release notes') {
                    if (!found) {
                      found = true;
                      (visitor.recognizer as TapGestureRecognizer).onTap!();
                    }
                    return false;
                  }
                  return true;
                })) {
                  return true;
                }
              }
              return false;
            })),
        findsOneWidget);
    expect(launches.length, 1);
    expect(launches[0].method, 'launch');
    expect(launches[0].arguments['url'],
        matches('https://wiki.ubuntu.com/[A-Za-z]+/ReleaseNotes'));
    channel.setMockMethodCallHandler(null);
  });

  testWidgets('selecting an option should enable continuing', (tester) async {
    await setUpApp(tester);

    final continueButton = find.widgetWithText(OutlinedButton, 'Continue');
    expect(continueButton, findsOneWidget);
    expect((continueButton.evaluate().single.widget as OutlinedButton).enabled,
        false);

    final options = find.byType(OptionCard);
    expect(options, findsWidgets);

    await tester.tap(options.first);
    await tester.pump();

    expect((continueButton.evaluate().single.widget as OutlinedButton).enabled,
        true);
  });

  final options = {
    Routes.repairUbuntu: 'Repair installation',
    Routes.tryUbuntu: 'Try Ubuntu',
    Routes.keyboardLayout: 'Install Ubuntu'
  };
  options.forEach((key, value) {
    testWidgets('selecting option "$value"', (tester) async {
      await setUpApp(tester);

      final continueButton = find.widgetWithText(OutlinedButton, 'Continue');
      expect(continueButton, findsOneWidget);

      final option = find.widgetWithText(OptionCard, value);
      expect(option, findsOneWidget);

      await tester.tap(option);
      await tester.pump();

      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      expect(find.byType(TryOrInstallPage), findsNothing);
      expect(find.text(key), findsOneWidget);
    });
  });
}
