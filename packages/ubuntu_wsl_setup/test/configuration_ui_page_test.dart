import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/services.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/configuration_ui/configuration_ui_model.dart';
import 'package:ubuntu_wsl_setup/pages/configuration_ui/configuration_ui_page.dart';

import 'configuration_ui_page_test.mocks.dart';
import 'test_utils.dart';

@GenerateMocks([ConfigurationUIModel])
void main() {
  LangTester.type = ConfigurationUIPage;

  ConfigurationUIModel buildModel({
    bool? isValid,
    bool? interopEnabled,
    bool? interopAppendwindowspath,
    bool? automountEnabled,
    bool? automountMountfstab,
  }) {
    final model = MockConfigurationUIModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.interopEnabled).thenReturn(interopEnabled ?? false);
    when(model.interopAppendwindowspath)
        .thenReturn(interopAppendwindowspath ?? false);
    when(model.automountEnabled).thenReturn(automountEnabled ?? true);
    when(model.automountMountfstab).thenReturn(automountMountfstab ?? true);
    return model;
  }

  Widget buildPage(ConfigurationUIModel model) {
    return ChangeNotifierProvider<ConfigurationUIModel>.value(
      value: model,
      child: ConfigurationUIPage(),
    );
  }

  Widget buildApp(WidgetTester tester, ConfigurationUIModel model) {
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

  testWidgets('automountEnabled input', (tester) async {
    final model = buildModel(automountEnabled: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIAutoMountSubtitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.automountEnabled = true).called(1);
  });

  testWidgets('mount fstab input', (tester) async {
    final model = buildModel(automountMountfstab: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIMountFstabTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.automountMountfstab = true).called(1);
  });

  testWidgets('interopEnabled input', (tester) async {
    final model = buildModel(interopEnabled: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIInteroperabilitySubtitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.interopEnabled = true).called(1);
  });

  testWidgets('interopAppendwindowspath input', (tester) async {
    final model = buildModel(interopAppendwindowspath: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIInteropAppendWindowsPathTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.interopAppendwindowspath = true).called(1);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final saveButton =
        find.widgetWithText(ElevatedButton, tester.lang.saveButton);
    expect(saveButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(saveButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final saveButton =
        find.widgetWithText(ElevatedButton, tester.lang.saveButton);
    expect(saveButton, findsOneWidget);
    expect(tester.widget<ElevatedButton>(saveButton).enabled, isFalse);
  });

  testWidgets('loads and saves configuration', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    verify(model.loadConfiguration()).called(1);
    verifyNever(model.saveConfiguration());

    final saveButton =
        find.widgetWithText(ElevatedButton, tester.lang.saveButton);
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);

    verify(model.saveConfiguration()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.wslConfigurationAdvanced())
        .thenAnswer((_) async => WSLConfigurationAdvanced());
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: ConfigurationUIPage.create,
            onNext: (settings) => '/',
          ),
        },
      ),
    ));

    final page = find.byType(ConfigurationUIPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ConfigurationUIModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
