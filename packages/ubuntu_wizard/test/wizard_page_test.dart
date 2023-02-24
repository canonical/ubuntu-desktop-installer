import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/widgets.dart';

// ignore_for_file: type=lint

void main() {
  testWidgets('activation', (tester) async {
    var activated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          actions: <WizardAction>[
            WizardAction(label: 'action', onActivated: () => activated = true),
          ],
        ),
      ),
    );

    await tester.tap(find.descendant(
      of: find.byType(OutlinedButton),
      matching: find.text('action'),
    ));
    expect(activated, isTrue);
  });

  testWidgets('layout', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          title: AppBar(title: const Text('title')),
          header: const Text('header'),
          content: const Text('content'),
          footer: const Text('footer'),
          snackBar: const SnackBar(content: Text('snackbar')),
          actions: const <WizardAction>[
            WizardAction(label: 'back'),
            WizardAction(label: 'next'),
          ],
        ),
      ),
    );
    await tester.pumpAndSettle();

    final title = find.descendant(
      of: find.byType(AppBar),
      matching: find.text('title'),
    );
    expect(title, findsOneWidget);

    final header = find.text('header');
    expect(header, findsOneWidget);

    final content = find.text('content');
    expect(content, findsOneWidget);

    final footer = find.text('footer');
    expect(footer, findsOneWidget);

    final snackBar = find.text('snackbar');
    expect(snackBar, findsOneWidget);

    expect(tester.getCenter(title).dy, lessThan(tester.getCenter(header).dy));
    expect(tester.getCenter(header).dy, lessThan(tester.getCenter(content).dy));
    expect(tester.getCenter(content).dy, lessThan(tester.getCenter(footer).dy));
  });

  testWidgets('highlighted action', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          actions: const <WizardAction>[
            WizardAction(label: 'action', highlighted: false),
          ],
        ),
      ),
    );
    expect(find.widgetWithText(OutlinedButton, 'action'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'action'), findsNothing);

    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          actions: const <WizardAction>[
            WizardAction(label: 'action', highlighted: true),
          ],
        ),
      ),
    );
    expect(find.widgetWithText(OutlinedButton, 'action'), findsNothing);
    expect(find.widgetWithText(ElevatedButton, 'action'), findsOneWidget);
  });

  testWidgets('disabled action', (tester) async {
    var activated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          actions: <WizardAction>[
            WizardAction(
              label: 'action',
              enabled: false,
              onActivated: () => activated = true,
            ),
          ],
        ),
      ),
    );

    await tester.tap(find.descendant(
      of: find.byType(OutlinedButton),
      matching: find.text('action'),
    ));
    expect(activated, isFalse);
  });

  testWidgets('hidden action', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          actions: const <WizardAction>[
            WizardAction(label: 'action', visible: false),
          ],
        ),
      ),
    );

    expect(
      find.descendant(
        of: find.byType(OutlinedButton),
        matching: find.text('action'),
      ),
      findsNothing,
    );
  });

  testWidgets('common actions', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
        home: Wizard(routes: {
          '/': WizardRoute(builder: (_) {
            return Builder(builder: (context) {
              return WizardPage(
                actions: <WizardAction>[
                  WizardAction.back(context),
                  WizardAction.next(context),
                ],
              );
            });
          }),
        }),
      ),
    );

    final context = tester.element(find.byType(WizardPage));
    final lang = UbuntuLocalizations.of(context);

    expect(
      find.descendant(
        of: find.byType(OutlinedButton),
        matching: find.text(lang.backAction),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byType(OutlinedButton),
        matching: find.text(lang.continueAction),
      ),
      findsOneWidget,
    );
  });

  testWidgets('page indicator', (tester) async {
    final routes = <String, WizardRoute>{
      '/foo': WizardRoute(
        builder: (context) => WizardPage(
          content: const Text('Page 4 of 7'),
        ),
        userData: 3,
      ),
    };
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
        home: Wizard(
          userData: 7,
          routes: routes,
          initialRoute: '/foo',
        ),
      ),
    );

    final indicatorFinder = find.byType(YaruPageIndicator);
    expect(indicatorFinder, findsOneWidget);
    expect(find.text('Page 4 of 7'), findsOneWidget);
    expect((indicatorFinder.evaluate().first.widget as YaruPageIndicator).page,
        equals(3));
  });
}
