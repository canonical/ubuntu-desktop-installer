import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../test_utils.dart';
import 'installation_complete_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([InstallationCompleteModel])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  Widget buildPage(InstallationCompleteModel model) {
    when(model.productInfo).thenReturn(ProductInfo(name: 'Ubuntu'));
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

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pump();
    verify(model.reboot()).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('continue testing', (tester) async {
    final model = MockInstallationCompleteModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.button(tester.lang.continueTesting);
    expect(continueButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(continueButton);
    await tester.pump();
    verifyNever(model.reboot());

    await expectLater(windowClosed, completes);
  });

  testWidgets('creates a model', (tester) async {
    registerMockService<SubiquityClient>(MockSubiquityClient());
    registerMockService<ProductService>(ProductService());

    await tester.pumpWidget(tester.buildApp(InstallationCompletePage.create));

    final page = find.byType(InstallationCompletePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model =
        Provider.of<InstallationCompleteModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
