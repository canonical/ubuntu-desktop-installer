import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/try_or_install_page.dart';
import 'package:ubuntu_desktop_installer/routes.dart';

import 'simple_navigator_observer.dart';

void main() {
  late SimpleNavigatorObserver observer;
  late MaterialApp app;

  Future<void> setUpApp(WidgetTester tester) async {
    observer = SimpleNavigatorObserver();
    app = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale('en'),
      home: TryOrInstallPage(),
      navigatorObservers: [observer],
      routes: <String, WidgetBuilder>{
        Routes.repairUbuntu: (context) => Container(),
        Routes.tryUbuntu: (context) => Container(),
        Routes.keyboardLayout: (context) => Container(),
      },
    );
    await tester.pumpWidget(app);
    expect(observer.pushed.length, 1);
    expect(observer.pushed.first.settings.name, '/');
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
}
