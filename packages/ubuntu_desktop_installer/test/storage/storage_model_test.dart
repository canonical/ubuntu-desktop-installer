import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/storage_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_storage.dart';

void main() {
  test('init', () async {
    final service = MockStorageService();
    when(service.useLvm).thenReturn(true);
    when(service.useEncryption).thenReturn(true);
    when(service.hasBitLocker()).thenAnswer((_) async => true);
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());

    final model = StorageModel(
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

    final service = MockStorageService();
    when(service.existingOS).thenReturn([ubuntu2110, ubuntu2204]);

    final model = StorageModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );
    expect(model.existingOS, equals([ubuntu2110, ubuntu2204]));
  });

  test('notify changes', () {
    final model = StorageModel(
      MockStorageService(),
      MockTelemetryService(),
      MockProductService(),
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.type, isNull);
    model.type = StorageType.manual;
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

    final model = StorageModel(
      MockStorageService(),
      MockTelemetryService(),
      product,
    );
    expect(model.productInfo.name, 'Ubuntu');
    expect(model.productInfo.version, '24.04 LTS');
  });

  test('save talks to telemetry service', () async {
    final storage = MockStorageService();
    when(storage.hasMultipleDisks).thenReturn(false);
    when(storage.useEncryption).thenReturn(false);

    final telemetry = MockTelemetryService();
    final model = StorageModel(
      storage,
      telemetry,
      MockProductService(),
    );
    verifyNever(telemetry.addMetric('PartitionMethod', any));

    model.type = StorageType.erase;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'use_device')).called(1);
    reset(telemetry);

    model.type = StorageType.alongside;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'resize_use_free')).called(1);
    reset(telemetry);

    model.type = StorageType.manual;
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

    when(storage.useEncryption).thenReturn(true);
    model.advancedFeature = AdvancedFeature.none;
    await model.save();
    verify(telemetry.addMetric('PartitionMethod', 'use_crypto')).called(1);
    reset(telemetry);
  });

  test('set lvm', () {
    final storage = MockStorageService();
    when(storage.hasMultipleDisks).thenReturn(false);
    when(storage.useEncryption).thenReturn(false);

    final model = StorageModel(
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
    const reformat = GuidedStorageTargetReformat(diskId: '');

    final service = MockStorageService();
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: [reformat]));
    when(service.hasBitLocker()).thenAnswer((_) async => false);

    final model = StorageModel(
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
    final service = MockStorageService();
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    when(service.hasBitLocker()).thenAnswer((_) async => false);

    final model = StorageModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );

    // none
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());
    await model.init();
    expect(model.canInstallAlongside, isFalse);

    // reformat
    const reformat = GuidedStorageTargetReformat(diskId: '');
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: [reformat]));
    await model.init();
    expect(model.canInstallAlongside, isFalse);

    // resize
    const resize = GuidedStorageTargetResize(
      diskId: '',
      partitionNumber: 0,
      newSize: 0,
      maximum: 0,
      minimum: 0,
      recommended: 0,
    );
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse(targets: [resize]));
    await model.init();
    expect(model.canInstallAlongside, isTrue);

    // gap
    const gap = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 0, usable: GapUsable.YES),
    );
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse(targets: [gap]));
    await model.init();
    expect(model.canInstallAlongside, isTrue);

    // all
    when(service.getGuidedStorage()).thenAnswer((_) async =>
        fakeGuidedStorageResponse(targets: [reformat, resize, gap]));
    await model.init();
    expect(model.canInstallAlongside, isTrue);
  });

  test('pre-select target', () async {
    final service = MockStorageService();
    when(service.useLvm).thenReturn(false);
    when(service.useEncryption).thenReturn(false);
    when(service.hasBitLocker()).thenAnswer((_) async => false);

    final model = StorageModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );

    // none
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());
    await model.init();
    expect(model.preselectTarget(StorageType.erase), isNull);
    expect(model.preselectTarget(StorageType.alongside), isNull);
    expect(model.preselectTarget(StorageType.manual), isNull);

    // reformat
    const reformat = GuidedStorageTargetReformat(diskId: '');
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: [reformat]));
    await model.init();
    expect(model.preselectTarget(StorageType.erase), reformat);
    expect(model.preselectTarget(StorageType.alongside), isNull);
    expect(model.preselectTarget(StorageType.manual), isNull);

    // multiple reformats
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: [reformat, reformat]));
    await model.init();
    expect(model.preselectTarget(StorageType.erase), isNull);
    expect(model.preselectTarget(StorageType.alongside), isNull);
    expect(model.preselectTarget(StorageType.manual), isNull);

    // resize
    const resize = GuidedStorageTargetResize(
      diskId: '',
      partitionNumber: 0,
      newSize: 0,
      maximum: 0,
      minimum: 0,
      recommended: 0,
    );
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse(targets: [resize]));
    await model.init();
    expect(model.preselectTarget(StorageType.erase), isNull);
    expect(model.preselectTarget(StorageType.alongside), isNull);
    expect(model.preselectTarget(StorageType.manual), isNull);

    // gap
    const gap = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 1, usable: GapUsable.YES),
    );
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse(targets: [gap]));
    await model.init();
    expect(model.preselectTarget(StorageType.erase), isNull);
    expect(model.preselectTarget(StorageType.alongside), gap);
    expect(model.preselectTarget(StorageType.manual), isNull);

    // multiple gaps
    const gap2 = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 2, usable: GapUsable.YES),
    );
    const gap3 = GuidedStorageTargetUseGap(
      diskId: '',
      gap: Gap(offset: 0, size: 3, usable: GapUsable.YES),
    );
    when(service.getGuidedStorage()).thenAnswer(
        (_) async => fakeGuidedStorageResponse(targets: [gap, gap3, gap2]));
    await model.init();
    expect(model.preselectTarget(StorageType.erase), isNull);
    expect(model.preselectTarget(StorageType.alongside), gap3);
    expect(model.preselectTarget(StorageType.manual), isNull);

    // all
    when(service.getGuidedStorage()).thenAnswer((_) async =>
        fakeGuidedStorageResponse(targets: [reformat, resize, gap]));
    await model.init();
    expect(model.preselectTarget(StorageType.erase), reformat);
    expect(model.preselectTarget(StorageType.alongside), gap);
    expect(model.preselectTarget(StorageType.manual), isNull);
  });

  test('reset storage', () async {
    final service = MockStorageService();
    when(service.resetStorage()).thenAnswer((_) async => []);

    final model = StorageModel(
      service,
      MockTelemetryService(),
      MockProductService(),
    );
    await model.resetStorage();
    verify(service.resetStorage()).called(1);
  });
}
