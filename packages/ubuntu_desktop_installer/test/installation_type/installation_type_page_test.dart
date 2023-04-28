import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
    bool? canInstallAlongside,
    bool? hasStorage,
    bool? hasBitLocker,
    bool? isDone,
  }) {
    final model = MockInstallationTypeModel();
    when(model.installationType)
        .thenReturn(installationType ?? InstallationType.erase);
    when(model.advancedFeature)
        .thenReturn(advancedFeature ?? AdvancedFeature.none);
    when(model.encryption).thenReturn(encryption ?? false);
    when(model.productInfo).thenReturn(productInfo ?? ProductInfo(name: ''));
    when(model.existingOS).thenReturn(existingOS);
    when(model.canInstallAlongside).thenReturn(canInstallAlongside ?? false);
    when(model.hasStorage).thenReturn(hasStorage ?? true);
    when(model.hasBitLocker).thenReturn(hasBitLocker ?? false);
    when(model.isDone).thenReturn(isDone ?? false);
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

  testWidgets('duplicate existing OSes', (tester) async {
    final model = buildModel(existingOS: [
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

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeReinstall('Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.reinstall).called(1);
  }, skip: true);

  testWidgets('alongside windows', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        OsProber(
          long: 'Windows 10',
          label: 'WIN10',
          version: '10',
          type: 'ntfs',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeAlongside('Ubuntu 22.10', 'Windows 10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside bitlocker', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        OsProber(
          long: 'Windows 11',
          label: 'WIN11',
          version: '11',
          type: 'BitLocker',
        ),
      ],
      canInstallAlongside: false,
      hasBitLocker: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeAlongside('Ubuntu 22.10', 'Windows 11'));
    expect(radio, findsOneWidget);

    await tester.tap(radio);
    verify(model.installationType = InstallationType.bitlocker).called(1);
  });

  testWidgets('alongside ubuntu', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        OsProber(
          long: 'Ubuntu 18.04 LTS',
          label: 'Ubuntu',
          version: '18.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(
        YaruRadioButton<InstallationType>,
        tester.lang
            .installationTypeAlongside('Ubuntu 22.10', 'Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside unknown', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeAlongsideUnknown('Ubuntu 22.10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside dual os', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        OsProber(
          long: 'Windows 10',
          label: 'WIN10',
          version: '10',
          type: 'ntfs',
        ),
        OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu',
          version: '20.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(
        YaruRadioButton<InstallationType>,
        tester.lang.installationTypeAlongsideDual(
            'Ubuntu 22.10', 'Windows 10', 'Ubuntu 20.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside duplicate os', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu1',
          version: '20.04 LTS',
          type: 'ext4',
        ),
        OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu2',
          version: '20.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeAlongsideMulti('Ubuntu 22.10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside multi os', (tester) async {
    final model = buildModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        OsProber(
          long: 'Windows 10',
          label: 'WIN10',
          version: '10',
          type: 'ntfs',
        ),
        OsProber(
          long: 'Ubuntu 18.04 LTS',
          label: 'Ubuntu',
          version: '18.04 LTS',
          type: 'ext4',
        ),
        OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu',
          version: '20.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeAlongsideMulti('Ubuntu 22.10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('erase', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(YaruRadioButton<InstallationType>,
        tester.lang.installationTypeErase('Ubuntu'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.erase).called(1);
  });

  testWidgets('manual', (tester) async {
    final model = buildModel(installationType: InstallationType.manual);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.widgetWithText(
        YaruRadioButton<InstallationType>, tester.lang.installationTypeManual);
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.manual).called(1);

    final button = find.widgetWithText(
        OutlinedButton, tester.lang.installationTypeAdvancedLabel);
    expect(tester.widget<ButtonStyleButton>(button).enabled, false);
  });

  group('advanced features', () {
    testWidgets('dialog', (tester) async {
      final model = buildModel();
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      final button = find.widgetWithText(
          OutlinedButton, tester.lang.installationTypeAdvancedLabel);
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('none selected', (tester) async {
      final model = buildModel(advancedFeature: AdvancedFeature.none);
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      expect(
          find.text(tester.lang.installationTypeNoneSelected), findsOneWidget);
    });

    testWidgets('lvm selected', (tester) async {
      final model = buildModel(advancedFeature: AdvancedFeature.lvm);
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      expect(
          find.text(tester.lang.installationTypeLVMSelected), findsOneWidget);
    });

    testWidgets('encrypted lvm selected', (tester) async {
      final model =
          buildModel(advancedFeature: AdvancedFeature.lvm, encryption: true);
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      expect(find.text(tester.lang.installationTypeLVMEncryptionSelected),
          findsOneWidget);
    });
  });

  testWidgets('no storage', (tester) async {
    final model = buildModel(hasStorage: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.nextLabel,
    );
    expect(continueButton, findsOneWidget);
    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, false);

    await tester.tap(continueButton);
    verifyNever(model.save());
  });

  testWidgets('continue', (tester) async {
    final model = buildModel(hasStorage: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.nextLabel,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.save()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.getGuidedStorageV2())
        .thenAnswer((_) async => fakeGuidedStorageResponse());
    when(client.getStorageV2()).thenAnswer((_) async => fakeStorageResponse());
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
    registerMockService<SubiquityClient>(client);
    registerMockService<DiskStorageService>(DiskStorageService(client));
    registerMockService<ProductService>(ProductService());
    registerMockService<TelemetryService>(TelemetryService());

    await tester.pumpWidget(tester.buildApp(InstallationTypePage.create));

    final page = find.byType(InstallationTypePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<InstallationTypeModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
