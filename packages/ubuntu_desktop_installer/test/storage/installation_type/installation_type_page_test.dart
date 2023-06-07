import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/storage/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/installation_type/installation_type_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_installation_type.dart';

void main() {
  Widget buildPage(InstallationTypeModel model) {
    return ProviderScope(
      overrides: [installationTypeModelProvider.overrideWith((_) => model)],
      child: const InstallationTypePage(),
    );
  }

  testWidgets('no existing OS', (tester) async {
    await tester.pumpWidget(
        tester.buildApp((_) => buildPage(buildInstallationTypeModel())));

    expect(
      find.text(tester.lang.installationTypeNoOSDetected),
      findsOneWidget,
    );
  });

  testWidgets('one existing OS', (tester) async {
    final model = buildInstallationTypeModel(existingOS: [
      const OsProber(long: 'Ubuntu 18.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeOSDetected('Ubuntu 18.04 LTS')),
      findsOneWidget,
    );
  });

  testWidgets('two existing OSes', (tester) async {
    final model = buildInstallationTypeModel(existingOS: [
      const OsProber(long: 'Ubuntu 18.04 LTS', label: 'Ubuntu', type: 'ext4'),
      const OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeDualOSDetected(
          'Ubuntu 18.04 LTS', 'Ubuntu 20.04 LTS')),
      findsOneWidget,
    );
  });

  testWidgets('multiple existing OSes', (tester) async {
    final model = buildInstallationTypeModel(existingOS: [
      const OsProber(long: 'Windows 10', label: 'windows', type: 'ntfs'),
      const OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4'),
      const OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeMultiOSDetected),
      findsOneWidget,
    );
  });

  testWidgets('duplicate existing OSes', (tester) async {
    final model = buildInstallationTypeModel(existingOS: [
      const OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4'),
      const OsProber(long: 'Ubuntu 20.04 LTS', label: 'Ubuntu', type: 'ext4')
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
      find.text(tester.lang.installationTypeMultiOSDetected),
      findsOneWidget,
    );
  });

  testWidgets('reinstall', (tester) async {
    final model = buildInstallationTypeModel(existingOS: [
      const OsProber(
        long: 'Ubuntu 18.04 LTS',
        label: 'Ubuntu',
        version: '18.04 LTS',
        type: 'ext4',
      )
    ]);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeReinstall('Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.reinstall).called(1);
  }, skip: true);

  testWidgets('alongside windows', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        const OsProber(
          long: 'Windows 10',
          label: 'WIN10',
          version: '10',
          type: 'ntfs',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeAlongside('Ubuntu 22.10', 'Windows 10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside bitlocker', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        const OsProber(
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

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeAlongside('Ubuntu 22.10', 'Windows 11'));
    expect(radio, findsOneWidget);

    await tester.tap(radio);
    verify(model.installationType = InstallationType.bitlocker).called(1);
  });

  testWidgets('alongside ubuntu', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        const OsProber(
          long: 'Ubuntu 18.04 LTS',
          label: 'Ubuntu',
          version: '18.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(tester.lang
        .installationTypeAlongside('Ubuntu 22.10', 'Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside unknown', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeAlongsideUnknown('Ubuntu 22.10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside dual os', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        const OsProber(
          long: 'Windows 10',
          label: 'WIN10',
          version: '10',
          type: 'ntfs',
        ),
        const OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu',
          version: '20.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(tester.lang
        .installationTypeAlongsideDual(
            'Ubuntu 22.10', 'Windows 10', 'Ubuntu 20.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside duplicate os', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        const OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu1',
          version: '20.04 LTS',
          type: 'ext4',
        ),
        const OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu2',
          version: '20.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeAlongsideMulti('Ubuntu 22.10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('alongside multi os', (tester) async {
    final model = buildInstallationTypeModel(
      productInfo: ProductInfo(name: 'Ubuntu 22.10'),
      existingOS: [
        const OsProber(
          long: 'Windows 10',
          label: 'WIN10',
          version: '10',
          type: 'ntfs',
        ),
        const OsProber(
          long: 'Ubuntu 18.04 LTS',
          label: 'Ubuntu',
          version: '18.04 LTS',
          type: 'ext4',
        ),
        const OsProber(
          long: 'Ubuntu 20.04 LTS',
          label: 'Ubuntu',
          version: '20.04 LTS',
          type: 'ext4',
        ),
      ],
      canInstallAlongside: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeAlongsideMulti('Ubuntu 22.10'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('erase', (tester) async {
    final model = buildInstallationTypeModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio = find.radioButton<InstallationType>(
        tester.lang.installationTypeErase('Ubuntu'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.erase).called(1);
  });

  testWidgets('manual', (tester) async {
    final model =
        buildInstallationTypeModel(installationType: InstallationType.manual);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final radio =
        find.radioButton<InstallationType>(tester.lang.installationTypeManual);
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.manual).called(1);

    expect(find.button(tester.lang.installationTypeAdvancedLabel), isDisabled);
  });

  group('advanced features', () {
    testWidgets('dialog', (tester) async {
      final model = buildInstallationTypeModel();
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      final button = find.button(tester.lang.installationTypeAdvancedLabel);
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('none selected', (tester) async {
      final model =
          buildInstallationTypeModel(advancedFeature: AdvancedFeature.none);
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      expect(
          find.text(tester.lang.installationTypeNoneSelected), findsOneWidget);
    });

    testWidgets('lvm selected', (tester) async {
      final model =
          buildInstallationTypeModel(advancedFeature: AdvancedFeature.lvm);
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      expect(
          find.text(tester.lang.installationTypeLVMSelected), findsOneWidget);
    });

    testWidgets('encrypted lvm selected', (tester) async {
      final model = buildInstallationTypeModel(
          advancedFeature: AdvancedFeature.lvm, encryption: true);
      await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

      expect(find.text(tester.lang.installationTypeLVMEncryptionSelected),
          findsOneWidget);
    });
  });

  testWidgets('no storage', (tester) async {
    final model = buildInstallationTypeModel(hasStorage: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    expect(nextButton, isDisabled);

    await tester.tap(nextButton);
    verifyNever(model.save());
  });

  testWidgets('continue', (tester) async {
    final model = buildInstallationTypeModel(hasStorage: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    verify(model.save()).called(1);
  });
}
