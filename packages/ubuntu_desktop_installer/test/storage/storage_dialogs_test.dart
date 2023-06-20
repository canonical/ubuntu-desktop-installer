import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/storage/storage_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/storage/storage_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/storage_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_storage.dart';

void main() {
  setUpAll(() => InstallerTester.context = AlertDialog);

  testWidgets('select zfs', (tester) async {
    final model = MockStorageModel();
    when(model.existingOS).thenReturn(null);
    when(model.type).thenReturn(StorageType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const StoragePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(StoragePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(
        find.radioButton<AdvancedFeature>(tester.lang.installationTypeZFS));
    await tester.pump();

    await tester
        .tap(find.checkButton(tester.lang.installationTypeEncrypt('Ubuntu')));
    await tester.pump();

    await tester.tapOk();
    await result;

    verify(model.advancedFeature = AdvancedFeature.zfs).called(1);
    verify(model.encryption = true).called(1);
  }, skip: true); // #373

  testWidgets('select lvm', (tester) async {
    final model = MockStorageModel();
    when(model.existingOS).thenReturn(null);
    when(model.type).thenReturn(StorageType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);
    when(model.canInstallAlongside).thenReturn(false);
    when(model.hasStorage).thenReturn(true);
    when(model.hasBitLocker).thenReturn(false);
    when(model.isDone).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const StoragePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(StoragePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.radioButton<AdvancedFeature>(
        tester.lang.installationTypeLVM('Ubuntu')));
    await tester.pump();

    await tester.tapOk();
    await result;

    verify(model.advancedFeature = AdvancedFeature.lvm).called(1);
    verifyNever(model.encryption = true);
  });

  testWidgets('select encrypted lvm', (tester) async {
    final model = MockStorageModel();
    when(model.existingOS).thenReturn(null);
    when(model.type).thenReturn(StorageType.erase);
    when(model.advancedFeature).thenReturn(AdvancedFeature.lvm);
    when(model.encryption).thenReturn(false);
    when(model.canInstallAlongside).thenReturn(false);
    when(model.hasStorage).thenReturn(true);
    when(model.hasBitLocker).thenReturn(false);
    when(model.isDone).thenReturn(false);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const StoragePage()),
      ),
    );

    final result = showAdvancedFeaturesDialog(
        tester.element(find.byType(StoragePage)), model);
    await tester.pumpAndSettle();

    await tester.tap(find.radioButton<AdvancedFeature>(
        tester.lang.installationTypeLVM('Ubuntu')));
    await tester.pump();

    await tester
        .tap(find.checkButton(tester.lang.installationTypeEncrypt('Ubuntu')));
    await tester.pump();

    await tester.tapOk();
    await result;

    verify(model.advancedFeature = AdvancedFeature.lvm).called(1);
    verify(model.encryption = true).called(1);
  });
}
