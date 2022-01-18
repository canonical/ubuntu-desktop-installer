import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'installation_type_model_test.mocks.dart';

@GenerateMocks([DiskStorageService, TelemetryService])
void main() {
  test('init existing OS', () async {
    final client = MockSubiquityClient();
    // when(client.getExistingOS()).thenAnswer((_) async => 'Ubuntu 18.04 LTS');

    final model = InstallationTypeModel(
        client, MockDiskStorageService(), MockTelemetryService());
    await model.init();
    // verify(client.getExistingOS()).called(1);

    // expect(model.existingOS, equals('Ubuntu 18.04 LTS'));
  });

  test('notify changes', () {
    final model = InstallationTypeModel(
      MockSubiquityClient(),
      MockDiskStorageService(),
      MockTelemetryService(),
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.installationType, equals(InstallationType.erase));
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
    final model = InstallationTypeModel(
      MockSubiquityClient(),
      MockDiskStorageService(),
      MockTelemetryService(),
    );
    expect(model.productInfo, isNotEmpty);
  });

  test('save talks to telemetry service', () async {
    final disks = MockDiskStorageService();
    when(disks.hasMultipleDisks).thenReturn(false);
    when(disks.hasEncryption).thenReturn(false);

    final telemetry = MockTelemetryService();
    final model =
        InstallationTypeModel(MockSubiquityClient(), disks, telemetry);
    verifyNever(telemetry.setPartitionMethod(any));

    model.installationType = InstallationType.erase;
    await model.save();
    verify(telemetry.setPartitionMethod('use_device')).called(1);
    reset(telemetry);

    model.installationType = InstallationType.reinstall;
    await model.save();
    verify(telemetry.setPartitionMethod('reinstall_partition')).called(1);
    reset(telemetry);

    model.installationType = InstallationType.alongside;
    await model.save();
    verify(telemetry.setPartitionMethod('resize_use_free')).called(1);
    reset(telemetry);

    model.installationType = InstallationType.manual;
    await model.save();
    verify(telemetry.setPartitionMethod('manual')).called(1);
    reset(telemetry);

    model.advancedFeature = AdvancedFeature.lvm;
    await model.save();
    verify(telemetry.setPartitionMethod('use_lvm')).called(1);
    reset(telemetry);

    model.advancedFeature = AdvancedFeature.zfs;
    await model.save();
    verify(telemetry.setPartitionMethod('use_zfs')).called(1);
    reset(telemetry);

    when(disks.hasEncryption).thenReturn(true);
    model.advancedFeature = AdvancedFeature.none;
    await model.save();
    verify(telemetry.setPartitionMethod('use_crypto')).called(1);
    reset(telemetry);
  });

  test('save lvm', () {
    final storage = MockDiskStorageService();
    when(storage.hasMultipleDisks).thenReturn(false);
    when(storage.hasEncryption).thenReturn(false);

    final model = InstallationTypeModel(
      MockSubiquityClient(),
      storage,
      MockTelemetryService(),
    );

    model.advancedFeature = AdvancedFeature.none;
    model.save();
    verify(storage.useLvm = false).called(1);

    model.advancedFeature = AdvancedFeature.lvm;
    model.save();
    verify(storage.useLvm = true).called(1);
  });
}
