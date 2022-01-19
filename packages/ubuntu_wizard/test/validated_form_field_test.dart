import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';

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
    ValidatedString? string;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ValidatedFormField(
            autofocus: true,
            initialValue: 'initial',
            onChanged: (v) => string = v,
          ),
        ),
      ),
    );

    expect(find.text('initial'), findsOneWidget);

    await tester.enterText(find.byType(ValidatedFormField), 'ubuntu');

    expect(string, isNotNull);
    expect(string!.value, equals('ubuntu'));
    expect(string!.isValid, isTrue);
    expect(find.text('ubuntu'), findsOneWidget);
  });

  testWidgets('rebuild initial value', (tester) async {
    final controller = TextEditingController(text: 'initial');

    Widget buildValidatedFormField({String? initialValue}) {
      return MaterialApp(
        home: Material(
          child: ValidatedFormField(
            controller: controller,
            initialValue: initialValue,
          ),
        ),
      );
    }

    await tester.pumpWidget(buildValidatedFormField(initialValue: null));
    expect(find.widgetWithText(TextField, 'initial'), findsOneWidget);
    expect(controller.text, equals('initial'));

    await tester.pumpWidget(buildValidatedFormField(initialValue: 'rebuild'));
    expect(find.widgetWithText(TextField, 'rebuild'), findsOneWidget);
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

  testWidgets('real name input', (tester) async {
    ValidatedString? realName;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: RealNameFormField(
            autofocus: true,
            realName: '',
            onChanged: (v) => realName = v,
          ),
        ),
      ),
    );

    expect(find.byType(SuccessIcon), findsNothing);
    expect(realName, isNotNull);
    expect(realName!.value, isEmpty);
    expect(realName!.isValid, isFalse);

    await tester.enterText(find.byType(TextField), 'real name');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsOneWidget);
    expect(realName, isNotNull);
    expect(realName!.value, equals('real name'));
    expect(realName!.isValid, isTrue);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsNothing);
    expect(realName, isNotNull);
    expect(realName!.value, isEmpty);
    expect(realName!.isValid, isFalse);
  });

  testWidgets('username input', (tester) async {
    ValidatedString? username;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: UsernameFormField(
            autofocus: true,
            username: '',
            onChanged: (v) => username = v,
          ),
        ),
      ),
    );

    expect(find.byType(SuccessIcon), findsNothing);
    expect(username, isNotNull);
    expect(username!.value, isEmpty);
    expect(username!.isValid, isFalse);

    await tester.enterText(find.byType(TextField), 'username');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsOneWidget);
    expect(username, isNotNull);
    expect(username!.value, equals('username'));
    expect(username!.isValid, isTrue);

    await tester.enterText(find.byType(TextField), '1nv@lid!');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsNothing);
    expect(username, isNotNull);
    expect(username!.value, equals('1nv@lid!'));
    expect(username!.isValid, isFalse);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsNothing);
    expect(username, isNotNull);
    expect(username!.value, isEmpty);
    expect(username!.isValid, isFalse);
  });

  testWidgets('hostname input', (tester) async {
    ValidatedString? hostname;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: HostnameFormField(
            autofocus: true,
            hostname: '',
            onChanged: (v) => hostname = v,
          ),
        ),
      ),
    );

    expect(find.byType(SuccessIcon), findsNothing);
    expect(hostname, isNotNull);
    expect(hostname!.value, isEmpty);
    expect(hostname!.isValid, isFalse);

    await tester.enterText(find.byType(TextField), 'hostname');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsOneWidget);
    expect(hostname, isNotNull);
    expect(hostname!.value, equals('hostname'));
    expect(hostname!.isValid, isTrue);

    await tester.enterText(find.byType(TextField), '@#%&/!');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsNothing);
    expect(hostname, isNotNull);
    expect(hostname!.value, equals('@#%&/!'));
    expect(hostname!.isValid, isFalse);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(find.byType(SuccessIcon), findsNothing);
    expect(hostname, isNotNull);
    expect(hostname!.value, isEmpty);
    expect(hostname!.isValid, isFalse);
  });

  testWidgets('password input', (tester) async {
    ValidatedString? password;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: GlobalUbuntuLocalizations.delegates,
        home: Material(
          child: PasswordFormField(
            autofocus: true,
            password: 'password',
            passwordStrength: PasswordStrength.good,
            onChanged: (v) => password = v,
          ),
        ),
      ),
    );

    final state =
        tester.state<PasswordFormFieldState>(find.byType(PasswordFormField));

    expect(find.byType(SuccessIcon), findsNothing);
    expect(password, isNotNull);
    expect(password!.value, equals('password'));
    expect(password!.isValid, isTrue);

    await tester.enterText(find.byType(TextField), 'drowssap');
    await tester.pump();
    expect(state.obscureText, isTrue);
    expect(password, isNotNull);
    expect(password!.value, equals('drowssap'));
    expect(password!.isValid, isTrue);

    await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(state.obscureText, isFalse);
    expect(password, isNotNull);
    expect(password!.value, equals('drowssap'));
    expect(password!.isValid, isTrue);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(password, isNotNull);
    expect(password!.value, isEmpty);
    expect(password!.isValid, isFalse);
  });

  testWidgets('confirmed password input', (tester) async {
    ValidatedString? confirmedPassword;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ConfirmPasswordFormField(
            autofocus: true,
            password: 'password',
            confirmedPassword: 'password',
            onChanged: (v) => confirmedPassword = v,
          ),
        ),
      ),
    );

    final state = tester.state<ConfirmPasswordFormFieldState>(
        find.byType(ConfirmPasswordFormField));

    expect(state.obscureText, isTrue);

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();
    expect(find.byType(SuccessIcon), findsOneWidget);
    expect(state.obscureText, isFalse);
    expect(confirmedPassword, isNotNull);
    expect(confirmedPassword!.value, 'password');
    expect(confirmedPassword!.isValid, isTrue);

    await tester.enterText(find.byType(TextField), '');
    await tester.pump();
    expect(confirmedPassword, isNotNull);
    expect(confirmedPassword!.value, isEmpty);
    expect(confirmedPassword!.isValid, isFalse);
  });

  testWidgets('unconfirmed password input', (tester) async {
    ValidatedString? confirmedPassword;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: ConfirmPasswordFormField(
            autofocus: true,
            password: 'password',
            confirmedPassword: '',
            onChanged: (v) => confirmedPassword = v,
          ),
        ),
      ),
    );

    expect(find.byType(SuccessIcon), findsNothing);
    expect(confirmedPassword, isNotNull);
    expect(confirmedPassword!.value, isEmpty);
    expect(confirmedPassword!.isValid, isFalse);

    await tester.enterText(find.byType(TextField), 'password');
    await tester.pump();
    expect(confirmedPassword, isNotNull);
    expect(confirmedPassword!.value, equals('password'));
    expect(confirmedPassword!.isValid, isTrue);
  });
}
