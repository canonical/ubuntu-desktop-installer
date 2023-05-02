import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/source/source_model.dart';
import 'package:ubuntu_desktop_installer/pages/source/source_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'source_model_test.mocks.dart';
import 'source_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([SourceModel, TelemetryService])
void main() {
  SourceModel buildModel({
    String? sourceId,
    bool? installDrivers,
    bool? installCodecs,
    bool? onBattery,
    bool? isOnline,
  }) {
    final model = MockSourceModel();
    when(model.sources).thenReturn([
      SourceSelection(
        id: kMinimalSourceId,
        name: '',
        description: '',
        size: 0,
        variant: 'desktop',
        isDefault: false,
      ),
      SourceSelection(
        id: kNormalSourceId,
        name: '',
        description: '',
        size: 0,
        variant: 'desktop',
        isDefault: true,
      ),
    ]);
    when(model.sourceId).thenReturn(sourceId ?? kNormalSourceId);
    when(model.installDrivers).thenReturn(installDrivers ?? false);
    when(model.installCodecs).thenReturn(installCodecs ?? false);
    when(model.onBattery).thenReturn(onBattery ?? false);
    when(model.isOnline).thenReturn(isOnline ?? true);
    return model;
  }

  Widget buildPage(SourceModel model) {
    registerMockService<SubiquityClient>(MockSubiquityClient());
    registerMockService<TelemetryService>(MockTelemetryService());

    return ChangeNotifierProvider<SourceModel>.value(
      value: model,
      child: SourcePage(),
    );
  }

  testWidgets('source id', (tester) async {
    final model = buildModel(sourceId: kNormalSourceId);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final normalInstallationTile = find.radioButton<String>(
      tester.lang.normalInstallationTitle,
    );
    expect(normalInstallationTile, findsOneWidget);

    final minimalInstallationTile = find.radioButton<String>(
      tester.lang.minimalInstallationTitle,
    );
    expect(minimalInstallationTile, findsOneWidget);

    expect(
      tester.widget<YaruRadioButton<String>>(normalInstallationTile).groupValue,
      kNormalSourceId,
    );
    expect(
      tester
          .widget<YaruRadioButton<String>>(minimalInstallationTile)
          .groupValue,
      kNormalSourceId,
    );

    when(model.sourceId).thenReturn('ubuntu-desktop-minimal');

    await tester.tap(minimalInstallationTile);

    verify(model.setSourceId('ubuntu-desktop-minimal')).called(1);
  });

  testWidgets('install drivers', (tester) async {
    final model = buildModel(installDrivers: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final installDriversTile = find.checkButton(
      tester.lang.installDriversTitle,
    );
    expect(installDriversTile, findsOneWidget);

    expect(tester.widget<YaruCheckButton>(installDriversTile).value, isTrue);

    when(model.installDrivers).thenReturn(false);

    await tester.tap(installDriversTile);

    verify(model.setInstallDrivers(false)).called(1);
  });

  testWidgets('install codecs', (tester) async {
    final model = buildModel(installCodecs: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final installCodecsTile = find.checkButton(
      tester.lang.installCodecsTitle,
    );
    expect(installCodecsTile, findsOneWidget);

    expect(tester.widget<YaruCheckButton>(installCodecsTile).value, isTrue);

    when(model.installCodecs).thenReturn(false);

    await tester.tap(installCodecsTile);

    verify(model.setInstallCodecs(false)).called(1);
  });

  testWidgets('on battery', (tester) async {
    final model = buildModel(onBattery: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    final warning = find.byType(Html);
    final theme = Theme.of(tester.element(find.byType(Scaffold)));
    expect(warning, findsOneWidget);
    expect(
      tester.widget<Html>(warning).data,
      equals(tester.lang.onBatteryWarning(theme.colorScheme.error.toHex())),
    );
  });

  testWidgets('not on battery', (tester) async {
    final model = buildModel(onBattery: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(Html), findsNothing);
  });

  testWidgets('offline', (tester) async {
    final model = buildModel(isOnline: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.text(tester.lang.offlineWarning), findsNothing);

    final installCodecsTile = find.checkButton(tester.lang.installCodecsTitle);
    expect(installCodecsTile, findsOneWidget);
    expect(tester.widget<YaruCheckButton>(installCodecsTile).onChanged, isNull);

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer();
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(installCodecsTile));
    await tester.pump();

    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(find.text(tester.lang.offlineWarning), findsOneWidget);
  });

  testWidgets('continue on the next page', (tester) async {
    final model = buildModel(sourceId: kNormalSourceId);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    verify(model.save()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.getSource()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));
    when(client.getDrivers()).thenAnswer((_) async => const DriversResponse(
        install: true, drivers: [], localOnly: false, searchDrivers: false));
    when(client.getCodecs())
        .thenAnswer((_) async => const CodecsData(install: true));
    registerMockService<SubiquityClient>(client);

    final power = MockPowerService();
    when(power.onBattery).thenReturn(false);
    when(power.propertiesChanged).thenAnswer((_) => Stream.empty());
    registerMockService<PowerService>(power);

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);
    when(network.propertiesChanged).thenAnswer((_) => Stream.empty());
    registerMockService<NetworkService>(network);

    final storage = MockDiskStorageService();
    registerMockService<DiskStorageService>(storage);

    await tester.pumpWidget(tester.buildApp(SourcePage.create));

    final page = find.byType(SourcePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SourceModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
