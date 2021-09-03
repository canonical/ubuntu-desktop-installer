import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('input validation', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            validator: MinLengthValidator(2, errorText: 'error'),
            successWidget: const Text('success'),
          ),
        ),
      ),
    );

    expect(find.text('error'), findsNothing);
    expect(find.text('success'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'u');
    await tester.pumpAndSettle();

    expect(find.text('error'), findsOneWidget);
    expect(find.text('success'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'buntu');
    await tester.pumpAndSettle();

    expect(find.text('error'), findsNothing);
    expect(find.text('success'), findsOneWidget);
  });

  testWidgets('input with controller', (tester) async {
    final controller = TextEditingController(text: 'value');
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            controller: controller,
          ),
        ),
      ),
    );

    expect(find.text('value'), findsOneWidget);

    await tester.enterText(find.byType(ValidatedFormField), 'ubuntu');

    expect(controller.text, equals('ubuntu'));
    expect(find.text('ubuntu'), findsOneWidget);
  });

  testWidgets('initial value and changes', (tester) async {
    String? value;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            initialValue: 'initial',
            onChanged: (v) => value = v,
          ),
        ),
      ),
    );

    expect(find.text('initial'), findsOneWidget);

    await tester.enterText(find.byType(ValidatedFormField), 'ubuntu');

    expect(value, equals('ubuntu'));
    expect(find.text('ubuntu'), findsOneWidget);
  });

  testWidgets('fixed field width', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            fieldWidth: 123,
            spacing: 45,
          ),
        ),
      ),
    );

    final field = find.byType(TextFormField);
    expect(tester.getRect(field).width, equals(123));
  });

  testWidgets('constrained field width', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: SizedBox(
              width: 123,
              child: ValidatedFormField(spacing: 45),
            ),
          ),
        ),
      ),
    );

    final field = find.byType(TextFormField);
    expect(tester.getRect(field).width, equals(123 - 45));
  });

  testWidgets('icon baseline alignment', (tester) async {
    Widget buildWithHelperText(String? helperText) {
      return MaterialApp(
        home: Material(
          child: Center(
            child: ValidatedFormField(
              successWidget: SuccessIcon(),
              helperText: helperText,
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(buildWithHelperText(null));

    expect(
      tester.getRect(find.byType(SuccessIcon)).center.dy,
      moreOrLessEquals(tester.getRect(find.byType(EditableText)).center.dy,
          epsilon: 1),
    );

    await tester.pumpWidget(buildWithHelperText('helper'));

    expect(
      tester.getRect(find.byType(SuccessIcon)).center.dy,
      moreOrLessEquals(tester.getRect(find.byType(EditableText)).center.dy,
          epsilon: 1),
    );
  });

  testWidgets('equal input', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            validator: EqualValidator('ubuntu', errorText: 'not equal'),
            successWidget: const Text('equal'),
          ),
        ),
      ),
    );

    expect(find.text('equal'), findsNothing);
    expect(find.text('not equal'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'ubuntu');
    await tester.pumpAndSettle();

    expect(find.text('equal'), findsOneWidget);
    expect(find.text('not equal'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'foobar');
    await tester.pumpAndSettle();

    expect(find.text('equal'), findsNothing);
    expect(find.text('not equal'), findsOneWidget);
  });

  testWidgets('equal empty input', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            validator: EqualValidator('', errorText: 'not equal'),
            successWidget: const Text('equal'),
          ),
        ),
      ),
    );

    expect(find.text('equal'), findsOneWidget);
    expect(find.text('not equal'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'foobar');
    await tester.pumpAndSettle();

    expect(find.text('equal'), findsNothing);
    expect(find.text('not equal'), findsOneWidget);

    await tester.enterText(find.byType(ValidatedFormField), '');
    await tester.pumpAndSettle();

    expect(find.text('equal'), findsOneWidget);
    expect(find.text('not equal'), findsNothing);
  });
}
