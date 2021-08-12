import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_model.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_page.dart';
import 'package:wizard_router/wizard_router.dart';

import 'who_are_you_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([WhoAreYouModel])
void main() {
  WhoAreYouModel buildModel({
    bool? isValid,
    String? realName,
    String? hostName,
    String? username,
    String? password,
    String? confirmedPassword,
    PasswordStrength? passwordStrength,
    LoginStrategy? loginStrategy,
  }) {
    final model = MockWhoAreYouModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.realName).thenReturn(realName ?? '');
    when(model.hostName).thenReturn(hostName ?? '');
    when(model.username).thenReturn(username ?? '');
    when(model.password).thenReturn(password ?? '');
    when(model.confirmedPassword).thenReturn(confirmedPassword ?? '');
    when(model.passwordStrength)
        .thenReturn(passwordStrength ?? PasswordStrength.weak);
    when(model.loginStrategy)
        .thenReturn(loginStrategy ?? LoginStrategy.autoLogin);
    return model;
  }

  Widget buildPage(WhoAreYouModel model) {
    return ChangeNotifierProvider<WhoAreYouModel>.value(
      value: model,
      child: WhoAreYouPage(),
    );
  }

  Widget buildApp(WidgetTester tester, WhoAreYouModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('real name input', (tester) async {
    final model = buildModel(realName: 'real name');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'real name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.realName = 'ubuntu').called(1);
  });

  testWidgets('host name input', (tester) async {
    final model = buildModel(hostName: 'host name');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'host name');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.hostName = 'ubuntu').called(1);
  });

  testWidgets('username input', (tester) async {
    final model = buildModel(username: 'username');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'username');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.username = 'ubuntu').called(1);
  });

  testWidgets('password input', (tester) async {
    final model = buildModel(password: 'password');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'password');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
  });

  testWidgets('password confirmation', (tester) async {
    final model = buildModel(password: 'passwd', confirmedPassword: 'passwd');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'passwd');
    expect(textField, findsNWidgets(2));
    await tester.enterText(textField.first, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
    await tester.enterText(textField.last, 'ubuntu');
    verify(model.confirmedPassword = 'ubuntu').called(1);
  });

  testWidgets('empty password', (tester) async {
    final model = buildModel(password: '');
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.lang.weakPassword), findsNothing);
    expect(find.text(tester.lang.moderatePassword), findsNothing);
    expect(find.text(tester.lang.strongPassword), findsNothing);
  });

  testWidgets('weak password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.weak,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.lang.weakPassword), findsOneWidget);
  });

  testWidgets('moderate password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.moderate,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.lang.moderatePassword), findsOneWidget);
  });

  testWidgets('strong password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.strong,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.lang.strongPassword), findsOneWidget);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.lang.continueButtonText,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.lang.continueButtonText,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });

  testWidgets('login strategy', (tester) async {
    final model = buildModel(loginStrategy: LoginStrategy.autoLogin);
    await tester.pumpWidget(buildApp(tester, model));

    Type typeOf<T>() => T;

    final autoLoginTile = find.widgetWithText(
      typeOf<RadioListTile<LoginStrategy>>(),
      tester.lang.whoAreYouPageAutoLogin,
    );
    expect(autoLoginTile, findsOneWidget);

    final requirePasswordTile = find.widgetWithText(
      typeOf<RadioListTile<LoginStrategy>>(),
      tester.lang.whoAreYouPageRequirePassword,
    );
    expect(requirePasswordTile, findsOneWidget);

    expect(
      tester.widget<RadioListTile<LoginStrategy>>(autoLoginTile).groupValue,
      LoginStrategy.autoLogin,
    );
    expect(
      tester
          .widget<RadioListTile<LoginStrategy>>(requirePasswordTile)
          .groupValue,
      LoginStrategy.autoLogin,
    );

    when(model.loginStrategy).thenReturn(LoginStrategy.requirePassword);

    await tester.tap(requirePasswordTile);

    verify(model.loginStrategy = LoginStrategy.requirePassword).called(1);
  });

  testWidgets('save identity', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.lang.continueButtonText,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveIdentity()).called(1);
  });
}
