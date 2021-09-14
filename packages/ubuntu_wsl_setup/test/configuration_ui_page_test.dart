import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
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
    bool? legacyGUI,
    bool? legacyAudio,
    bool? advancedIPDetection,
    bool? wslMotdNews,
    bool? automount,
    bool? mountFstab,
  }) {
    final model = MockConfigurationUIModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.legacyGUI).thenReturn(legacyGUI ?? false);
    when(model.legacyAudio).thenReturn(legacyAudio ?? false);
    when(model.advancedIPDetection).thenReturn(advancedIPDetection ?? false);
    when(model.wslMotdNews).thenReturn(wslMotdNews ?? true);
    when(model.automount).thenReturn(automount ?? true);
    when(model.mountFstab).thenReturn(mountFstab ?? true);
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
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('legacy GUI input', (tester) async {
    final model = buildModel(legacyGUI: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUILegacyGUIIntegrationTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.legacyGUI = true).called(1);
  });

  testWidgets('legacy audio input', (tester) async {
    final model = buildModel(legacyAudio: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUILegacyAudioIntegrationTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.legacyAudio = true).called(1);
  });

  testWidgets('advanced IP detection input', (tester) async {
    final model = buildModel(advancedIPDetection: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIAdvancedIPDetectionTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.advancedIPDetection = true).called(1);
  });

  testWidgets('WSL MOTD news input', (tester) async {
    final model = buildModel(wslMotdNews: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIWSLNewsTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.wslMotdNews = true).called(1);
  });

  testWidgets('automount input', (tester) async {
    final model = buildModel(automount: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIAutoMountTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.automount = true).called(1);
  });

  testWidgets('mount fstab input', (tester) async {
    final model = buildModel(mountFstab: false);
    await tester.pumpWidget(buildApp(tester, model));

    final checkbox = find.widgetWithText(
        CheckButton, tester.lang.configurationUIMountFstabTitle);
    expect(checkbox, findsOneWidget);
    await tester.tap(checkbox);
    verify(model.mountFstab = true).called(1);
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
    when(client.wslConfiguration2())
        .thenAnswer((_) async => WSLConfiguration2Data());

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Provider<SubiquityClient>.value(
        value: client,
        child: Wizard(
          routes: {'/': ConfigurationUIPage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(ConfigurationUIPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ConfigurationUIModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
