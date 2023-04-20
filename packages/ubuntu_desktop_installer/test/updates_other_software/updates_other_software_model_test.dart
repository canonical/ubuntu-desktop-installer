import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'updates_other_software_model_test.mocks.dart';

@GenerateMocks([NetworkService, PowerService])
void main() {
  late UpdateOtherSoftwareModel model;

  setUp(() {
    model = UpdateOtherSoftwareModel(
      client: MockSubiquityClient(),
      power: MockPowerService(),
      network: MockNetworkService(),
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

  test('should have drivers and codecs set to false by default', () {
    expect(model.installDrivers, isFalse);
    expect(model.installCodecs, isFalse);
  });

  test('should be able to install drivers', () {
    bool? shouldInstallDrivers;
    model.addListener(() => shouldInstallDrivers = model.installDrivers);
    model.setInstallDrivers(true);
    expect(shouldInstallDrivers, isTrue);
  });

  test('should be able to install codecs', () {
    bool? shouldInstallCodecs;
    model.addListener(() => shouldInstallCodecs = model.installCodecs);
    model.setInstallCodecs(true);
    expect(shouldInstallCodecs, isTrue);
  });

  test('should not notify installation mode when passed null', () {
    InstallationMode? mode;
    model.addListener(() => mode = model.installationMode);
    model.setInstallationMode(null);
    expect(mode, isNull);
  });

  test('should not notify drivers when passed null', () {
    bool? shouldInstallDrivers;
    model.addListener(() => shouldInstallDrivers = model.installDrivers);
    model.setInstallDrivers(null);
    expect(shouldInstallDrivers, isNull);
  });

  test('should not notify codecs when passed null', () {
    bool? shouldInstallCodecs;
    model.addListener(() => shouldInstallCodecs = model.installCodecs);
    model.setInstallCodecs(null);
    expect(shouldInstallCodecs, isNull);
  });

  test('init the installation options', () async {
    final client = MockSubiquityClient();
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));
    when(client.hasNetwork()).thenAnswer((_) async => true);

    final power = MockPowerService();
    final powerChanged = StreamController<List<String>>(sync: true);
    when(power.propertiesChanged).thenAnswer((_) => powerChanged.stream);

    final network = MockNetworkService();
    final networkChanged = StreamController<List<String>>(sync: true);
    when(network.propertiesChanged).thenAnswer((_) => networkChanged.stream);

    final model = UpdateOtherSoftwareModel(
      client: client,
      installationMode: InstallationMode.normal,
      installDrivers: false,
      installCodecs: false,
      isOnline: false,
      power: power,
      network: network,
    );

    await model.init();
    expect(model.installDrivers, isTrue);
    verify(client.getDrivers()).called(1);
    expect(model.installCodecs, isTrue);
    verify(client.getCodecs()).called(1);
    expect(model.isOnline, isTrue);
    verify(client.hasNetwork()).called(1);
  });

  test('save the installation options', () async {
    final client = MockSubiquityClient();
    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);

    final model = UpdateOtherSoftwareModel(
      client: client,
      installationMode: InstallationMode.normal,
      installDrivers: false,
      installCodecs: false,
      isOnline: true,
      power: MockPowerService(),
      network: network,
    );

    await model.save();
    verify(client.setSource('ubuntu-desktop')).called(1);
    verify(client.setDrivers(install: false)).called(1);
    verify(client.setCodecs(install: false)).called(1);

    model.setInstallationMode(InstallationMode.minimal);
    model.setInstallDrivers(true);
    model.setInstallCodecs(true);
    await model.save();
    verify(client.setSource('ubuntu-desktop-minimal')).called(1);
    verify(client.setDrivers(install: true)).called(1);
    verify(client.setCodecs(install: true)).called(1);
  });

  test('on battery', () async {
    final power = MockPowerService();
    final powerChanged = StreamController<List<String>>(sync: true);
    when(power.propertiesChanged).thenAnswer((_) => powerChanged.stream);

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final client = MockSubiquityClient();
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));
    when(client.hasNetwork()).thenAnswer((_) async => true);

    final model = UpdateOtherSoftwareModel(
      client: client,
      installationMode: InstallationMode.normal,
      power: power,
      network: network,
    );
    verifyNever(power.propertiesChanged);

    await model.init();
    verify(power.propertiesChanged).called(1);

    when(power.onBattery).thenReturn(false);
    expect(model.onBattery, isFalse);
    verify(power.onBattery).called(1);

    when(power.onBattery).thenReturn(true);
    expect(model.onBattery, isTrue);
    verify(power.onBattery).called(1);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);
    powerChanged.add(['OnBattery']);
    expect(wasNotified, isTrue);
    when(power.onBattery).thenReturn(false);
    expect(model.onBattery, isFalse);
    verify(power.onBattery).called(1);
  });

  test('offline', () async {
    final network = MockNetworkService();
    final networkChanged = StreamController<List<String>>(sync: true);
    when(network.propertiesChanged).thenAnswer((_) => networkChanged.stream);

    final power = MockPowerService();
    when(power.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final client = MockSubiquityClient();
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));
    when(client.hasNetwork()).thenAnswer((_) async => true);

    final model = UpdateOtherSoftwareModel(
      client: client,
      installationMode: InstallationMode.normal,
      power: power,
      network: network,
    );
    verifyNever(network.propertiesChanged);

    await model.init();
    verify(network.propertiesChanged).called(1);
    verify(client.hasNetwork()).called(1);

    expect(model.isOnline, isTrue);

    when(network.isConnected).thenReturn(false);
    when(client.hasNetwork()).thenAnswer((_) async => false);

    final wasNotified = Completer();
    model.addListener(wasNotified.complete);
    networkChanged.add(['Connectivity']);
    await expectLater(wasNotified.future, completes);
    expect(model.isOnline, isFalse);
    verify(network.isConnected).called(1);
    verify(client.hasNetwork()).called(1);
  });
}
