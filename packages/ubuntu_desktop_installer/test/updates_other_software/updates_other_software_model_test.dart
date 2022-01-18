import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'updates_other_software_model_test.mocks.dart';

@GenerateMocks([PowerService])
void main() {
  late UpdateOtherSoftwareModel model;

  setUp(() {
    model = UpdateOtherSoftwareModel(
      client: MockSubiquityClient(),
      power: MockPowerService(),
      installationMode: InstallationMode.normal,
    );
  });

  test('init state should be able to set installation mode', () {
    expect(model.installationMode, InstallationMode.normal);
  });

  test('should notify listeners when set installation mode', () {
    InstallationMode? mode;
    model.addListener(() => mode = model.installationMode);
    model.setInstallationMode(InstallationMode.minimal);
    expect(mode, InstallationMode.minimal);
  });

  test('should have third party option set to false by default', () {
    expect(model.installThirdParty, isFalse);
  });

  test('should be able to set third party', () {
    bool? shouldInstallThirdParty;
    model.addListener(() => shouldInstallThirdParty = model.installThirdParty);
    model.setInstallThirdParty(true);
    expect(shouldInstallThirdParty, isTrue);
  });

  test('should not notify installation mode when passed null', () {
    InstallationMode? mode;
    model.addListener(() => mode = model.installationMode);
    model.setInstallationMode(null);
    expect(mode, isNull);
  });

  test('should not notify third party when passed null', () {
    bool? shouldInstallThirdParty;
    model.addListener(() => shouldInstallThirdParty = model.installThirdParty);
    model.setInstallThirdParty(null);
    expect(shouldInstallThirdParty, isNull);
  });

  test('set the installation source', () async {
    final client = MockSubiquityClient();
    final model = UpdateOtherSoftwareModel(
      client: client,
      installationMode: InstallationMode.normal,
      power: MockPowerService(),
    );

    await model.selectInstallationSource();
    verify(client.setSource('ubuntu-desktop')).called(1);

    model.setInstallationMode(InstallationMode.minimal);
    await model.selectInstallationSource();
    verify(client.setSource('ubuntu-desktop-minimal')).called(1);
  });

  test('on battery', () async {
    final service = MockPowerService();
    final propertiesChanged = StreamController<List<String>>(sync: true);
    when(service.propertiesChanged).thenAnswer((_) => propertiesChanged.stream);

    final model = UpdateOtherSoftwareModel(
      client: MockSubiquityClient(),
      installationMode: InstallationMode.normal,
      power: service,
    );
    verifyNever(service.propertiesChanged);

    await model.init();
    verify(service.propertiesChanged).called(1);

    when(service.onBattery).thenReturn(false);
    expect(model.onBattery, isFalse);
    verify(service.onBattery).called(1);

    when(service.onBattery).thenReturn(true);
    expect(model.onBattery, isTrue);
    verify(service.onBattery).called(1);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);
    propertiesChanged.add(['OnBattery']);
    expect(wasNotified, isTrue);
    when(service.onBattery).thenReturn(false);
    expect(model.onBattery, isFalse);
    verify(service.onBattery).called(1);
  });
}
