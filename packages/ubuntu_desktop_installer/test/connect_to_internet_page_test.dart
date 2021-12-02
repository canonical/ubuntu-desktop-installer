import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_to_internet_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_to_internet_page.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_view.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_view.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'connect_to_internet_page_test.mocks.dart';

@GenerateMocks([
  ConnectToInternetModel,
  EthernetModel,
  EthernetDevice,
  NetworkService,
  UdevDeviceInfo,
  UdevService,
  WifiModel,
  WifiDevice,
])
void main() {
  setUpAll(() async {
    await setupAppLocalizations();
  });

  Future<void> buildTestApp(
    WidgetTester tester, {
    required ConnectToInternetModel model,
    bool? ethernetActive,
    bool? wifiActive,
  }) async {
    final ethernetModel = MockEthernetModel();
    when(ethernetModel.connectMode).thenReturn(ConnectMode.ethernet);
    when(ethernetModel.devices).thenReturn([MockEthernetDevice()]);
    when(ethernetModel.isActive).thenReturn(ethernetActive ?? false);
    when(ethernetModel.canConnect).thenReturn(true);
    when(ethernetModel.canContinue).thenReturn(true);
    when(ethernetModel.isBusy).thenReturn(false);
    when(ethernetModel.isEnabled).thenReturn(true);

    final wifiDevice = MockWifiDevice();
    when(wifiDevice.model).thenReturn('model');
    when(wifiDevice.isAvailable).thenReturn(true);
    when(wifiDevice.isBusy).thenReturn(false);
    when(wifiDevice.scanning).thenReturn(false);
    when(wifiDevice.accessPoints).thenReturn([]);

    final wifiModel = MockWifiModel();
    when(wifiModel.connectMode).thenReturn(ConnectMode.wifi);
    when(wifiModel.devices).thenReturn([]);
    when(wifiModel.requestScan(ssid: anyNamed('ssid')))
        .thenAnswer((_) async => null);
    when(wifiModel.isEnabled).thenReturn(true);
    when(wifiModel.devices).thenReturn([wifiDevice]);
    when(wifiModel.isSelectedDevice(any)).thenReturn(false);
    when(wifiModel.isActive).thenReturn(wifiActive ?? false);
    when(wifiModel.canConnect).thenReturn(true);
    when(wifiModel.canContinue).thenReturn(true);
    when(wifiModel.isBusy).thenReturn(false);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(
          body: Wizard(
            routes: {
              '/': WizardRoute(
                builder: (_) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider<ConnectToInternetModel>.value(
                          value: model),
                      ChangeNotifierProvider<EthernetModel>.value(
                          value: ethernetModel),
                      ChangeNotifierProvider<WifiModel>.value(value: wifiModel),
                      ChangeNotifierProvider<NoConnectModel>(
                          create: (_) => NoConnectModel()),
                    ],
                    child: ConnectToInternetPage(),
                  );
                },
              ),
            },
          ),
        ),
      ),
    );
  }

  testWidgets('selects the right connect mode on tap', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await buildTestApp(tester, model: model);
    await tester.pumpAndSettle();

    final ethernetTile = find.byType(EthernetRadioButton);
    expect(ethernetTile, findsOneWidget);
    await tester.tap(ethernetTile);
    expect(model.connectMode, ConnectMode.ethernet);

    final wifiTile = find.byType(WifiRadioButton);
    expect(wifiTile, findsOneWidget);
    await tester.tap(wifiTile);
    expect(model.connectMode, ConnectMode.wifi);

    final noConnectTile = find.byWidgetPredicate((widget) =>
        widget is RadioButton<ConnectMode> && widget.value == ConnectMode.none);
    expect(noConnectTile, findsOneWidget);
    await tester.tap(noConnectTile);
    expect(model.connectMode, ConnectMode.none);
  });

  testWidgets('pre-selects ethernet', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await buildTestApp(tester, model: model, ethernetActive: true);
    await tester.pumpAndSettle();

    final ethernetTile = find.byType(EthernetRadioButton);
    expect(ethernetTile, findsOneWidget);
    expect(tester.widget<EthernetRadioButton>(ethernetTile).value,
        ConnectMode.ethernet);
    expect(model.connectMode, ConnectMode.ethernet);
  });

  testWidgets('pre-selects wifi', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await buildTestApp(tester, model: model, wifiActive: true);
    await tester.pumpAndSettle();

    final wifiTile = find.byType(WifiRadioButton);
    expect(wifiTile, findsOneWidget);
    expect(tester.widget<WifiRadioButton>(wifiTile).value, ConnectMode.wifi);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('pre-selects no connect', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await buildTestApp(tester,
        model: model, ethernetActive: false, wifiActive: false);
    await tester.pumpAndSettle();

    final noConnectTile = find.byWidgetPredicate((widget) =>
        widget is RadioButton<ConnectMode> && widget.value == ConnectMode.none);
    expect(noConnectTile, findsOneWidget);
    expect(model.connectMode, ConnectMode.none);
  });

  testWidgets('creates all models', (tester) async {
    final service = MockNetworkService();
    when(service.propertiesChanged)
        .thenAnswer((_) => const Stream<List<String>>.empty());
    when(service.wiredDevices).thenReturn([]);
    when(service.wirelessDevices).thenReturn([]);
    when(service.wirelessEnabled).thenReturn(true);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(
          body: MultiProvider(
            providers: [
              Provider<NetworkService>.value(value: service),
              Provider<UdevService>(create: (_) => MockUdevService()),
            ],
            child: const Wizard(
              routes: {'/': WizardRoute(builder: ConnectToInternetPage.create)},
            ),
          ),
        ),
      ),
    );

    final page = find.byType(ConnectToInternetPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    expect(
        Provider.of<ConnectToInternetModel>(context, listen: false), isNotNull);
    expect(Provider.of<NoConnectModel>(context, listen: false), isNotNull);
    expect(Provider.of<EthernetModel>(context, listen: false), isNotNull);
    expect(Provider.of<WifiModel>(context, listen: false), isNotNull);
  });
}
