import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';
import 'installation_complete_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([InstallationCompleteModel])
void main() {
  Widget buildPage(InstallationCompleteModel model) {
    return Provider<InstallationCompleteModel>.value(
      value: model,
      child: InstallationCompletePage(),
    );
  }

  testWidgets('restart', (tester) async {
    final model = MockInstallationCompleteModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final restartButton = find.textContaining(tester.lang.restartButtonText);
    expect(restartButton, findsOneWidget);

    await tester.tap(restartButton);
    verify(model.reboot(immediate: false)).called(1);
  });

  testWidgets('shutdown', (tester) async {
    final model = MockInstallationCompleteModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final shutdownButton =
        find.widgetWithText(OutlinedButton, tester.lang.shutdown);
    expect(shutdownButton, findsOneWidget);

    await tester.tap(shutdownButton);
    verify(model.shutdown(immediate: false)).called(1);
  });

  testWidgets('creates a model', (tester) async {
    registerMockService<SubiquityClient>(MockSubiquityClient());

    await tester.pumpWidget(tester.buildApp(InstallationCompletePage.create));

    final page = find.byType(InstallationCompletePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model =
        Provider.of<InstallationCompleteModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
