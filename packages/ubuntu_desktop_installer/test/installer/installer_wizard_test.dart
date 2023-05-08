import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'installer_wizard_test.mocks.dart';

@GenerateMocks([TelemetryService])
void main() {
  testWidgets('telemetry', (tester) async {
    final telemetry = MockTelemetryService();
    registerMockService<TelemetryService>(telemetry);

    final userData = Object();

    final controller = WizardController(
      routes: {
        '/foo': WizardRoute(
          builder: (_) => const Text('foo'),
        ),
        '/bar': WizardRoute(
          builder: (_) => const Text('bar'),
        ),
        '/baz': WizardRoute(
          builder: (_) => const Text('baz'),
        ),
      },
    );

    await tester.pumpWidget(MaterialApp(
      home: InstallerWizard(
        controller: controller,
        userData: userData,
      ),
    ));

    final wizard = tester.widget<Wizard>(find.byType(Wizard));
    expect(wizard.controller, controller);
    expect(wizard.userData, same(userData));

    expect(find.text('foo'), findsOneWidget);
    verify(telemetry.addStage('foo')).called(1);

    controller.next();
    await tester.pumpAndSettle();
    verify(telemetry.addStage('bar')).called(1);

    controller.next();
    await tester.pumpAndSettle();
    verify(telemetry.addStage('baz')).called(1);

    controller.back();
    await tester.pumpAndSettle();
    verifyNever(telemetry.addStage(any));
  });
}
