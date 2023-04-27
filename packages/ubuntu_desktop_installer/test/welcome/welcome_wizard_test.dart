import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/try_or_install/try_or_install_widgets.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_wizard.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../test_utils.dart';
import 'try_or_install/try_or_install_model_test.mocks.dart';

void main() {
  testWidgets('no rst', (tester) async {
    await tester.buildWelcomeWizard(hasRst: false);
    expect(find.byType(TryOrInstallPage), findsOneWidget);

    await tester.tapOption(tester.lang.installUbuntu('Ubuntu'));
    await tester.pump();

    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(RstPage), findsNothing);
    expect(find.text('no rst'), findsOneWidget);
  });

  testWidgets('has rst', (tester) async {
    await tester.buildWelcomeWizard(hasRst: true);
    expect(find.byType(TryOrInstallPage), findsOneWidget);

    await tester.tapOption(tester.lang.installUbuntu('Ubuntu'));
    await tester.pump();

    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(RstPage), findsOneWidget);
    expect(find.text('no rst'), findsNothing);
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
      InheritedLocale(
        child: Flavor(
          data: const FlavorData(name: 'Ubuntu'),
          child: MaterialApp(
            localizationsDelegates: localizationsDelegates,
            home: Wizard(
              routes: {
                Routes.welcome:
                    const WizardRoute(builder: WelcomeWizard.create),
                '/no-rst': WizardRoute(builder: (_) => const Text('no rst')),
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> tapOption(String label) {
    final button = find.widgetWithText(OptionButton, label);
    expect(button, findsOneWidget);
    return tap(button);
  }
}
