import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/source/source_wizard.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'source_model_test.mocks.dart';
import 'source_page_test.mocks.dart';

void main() {
  testWidgets('enough disk space', (tester) async {
    await tester.buildSourceWizard(hasEnoughDiskSpace: true);

    expect(find.text('first route'), findsOneWidget);

    // first -> source
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(SourcePage), findsOneWidget);

    // source -> last
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(NotEnoughDiskSpacePage), findsNothing);
    expect(find.text('last route'), findsOneWidget);

    // last -> source
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.byType(SourcePage), findsOneWidget);

    // source -> first
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.text('first route'), findsOneWidget);
  });

  testWidgets('not enough disk space', (tester) async {
    await tester.buildSourceWizard(hasEnoughDiskSpace: false);

    expect(find.text('first route'), findsOneWidget);

    // first -> source
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(SourcePage), findsOneWidget);

    // source -> not enough disk space
    await tester.tapContinue();
    await tester.pumpAndSettle();

    expect(find.byType(NotEnoughDiskSpacePage), findsOneWidget);
    expect(find.text('last route'), findsNothing);

    // not enough disk space -> source
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.byType(SourcePage), findsOneWidget);

    // source -> first
    await tester.tapBack();
    await tester.pumpAndSettle();

    expect(find.text('first route'), findsOneWidget);
  });
}

extension on WidgetTester {
  Future<void> buildSourceWizard({required bool hasEnoughDiskSpace}) {
    final client = MockSubiquityClient();
    when(client.getSource()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));
    registerMockService<SubiquityClient>(client);

    final power = MockPowerService();
    when(power.onBattery).thenReturn(false);
    when(power.propertiesChanged).thenAnswer((_) => const Stream.empty());
    registerMockService<PowerService>(power);

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());
    registerMockService<NetworkService>(network);

    final storage = MockDiskStorageService();
    when(storage.largestDiskSize).thenReturn(1);
    when(storage.installMinimumSize).thenReturn(hasEnoughDiskSpace ? 1 : 2);
    registerMockService<DiskStorageService>(storage);

    final telemetry = MockTelemetryService();
    registerMockService<TelemetryService>(telemetry);

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
                  Routes.source:
                      WizardRoute(builder: (_) => const SourceWizard()),
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
