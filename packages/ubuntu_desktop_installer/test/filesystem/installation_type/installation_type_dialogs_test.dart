import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_page.dart';
import 'package:yaru_test/yaru_test.dart';

import '../../test_utils.dart';
import 'installation_type_page_test.mocks.dart';

void main() {
  setUpAll(() => UbuntuTester.context = AlertDialog);

  testWidgets('select zfs', (tester) async {
    final model = MockInstallationTypeModel();
    when(model.existingOS).thenReturn(null);
    when(model.installationType).thenReturn(InstallationType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [installationTypeModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const InstallationTypePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(InstallationTypePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(
        find.radioButton<AdvancedFeature>(tester.lang.installationTypeZFS));
    await tester.pump();

    await tester
        .tap(find.checkButton(tester.lang.installationTypeEncrypt('Ubuntu')));
    await tester.pump();

    await tester.tap(find.button(tester.lang.okButtonText));
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
    when(model.hasBitLocker).thenReturn(false);
    when(model.isDone).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [installationTypeModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const InstallationTypePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(InstallationTypePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.radioButton<AdvancedFeature>(
        tester.lang.installationTypeLVM('Ubuntu')));
    await tester.pump();

    await tester.tap(find.button(tester.lang.okButtonText));
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
    when(model.hasBitLocker).thenReturn(false);
    when(model.isDone).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [installationTypeModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const InstallationTypePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(InstallationTypePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.radioButton<AdvancedFeature>(
        tester.lang.installationTypeLVM('Ubuntu')));
    await tester.pump();

    await tester
        .tap(find.checkButton(tester.lang.installationTypeEncrypt('Ubuntu')));
    await tester.pump();

    await tester.tap(find.button(tester.lang.okButtonText));
    await result;

    verify(model.advancedFeature = AdvancedFeature.lvm).called(1);
    verify(model.encryption = true).called(1);
  });
}
