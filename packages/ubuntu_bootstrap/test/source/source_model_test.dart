import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/pages/source/source_model.dart';

import 'test_source.dart';

void main() {
  late SourceModel model;

  setUp(() {
    model = SourceModel(
      client: MockSubiquityClient(),
      power: MockPowerService(),
      network: MockNetworkService(),
      storage: MockStorageService(),
    );
  });

  test('should notify listeners when set source id', () {
    String? sourceId;
    model.addListener(() => sourceId = model.sourceId);
    model.setSourceId('ubuntu-desktop-minimal');
    expect(sourceId, 'ubuntu-desktop-minimal');
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

  test('should not notify source id when passed null', () {
    String? source;
    model.addListener(() => source = model.sourceId);
    model.setSourceId(null);
    expect(source, isNull);
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
    when(client.getSource()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));

    final power = MockPowerService();
    final powerChanged = StreamController<List<String>>(sync: true);
    when(power.propertiesChanged).thenAnswer((_) => powerChanged.stream);

    final network = MockNetworkService();
    final networkChanged = StreamController<List<String>>(sync: true);
    when(network.propertiesChanged).thenAnswer((_) => networkChanged.stream);

    final model = SourceModel(
      client: client,
      installDrivers: false,
      installCodecs: false,
      power: power,
      network: network,
      storage: MockStorageService(),
    );

    await model.init();
    expect(model.sourceId, kNormalSourceId);
    verify(client.getSource()).called(1);
    expect(model.installDrivers, isTrue);
    verify(client.getDrivers()).called(1);
    expect(model.installCodecs, isTrue);
    verify(client.getCodecs()).called(1);
  });

  test('save the installation options', () async {
    final client = MockSubiquityClient();
    when(client.getSource()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);

    final storage = MockStorageService();
    when(storage.init()).thenAnswer((_) async {});

    final model = SourceModel(
      client: client,
      installDrivers: false,
      installCodecs: false,
      power: MockPowerService(),
      network: network,
      storage: storage,
    );

    await model.setSourceId(kNormalSourceId);
    verify(client.setSource(kNormalSourceId)).called(1);
    verify(storage.init()).called(1);

    model.setInstallDrivers(false);
    model.setInstallCodecs(false);
    await model.save();
    verify(client.setSource(kNormalSourceId)).called(1);
    verify(client.setDrivers(install: false)).called(1);
    verify(client.setCodecs(install: false)).called(1);
    verify(storage.init()).called(1);

    await model.setSourceId('ubuntu-desktop-minimal');
    verify(client.setSource('ubuntu-desktop-minimal')).called(1);
    verify(storage.init()).called(1);

    model.setInstallDrivers(true);
    model.setInstallCodecs(true);
    await model.save();
    verify(client.setSource('ubuntu-desktop-minimal')).called(1);
    verify(client.setDrivers(install: true)).called(1);
    verify(client.setCodecs(install: true)).called(1);
    verify(storage.init()).called(1);
  });

  test('on battery', () async {
    final power = MockPowerService();
    final powerChanged = StreamController<List<String>>(sync: true);
    when(power.propertiesChanged).thenAnswer((_) => powerChanged.stream);

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final client = MockSubiquityClient();
    when(client.getSource()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));

    final model = SourceModel(
      client: client,
      power: power,
      network: network,
      storage: MockStorageService(),
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
    when(client.getSource()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));

    final model = SourceModel(
      client: client,
      power: power,
      network: network,
      storage: MockStorageService(),
    );
    verifyNever(network.propertiesChanged);

    await model.init();
    verify(network.propertiesChanged).called(1);

    when(network.isConnected).thenReturn(false);
    expect(model.isOnline, isFalse);
    verify(network.isConnected).called(1);

    when(network.isConnected).thenReturn(true);
    expect(model.isOnline, isTrue);
    verify(network.isConnected).called(1);

    bool? wasNotified;
    model.addListener(() => wasNotified = true);
    networkChanged.add(['Connectivity']);
    expect(wasNotified, isTrue);
    when(network.isConnected).thenReturn(false);
    expect(model.isOnline, isFalse);
    verify(network.isConnected).called(1);
  });
}
