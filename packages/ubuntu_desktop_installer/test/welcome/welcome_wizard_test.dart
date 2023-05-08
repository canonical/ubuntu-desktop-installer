import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_wizard.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'welcome_model_test.mocks.dart';

void main() {
  testWidgets('no rst', (tester) async {
    await tester.buildWelcomeWizard(hasRst: false);

    expect(find.text('first route'), findsOneWidget);

    // first -> welcome
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsOneWidget);

    await tester.tap(find.radio(Option.installUbuntu));
    await tester.pump();

    // welcome -> last
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(RstPage), findsNothing);
    expect(find.text('last route'), findsOneWidget);

    // last -> welcome
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsOneWidget);

    // welcome -> first
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.text('first route'), findsOneWidget);
  });

  testWidgets('has rst', (tester) async {
    await tester.buildWelcomeWizard(hasRst: true);

    expect(find.text('first route'), findsOneWidget);

    // first -> welcome
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsOneWidget);

    await tester.tap(find.radio(Option.installUbuntu));
    await tester.pump();

    // welcome -> rst
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(RstPage), findsOneWidget);
    expect(find.text('no rst'), findsNothing);

    // last -> welcome
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.byType(WelcomePage), findsOneWidget);

    // welcome -> first
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.text('first route'), findsOneWidget);
  });
}

extension on WidgetTester {
  Future<void> buildWelcomeWizard({required bool hasRst}) {
    final client = MockSubiquityClient();
    when(client.hasRst()).thenAnswer((_) async => hasRst);
    registerMockService<SubiquityClient>(client);

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(false);
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());
    registerMockService<NetworkService>(network);

    return pumpWidget(
      ProviderScope(
        child: InheritedLocale(
          child: Flavor(
            data: const FlavorData(name: 'Ubuntu'),
            child: MaterialApp(
              localizationsDelegates: localizationsDelegates,
              home: Wizard(
                routes: {
                  '/first': WizardRoute(
                    builder: (context) => WizardPage(
                      content: const Text('first route'),
                      bottomBar: WizardBar(
                        trailing: [WizardAction.next(context)],
                      ),
                    ),
                  ),
                  Routes.welcome:
                      WizardRoute(builder: (_) => const WelcomeWizard()),
                  '/last': WizardRoute(
                    builder: (context) => WizardPage(
                      content: const Text('last route'),
                      bottomBar: WizardBar(leading: WizardAction.back(context)),
                    ),
                  ),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
