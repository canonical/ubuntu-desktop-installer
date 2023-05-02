import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_model.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_page.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'identity_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([IdentityModel])
void main() {
  IdentityModel buildModel({
    bool? isValid,
    String? realName,
    String? hostname,
    String? username,
    String? password,
    String? confirmedPassword,
    PasswordStrength? passwordStrength,
    bool? autoLogin,
    bool? showPassword,
    bool? isConnected,
    bool? hasActiveDirectorySupport,
    bool? useActiveDirectory,
  }) {
    final model = MockIdentityModel();
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
    when(model.isConnected).thenReturn(isConnected ?? false);
    when(model.hasActiveDirectorySupport)
        .thenReturn(hasActiveDirectorySupport ?? false);
    when(model.useActiveDirectory).thenReturn(useActiveDirectory ?? false);
    return model;
  }

  Widget buildPage(IdentityModel model) {
    return ChangeNotifierProvider<IdentityModel>.value(
      value: model,
      child: IdentityPage(),
    );
  }

  testWidgets('real name input', (tester) async {
    final model = buildModel(realName: 'real name');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('real name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.realName = 'ubuntu').called(1);
  });

  testWidgets('host name input', (tester) async {
    final model = buildModel(hostname: 'host name');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('host name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.hostname = 'ubuntu').called(1);
  });

  testWidgets('username input', (tester) async {
    final model = buildModel(username: 'username');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('username');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.username = 'ubuntu').called(1);
  });

  testWidgets('password input', (tester) async {
    final model = buildModel(password: 'password');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('password');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
  });

  testWidgets('password confirmation', (tester) async {
    final model = buildModel(password: 'passwd', confirmedPassword: 'passwd');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('passwd');
    expect(textField, findsNWidgets(2));
    await tester.enterText(textField.first, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
    await tester.enterText(textField.last, 'ubuntu');
    verify(model.confirmedPassword = 'ubuntu').called(1);
  });

  testWidgets('password tab focus', (tester) async {
    final model = buildModel(password: 'passwd', confirmedPassword: 'confirm');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final passwordField = find.textField('passwd');
    expect(passwordField, findsOneWidget);

    await tester.tap(passwordField);

    expect(passwordField, hasFocus);

    final confirmPasswordField = find.textField('confirm');
    expect(confirmPasswordField, findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);

    expect(passwordField, hasNoFocus);
    expect(confirmPasswordField, hasNoFocus);

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);

    expect(confirmPasswordField, hasFocus);
  });

  testWidgets('empty password', (tester) async {
    final model = buildModel(password: '');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(IdentityPage));
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

    final context = tester.element(find.byType(IdentityPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.weakPassword), findsOneWidget);
  });

  testWidgets('fair password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.fair,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.fairPassword), findsOneWidget);
  });

  testWidgets('good password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.good,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.goodPassword), findsOneWidget);
  });

  testWidgets('strong password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.strong,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final lang = UbuntuLocalizations.of(context);

    expect(find.text(lang.strongPassword), findsOneWidget);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.nextLabel), isDisabled);
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
      matching: find.bySubtype<ButtonStyleButton>(),
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
      matching: find.bySubtype<ButtonStyleButton>(),
    );
    expect(hidePasswordButton, findsOneWidget);

    await tester.tap(hidePasswordButton);
    verify(model.showPassword = false).called(1);
  });

  testWidgets('save identity', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    verify(model.save()).called(1);
  });

  testWidgets('has active directory support', (tester) async {
    final model =
        buildModel(isConnected: true, hasActiveDirectorySupport: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox =
        find.widgetWithText(YaruCheckButton, tester.lang.activeDirectoryOption);
    expect(checkbox, findsOneWidget);
    expect(tester.widget<YaruCheckButton>(checkbox).value, isFalse);
    expect(tester.widget<YaruCheckButton>(checkbox).onChanged, isNotNull);

    await tester.tap(checkbox);
    verify(model.useActiveDirectory = true).called(1);
  });

  testWidgets('no active directory support', (tester) async {
    final model =
        buildModel(isConnected: true, hasActiveDirectorySupport: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox =
        find.widgetWithText(YaruCheckButton, tester.lang.activeDirectoryOption);
    expect(checkbox, findsNothing);
  });

  testWidgets('no site-level connectivity', (tester) async {
    final model =
        buildModel(isConnected: false, hasActiveDirectorySupport: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox =
        find.widgetWithText(YaruCheckButton, tester.lang.activeDirectoryOption);
    expect(checkbox, findsOneWidget);
    expect(tester.widget<YaruCheckButton>(checkbox).value, isFalse);
    expect(tester.widget<YaruCheckButton>(checkbox).onChanged, isNull);

    await tester.tap(checkbox);
    verifyNever(model.useActiveDirectory = true);
  });
}
