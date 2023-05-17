import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_test/ubuntu_test.dart';

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

  testWidgets('rebuild initial value', (tester) async {
    final controller = TextEditingController(text: 'initial');

    Widget buildValidatedFormField({String? initialValue}) {
      return MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            controller: controller,
            initialValue: initialValue,
          ),
        ),
      );
    }

    await tester.pumpWidget(buildValidatedFormField(initialValue: null));
    expect(find.textField('initial'), findsOneWidget);
    expect(controller.text, equals('initial'));

    await tester.pumpWidget(buildValidatedFormField(initialValue: 'rebuild'));
    expect(find.textField('rebuild'), findsOneWidget);
    expect(controller.text, equals('rebuild'));
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

  testWidgets('default spacing', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Center(
            child: SizedBox(
              width: 123,
              child: ValidatedFormField(),
            ),
          ),
        ),
      ),
    );

    final field = find.byType(TextFormField);
    expect(tester.getRect(field).width, equals(123));
  });

  testWidgets('icon baseline alignment', (tester) async {
    Widget buildWithHelperText(String? helperText) {
      return MaterialApp(
        home: Material(
          child: Center(
            child: ValidatedFormField(
              successWidget: const SuccessIcon(),
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

  testWidgets('focus node is attached', (tester) async {
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(focusNode: focusNode),
        ),
      ),
    );

    expect(
      tester.widget<TextField>(find.byType(TextField)).focusNode,
      equals(focusNode),
    );
  });

  testWidgets('initial autofocus', (tester) async {
    final focusNode = FocusNode();
    expect(focusNode.hasFocus, isFalse);

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(autofocus: true, focusNode: focusNode),
        ),
      ),
    );

    expect(focusNode.hasFocus, isTrue);
  });

  testWidgets('no initial autofocus', (tester) async {
    final focusNode = FocusNode();
    expect(focusNode.hasFocus, isFalse);

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(autofocus: false, focusNode: focusNode),
        ),
      ),
    );

    expect(focusNode.hasFocus, isFalse);
  });

  testWidgets('initial focus with focus node', (tester) async {
    final focusNode = FocusNode();
    expect(focusNode.hasFocus, isFalse);

    focusNode.requestFocus();
    await tester.pump();
    expect(focusNode.hasFocus, isFalse); // the focus node is not yet attached

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(focusNode: focusNode),
        ),
      ),
    );

    expect(focusNode.hasFocus, isTrue);
  });

  testWidgets('request focus and unfocus', (tester) async {
    final focusNode = FocusNode();
    expect(focusNode.hasFocus, isFalse);

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(focusNode: focusNode),
        ),
      ),
    );

    expect(focusNode.hasFocus, isFalse);

    focusNode.requestFocus();
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    focusNode.unfocus();
    await tester.pump();
    expect(focusNode.hasFocus, isFalse);
  });

  testWidgets('focus node disposal', (tester) async {
    final externalFocusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(focusNode: externalFocusNode),
        ),
      ),
    );
    await tester.pumpWidget(const MaterialApp());
    await tester.pumpAndSettle();

    await expectLater(
      () => externalFocusNode.addListener(() {}),
      isNot(throwsAssertionError),
    );
  });

  testWidgets('callback validation', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            validator: CallbackValidator((v) => v == 'ubuntu',
                errorText: 'not ubuntu'),
            successWidget: const Text('is ubuntu'),
          ),
        ),
      ),
    );

    expect(find.text('is ubuntu'), findsNothing);
    expect(find.text('not ubuntu'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'ubuntu');
    await tester.pumpAndSettle();

    expect(find.text('is ubuntu'), findsOneWidget);
    expect(find.text('not ubuntu'), findsNothing);

    await tester.enterText(find.byType(ValidatedFormField), 'foobar');
    await tester.pumpAndSettle();

    expect(find.text('is ubuntu'), findsNothing);
    expect(find.text('not ubuntu'), findsOneWidget);
  });

  testWidgets('select all', (tester) async {
    final controller = TextEditingController(text: 'Ubuntu');
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            controller: controller,
            focusNode: focusNode,
          ),
        ),
      ),
    );

    expect(controller.selection.isCollapsed, isTrue);

    focusNode.requestFocus();
    await tester.pump();

    expect(controller.selection.isCollapsed, isFalse);
    expect(controller.selection.baseOffset, 0);
    expect(controller.selection.extentOffset, controller.text.length);
  });
}
