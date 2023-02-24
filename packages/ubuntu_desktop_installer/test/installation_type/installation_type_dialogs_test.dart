import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_page.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'installation_type_page_test.mocks.dart';

// ignore_for_file: type=lint

void main() {
  setUpAll(() => UbuntuTester.context = AlertDialog);

  testWidgets('select zfs', (tester) async {
    final model = MockInstallationTypeModel();
    when(model.existingOS).thenReturn(null);
    when(model.installationType).thenReturn(InstallationType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);

    await tester.pumpWidget(
      ChangeNotifierProvider<InstallationTypeModel>.value(
        value: model,
        child: tester.buildApp((_) => InstallationTypePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(InstallationTypePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(
        YaruRadioButton<AdvancedFeature>, tester.lang.installationTypeZFS));
    await tester.pump();

    await tester.tap(find.widgetWithText(
        YaruCheckButton, tester.lang.installationTypeEncrypt('Ubuntu')));
    await tester.pump();

    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.okButtonText));
    await result;

    verify(model.advancedFeature = AdvancedFeature.zfs).called(1);
    verify(model.encryption = true).called(1);
  }, skip: true); // #373

  testWidgets('select lvm', (tester) async {
    final model = MockInstallationTypeModel();
    when(model.existingOS).thenReturn(null);
    when(model.installationType).thenReturn(InstallationType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);
    when(model.canInstallAlongside).thenReturn(false);
    when(model.hasStorage).thenReturn(true);

    await tester.pumpWidget(
      ChangeNotifierProvider<InstallationTypeModel>.value(
        value: model,
        child: tester.buildApp((_) => InstallationTypePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(InstallationTypePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(YaruRadioButton<AdvancedFeature>,
        tester.lang.installationTypeLVM('Ubuntu')));
    await tester.pump();

    await tester
        .tap(find.widgetWithText(FilledButton, tester.lang.okButtonText));
    await result;

    verify(model.advancedFeature = AdvancedFeature.lvm).called(1);
    verifyNever(model.encryption = true);
  });

  testWidgets('select encrypted lvm', (tester) async {
    final model = MockInstallationTypeModel();
    when(model.existingOS).thenReturn(null);
    when(model.installationType).thenReturn(InstallationType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);
    when(model.canInstallAlongside).thenReturn(false);
    when(model.hasStorage).thenReturn(true);

    await tester.pumpWidget(
      ChangeNotifierProvider<InstallationTypeModel>.value(
        value: model,
        child: tester.buildApp((_) => InstallationTypePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(InstallationTypePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(YaruRadioButton<AdvancedFeature>,
        tester.lang.installationTypeLVM('Ubuntu')));
    await tester.pump();

    await tester.tap(find.widgetWithText(
        YaruCheckButton, tester.lang.installationTypeEncrypt('Ubuntu')));
    await tester.pump();

    await tester
        .tap(find.widgetWithText(FilledButton, tester.lang.okButtonText));
    await result;

    verify(model.advancedFeature = AdvancedFeature.lvm).called(1);
    verify(model.encryption = true).called(1);
  });
}
