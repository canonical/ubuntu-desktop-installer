import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'installation_type_model_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([DiskStorageService, ProductService, TelemetryService])
void main() {
  test('init', () async {
    final service = MockDiskStorageService();
    when(service.useLvm).thenReturn(true);
    when(service.useEncryption).thenReturn(true);
    when(service.hasBitLocker).thenReturn(true);
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse());

    final model = InstallationTypeModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );
    await model.init();

    expect(model.advancedFeature, AdvancedFeature.lvm);
    expect(model.encryption, isTrue);
    expect(model.hasBitLocker, isTrue);
  });

  test('existing OS', () async {
    const ubuntu2110 = OsProber(
      long: 'Ubuntu 21.10',
      label: 'Ubuntu',
      version: '21.10',
      type: 'linux',
    );
    const ubuntu2204 = OsProber(
      long: 'Ubuntu 22.04 LTS',
      label: 'Ubuntu',
      version: '22.04 LTS',
      type: 'linux',
    );

    final service = MockDiskStorageService();
    when(service.existingOS).thenReturn([ubuntu2110, ubuntu2204]);

    final model = InstallationTypeModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );
    expect(model.existingOS, equals([ubuntu2110, ubuntu2204]));
  });

  test('notify changes', () {
    final model = InstallationTypeModel(
      MockDiskStorageService(),
      MockTelemetryService(),
      MockProductService(),
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.installationType, isNull);
    model.installationType = InstallationType.manual;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.advancedFeature, equals(AdvancedFeature.none));
    model.advancedFeature = AdvancedFeature.lvm;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.encryption, isFalse);
    model.encryption = true;
    expect(wasNotified, isTrue);
  });

  test('product info', () {
    final product = MockProductService();
    when(product.getProductInfo())
        .thenReturn(ProductInfo(name: 'Ubuntu', version: '24.04 LTS'));

    final model = InstallationTypeModel(
      MockDiskStorageService(),
      MockTelemetryService(),
      product,
    );
    expect(model.productInfo.name, 'Ubuntu');
    expect(model.productInfo.version, '24.04 LTS');
  });

  test('save talks to telemetry service', () async {
    final disks = MockDiskStorageService();
    when(disks.hasMultipleDisks).thenReturn(false);
    when(disks.useEncryption).thenReturn(false);

    final telemetry = MockTelemetryService();
    final model = InstallationTypeModel(
      disks,
      telemetry,
      MockProductService(),
    );
    verifyNever(telemetry.addMetric('PartitionMethod', any));

    model.installationType = InstallationType.erase;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'use_device')).called(1);
    reset(telemetry);

    model.installationType = InstallationType.reinstall;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'reinstall_partition'))
        .called(1);
    reset(telemetry);

    model.installationType = InstallationType.alongside;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'resize_use_free')).called(1);
    reset(telemetry);

    model.installationType = InstallationType.manual;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'manual')).called(1);
    reset(telemetry);

    model.advancedFeature = AdvancedFeature.lvm;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'use_lvm')).called(1);
    reset(telemetry);

    model.advancedFeature = AdvancedFeature.zfs;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'use_zfs')).called(1);
    reset(telemetry);

    when(disks.useEncryption).thenReturn(true);
    model.advancedFeature = AdvancedFeature.none;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'use_crypto')).called(1);
    reset(telemetry);
  });

  test('set lvm', () {
    final storage = MockDiskStorageService();
    when(storage.hasMultipleDisks).thenReturn(false);
    when(storage.useEncryption).thenReturn(false);

    final model = InstallationTypeModel(
      storage,
      MockTelemetryService(),
      MockProductService(),
    );

    model.advancedFeature = AdvancedFeature.lvm;
    verify(storage.useLvm = true).called(1);

    model.advancedFeature = AdvancedFeature.none;
    verify(storage.useLvm = false).called(1);
  });

  test('single reformat target', () async {
    final reformat = GuidedStorageTargetReformat(diskId: '', capabilities: []);

    final service = MockDiskStorageService();
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(possible: [reformat]));

    final model = InstallationTypeModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );

    await model.init();

    await model.save();
    verify(service.guidedTarget = reformat).called(1);
    verifyNever(service.setGuidedStorage());
  });

  test('can install alongside', () async {
    final service = MockDiskStorageService();
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);

    final model = InstallationTypeModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );

    // none
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse());
    await model.init();
    expect(model.canInstallAlongside, isFalse);

    // reformat
    final reformat = GuidedStorageTargetReformat(diskId: '', capabilities: []);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(possible: [reformat]));
    await model.init();
    expect(model.canInstallAlongside, isFalse);

    // resize
    final resize = GuidedStorageTargetResize(
        diskId: '',
        partitionNumber: 0,
        newSize: 0,
        maximum: 0,
        minimum: 0,
        recommended: 0,
        capabilities: []);
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse(possible: [resize]));
    await model.init();
    expect(model.canInstallAlongside, isTrue);

    // gap
    final gap = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 0, usable: GapUsable.YES),
      capabilities: [],
    );
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse(possible: [gap]));
    await model.init();
    expect(model.canInstallAlongside, isTrue);

    // all
    when(service.getGuidedStorage()).thenAnswer((_) async =>
        testGuidedStorageResponse(possible: [reformat, resize, gap]));
    await model.init();
    expect(model.canInstallAlongside, isTrue);
  });

  test('pre-select target', () async {
    final service = MockDiskStorageService();
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    final model = InstallationTypeModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );

    // none
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse());
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), isNull);
    expect(model.preselectTarget(InstallationType.alongside), isNull);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);

    // reformat
    final reformat = GuidedStorageTargetReformat(diskId: '', capabilities: []);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(possible: [reformat]));
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), reformat);
    expect(model.preselectTarget(InstallationType.alongside), isNull);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);

    // multiple reformats
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(possible: [reformat, reformat]));
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), isNull);
    expect(model.preselectTarget(InstallationType.alongside), isNull);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);

    // resize
    final resize = GuidedStorageTargetResize(
        diskId: '',
        partitionNumber: 0,
        newSize: 0,
        maximum: 0,
        minimum: 0,
        recommended: 0,
        capabilities: []);
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse(possible: [resize]));
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), isNull);
    expect(model.preselectTarget(InstallationType.alongside), isNull);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);

    // gap
    final gap = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 1, usable: GapUsable.YES),
      capabilities: [],
    );
    when(service.getGuidedStorage())
        .thenAnswer((_) async => testGuidedStorageResponse(possible: [gap]));
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), isNull);
    expect(model.preselectTarget(InstallationType.alongside), gap);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);

    // multiple gaps
    final gap2 = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 2, usable: GapUsable.YES),
      capabilities: [],
    );
    final gap3 = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 3, usable: GapUsable.YES),
      capabilities: [],
    );
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => testGuidedStorageResponse(possible: [gap, gap3, gap2]));
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), isNull);
    expect(model.preselectTarget(InstallationType.alongside), gap3);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);

    // all
    when(service.getGuidedStorage()).thenAnswer((_) async =>
        testGuidedStorageResponse(possible: [reformat, resize, gap]));
    await model.init();
    expect(model.preselectTarget(InstallationType.erase), reformat);
    expect(model.preselectTarget(InstallationType.alongside), gap);
    expect(model.preselectTarget(InstallationType.reinstall), isNull);
    expect(model.preselectTarget(InstallationType.manual), isNull);
  });

  test('reset storage', () async {
    final service = MockDiskStorageService();
    when(service.resetStorage()).thenAnswer((_) async => []);

    final model = InstallationTypeModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );
    await model.resetStorage();
    verify(service.resetStorage()).called(1);
  });
}
