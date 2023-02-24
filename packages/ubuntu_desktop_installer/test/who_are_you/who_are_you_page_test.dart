import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_model.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_page.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'who_are_you_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([WhoAreYouModel])
void main() {
  WhoAreYouModel buildModel({
    bool? isValid,
    String? realName,
    String? hostname,
    String? username,
    String? password,
    String? confirmedPassword,
    PasswordStrength? passwordStrength,
    bool? autoLogin,
    bool? showPassword,
  }) {
    final model = MockWhoAreYouModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.realName).thenReturn(realName ?? '');
    when(model.hostname).thenReturn(hostname ?? '');
    when(model.username).thenReturn(username ?? '');
    when(model.password).thenReturn(password ?? '');
    when(model.confirmedPassword).thenReturn(confirmedPassword ?? '');
    when(model.passwordStrength)
        .thenReturn(passwordStrength ?? PasswordStrength.weak);
    when(model.autoLogin).thenReturn(autoLogin ?? false);
    when(model.showPassword).thenReturn(showPassword ?? false);
    when(model.usernameOk).thenReturn(true);
    when(model.usernameValidation).thenReturn(UsernameValidation.OK);
    return model;
  }

  Widget buildPage(WhoAreYouModel model) {
    return ChangeNotifierProvider<WhoAreYouModel>.value(
      value: model,
      child: WhoAreYouPage(),
    );
  }

  testWidgets('real name input', (tester) async {
    final model = buildModel(realName: 'real name');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'real name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.realName = 'ubuntu').called(1);
  });

  testWidgets('host name input', (tester) async {
    final model = buildModel(hostname: 'host name');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'host name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.hostname = 'ubuntu').called(1);
  });

  testWidgets('username input', (tester) async {
    final model = buildModel(username: 'username');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'username');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.username = 'ubuntu').called(1);
  });

  testWidgets('password input', (tester) async {
    final model = buildModel(password: 'password');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'password');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
  });

  testWidgets('password confirmation', (tester) async {
    final model = buildModel(password: 'passwd', confirmedPassword: 'passwd');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'passwd');
    expect(textField, findsNWidgets(2));
    await tester.enterText(textField.first, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
    await tester.enterText(textField.last, 'ubuntu');
    verify(model.confirmedPassword = 'ubuntu').called(1);
  });

  testWidgets('password tab focus', (tester) async {
    final model = buildModel(password: 'passwd', confirmedPassword: 'confirm');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final passwordField = find.widgetWithText(TextField, 'passwd');
    expect(passwordField, findsOneWidget);

    await tester.tap(passwordField);

    final passwordFocus = tester.widget<TextField>(passwordField).focusNode;
    expect(passwordFocus?.hasFocus, isTrue);

    final confirmPasswordField = find.widgetWithText(TextField, 'confirm');
    expect(confirmPasswordField, findsOneWidget);

    final confirmPasswordFocus =
        tester.widget<TextField>(confirmPasswordField).focusNode;
    expect(confirmPasswordFocus?.hasFocus, isFalse);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);

    expect(passwordFocus?.hasFocus, isFalse);
    expect(confirmPasswordFocus?.hasFocus, isFalse);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);

    expect(confirmPasswordFocus?.hasFocus, isTrue);
  });

  testWidgets('empty password', (tester) async {
    final model = buildModel(password: '');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(WhoAreYouPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.weakPassword), findsNothing);
    expect(find.text(lang.fairPassword), findsNothing);
    expect(find.text(lang.goodPassword), findsNothing);
    expect(find.text(lang.strongPassword), findsNothing);
  });

  testWidgets('weak password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.weak,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(WhoAreYouPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.weakPassword), findsOneWidget);
  });

  testWidgets('fair password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.fair,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(WhoAreYouPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.fairPassword), findsOneWidget);
  });

  testWidgets('good password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.good,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(WhoAreYouPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.goodPassword), findsOneWidget);
  });

  testWidgets('strong password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.strong,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(WhoAreYouPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.strongPassword), findsOneWidget);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<FilledButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<FilledButton>(continueButton).enabled, isFalse);
  });

  testWidgets('auto-login', (tester) async {
    final model = buildModel(autoLogin: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final requiredPasswordSwitch = find.widgetWithText(
      YaruSwitchButton,
      tester.lang.whoAreYouPageRequirePassword,
    );
    expect(requiredPasswordSwitch, findsOneWidget);
    expect(
        tester.widget<YaruSwitchButton>(requiredPasswordSwitch).value, isFalse);

    await tester.tap(requiredPasswordSwitch);
    verify(model.autoLogin = false).called(1);
  });

  testWidgets('show password', (tester) async {
    final model = buildModel(showPassword: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final showPasswordButton = find.ancestor(
      of: find.text(tester.lang.whoAreYouPagePasswordShow),
      matching: find.bySubtype<OutlinedButton>(),
    );
    expect(showPasswordButton, findsOneWidget);

    await tester.tap(showPasswordButton);
    verify(model.showPassword = true).called(1);
  });

  testWidgets('hide password', (tester) async {
    final model = buildModel(showPassword: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final hidePasswordButton = find.ancestor(
      of: find.text(tester.lang.whoAreYouPagePasswordHide),
      matching: find.bySubtype<OutlinedButton>(),
    );
    expect(hidePasswordButton, findsOneWidget);

    await tester.tap(hidePasswordButton);
    verify(model.showPassword = false).called(1);
  });

  testWidgets('save identity', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveIdentity()).called(1);
  });
}
