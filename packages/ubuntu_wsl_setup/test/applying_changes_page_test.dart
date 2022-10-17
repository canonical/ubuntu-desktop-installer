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
import 'package:ubuntu_wsl_setup/pages.dart';
import 'package:ubuntu_wsl_setup/pages/applying_changes/applying_changes_model.dart';

import 'applying_changes_page_test.mocks.dart';
import 'test_utils.dart';

// ignore_for_file: type=lint

@GenerateMocks([ApplyingChangesModel, SubiquityStatusMonitor])
void main() {
  const theEnd = 'The end';
  LangTester.type = ApplyingChangesModel;

  Widget buildPage(ApplyingChangesModel model) {
    return ChangeNotifierProvider<ApplyingChangesModel>.value(
      value: model,
      child: ApplyingChangesPage(),
    );
  }

  Widget buildApp({
    required Widget Function(BuildContext) builder,
    bool hasNext = false,
  }) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': WizardRoute(
            builder: builder,
            onNext: (settings) => '/end',
          ),
          if (hasNext)
            '/end': WizardRoute(
              builder: (_) => Center(
                child: const Text(theEnd),
              ),
              onNext: (settings) => '/end',
            ),
        },
      ),
    );
  }

  testWidgets('goes to the next page on false', (tester) async {
    final model = MockApplyingChangesModel();
    when(model.init(onDoneTransition: captureAnyNamed('onDoneTransition')))
        .thenAnswer((realInvocation) {
      realInvocation.namedArguments[Symbol('onDoneTransition')]();
    });
    await tester.pumpWidget(buildApp(
      builder: (_) => buildPage(model),
      hasNext: true,
    ));
    expect(find.text(theEnd), findsNothing);
    await tester.pumpAndSettle();
    expect(find.text(theEnd), findsOneWidget);
  });

  testWidgets('closes the window when last page', (tester) async {
    final model = MockApplyingChangesModel();
    when(model.init(onDoneTransition: captureAnyNamed('onDoneTransition')))
        .thenAnswer((realInvocation) {
      realInvocation.namedArguments[Symbol('onDoneTransition')]();
    });

    await tester.pumpWidget(buildApp(
      builder: (_) => buildPage(model),
      hasNext: false,
    ));
    verify(model.reboot(immediate: false)).called(1);
  });

  testWidgets('won\'t go next while still installing', (tester) async {
    final model = MockApplyingChangesModel();
    when(model.init(onDoneTransition: captureAnyNamed('onDoneTransition')))
        .thenAnswer((realInvocation) {});
    await tester.pumpWidget(buildApp(
      builder: (_) => buildPage(model),
      hasNext: true,
    ));
    expect(find.text(theEnd), findsNothing);
    await tester.pump(Duration.zero);
    expect(find.text(theEnd), findsNothing);
    await tester.pump(Duration.zero);
    expect(find.text(theEnd), findsNothing);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged).thenAnswer((_) => Stream.value(null));
    when(monitor.status).thenAnswer((_) => null);
    registerMockService<SubiquityClient>(client);
    registerMockService<SubiquityStatusMonitor>(monitor);
    await tester.pumpWidget(buildApp(
      builder: ApplyingChangesPage.create,
      hasNext: true,
    ));
    final page = find.byType(ApplyingChangesPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ApplyingChangesModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
