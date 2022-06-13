import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../test_utils.dart';
import 'updates_other_software_model_test.mocks.dart';
import 'updates_other_software_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([UpdateOtherSoftwareModel, TelemetryService])
void main() {
  UpdateOtherSoftwareModel buildModel({
    InstallationMode? installationMode,
    bool? installThirdParty,
    bool? onBattery,
  }) {
    final model = MockUpdateOtherSoftwareModel();
    when(model.installationMode)
        .thenReturn(installationMode ?? InstallationMode.normal);
    when(model.installThirdParty).thenReturn(installThirdParty ?? false);
    when(model.onBattery).thenReturn(onBattery ?? false);
    return model;
  }

  Widget buildPage(UpdateOtherSoftwareModel model) {
    registerMockService<SubiquityClient>(MockSubiquityClient());
    registerMockService<TelemetryService>(MockTelemetryService());

    return ChangeNotifierProvider<UpdateOtherSoftwareModel>.value(
      value: model,
      child: UpdatesOtherSoftwarePage(),
    );
  }

  testWidgets('installation mode', (tester) async {
    final model = buildModel(installationMode: InstallationMode.normal);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final normalInstallationTile = find.widgetWithText(
      RadioButton<InstallationMode>,
      tester.lang.normalInstallationTitle,
    );
    expect(normalInstallationTile, findsOneWidget);

    final minimalInstallationTile = find.widgetWithText(
      RadioButton<InstallationMode>,
      tester.lang.minimalInstallationTitle,
    );
    expect(minimalInstallationTile, findsOneWidget);

    expect(
      tester
          .widget<RadioButton<InstallationMode>>(normalInstallationTile)
          .groupValue,
      InstallationMode.normal,
    );
    expect(
      tester
          .widget<RadioButton<InstallationMode>>(minimalInstallationTile)
          .groupValue,
      InstallationMode.normal,
    );

    when(model.installationMode).thenReturn(InstallationMode.minimal);

    await tester.tap(minimalInstallationTile);

    verify(model.setInstallationMode(InstallationMode.minimal)).called(1);
  });

  // https://github.com/canonical/ubuntu-desktop-installer/issues/373
  // testWidgets('install third-party software', (tester) async {
  //   final model = buildModel(installThirdParty: true);
  //   await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

  //   final installThirdPartyTile = find.widgetWithText(
  //     CheckButton,
  //     tester.lang.installThirdPartyTitle,
  //   );
  //   expect(installThirdPartyTile, findsOneWidget);

  //   expect(tester.widget<CheckButton>(installThirdPartyTile).value, isTrue);

  //   when(model.installThirdParty).thenReturn(false);

  //   await tester.tap(installThirdPartyTile);

  //   verify(model.setInstallThirdParty(false)).called(1);
  // });

  testWidgets('on battery', (tester) async {
    final model = buildModel(onBattery: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final warning = find.byType(Html);
    final theme = Theme.of(tester.element(warning));
    expect(warning, findsOneWidget);
    expect(
      tester.widget<Html>(warning).data,
      equals(tester.lang.onBatteryWarning(theme.errorColor.toHex())),
    );
  });

  testWidgets('not on battery', (tester) async {
    final model = buildModel(onBattery: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(Html), findsNothing);
  });

  testWidgets('continue on the next page', (tester) async {
    final model = buildModel(installationMode: InstallationMode.normal);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);
    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    verify(model.selectInstallationSource()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });

  testWidgets('creates a model', (tester) async {
    registerMockService<SubiquityClient>(MockSubiquityClient());

    final power = MockPowerService();
    when(power.onBattery).thenReturn(false);
    when(power.propertiesChanged).thenAnswer((_) => Stream.empty());
    registerMockService<PowerService>(power);

    await tester.pumpWidget(tester.buildApp(UpdatesOtherSoftwarePage.create));

    final page = find.byType(UpdatesOtherSoftwarePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<UpdateOtherSoftwareModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
