import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/advanced_setup/advanced_setup_model.dart';
import 'package:ubuntu_wsl_setup/pages/advanced_setup/advanced_setup_page.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'advanced_setup_page_test.mocks.dart';
import 'test_utils.dart';

// ignore_for_file: type=lint

@GenerateMocks([AdvancedSetupModel])
void main() {
  LangTester.type = AdvancedSetupPage;

  AdvancedSetupModel buildModel({
    bool? isValid,
    String? mountLocation,
    String? mountOption,
    bool? enableHostGeneration,
    bool? enableResolvConfGeneration,
  }) {
    final model = MockAdvancedSetupModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.mountLocation).thenReturn(mountLocation ?? '');
    when(model.mountOption).thenReturn(mountOption ?? '');
    when(model.enableHostGeneration).thenReturn(enableHostGeneration ?? true);
    when(model.enableResolvConfGeneration)
        .thenReturn(enableResolvConfGeneration ?? true);
    return model;
  }

  Widget buildPage(AdvancedSetupModel model) {
    return ChangeNotifierProvider<AdvancedSetupModel>.value(
      value: model,
      child: AdvancedSetupPage(),
    );
  }

  Widget buildApp(AdvancedSetupModel model) {
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

  testWidgets('mount location input', (tester) async {
    final model = buildModel(mountLocation: '/foo');
    await tester.pumpWidget(buildApp(model));

    final textField = find.textField('/foo');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, '/foo/bar');
    await tester.pump();
    verify(model.mountLocation = '/foo/bar').called(1);
  });

  testWidgets('mount option input', (tester) async {
    final model = buildModel(mountOption: '--foo');
    await tester.pumpWidget(buildApp(model));

    final textField = find.textField('--foo');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, '--bar');
    await tester.pump();
    verify(model.mountOption = '--bar').called(1);
  });

  testWidgets('host generation input', (tester) async {
    final model = buildModel(enableHostGeneration: false);
    await tester.pumpWidget(buildApp(model));

    final checkbox = find.widgetWithText(
        YaruCheckButton, tester.lang.advancedSetupHostGenerationTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.enableHostGeneration = true).called(1);
  });

  testWidgets('resolv.conf generation input', (tester) async {
    final model = buildModel(enableResolvConfGeneration: false);
    await tester.pumpWidget(buildApp(model));

    final checkbox = find.widgetWithText(
        YaruCheckButton, tester.lang.advancedSetupResolvConfGenerationTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.enableResolvConfGeneration = true).called(1);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(model));

    final setupButton = find.button(tester.lang.setupButton);
    expect(setupButton, findsOneWidget);
    expect(setupButton, isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(model));

    final setupButton = find.button(tester.lang.setupButton);
    expect(setupButton, findsOneWidget);
    expect(setupButton, isDisabled);
  });

  testWidgets('loads and saves advanced setup', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(model));

    verify(model.loadAdvancedSetup()).called(1);
    verifyNever(model.saveAdvancedSetup());

    final setupButton = find.button(tester.lang.setupButton);
    expect(setupButton, findsOneWidget);

    await tester.tap(setupButton);
    verify(model.saveAdvancedSetup()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.wslConfigurationBase())
        .thenAnswer((_) async => WSLConfigurationBase());
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: AdvancedSetupPage.create,
            onNext: (settings) => '/',
          ),
        },
      ),
    ));

    final page = find.byType(AdvancedSetupPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<AdvancedSetupModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
