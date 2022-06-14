import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/setup_complete/setup_complete_model.dart';
import 'package:ubuntu_wsl_setup/pages/setup_complete/setup_complete_page.dart';

import 'setup_complete_page_test.mocks.dart';
import 'test_utils.dart';

// ignore_for_file: type=lint

@GenerateMocks([SetupCompleteModel])
void main() {
  LangTester.type = SetupCompletePage;

  SetupCompleteModel buildModel({String? username}) {
    final model = MockSetupCompleteModel();
    when(model.username).thenReturn(username ?? '');
    return model;
  }

  Widget buildPage(SetupCompleteModel model) {
    return ChangeNotifierProvider<SetupCompleteModel>.value(
      value: model,
      child: SetupCompletePage(),
    );
  }

  Widget buildApp(WidgetTester tester, SetupCompleteModel model) {
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

  testWidgets('username', (tester) async {
    final model = buildModel(username: 'Test');
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.text(tester.lang.setupCompleteHeader('Test')), findsOneWidget);
  });

  testWidgets('init model', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));

    verify(model.init()).called(1);
  });

  testWidgets('reboot on finish', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));

    final finishButton =
        find.widgetWithText(OutlinedButton, tester.lang.finishButton);
    expect(finishButton, findsOneWidget);

    await tester.tap(finishButton);
    verify(model.reboot(immediate: false)).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => IdentityData());
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: SetupCompletePage.create,
            onNext: (settings) => '/',
          ),
        },
      ),
    ));

    final page = find.byType(SetupCompletePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SetupCompleteModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
