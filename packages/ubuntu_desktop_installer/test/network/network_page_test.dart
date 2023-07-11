import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_view.dart';
import 'package:ubuntu_desktop_installer/pages/network/hidden_wifi_view.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_page.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_view.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'test_network.dart';

void main() {
  testWidgets('selects the right connect mode on tap', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester
        .pumpWidget(tester.buildApp((_) => buildNetworkPage(model: model)));
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
        widget is YaruRadioButton<ConnectMode> &&
        widget.value == ConnectMode.none);
    expect(noConnectTile, findsOneWidget);
    await tester.tap(noConnectTile);
    expect(model.connectMode, ConnectMode.none);
  });

  testWidgets('enables ethernet', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester.pumpWidget(tester
        .buildApp((_) => buildNetworkPage(model: model, ethernet: false)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(NetworkPage));
    final l10n = AppLocalizations.of(context);

    final button = find.button(l10n.networkWiredEnable);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(model.connectMode, ConnectMode.ethernet);
  });

  testWidgets('enables wifi', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildNetworkPage(model: model, wifi: false)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(NetworkPage));
    final l10n = AppLocalizations.of(context);

    final button = find.button(l10n.networkWifiEnable);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('selects wifi', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester.pumpWidget(tester.buildApp(
        (_) => buildNetworkPage(model: model, ethernet: false, wifi: true)));
    await tester.pumpAndSettle();

    final tile = find.listTile('ap').first;
    expect(tile, findsOneWidget);
    await tester.pump();
    await tester.tap(tile);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('initializes and cleans up the model', (tester) async {
    final model = buildNetworkModel(
      connectMode: ConnectMode.none,
      isConnecting: false,
      canConnect: false,
      isConnected: true,
      isEnabled: true,
    );

    await tester
        .pumpWidget(tester.buildApp((_) => buildNetworkPage(model: model)));
    await tester.pumpAndSettle();

    verify(model.init());
    verifyNever(model.cleanup());

    await tester.tapNext();
    await tester.pumpAndSettle();

    verify(model.cleanup()).called(1);

    final context = tester.element(find.text('Next page'));
    Wizard.of(context).back();
    await tester.pumpAndSettle();

    verify(model.init());
    verifyNever(model.cleanup());
  });

  testWidgets('pre-selects ethernet', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildNetworkPage(model: model, ethernet: true)));
    await tester.pumpAndSettle();

    final ethernetRadio = find.radio(ConnectMode.ethernet);
    expect(ethernetRadio, findsOneWidget);
    expect(ethernetRadio, isChecked);
    expect(model.connectMode, ConnectMode.ethernet);
  });

  testWidgets('pre-selects wifi', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester.pumpWidget(
        tester.buildApp((_) => buildNetworkPage(model: model, wifi: true)));
    await tester.pumpAndSettle();

    final wifiRadio = find.radio(ConnectMode.wifi);
    expect(wifiRadio, findsOneWidget);
    expect(wifiRadio, isChecked);
    expect(model.connectMode, ConnectMode.wifi);
  });

  testWidgets('pre-selects no connect', (tester) async {
    final model = NetworkModel(MockNetworkService());
    await tester
        .pumpWidget(tester.buildApp((_) => buildNetworkPage(model: model)));
    await tester.pumpAndSettle();

    final noConnectRadio = find.radio(ConnectMode.none);
    expect(noConnectRadio, findsOneWidget);
    expect(noConnectRadio, isChecked);
    expect(model.connectMode, ConnectMode.none);
  });

  testWidgets('mark network configured', (tester) async {
    final model = buildNetworkModel(
      connectMode: ConnectMode.none,
      isConnecting: false,
      canConnect: false,
      isConnected: true,
      isEnabled: true,
    );

    await tester
        .pumpWidget(tester.buildApp((_) => buildNetworkPage(model: model)));
    await tester.pumpAndSettle();

    verify(model.init()).called(1);
    verifyNever(model.cleanup());

    await tester.tapNext();
    await tester.pumpAndSettle();

    verify(model.markConfigured()).called(1);
  });
}
