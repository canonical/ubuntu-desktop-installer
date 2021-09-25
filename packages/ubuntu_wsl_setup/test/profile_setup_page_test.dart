import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_model.dart';
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_page.dart';

import 'profile_setup_page_test.mocks.dart';
import 'test_utils.dart';

@GenerateMocks([ProfileSetupModel])
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
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
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
    expect(find.text(tester.ulang.moderatePassword), findsNothing);
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

  testWidgets('moderate password', (tester) async {
    final model = buildModel(
      password: 'not empty',
      passwordStrength: PasswordStrength.moderate,
    );
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.ulang.moderatePassword), findsOneWidget);
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
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);
    expect(continueButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);
    expect(continueButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });

  testWidgets('advanced options', (tester) async {
    final model = buildModel(showAdvancedOptions: true);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.profileSetupShowAdvancedOptions);
    expect(checkbox, findsOneWidget);
    expect(tester.widget<CheckButton>(checkbox).value, isTrue);

    when(model.showAdvancedOptions).thenReturn(true);

    await tester.tap(checkbox);
    verify(model.showAdvancedOptions = false).called(1);
    expect(tester.widget<CheckButton>(checkbox).value, isTrue);
  });

  testWidgets('load and save profile setup', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    verify(model.loadProfileSetup()).called(1);
    verifyNever(model.saveProfileSetup());

    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveProfileSetup()).called(1);
  });

  testWidgets('click link', (tester) async {
    await tester.pumpWidget(buildApp(tester, buildModel()));

    var urlLaunched = false;
    final methodChannel = MethodChannel('plugins.flutter.io/url_launcher');
    methodChannel.setMockMethodCallHandler((call) {
      expect(call.method, equals('launch'));
      expect(call.arguments['url'], equals('https://aka.ms/wslusers'));
      urlLaunched = true;
    });

    expect(find.byType(Html), findsOneWidget);
    await tester.tap(find.byType(Html));
    expect(urlLaunched, isTrue);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => IdentityData());

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Provider<SubiquityClient>.value(
        value: client,
        child: Wizard(
          routes: {'/': ProfileSetupPage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(ProfileSetupPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ProfileSetupModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
