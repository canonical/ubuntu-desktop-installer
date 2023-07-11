import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_provision/src/identity/identity_l10n.dart';
import 'package:ubuntu_provision/src/identity/identity_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_identity.dart';

void main() {
  testWidgets('real name input', (tester) async {
    final model = buildIdentityModel(realName: 'real name');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final textField = find.textField('real name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.realName = 'ubuntu').called(1);
  });

  testWidgets('host name input', (tester) async {
    final model = buildIdentityModel(hostname: 'host name');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final textField = find.textField('host name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.hostname = 'ubuntu').called(1);
  });

  testWidgets('username input', (tester) async {
    final model = buildIdentityModel(username: 'username');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final textField = find.textField('username');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.username = 'ubuntu').called(1);
  });

  testWidgets('password input', (tester) async {
    final model = buildIdentityModel(password: 'password');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final textField = find.textField('password');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
  });

  testWidgets('password confirmation', (tester) async {
    final model =
        buildIdentityModel(password: 'passwd', confirmedPassword: 'passwd');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final textField = find.textField('passwd');
    expect(textField, findsNWidgets(2));
    await tester.enterText(textField.first, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
    await tester.enterText(textField.last, 'ubuntu');
    verify(model.confirmedPassword = 'ubuntu').called(1);
  });

  testWidgets('password tab focus', (tester) async {
    final model =
        buildIdentityModel(password: 'passwd', confirmedPassword: 'confirm');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

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
    final model = buildIdentityModel(password: '');
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = UbuntuLocalizations.of(context);

    expect(find.text(l10n.weakPassword), findsNothing);
    expect(find.text(l10n.fairPassword), findsNothing);
    expect(find.text(l10n.goodPassword), findsNothing);
    expect(find.text(l10n.strongPassword), findsNothing);
  });

  testWidgets('weak password', (tester) async {
    final model = buildIdentityModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.weak,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = UbuntuLocalizations.of(context);

    expect(find.text(l10n.weakPassword), findsOneWidget);
  });

  testWidgets('fair password', (tester) async {
    final model = buildIdentityModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.fair,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = UbuntuLocalizations.of(context);

    expect(find.text(l10n.fairPassword), findsOneWidget);
  });

  testWidgets('good password', (tester) async {
    final model = buildIdentityModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.good,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = UbuntuLocalizations.of(context);

    expect(find.text(l10n.goodPassword), findsOneWidget);
  });

  testWidgets('strong password', (tester) async {
    final model = buildIdentityModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.strong,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = UbuntuLocalizations.of(context);

    expect(find.text(l10n.strongPassword), findsOneWidget);
  });

  testWidgets('valid input', (tester) async {
    final model = buildIdentityModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    expect(find.button(find.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildIdentityModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    expect(find.button(find.nextLabel), isDisabled);
  });

  testWidgets('auto-login', (tester) async {
    final model = buildIdentityModel(autoLogin: true);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = IdentityLocalizations.of(context);

    final requiredPasswordSwitch = find.switchButton(
      l10n.identityRequirePassword,
    );
    expect(requiredPasswordSwitch, findsOneWidget);
    expect(requiredPasswordSwitch, isNotChecked);

    await tester.tap(requiredPasswordSwitch);
    verify(model.autoLogin = false).called(1);
  });

  testWidgets('show password', (tester) async {
    final model = buildIdentityModel(showPassword: false);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = IdentityLocalizations.of(context);

    final showPasswordButton = find.button(l10n.identityPasswordShow);
    expect(showPasswordButton, findsOneWidget);

    await tester.tap(showPasswordButton);
    verify(model.showPassword = true).called(1);
  });

  testWidgets('hide password', (tester) async {
    final model = buildIdentityModel(showPassword: true);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = IdentityLocalizations.of(context);

    final hidePasswordButton = find.button(l10n.identityPasswordHide);
    expect(hidePasswordButton, findsOneWidget);

    await tester.tap(hidePasswordButton);
    verify(model.showPassword = false).called(1);
  });

  testWidgets('save identity', (tester) async {
    final model = buildIdentityModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    await tester.tapNext();
    verify(model.save()).called(1);
  });

  testWidgets('has active directory support', (tester) async {
    final model =
        buildIdentityModel(isConnected: true, hasActiveDirectorySupport: true);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = IdentityLocalizations.of(context);

    final checkbox = find.checkButton(l10n.identityActiveDirectoryOption);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isNotChecked);
    expect(checkbox, isEnabled);

    await tester.tap(checkbox);
    verify(model.useActiveDirectory = true).called(1);
  });

  testWidgets('no active directory support', (tester) async {
    final model =
        buildIdentityModel(isConnected: true, hasActiveDirectorySupport: false);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = IdentityLocalizations.of(context);

    final checkbox = find.checkButton(l10n.identityActiveDirectoryOption);
    expect(checkbox, findsNothing);
  });

  testWidgets('no site-level connectivity', (tester) async {
    final model =
        buildIdentityModel(isConnected: false, hasActiveDirectorySupport: true);
    await tester.pumpWidget(tester.buildApp((_) => buildIdentityPage(model)));

    final context = tester.element(find.byType(IdentityPage));
    final l10n = IdentityLocalizations.of(context);

    final checkbox = find.checkButton(l10n.identityActiveDirectoryOption);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isNotChecked);
    expect(checkbox, isDisabled);

    await tester.tap(checkbox);
    verifyNever(model.useActiveDirectory = true);
  });
}
