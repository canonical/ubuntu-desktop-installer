import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_model.dart';
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_page.dart';

import 'profile_setup_page_test.mocks.dart';
import 'test_utils.dart';

// ignore_for_file: type=lint

@GenerateMocks([ProfileSetupModel, UrlLauncher])
void main() {
  LangTester.type = ProfileSetupPage;

  ProfileSetupModel buildModel({
    bool? isValid,
    String? realname,
    String? username,
    String? password,
    String? confirmedPassword,
    PasswordStrength? passwordStrength,
    bool? showAdvancedOptions,
  }) {
    final model = MockProfileSetupModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.realname).thenReturn(realname ?? '');
    when(model.username).thenReturn(username ?? '');
    when(model.password).thenReturn(password ?? '');
    when(model.confirmedPassword).thenReturn(confirmedPassword ?? '');
    when(model.passwordStrength)
        .thenReturn(passwordStrength ?? PasswordStrength.weak);
    when(model.showAdvancedOptions).thenReturn(showAdvancedOptions ?? false);
    when(model.usernameValidation).thenReturn(UsernameValidation.OK);
    when(model.usernameOk).thenReturn(true);
    return model;
  }

  Widget buildPage(ProfileSetupModel model) {
    return ChangeNotifierProvider<ProfileSetupModel>.value(
      value: model,
      child: ProfileSetupPage(),
    );
  }

  Widget buildApp(WidgetTester tester, ProfileSetupModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: (_) => buildPage(model),
            onNext: (settings) => '/',
          ),
        },
      ),
    );
  }

  testWidgets('realname input', (tester) async {
    final model = buildModel(realname: 'realname');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'realname');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.realname = 'ubuntu').called(1);
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

    expect(find.text(tester.ulang.weakPassword), findsNothing);
    expect(find.text(tester.ulang.fairPassword), findsNothing);
    expect(find.text(tester.ulang.goodPassword), findsNothing);
    expect(find.text(tester.ulang.strongPassword), findsNothing);
  });

  testWidgets('weak password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.weak,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.ulang.weakPassword), findsOneWidget);
  });

  testWidgets('fair password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.fair,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.ulang.fairPassword), findsOneWidget);
  });

  testWidgets('good password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.good,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.ulang.goodPassword), findsOneWidget);
  });

  testWidgets('strong password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.strong,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.ulang.strongPassword), findsOneWidget);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, isFalse);
  });

  // NOTE: The "Show advanced options" checkbox was temporarily removed (#431).
  //       See [ProfileSetupModel.showAdvancedOptions] for more details.
  //
  // testWidgets('advanced options', (tester) async {
  //   final model = buildModel(showAdvancedOptions: true);
  //   await tester.pumpWidget(buildApp(tester, model));

  //   final checkbox = find.widgetWithText(
  //       YaruCheckButton, tester.lang.profileSetupShowAdvancedOptions);
  //   expect(checkbox, findsOneWidget);
  //   expect(tester.widget<YaruCheckButton>(checkbox).value, isTrue);

  //   when(model.showAdvancedOptions).thenReturn(true);

  //   await tester.tap(checkbox);
  //   verify(model.showAdvancedOptions = false).called(1);
  //   expect(tester.widget<YaruCheckButton>(checkbox).value, isTrue);
  // });

  testWidgets('load and save profile setup', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    verify(model.loadProfileSetup()).called(1);
    verifyNever(model.saveProfileSetup());

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveProfileSetup()).called(1);
  });

  testWidgets('click link currently disabled', (tester) async {
    const url = 'https://aka.ms/wslusers';
    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl(url)).thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(buildApp(tester, buildModel()));

    expect(find.byType(Html), findsOneWidget);
    await tester.tap(find.byType(Html), warnIfMissed: false);
    verifyNever(urlLauncher.launchUrl(url));
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.getIdentity()).thenAnswer((_) async => IdentityData());
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: ProfileSetupPage.create,
            onNext: (settings) => '/',
          ),
        },
      ),
    ));

    final page = find.byType(ProfileSetupPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ProfileSetupModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
