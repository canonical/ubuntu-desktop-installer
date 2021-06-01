import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/wizard_page.dart';

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
          title: const Text('title'),
          header: const Text('header'),
          content: const Text('content'),
          footer: const Text('footer'),
          actions: <WizardAction>[
            const WizardAction(label: 'back'),
            const WizardAction(label: 'next'),
          ],
        ),
      ),
    );

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

    expect(tester.getCenter(title).dy, lessThan(tester.getCenter(header).dy));
    expect(tester.getCenter(header).dy, lessThan(tester.getCenter(content).dy));
    expect(tester.getCenter(content).dy, lessThan(tester.getCenter(footer).dy));
  });

  testWidgets('highlighted action', (tester) async {
    final buttonTheme = OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((_) => Colors.red),
        foregroundColor: MaterialStateColor.resolveWith((_) => Colors.blue),
      ),
    );

    final button = find.widgetWithText(OutlinedButton, 'action');

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(outlinedButtonTheme: buttonTheme),
        home: WizardPage(
          actions: <WizardAction>[
            const WizardAction(label: 'action', highlighted: false),
          ],
        ),
      ),
    );
    expect(tester.widget<OutlinedButton>(button).style, isNull);

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(outlinedButtonTheme: buttonTheme),
        home: WizardPage(
          actions: <WizardAction>[
            const WizardAction(label: 'action', highlighted: true),
          ],
        ),
      ),
    );
    expect(tester.widget<OutlinedButton>(button).style, isNotNull);
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
          actions: <WizardAction>[
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
}
