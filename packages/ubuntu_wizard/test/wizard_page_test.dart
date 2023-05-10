import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/widgets.dart';

void main() {
  testWidgets('activation', (tester) async {
    var activated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          bottomBar: WizardBar(
            leading: WizardButton(
                label: 'action', onActivated: () => activated = true),
          ),
        ),
      ),
    );

    await tester.tap(find.descendant(
      of: find.byType(FilledButton),
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
          snackBar: const SnackBar(content: Text('snackbar')),
          bottomBar: const WizardBar(
            leading: WizardButton(label: 'back'),
            trailing: [
              WizardButton(label: 'next'),
            ],
          ),
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

    final snackBar = find.text('snackbar');
    expect(snackBar, findsOneWidget);

    final back = find.text('back');
    expect(back, findsOneWidget);

    final next = find.text('next');
    expect(next, findsOneWidget);

    expect(tester.getCenter(title).dy, lessThan(tester.getCenter(header).dy));
    expect(tester.getCenter(header).dy, lessThan(tester.getCenter(content).dy));
    expect(tester.getCenter(back).dx, lessThan(tester.getCenter(content).dx));
    expect(
        tester.getCenter(next).dx, greaterThan(tester.getCenter(content).dx));
  });

  testWidgets('normal/flat/highlighted action', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WizardPage(
          bottomBar: WizardBar(
            trailing: [
              WizardButton(label: 'normal'),
              WizardButton(label: 'flat', flat: true),
              WizardButton(label: 'highlighted', highlighted: true),
            ],
          ),
        ),
      ),
    );
    expect(find.button('normal'), findsOneWidget);
    expect(find.button('flat'), findsOneWidget);
    expect(find.button('highlighted'), findsOneWidget);
  });

  testWidgets('disabled action', (tester) async {
    var activated = false;

    await tester.pumpWidget(
      MaterialApp(
        home: WizardPage(
          bottomBar: WizardBar(
            trailing: [
              WizardButton(
                label: 'action',
                enabled: false,
                onActivated: () => activated = true,
              ),
            ],
          ),
        ),
      ),
    );

    await tester.tap(find.descendant(
      of: find.byType(FilledButton),
      matching: find.text('action'),
    ));
    expect(activated, isFalse);
  });

  testWidgets('hidden action', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WizardPage(
          bottomBar: WizardBar(
            trailing: [
              WizardButton(label: 'action', visible: false),
            ],
          ),
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
                bottomBar: WizardBar(
                  leading: WizardButton.previous(context),
                  trailing: [
                    WizardButton.next(context),
                  ],
                ),
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
        matching: find.text(lang.previousLabel),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byType(FilledButton),
        matching: find.text(lang.nextLabel),
      ),
      findsOneWidget,
    );
  });

  testWidgets('page indicator', (tester) async {
    final routes = <String, WizardRoute>{
      '/foo': WizardRoute(
        builder: (context) => const WizardPage(
          content: Text('Page 4 of 7'),
          bottomBar: WizardBar(),
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

  testWidgets('loading indicator', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: WizardButton(
          label: 'button',
          loading: true,
        ),
      ),
    );

    expect(find.text('button'), findsOneWidget);
    expect(find.byType(YaruCircularProgressIndicator), findsNothing);

    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('button'), findsNothing);
    expect(find.byType(YaruCircularProgressIndicator), findsOneWidget);

    await tester.pumpWidget(
      const MaterialApp(
        home: WizardButton(
          label: 'button',
        ),
      ),
    );

    expect(find.text('button'), findsOneWidget);
    expect(find.byType(YaruCircularProgressIndicator), findsNothing);
  });
}
