import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n/app_localizations.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_to_internet_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_to_internet_page.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_auth_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/wifi_model.dart';

import 'connect_to_internet_page_test.mocks.dart';

@GenerateMocks([
  ConnectToInternetModel,
  EthernetModel,
  EthernetDeviceModel,
  HiddenWifiModel,
  WifiAuthModel,
  WifiModel,
])
void main() {
  setUpAll(() async {
    await setupAppLocalizations();
  });

  testWidgets('selects the right connect mode on tap', (tester) async {
    final connectToInternetModel = ConnectToInternetModel();

    final ethernetModel = MockEthernetModel();
    when(ethernetModel.connectMode).thenReturn(ConnectMode.ethernet);
    when(ethernetModel.devices).thenReturn([MockEthernetDeviceModel()]);

    final hiddenWifiModel = MockHiddenWifiModel();
    when(hiddenWifiModel.connectMode).thenReturn(ConnectMode.hiddenWifi);
    when(hiddenWifiModel.ssid).thenReturn('');
    when(hiddenWifiModel.selectedDevice).thenReturn(null);

    final wifiModel = MockWifiModel();
    when(wifiModel.connectMode).thenReturn(ConnectMode.wifi);
    when(wifiModel.devices).thenReturn([]);
    when(wifiModel.requestScan(ssid: anyNamed('ssid')))
        .thenAnswer((_) async => null);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: Builder(builder: (context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<ConnectToInternetModel>.value(
                    value: connectToInternetModel),
                ChangeNotifierProvider<EthernetModel>.value(
                    value: ethernetModel),
                ChangeNotifierProvider<HiddenWifiModel>.value(
                    value: hiddenWifiModel),
                ChangeNotifierProvider<WifiAuthModel>(
                    create: (_) => MockWifiAuthModel()),
                ChangeNotifierProvider<WifiModel>.value(value: wifiModel),
              ],
              child: ConnectToInternetPage(),
            );
          }),
        ),
      ),
    );

    final ethernetTile = find.byWidgetPredicate((widget) =>
        widget is RadioListTile<ConnectMode> &&
        widget.value == ConnectMode.ethernet);
    expect(ethernetTile, findsOneWidget);
    await tester.tap(ethernetTile);
    expect(connectToInternetModel.connectMode, ConnectMode.ethernet);

    final wifiTile = find.byWidgetPredicate((widget) =>
        widget is RadioListTile<ConnectMode> &&
        widget.value == ConnectMode.wifi);
    expect(wifiTile, findsOneWidget);
    await tester.tap(wifiTile);
    expect(connectToInternetModel.connectMode, ConnectMode.wifi);

    final hiddenWifiTile = find.byWidgetPredicate((widget) =>
        widget is RadioListTile<ConnectMode> &&
        widget.value == ConnectMode.hiddenWifi);
    expect(wifiTile, findsOneWidget);
    await tester.tap(hiddenWifiTile);
    expect(connectToInternetModel.connectMode, ConnectMode.hiddenWifi);

    final noConnectTile = find.byWidgetPredicate((widget) =>
        widget is RadioListTile<ConnectMode> &&
        widget.value == ConnectMode.none);
    expect(noConnectTile, findsOneWidget);
    await tester.tap(noConnectTile);
    expect(connectToInternetModel.connectMode, ConnectMode.none);
  });
}
