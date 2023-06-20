import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  Widget buildPage(BuildContext context, String title) {
    return WizardPage(
      content: Text(title),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [WizardButton.next(context)],
      ),
    );
  }

  testWidgets('nested wizard', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
        home: Wizard(
          routes: {
            '/1': WizardRoute(builder: (ctx) => buildPage(ctx, '1')),
            '/2': WizardRoute(
              builder: (_) => Wizard(
                routes: {
                  '/a': WizardRoute(builder: (ctx) => buildPage(ctx, '2A')),
                  '/b': WizardRoute(builder: (ctx) => buildPage(ctx, '2B')),
                  '/c': WizardRoute(builder: (ctx) => buildPage(ctx, '2C')),
                },
              ),
            ),
            '/3': WizardRoute(builder: (ctx) => buildPage(ctx, '3')),
          },
        ),
      ),
    );

    final page1 = find.text('1');
    final page2a = find.text('2A');
    final page2b = find.text('2B');
    final page2c = find.text('2C');
    final page3 = find.text('3');

    await tester.pumpAndSettle();
    expect(page1, findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(page2a, findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(page2b, findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(page2c, findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(page3, findsOneWidget);

    await tester.tapPrevious();
    await tester.pumpAndSettle();
    expect(page2c, findsOneWidget);

    await tester.tapPrevious();
    await tester.pumpAndSettle();
    expect(page2b, findsOneWidget);

    await tester.tapPrevious();
    await tester.pumpAndSettle();
    expect(page2a, findsOneWidget);

    await tester.tapPrevious();
    await tester.pumpAndSettle();
    expect(page1, findsOneWidget);
  });

  testWidgets('nested on-load', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
        home: Wizard(
          routes: {
            '/1': WizardRoute(builder: (ctx) => buildPage(ctx, '1')),
            '/2': WizardRoute(
              builder: (_) => Wizard(
                routes: {
                  '/a': WizardRoute(builder: (ctx) => buildPage(ctx, '2A')),
                  '/b': WizardRoute(
                    builder: (ctx) => buildPage(ctx, '2B'),
                    onLoad: (_) =>
                        Future.delayed(Duration.zero).then((_) => false),
                  ),
                  '/c': WizardRoute(
                    builder: (ctx) => buildPage(ctx, '2C'),
                    onLoad: (_) =>
                        Future.delayed(Duration.zero).then((_) => false),
                  ),
                },
              ),
            ),
            '/3': WizardRoute(builder: (ctx) => buildPage(ctx, '3')),
          },
        ),
      ),
    );

    final page1 = find.text('1');
    final page2a = find.text('2A');
    final page3 = find.text('3');

    await tester.pumpAndSettle();
    expect(page1, findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(page2a, findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(page3, findsOneWidget);

    await tester.tapPrevious();
    await tester.pumpAndSettle();
    expect(page2a, findsOneWidget);

    await tester.tapPrevious();
    await tester.pumpAndSettle();
    expect(page1, findsOneWidget);
  });
}
