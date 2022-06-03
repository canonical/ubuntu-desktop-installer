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
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/hidden_wifi_view.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_view.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../test_utils.dart';
import 'connect_to_internet_page_test.mocks.dart';

@GenerateMocks([
  AccessPoint,
  ConnectToInternetModel,
  EthernetModel,
  EthernetDevice,
  HiddenWifiModel,
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

  Widget buildPage({
    required ConnectToInternetModel model,
    bool? ethernet,
    bool? wifi,
  }) {
    final ethernetModel = MockEthernetModel();
    when(ethernetModel.connectMode).thenReturn(ConnectMode.ethernet);
    when(ethernetModel.devices).thenReturn([MockEthernetDevice()]);
    when(ethernetModel.hasActiveConnection).thenReturn(ethernet ?? false);
    when(ethernetModel.canConnect).thenReturn(true);
    when(ethernetModel.isConnected).thenReturn(true);
    when(ethernetModel.isConnecting).thenReturn(false);
    when(ethernetModel.isEnabled).thenReturn(ethernet ?? true);
    when(ethernetModel.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final accessPoint = MockAccessPoint();
    when(accessPoint.name).thenReturn('ap');
    when(accessPoint.strength).thenReturn(0);
    when(accessPoint.isOpen).thenReturn(true);

    final wifiDevice = MockWifiDevice();
    when(wifiDevice.model).thenReturn('model');
    when(wifiDevice.isAvailable).thenReturn(true);
    when(wifiDevice.isConnecting).thenReturn(false);
    when(wifiDevice.scanning).thenReturn(false);
    when(wifiDevice.accessPoints).thenReturn([accessPoint]);
    when(wifiDevice.isActive).thenReturn(false);

    final wifiModel = MockWifiModel();
    when(wifiModel.connectMode).thenReturn(ConnectMode.wifi);
    when(wifiModel.startPeriodicScanning()).thenReturn(null);
    when(wifiModel.isEnabled).thenReturn(wifi ?? true);
    when(wifiModel.devices).thenReturn([wifiDevice]);
    when(wifiModel.isSelectedDevice(any)).thenReturn(false);
    when(wifiModel.hasActiveConnection).thenReturn(wifi ?? false);
    when(wifiModel.canConnect).thenReturn(true);
    when(wifiModel.isConnected).thenReturn(true);
    when(wifiModel.isConnecting).thenReturn(false);
    when(wifiModel.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final hiddenWifiModel = MockHiddenWifiModel();
    when(hiddenWifiModel.connectMode).thenReturn(ConnectMode.hiddenWifi);
    when(hiddenWifiModel.ssid).thenReturn('ssid');
    when(hiddenWifiModel.isEnabled).thenReturn(wifi ?? true);
    when(hiddenWifiModel.devices).thenReturn([wifiDevice]);
    when(hiddenWifiModel.isSelectedDevice(any)).thenReturn(false);
    when(hiddenWifiModel.hasActiveConnection).thenReturn(wifi ?? false);
    when(hiddenWifiModel.canConnect).thenReturn(true);
    when(hiddenWifiModel.isConnected).thenReturn(true);
    when(hiddenWifiModel.isConnecting).thenReturn(false);
    when(hiddenWifiModel.onAvailabilityChanged)
        .thenAnswer((_) => const Stream.empty());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConnectToInternetModel>.value(value: model),
        ChangeNotifierProvider<EthernetModel>.value(value: ethernetModel),
        ChangeNotifierProvider<WifiModel>.value(value: wifiModel),
        ChangeNotifierProvider<HiddenWifiModel>.value(value: hiddenWifiModel),
        ChangeNotifierProvider<NoConnectModel>(create: (_) => NoConnectModel()),
      ],
      child: const ConnectToInternetPage(),
    );
  }

  testWidgets('selects the right connect mode on tap', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model: model)));
    await tester.pumpAndSettle();

    final ethernetTile = find.byType(EthernetRadioButton);
    expect(ethernetTile, findsOneWidget);
    await tester.tap(ethernetTile);
    expect(model.connectMode, ConnectMode.ethernet);

    final wifiTile = find.byType(WifiRadioButton);
    expect(wifiTile, findsOneWidget);
    await tester.tap(wifiTile);
    expect(model.connectMode, ConnectMode.wifi);

    final hiddenWifiTile = find.byType(HiddenWifiRadioButton);
    expect(hiddenWifiTile, findsOneWidget);
    await tester.tap(hiddenWifiTile);
    expect(model.connectMode, ConnectMode.hiddenWifi);

    final noConnectTile = find.byWidgetPredicate((widget) =>
        widget is RadioButton<ConnectMode> && widget.value == ConnectMode.none);
    expect(noConnectTile, findsOneWidget);
    await tester.tap(noConnectTile);
    expect(model.connectMode, ConnectMode.none);
  });

  testWidgets('enables ethernet', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildPage(model: model, ethernet: false)));
    await tester.pumpAndSettle();

    final button = find.widgetWithText(OutlinedButton, tester.lang.enableWired);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(model.connectMode, ConnectMode.ethernet);
  });

  testWidgets('enables wifi', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildPage(model: model, wifi: false)));
    await tester.pumpAndSettle();

    final button = find.widgetWithText(OutlinedButton, tester.lang.enableWifi);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('selects wifi', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(tester
        .buildApp((_) => buildPage(model: model, ethernet: false, wifi: true)));
    await tester.pumpAndSettle();

    final tile = find.widgetWithText(ListTile, 'ap').first;
    expect(tile, findsOneWidget);
    await tester.pump();
    await tester.tap(tile);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('initializes and cleans up the model', (tester) async {
    final model = MockConnectToInternetModel();
    when(model.connectMode).thenReturn(ConnectMode.none);
    when(model.isConnecting).thenReturn(false);
    when(model.canConnect).thenReturn(false);
    when(model.isConnected).thenReturn(true);
    when(model.isEnabled).thenReturn(true);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model: model)));
    await tester.pumpAndSettle();

    verify(model.init()).called(1);
    verifyNever(model.cleanup());

    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);
    expect(continueButton, findsOneWidget);
    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    verifyNever(model.init());
    verify(model.cleanup()).called(1);

    final context = tester.element(find.text('Next page'));
    Wizard.of(context).back();
    await tester.pumpAndSettle();

    verify(model.init()).called(1);
    verifyNever(model.cleanup());
  });

  testWidgets('pre-selects ethernet', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildPage(model: model, ethernet: true)));
    await tester.pumpAndSettle();

    final ethernetTile = find.byType(EthernetRadioButton);
    expect(ethernetTile, findsOneWidget);
    expect(tester.widget<EthernetRadioButton>(ethernetTile).value,
        ConnectMode.ethernet);
    expect(model.connectMode, ConnectMode.ethernet);
  });

  testWidgets('pre-selects wifi', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildPage(model: model, wifi: true)));
    await tester.pumpAndSettle();

    final wifiTile = find.byType(WifiRadioButton);
    expect(wifiTile, findsOneWidget);
    expect(tester.widget<WifiRadioButton>(wifiTile).value, ConnectMode.wifi);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('pre-selects no connect', (tester) async {
    final model = ConnectToInternetModel(MockNetworkService());
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model: model)));
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
    registerMockService<NetworkService>(service);
    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(tester.buildApp(ConnectToInternetPage.create));

    final page = find.byType(ConnectToInternetPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    expect(
        Provider.of<ConnectToInternetModel>(context, listen: false), isNotNull);
    expect(Provider.of<NoConnectModel>(context, listen: false), isNotNull);
    expect(Provider.of<EthernetModel>(context, listen: false), isNotNull);
    expect(Provider.of<WifiModel>(context, listen: false), isNotNull);
    expect(Provider.of<HiddenWifiModel>(context, listen: false), isNotNull);
  });
}
