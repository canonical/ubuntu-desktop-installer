import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../test_utils.dart';
import 'installation_type_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([InstallationTypeModel])
void main() {
  InstallationTypeModel buildModel({
    InstallationType? installationType,
    AdvancedFeature? advancedFeature,
    bool? encryption,
    ProductInfo? productInfo,
    List<OsProber>? existingOS,
  }) {
    final model = MockInstallationTypeModel();
    when(model.installationType)
        .thenReturn(installationType ?? InstallationType.erase);
    when(model.advancedFeature)
        .thenReturn(advancedFeature ?? AdvancedFeature.none);
    when(model.encryption).thenReturn(encryption ?? false);
    when(model.productInfo).thenReturn(productInfo ?? ProductInfo(name: ''));
    when(model.existingOS).thenReturn(existingOS);
    return model;
  }

  Widget buildPage(InstallationTypeModel model) {
    return ChangeNotifierProvider<InstallationTypeModel>.value(
      value: model,
      child: InstallationTypePage(),
    );
  }

  testWidgets('no existing OS', (tester) async {
    await tester.pumpWidget(tester.buildApp((_) => buildPage(buildModel())));

    expect(
      find.text(tester.lang.installationTypeNoOSDetected),
      findsOneWidget,
    );
  });

  testWidgets('one existing OS', (tester) async {
    final model = buildModel(existingOS: [
      OsProber(long: 'Ubuntu 18.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeOSDetected('Ubuntu 18.04 LTS')),
      findsOneWidget,
    );
  });

  testWidgets('two existing OSes', (tester) async {
    final model = buildModel(existingOS: [
      OsProber(long: 'Ubuntu 18.04 LTS', label: 'Ubuntu', type: 'ext4'),
      OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeDualOSDetected(
          'Ubuntu 18.04 LTS', 'Ubuntu 20.04 LTS')),
      findsOneWidget,
    );
  });

  testWidgets('multiple existing OSes', (tester) async {
    final model = buildModel(existingOS: [
      OsProber(long: 'Windows 10', label: 'windows', type: 'ntfs'),
      OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4'),
      OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeMultiOSDetected),
      findsOneWidget,
    );
  });

  testWidgets('reinstall', (tester) async {
    final model = buildModel(existingOS: [
      OsProber(
        long: 'Ubuntu 18.04 LTS',
        label: 'Ubuntu',
        version: '18.04 LTS',
        type: 'ext4',
      )
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(RadioButton<InstallationType>,
        tester.lang.installationTypeReinstall('Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.reinstall).called(1);
  }, skip: true);

  testWidgets('alongside', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 21.10'),
      existingOS: [
        OsProber(
          long: 'Ubuntu 18.04 LTS',
          label: 'Ubuntu',
          version: '18.04 LTS',
          type: 'ext4',
        )
      ],
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(
        RadioButton<InstallationType>,
        tester.lang
            .installationTypeAlongside('Ubuntu 21.10', 'Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  }, skip: true);

  testWidgets('erase', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(RadioButton<InstallationType>,
        tester.lang.installationTypeErase('Ubuntu'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.erase).called(1);
  });

  testWidgets('manual', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(
        RadioButton<InstallationType>, tester.lang.installationTypeManual);
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.manual).called(1);
  });

  testWidgets('advanced features', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final button = find.widgetWithText(
        OutlinedButton, tester.lang.installationTypeAdvancedLabel);
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.isOpen).thenAnswer((_) async => true);
    when(client.getGuidedStorage()).thenAnswer(
        (_) async => GuidedStorageResponse(status: ProbeStatus.DONE));
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
    registerMockService<SubiquityClient>(client);
    registerMockService<DiskStorageService>(DiskStorageService(client));
    registerMockService<TelemetryService>(TelemetryService());

    await tester.pumpWidget(tester.buildApp(InstallationTypePage.create));

    final page = find.byType(InstallationTypePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<InstallationTypeModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
